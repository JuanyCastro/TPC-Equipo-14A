using System;
using System.Web.UI;
using System.Net;
using System.Net.Mail;
using negocio;
using dominio;

namespace TPC_Equipo_14A
{
    public partial class RecuperarPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                Response.Redirect("Default.aspx", false);
            }
        }

        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            try
            {
                string emailDestino = txtEmail.Text.Trim();

                if (string.IsNullOrEmpty(emailDestino))
                {
                    mostrarMensaje("Por favor, ingresá tu email.", false);
                    return;
                }
                string nuevaClave = Guid.NewGuid().ToString().Substring(0, 8);
                mostrarMensaje("¡Listo! Te enviamos una nueva contraseña a tu correo. (Simulado)", true);
                txtEmail.Text = "";
            }
            catch (Exception ex)
            {
                mostrarMensaje("Ocurrió un error: " + ex.Message, false);
            }
        }

        private void mostrarMensaje(string mensaje, bool esExito)
        {
            lblMensaje.Text = mensaje;
            lblMensaje.CssClass = esExito ? "text-success fw-bold mb-3 d-block text-center alert alert-success" : "text-danger fw-bold mb-3 d-block text-center alert alert-danger";
            lblMensaje.Visible = true;
        }
    }
}