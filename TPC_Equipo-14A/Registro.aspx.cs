using System;
using System.Web.UI;
using dominio;
using negocio;

namespace TPC_Equipo_14A
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                Response.Redirect("Default.aspx", false);
                return;
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;

            try
            {
                Usuario nuevo = new Usuario();
                UsuarioNegocio negocio = new UsuarioNegocio();

                nuevo.Nombre = txtNombre.Text.Trim();
                nuevo.Apellido = txtApellido.Text.Trim();
                nuevo.Email = txtEmail.Text.Trim();
                nuevo.Telefono = txtTelefono.Text.Trim();
                nuevo.Contrasena = txtPassword.Text;
                nuevo.Rol = (Rol)2;
                nuevo.Activo = true;
                negocio.agregar(nuevo);
                bool autologinExitoso = negocio.Loguear(nuevo);

                if (autologinExitoso)
                {
                    Session.Add("usuario", nuevo);
                    Response.Redirect("Default.aspx", false);
                }
                else
                {
                    mostrarError("¡Cuenta creada con éxito! Por favor, iniciá sesión manualmente.");
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.ToLower().Contains("correo") || ex.Message.ToLower().Contains("email") || ex.Message.ToLower().Contains("unique"))
                {
                    mostrarError("Ese correo electrónico ya se encuentra registrado.");
                }
                else
                {
                    mostrarError("No pudimos crear tu cuenta en este momento. Por favor, intentá de nuevo más tarde.");
                }
            }
        }

        private void mostrarError(string mensaje)
        {
            lblError.Text = mensaje;
            lblError.Visible = true;
        }
    }
}