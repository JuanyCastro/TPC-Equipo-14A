using dominio;
using System;
using System.Collections.Generic;

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
                datos.setearConsulta("SELECT Id, Nombre, IdDeporte, IdSuperficie, PrecioBase, EnMantenimiento, Activa FROM Canchas");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Cancha aux = new Cancha();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.PrecioBase = (decimal)datos.Lector["PrecioBase"];
                    aux.EnMantenimiento = (bool)datos.Lector["EnMantenimiento"];
                    aux.Activa = (bool)datos.Lector["Activa"];

                    aux.Deporte = new Deporte();
                    if (!(datos.Lector["IdDeporte"] is DBNull))
                        aux.Deporte.Id = (int)datos.Lector["IdDeporte"];

                    if (!(datos.Lector["IdSuperficie"] is DBNull))
                        aux.Superficie = (Superficie)(int)datos.Lector["IdSuperficie"];

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
            string nombreDeporte = obtenerNombreDeporte(nueva.Deporte.Id);
            nueva.Nombre = $"{nombreDeporte} - {nueva.Superficie.ToString()}";

            if (canchaExiste(nueva.Nombre))
                throw new Exception("Ya existe una cancha con esta combinación de deporte y superficie.");

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Canchas (Nombre, IdDeporte, IdSuperficie, PrecioBase, EnMantenimiento, Activa) VALUES (@nombre, @idDeporte, @idSuperficie, @precioBase, @enMantenimiento, 1)");
                datos.setearParametro("@nombre", nueva.Nombre);
                datos.setearParametro("@idDeporte", nueva.Deporte.Id);
                datos.setearParametro("@idSuperficie", (int)nueva.Superficie);
                datos.setearParametro("@precioBase", nueva.PrecioBase);
                datos.setearParametro("@enMantenimiento", nueva.EnMantenimiento);

                datos.ejecutarAccion();
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void modificar(Cancha modificar)
        {
            validarDatos(modificar);
            string nombreDeporte = obtenerNombreDeporte(modificar.Deporte.Id);
            modificar.Nombre = $"{nombreDeporte} - {modificar.Superficie.ToString()}";

            AccesoDatos datosValidacion = new AccesoDatos();
            try
            {
                datosValidacion.setearConsulta("SELECT Id FROM Canchas WHERE Nombre = @nombre AND Id != @id");
                datosValidacion.setearParametro("@nombre", modificar.Nombre);
                datosValidacion.setearParametro("@id", modificar.Id);
                datosValidacion.ejecutarLectura();
                if (datosValidacion.Lector.Read())
                    throw new Exception("Esta combinación de deporte y superficie ya pertenece a otra cancha.");
            }
            finally
            {
                datosValidacion.cerrarConexion();
            }

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Canchas SET Nombre = @nombre, IdDeporte = @idDeporte, IdSuperficie = @idSuperficie, PrecioBase = @precioBase, EnMantenimiento = @enMantenimiento, Activa = @activa WHERE Id = @id");
                datos.setearParametro("@nombre", modificar.Nombre);
                datos.setearParametro("@idDeporte", modificar.Deporte.Id);
                datos.setearParametro("@idSuperficie", (int)modificar.Superficie);
                datos.setearParametro("@precioBase", modificar.PrecioBase);
                datos.setearParametro("@enMantenimiento", modificar.EnMantenimiento);
                datos.setearParametro("@activa", modificar.Activa);
                datos.setearParametro("@id", modificar.Id);

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
            finally
            {
                datos.cerrarConexion();
            }
        }

        private string obtenerNombreDeporte(int idDeporte)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Nombre FROM Deportes WHERE Id = @id");
                datos.setearParametro("@id", idDeporte);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    return (string)datos.Lector["Nombre"];
                }
                return "Deporte Desconocido";
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}