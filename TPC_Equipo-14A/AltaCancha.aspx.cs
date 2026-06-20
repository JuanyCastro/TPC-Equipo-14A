using System;
using System.Web.UI;
using dominio;
using negocio;

namespace TPC_Equipo_14A
{
    public partial class AltaCancha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DeporteNegocio deporteNegocio = new DeporteNegocio();
                 ddlDeporte.DataSource = deporteNegocio.listar();
                ddlDeporte.DataTextField = "Nombre";
                ddlDeporte.DataValueField = "Id";
                ddlDeporte.DataBind();

                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"]);
                    CanchaNegocio negocio = new CanchaNegocio();
                    Cancha seleccionada = negocio.listar().Find(x => x.Id == id);

                    if (seleccionada != null)
                    {
                        txtPrecioBase.Text = seleccionada.PrecioBase.ToString("0.00");
                        chkMantenimiento.Checked = seleccionada.EnMantenimiento;
                        chkActiva.Checked = seleccionada.Activa;
                        ddlDeporte.SelectedValue = seleccionada.Deporte.Id.ToString();
                    }
                }
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;

            Cancha cancha = new Cancha();
            CanchaNegocio negocio = new CanchaNegocio();

            try
            {
                cancha.PrecioBase = decimal.Parse(txtPrecioBase.Text);
                cancha.EnMantenimiento = chkMantenimiento.Checked;
                cancha.Activa = chkActiva.Checked;

                cancha.Deporte = new Deporte();
                cancha.Deporte.Id = int.Parse(ddlDeporte.SelectedValue);

                if (Request.QueryString["id"] != null)
                {
                    cancha.Id = int.Parse(Request.QueryString["id"]);
                    negocio.modificar(cancha);
                }
                else
                {
                    negocio.agregar(cancha);
                }

                Response.Redirect("Canchas.aspx", false);
            }
            catch (Exception ex)
            {
                lblError.Text = "Error: " + ex.Message;
            }
        }
    }
}