using System;
using dominio;
using negocio;

namespace TPC_Equipo_14A
{
    public partial class AltaDeporte : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!negocio.Seguridad.esAdmin(Session["usuario"]))
            {
                Session.Add("error", "No tenés permisos para acceder a esta pantalla.");
                Response.Redirect("Default.aspx", false);
                return;
            }
            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                DeporteNegocio negocio = new DeporteNegocio();
                Deporte seleccionado = negocio.listar().Find(x => x.Id == id);

                if (seleccionado != null)
                {
                    txtNombre.Text = seleccionado.Nombre;
                    txtDuracion.Text = seleccionado.DuracionBloqueMinutos.ToString();
                    chkActivo.Checked = seleccionado.Activo;
                }
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;

            Deporte deporte = new Deporte();
            DeporteNegocio negocio = new DeporteNegocio();

            try
            {
                deporte.Nombre = txtNombre.Text;
                deporte.DuracionBloqueMinutos = int.Parse(txtDuracion.Text);
                deporte.Activo = chkActivo.Checked;

                if (Request.QueryString["id"] != null)
                {
                    deporte.Id = int.Parse(Request.QueryString["id"]);
                    negocio.modificar(deporte);
                }
                else
                {
                    negocio.agregar(deporte);
                }

                Response.Redirect("Deportes.aspx", false);
            }
            catch (Exception ex)
            {
                lblError.Text = "Error: " + ex.Message;
            }
        }
    }
}