using System;
using System.Web.UI;
using dominio;
using negocio;

namespace TPC_Equipo_14A
{
    public partial class AltaUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                UsuarioNegocio negocio = new UsuarioNegocio();
                Usuario seleccionado = negocio.listar().Find(x => x.Id == id);

                if (seleccionado != null)
                {
                    txtNombre.Text = seleccionado.Nombre;
                    txtApellido.Text = seleccionado.Apellido;
                    txtEmail.Text = seleccionado.Email;
                    txtTelefono.Text = seleccionado.Telefono;
                    chkActivo.Checked = seleccionado.Activo;
                    ddlRol.SelectedValue = seleccionado.Rol.Id.ToString();

                    divContrasena.Visible = false;
                }
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;

            Usuario usuario = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                usuario.Nombre = txtNombre.Text;
                usuario.Apellido = txtApellido.Text;
                usuario.Email = txtEmail.Text;
                usuario.Telefono = txtTelefono.Text;
                usuario.Activo = chkActivo.Checked;

                usuario.Rol = new Rol();
                usuario.Rol.Id = int.Parse(ddlRol.SelectedValue);

                if (Request.QueryString["id"] != null)
                {
                    usuario.Id = int.Parse(Request.QueryString["id"]);
                    negocio.modificar(usuario);
                }
                else
                {
                    usuario.Contrasena = txtContrasena.Text;
                    negocio.agregar(usuario);
                }

                Response.Redirect("Usuarios.aspx", false);
            }
            catch (Exception ex)
            {
                Session["Error"] = ex.Message;
                Response.Redirect("Error.aspx");
            }
        }
    }
}