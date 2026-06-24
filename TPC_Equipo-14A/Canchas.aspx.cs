using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TPC_Equipo_14A
{
    public partial class Canchas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarCanchas();
            }
        }

        private void cargarCanchas()
        {
            CanchaNegocio negocio = new CanchaNegocio();
            dgvCanchas.DataSource = negocio.listar();
            dgvCanchas.DataBind();
        }

        protected void dgvCanchas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                string id = e.CommandArgument.ToString();
                Response.Redirect("AltaCancha.aspx?id=" + id);
            }
            else if (e.CommandName == "Eliminar")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                CanchaNegocio negocio = new CanchaNegocio();
                negocio.eliminarLogico(id);

                cargarCanchas();
            }
        }
    }
}