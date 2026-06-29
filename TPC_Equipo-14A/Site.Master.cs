using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_14A
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                Usuario user = (Usuario)Session["usuario"];
                string nombreMostrar = !string.IsNullOrEmpty(user.Nombre) ? user.Nombre : user.Email;
                lblUser.Text = $"Hola, {nombreMostrar}!";
                imgAvatar.ImageUrl = $"https://ui-avatars.com/api/?name={nombreMostrar}&background=0D6EFD&color=fff&rounded=true";
            }

            if (!(Page is Default || Page is Turnos || Page is Checkout || Page is Login))
            {
                if (!Seguridad.sesionActiva(Session["usuario"]))
                {
                    Response.Redirect("Login.aspx", false);
                }
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx", false);
        }
    }
}