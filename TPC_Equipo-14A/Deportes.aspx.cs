using System;
using System.Web.UI;
using dominio;
using negocio;

namespace TPC_Equipo_14A
{
    public partial class Deportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                DeporteNegocio negocio = new DeporteNegocio();
                dgvDeportes.DataSource = negocio.listar();
                dgvDeportes.DataBind();
            }
        }
    }
}