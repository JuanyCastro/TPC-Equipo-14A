using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_14A
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.sesionActiva(Session["usuario"]))
            {
                Session.Add("error", "Tu sesión expiró. Volvé a ingresar para confirmar tu reserva.");
                Response.Redirect("Login.aspx", false);
                return;
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["idCancha"] != null && Request.QueryString["fecha"] != null && Request.QueryString["horas"] != null)
                {
                    CargarDatosEnPantalla();
                }
                else
                {
                    Response.Redirect("Turnos.aspx");
                }
            }
        }

        private void CargarDatosEnPantalla()
        {
            int idCancha = Convert.ToInt32(Request.QueryString["idCancha"]);
            string fecha = Request.QueryString["fecha"];
            string[] horas = Request.QueryString["horas"].Split(',');

            CanchaNegocio negocio = new CanchaNegocio();
            Cancha canchaActual = negocio.listar().Find(c => c.Id == idCancha);

            if (canchaActual != null)
            {
                lblCancha.Text = canchaActual.Nombre;
                lblFecha.Text = $"{DateTime.Parse(fecha).ToString("dd/MM/yyyy")} - {horas[0]} hs";

                decimal precioTotal = canchaActual.PrecioBase * horas.Length;
                decimal montoSeña = precioTotal * 0.02m;

                lblTotal.Text = precioTotal.ToString("C");
                lblSena.Text = montoSeña.ToString("C");
            }
        }

        protected void btnPagarMercadoPago_Click(object sender, EventArgs e)
        {
            try
            {
                int idCancha = Convert.ToInt32(Request.QueryString["idCancha"]);
                DateTime fecha = DateTime.Parse(Request.QueryString["fecha"]);

                List<TimeSpan> horasSeleccionadas = Request.QueryString["horas"].Split(',').Select(TimeSpan.Parse).OrderBy(t => t).ToList();

                DateTime fechaInicio = fecha.Add(horasSeleccionadas.First());
                DateTime fechaFin = fecha.Add(horasSeleccionadas.Last()).AddHours(1);

                CanchaNegocio cNegocio = new CanchaNegocio();
                Cancha canchaActual = cNegocio.listar().Find(c => c.Id == idCancha);

                Usuario usuarioReal = (Usuario)Session["usuario"];

                Reserva nuevaReserva = new Reserva
                {
                    Usuario = usuarioReal,
                    Cancha = canchaActual,
                    FechaHoraInicio = fechaInicio,
                    FechaHoraFin = fechaFin,
                    EsTurnoFijo = false
                };

                ReservaNegocio rNegocio = new ReservaNegocio();
                int idReservaGenerada = rNegocio.agregarReservaPendiente(nuevaReserva);

                Session["IdReservaPendiente"] = idReservaGenerada;

                decimal montoSeña = (canchaActual.PrecioBase * horasSeleccionadas.Count) * 0.02m;
                string urlBase = Request.Url.GetLeftPart(UriPartial.Authority);

                MercadoPagoNegocio mpNegocio = new MercadoPagoNegocio(urlBase);
                string linkMercadoPago = mpNegocio.PagarMercadoPago(nuevaReserva, montoSeña);

                Response.Redirect(linkMercadoPago, false);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error al generar el pago: " + ex.Message + "');</script>");
            }
        }
    }
}