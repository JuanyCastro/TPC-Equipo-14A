using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace TPC_Equipo_14A
{
    public partial class Turnos : System.Web.UI.Page
    {
        public int IdDeporteSeleccionado
        {
            get { return ViewState["IdDeporteSeleccionado"] != null ? (int)ViewState["IdDeporteSeleccionado"] : 0; }
            set { ViewState["IdDeporteSeleccionado"] = value; }
        }

        public int IdCanchaSeleccionada
        {
            get { return ViewState["IdCanchaSeleccionada"] != null ? (int)ViewState["IdCanchaSeleccionada"] : 0; }
            set { ViewState["IdCanchaSeleccionada"] = value; }
        }

        public decimal PrecioCanchaSeleccionada
        {
            get { return ViewState["PrecioCanchaSeleccionada"] != null ? (decimal)ViewState["PrecioCanchaSeleccionada"] : 0; }
            set { ViewState["PrecioCanchaSeleccionada"] = value; }
        }

        public List<string> HorasSeleccionadas
        {
            get { return ViewState["HorasSeleccionadas"] != null ? (List<string>)ViewState["HorasSeleccionadas"] : new List<string>(); }
            set { ViewState["HorasSeleccionadas"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFecha.Attributes["min"] = DateTime.Today.ToString("yyyy-MM-dd");
                cargarDeportes();
            }
        }

        private void cargarDeportes()
        {
            DeporteNegocio negocio = new DeporteNegocio();
            List<Deporte> lista = negocio.listar();

            rptDeportes.DataSource = lista;
            rptDeportes.DataBind();

            if (lista.Count > 0 && IdDeporteSeleccionado == 0)
            {
                IdDeporteSeleccionado = lista[0].Id;
                cargarCanchasPorDeporte(IdDeporteSeleccionado);
            }
        }

        private void cargarCanchasPorDeporte(int idDeporte)
        {
            CanchaNegocio negocio = new CanchaNegocio();
            List<Cancha> listaFiltrada = negocio.listar().Where(c => c.Deporte.Id == idDeporte && c.Activa).ToList();

            rptCanchas.DataSource = listaFiltrada;
            rptCanchas.DataBind();
        }

        protected void rptDeportes_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SeleccionarDeporte")
            {
                IdDeporteSeleccionado = Convert.ToInt32(e.CommandArgument);
                IdCanchaSeleccionada = 0;
                pnlReserva.Visible = false;
                cargarDeportes();
                cargarCanchasPorDeporte(IdDeporteSeleccionado);
            }
        }

        protected void rptCanchas_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SeleccionarCancha")
            {
                string[] argumentos = e.CommandArgument.ToString().Split('|');
                IdCanchaSeleccionada = Convert.ToInt32(argumentos[0]);
                PrecioCanchaSeleccionada = Convert.ToDecimal(argumentos[1]);

                CanchaNegocio negocio = new CanchaNegocio();
                Cancha cancha = negocio.listar().Find(c => c.Id == IdCanchaSeleccionada);

                if (cancha != null)
                {
                    IdDeporteSeleccionado = cancha.Deporte.Id;
                    cargarDeportes();
                    cargarCanchasPorDeporte(IdDeporteSeleccionado);

                    pnlReserva.Visible = true;
                    pnlCheckout.Visible = false;
                    HorasSeleccionadas = new List<string>();
                    txtFecha.Text = DateTime.Today.ToString("yyyy-MM-dd");
                    cargarHorarios();
                }
            }
        }

        protected void txtFecha_TextChanged(object sender, EventArgs e)
        {
            HorasSeleccionadas = new List<string>();
            pnlCheckout.Visible = false;
            cargarHorarios();
        }

        private void cargarHorarios()
        {
            if (IdCanchaSeleccionada > 0 && !string.IsNullOrEmpty(txtFecha.Text))
            {
                DateTime fecha;

                if (!DateTime.TryParse(txtFecha.Text, out fecha) || fecha.Year < DateTime.Today.Year)
                {
                    lblSinHorarios.Text = "Por favor, ingresá una fecha válida.";
                    lblSinHorarios.Visible = true;
                    rptHorarios.DataSource = null;
                    rptHorarios.DataBind();
                    return;
                }

                if (fecha.Date < DateTime.Today)
                {
                    lblSinHorarios.Text = "No podés reservar turnos en días pasados.";
                    lblSinHorarios.Visible = true;
                    rptHorarios.DataSource = null;
                    rptHorarios.DataBind();
                    return;
                }

                ReservaNegocio negocio = new ReservaNegocio();
                List<TimeSpan> libresTimeSpan = negocio.obtenerHorariosLibres(IdCanchaSeleccionada, fecha, 60);

                if (fecha.Date == DateTime.Today)
                {
                    TimeSpan horaActual = DateTime.Now.TimeOfDay;
                    libresTimeSpan = libresTimeSpan.Where(t => t > horaActual).ToList();
                }

                List<string> libresTexto = libresTimeSpan.Select(t => t.ToString(@"hh\:mm")).ToList();

                rptHorarios.DataSource = libresTexto;
                rptHorarios.DataBind();

                if (libresTexto.Count == 0)
                {
                    lblSinHorarios.Text = "No hay horarios disponibles para esta fecha.";
                    lblSinHorarios.Visible = true;
                }
                else
                {
                    lblSinHorarios.Visible = false;
                }
            }
        }

        protected void rptHorarios_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SeleccionarHora")
            {
                string hora = e.CommandArgument.ToString();
                List<string> seleccionadas = HorasSeleccionadas;

                if (seleccionadas.Contains(hora))
                {
                    seleccionadas.Remove(hora);
                }
                else
                {
                    seleccionadas.Add(hora);
                }

                HorasSeleccionadas = seleccionadas;
                cargarHorarios();

                if (seleccionadas.Count > 0)
                {
                    pnlCheckout.Visible = true;
                    decimal total = PrecioCanchaSeleccionada * seleccionadas.Count;
                    lblPrecioTotal.Text = total.ToString("0.00");
                    lblPrecioSena.Text = (total * 0.20m).ToString("0.00");
                }
                else
                {
                    pnlCheckout.Visible = false;
                }
            }
        }

        protected void btnSeñar_Click(object sender, EventArgs e)
        {
            string horasStr = string.Join(",", HorasSeleccionadas);
            Response.Redirect($"Checkout.aspx?idCancha={IdCanchaSeleccionada}&fecha={txtFecha.Text}&horas={horasStr}");
        }
    }
}