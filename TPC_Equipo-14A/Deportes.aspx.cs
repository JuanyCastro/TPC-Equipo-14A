using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TPC_Equipo_14A
{
    public partial class Deportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarGrilla();
            }
        }

        private void cargarGrilla()
        {
            DeporteNegocio negocio = new DeporteNegocio();
            dgvDeportes.DataSource = negocio.listar();
            dgvDeportes.DataBind();
        }

        protected void dgvDeportes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "Editar")
            {
                Response.Redirect("AltaDeporte.aspx?id=" + id);
            }
            else if (e.CommandName == "Eliminar")
            {
                DeporteNegocio negocio = new DeporteNegocio();
                negocio.eliminarLogico(id);
                cargarGrilla();
            }
        }
    }
}