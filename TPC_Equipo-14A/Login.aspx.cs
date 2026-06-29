using System;
using System.Web.UI;
using dominio;
using negocio;

namespace TPC_Equipo_14A
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                Response.Redirect("Default.aspx", false);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario usuario = new Usuario();
                UsuarioNegocio negocio = new UsuarioNegocio();
                if (string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtPassword.Text))
                {
                    lblErrorLogin.Text = "Debes completar ambos campos.";
                    lblErrorLogin.Visible = true;
                    return;
                }

                usuario.Email = txtEmail.Text;
                usuario.Contrasena = txtPassword.Text;
                if (negocio.Loguear(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("Default.aspx", false);
                }
                else
                {
                    lblErrorLogin.Text = "Usuario o contraseña incorrectos.";
                    lblErrorLogin.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblErrorLogin.Text = ex.Message;
                lblErrorLogin.Visible = true;
            }
        }
    }
}