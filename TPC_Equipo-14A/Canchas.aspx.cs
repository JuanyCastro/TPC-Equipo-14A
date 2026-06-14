using System;
using System.Web.UI.WebControls;
using negocio;

namespace TPC_Equipo_14A
{
    public partial class Canchas : System.Web.UI.Page
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
            CanchaNegocio negocio = new CanchaNegocio();
            dgvCanchas.DataSource = negocio.listar();
            dgvCanchas.DataBind();
        }

        protected void dgvCanchas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "Editar")
            {
                Response.Redirect("AltaCancha.aspx?id=" + id);
            }
            else if (e.CommandName == "Eliminar")
            {
                CanchaNegocio negocio = new CanchaNegocio();
                negocio.eliminarLogico(id);
                cargarGrilla();
            }
        }
    }
}