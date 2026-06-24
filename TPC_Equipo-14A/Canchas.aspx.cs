using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TPC_Equipo_14A
{
    public partial class Canchas : System.Web.UI.Page
    {
        private List<Deporte> _listaDeportes;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarCanchas();
            }
        }

        private void cargarCanchas()
        {
            CanchaNegocio negocio = new CanchaNegocio();
            dgvCanchas.DataSource = negocio.listar();
            dgvCanchas.DataBind();
        }

        public string ObtenerNombreDeporte(object idDeporteObj)
        {
            if (idDeporteObj == null)
                return "Sin Deporte";

            int idDeporte = Convert.ToInt32(idDeporteObj);

            if (_listaDeportes == null)
            {
                DeporteNegocio negocio = new DeporteNegocio();
                _listaDeportes = negocio.listar();
            }

            Deporte deptoEncontrado = _listaDeportes.Find(x => x.Id == idDeporte);

            return deptoEncontrado != null ? deptoEncontrado.Nombre : "Deporte " + idDeporte;
        }

        protected void dgvCanchas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                string id = e.CommandArgument.ToString();
                Response.Redirect("AltaCancha.aspx?id=" + id);
            }
            else if (e.CommandName == "Eliminar")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                CanchaNegocio negocio = new CanchaNegocio();
                negocio.eliminarLogico(id);

                cargarCanchas();
            }
        }
    }
}