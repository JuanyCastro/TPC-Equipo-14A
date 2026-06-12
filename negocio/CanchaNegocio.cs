using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class CanchaNegocio
    {
        public List<Cancha> listar()
        {
            List<Cancha> lista = new List<Cancha>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT Id, Nombre, IdDeporte, PrecioBase, EnMantenimiento, Activa FROM Canchas");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Cancha aux = new Cancha();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.PrecioBase = (decimal)datos.Lector["PrecioBase"];
                    aux.EnMantenimiento = (bool)datos.Lector["EnMantenimiento"];
                    aux.Activa = (bool)datos.Lector["Activa"];

                    aux.Deporte = new Deporte();
                    aux.Deporte.Id = (int)datos.Lector["IdDeporte"];

                    if (!(datos.Lector["Nombre"] is DBNull))
                        aux.Nombre = (string)datos.Lector["Nombre"];

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

        public void agregar(Cancha nueva)
        {
            if (nueva.Deporte == null || !deporteExiste(nueva.Deporte.Id))
            {
                throw new Exception("Error de validación: El Deporte asignado no existe en el sistema.");
            }

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Canchas (Nombre, IdDeporte, PrecioBase, EnMantenimiento, Activa) VALUES (@nombre, @idDeporte, @precioBase, @enMantenimiento, 1)");
                datos.setearParametro("@nombre", (object)nueva.Nombre ?? DBNull.Value);
                datos.setearParametro("@idDeporte", nueva.Deporte.Id);
                datos.setearParametro("@precioBase", nueva.PrecioBase);
                datos.setearParametro("@enMantenimiento", nueva.EnMantenimiento);

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

        public void modificar(Cancha modificar)
        {
            if (modificar.Deporte == null || !deporteExiste(modificar.Deporte.Id))
            {
                throw new Exception("Error de validación: El Deporte asignado no existe en el sistema.");
            }

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Canchas SET Nombre = @nombre, IdDeporte = @idDeporte, PrecioBase = @precioBase, EnMantenimiento = @enMantenimiento, Activa = @activa WHERE Id = @id");
                datos.setearParametro("@nombre", (object)modificar.Nombre ?? DBNull.Value);
                datos.setearParametro("@idDeporte", modificar.Deporte.Id);
                datos.setearParametro("@precioBase", modificar.PrecioBase);
                datos.setearParametro("@enMantenimiento", modificar.EnMantenimiento);
                datos.setearParametro("@activa", modificar.Activa);
                datos.setearParametro("@id", modificar.Id);

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
                datos.setearConsulta("UPDATE Canchas SET Activa = 0 WHERE Id = @id");
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

        private bool deporteExiste(int idDeporte)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Id FROM Deportes WHERE Id = @id");
                datos.setearParametro("@id", idDeporte);
                datos.ejecutarLectura();

                return datos.Lector.Read();
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
