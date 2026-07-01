using dominio.Enums;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_14A
{
    public partial class Reservas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.esAdmin(Session["usuario"]))
            {
                Session.Add("error", "No tenés permisos para acceder a esta pantalla.");
                Response.Redirect("Default.aspx", false);
                return;
            }

            if (!IsPostBack)
            {
                cargarGrilla();
            }
        }

        private void cargarGrilla()
        {
            ReservaNegocio negocio = new ReservaNegocio();
            dgvReservas.DataSource = negocio.listar();
            dgvReservas.DataBind();
        }

        protected void dgvReservas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idReserva = int.Parse(e.CommandArgument.ToString());
            ReservaNegocio negocio = new ReservaNegocio();

            try
            {
                if (e.CommandName == "Confirmar")
                {
                    negocio.cambiarEstado(idReserva, EstadoReserva.Confirmada);
                }
                else if (e.CommandName == "Cancelar")
                {
                    negocio.cambiarEstado(idReserva, EstadoReserva.Cancelada);
                }

                cargarGrilla();
            }
            catch (Exception ex)
            {
                Session.Add("error", "Error al actualizar la reserva: " + ex.Message);
            }
        }
    }
}