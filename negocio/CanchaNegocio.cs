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
            validarDatos(nueva);
            if (canchaExiste(nueva.Nombre))
                throw new Exception("Ya existe una cancha con ese nombre.");

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Canchas (Nombre, IdDeporte, PrecioBase, EnMantenimiento, Activa) VALUES (@nombre, @idDeporte, @precioBase, @enMantenimiento, 1)");
                datos.setearParametro("@nombre", nueva.Nombre);
                datos.setearParametro("@idDeporte", nueva.Deporte.Id);
                datos.setearParametro("@precioBase", nueva.PrecioBase);
                datos.setearParametro("@enMantenimiento", nueva.EnMantenimiento);
                datos.ejecutarAccion();
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void modificar(Cancha modificarCancha)
        {
            validarDatos(modificarCancha);
            AccesoDatos datosValidacion = new AccesoDatos();
            try
            {
                datosValidacion.setearConsulta("SELECT Id FROM Canchas WHERE Nombre = @nombre AND Id != @id");
                datosValidacion.setearParametro("@nombre", modificarCancha.Nombre);
                datosValidacion.setearParametro("@id", modificarCancha.Id);
                datosValidacion.ejecutarLectura();
                if (datosValidacion.Lector.Read())
                    throw new Exception("El nombre ingresado ya pertenece a otra cancha.");
            }
            finally
            {
                datosValidacion.cerrarConexion();
            }

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Canchas SET Nombre = @nombre, IdDeporte = @idDeporte, PrecioBase = @precioBase, EnMantenimiento = @enMantenimiento, Activa = @activa WHERE Id = @id");
                datos.setearParametro("@nombre", modificarCancha.Nombre);
                datos.setearParametro("@idDeporte", modificarCancha.Deporte.Id);
                datos.setearParametro("@precioBase", modificarCancha.PrecioBase);
                datos.setearParametro("@enMantenimiento", modificarCancha.EnMantenimiento);
                datos.setearParametro("@activa", modificarCancha.Activa);
                datos.setearParametro("@id", modificarCancha.Id);
                datos.ejecutarAccion();
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

        private void validarDatos(Cancha cancha)
        {
            if (string.IsNullOrWhiteSpace(cancha.Nombre))
                throw new Exception("El nombre de la cancha es obligatorio.");

            if (cancha.PrecioBase < 0)
                throw new Exception("El precio base no puede ser negativo.");

            if (cancha.Deporte == null || !deporteExiste(cancha.Deporte.Id))
                throw new Exception("El deporte asignado no existe en el sistema.");
        }

        private bool canchaExiste(string nombre)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Id FROM Canchas WHERE Nombre = @nombre");
                datos.setearParametro("@nombre", nombre);
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
