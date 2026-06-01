using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class DeporteNegocio
    {
        public List<Deporte> listar()
        {
            List<Deporte> lista = new List<Deporte>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT Id, Nombre, DuracionBloqueMinutos, Activo FROM Deportes");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Deporte aux = new Deporte();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.DuracionBloqueMinutos = (int)datos.Lector["DuracionBloqueMinutos"];
                    aux.Activo = (bool)datos.Lector["Activo"];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public void agregar(Deporte nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Deportes (Nombre, DuracionBloqueMinutos, Activo) VALUES (@nombre, @duracion, 1)");
                datos.setearParametro("@nombre", nuevo.Nombre);
                datos.setearParametro("@duracion", nuevo.DuracionBloqueMinutos);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public void modificar(Deporte deporte)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Deportes SET Nombre = @nombre, DuracionBloqueMinutos = @duracion, Activo = @activo WHERE Id = @id");
                datos.setearParametro("@nombre", deporte.Nombre);
                datos.setearParametro("@duracion", deporte.DuracionBloqueMinutos);
                datos.setearParametro("@activo", deporte.Activo);
                datos.setearParametro("@id", deporte.Id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public void eliminarLogico(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Deportes SET Activo = 0 WHERE Id = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
