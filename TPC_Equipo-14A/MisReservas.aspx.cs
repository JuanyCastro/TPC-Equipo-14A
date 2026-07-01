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
    public partial class MisReservas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.sesionActiva(Session["usuario"]))
            {
                Response.Redirect("Login.aspx", false);
                return;
            }

            if (!IsPostBack)
            {
                CargarMisReservas();
            }
        }

        private void CargarMisReservas()
        {
            Usuario usuarioActual = (Usuario)Session["usuario"];
            ReservaNegocio negocio = new ReservaNegocio();

            List<Reserva> misReservas = negocio.listar().Where(r => r.Usuario.Id == usuarioActual.Id).ToList();

            if (misReservas.Count > 0)
            {
                dgvMisReservas.DataSource = misReservas;
                dgvMisReservas.DataBind();
            }
            else
            {
                lblSinReservas.Visible = true;
                dgvMisReservas.Visible = false;
            }
        }

        protected void dgvMisReservas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Pagar")
            {
                int idReserva = Convert.ToInt32(e.CommandArgument);

                ReservaNegocio rNegocio = new ReservaNegocio();
                Reserva reservaPendiente = rNegocio.listar().Find(r => r.Id == idReserva);

                CanchaNegocio cNegocio = new CanchaNegocio();
                Cancha cancha = cNegocio.listar().Find(c => c.Id == reservaPendiente.Cancha.Id);

                double horas = (reservaPendiente.FechaHoraFin - reservaPendiente.FechaHoraInicio).TotalHours;
                decimal montoTotal = cancha.PrecioBase * (decimal)horas;

                decimal montoSeña = montoTotal * 0.02m;

                string urlBase = Request.Url.GetLeftPart(UriPartial.Authority);
                MercadoPagoNegocio mpNegocio = new MercadoPagoNegocio(urlBase);
                string linkMercadoPago = mpNegocio.PagarMercadoPago(reservaPendiente, montoSeña);

                Response.Redirect(linkMercadoPago, false);
            }
        }
    }
}