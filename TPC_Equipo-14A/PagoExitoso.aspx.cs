using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_14A
{
    public partial class PagoExitoso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["payment_id"] != null)
                {
                    string paymentId = Request.QueryString["payment_id"].ToString();
                    lblPagoId.Text = "#" + paymentId;
                }
                else
                {
                    lblPagoId.Text = "No disponible";
                }
            }
        }
    }
}