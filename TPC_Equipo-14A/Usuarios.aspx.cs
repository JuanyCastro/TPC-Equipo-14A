using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace TPC_Equipo_14A
{
    public partial class Usuarios : System.Web.UI.Page
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
            UsuarioNegocio negocio = new UsuarioNegocio();
            dgvUsuarios.DataSource = negocio.listar();
            dgvUsuarios.DataBind();
        }

        protected void dgvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "Editar")
            {
                Response.Redirect("AltaUsuario.aspx?id=" + id);
            }
            else if (e.CommandName == "Eliminar")
            {
                UsuarioNegocio negocio = new UsuarioNegocio();
                negocio.eliminarLogico(id);
                cargarGrilla();
            }
        }
    }
}