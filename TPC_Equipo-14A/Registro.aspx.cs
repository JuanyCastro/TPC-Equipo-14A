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
            try
            {
                if (string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtPassword.Text))
                {
                    mostrarError("Debes completar todos los campos obligatorios.");
                    return;
                }

                if (txtPassword.Text != txtConfirmPassword.Text)
                {
                    mostrarError("Las contraseñas no coinciden.");
                    return;
                }
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
                    lblError.CssClass = "alert alert-warning fw-bold mb-3 d-block text-center";
                    mostrarError("El usuario se guardó en la base de datos, pero falló el Autologin. Probá iniciar sesión manualmente.");
                }
            }
            catch (Exception ex)
            {
                lblError.CssClass = "alert alert-danger fw-bold mb-3 d-block text-center";
                mostrarError("Error técnico en la BD: " + ex.Message);
            }
        }

        private void mostrarError(string mensaje)
        {
            lblError.Text = mensaje;
            lblError.Visible = true;
        }
    }
}