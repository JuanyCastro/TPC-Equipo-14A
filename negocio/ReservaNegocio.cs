using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio.Enums;
using dominio;

namespace negocio
{
    public class ReservaNegocio
    {
        public List<Reserva> listar()
        {
            List<Reserva> lista = new List<Reserva>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"SELECT 
                        r.Id, r.FechaHoraInicio, r.FechaHoraFin, r.IdEstado, r.EsTurnoFijo, r.FechaAlta, r.Observaciones,
                        u.Id AS IdUsuario, u.Nombre AS NombreUsuario, u.Apellido AS ApellidoUsuario, u.Email,
                        c.Id AS IdCancha, c.IdSuperficie,
                        d.Id AS IdDeporte, d.Nombre AS NombreDeporte
                       FROM Reservas r
                       INNER JOIN Usuarios u ON r.IdUsuario = u.Id
                       INNER JOIN Canchas c ON r.IdCancha = c.Id
                       INNER JOIN Deportes d ON c.IdDeporte = d.Id
                       ORDER BY r.Id DESC");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Reserva aux = new Reserva();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.FechaHoraInicio = (DateTime)datos.Lector["FechaHoraInicio"];
                    aux.FechaHoraFin = (DateTime)datos.Lector["FechaHoraFin"];
                    aux.Estado = (EstadoReserva)(int)datos.Lector["IdEstado"];
                    aux.EsTurnoFijo = (bool)datos.Lector["EsTurnoFijo"];
                    aux.FechaAlta = (DateTime)datos.Lector["FechaAlta"];

                    if (!(datos.Lector["Observaciones"] is DBNull))
                        aux.Observaciones = (string)datos.Lector["Observaciones"];

                    aux.Usuario = new Usuario();
                    aux.Usuario.Id = (int)datos.Lector["IdUsuario"];
                    aux.Usuario.Nombre = (string)datos.Lector["NombreUsuario"];
                    aux.Usuario.Apellido = (string)datos.Lector["ApellidoUsuario"];
                    aux.Usuario.Email = (string)datos.Lector["Email"];

                    aux.Cancha = new Cancha();
                    aux.Cancha.Id = (int)datos.Lector["IdCancha"];
                    aux.Cancha.Superficie = (Superficie)(int)datos.Lector["IdSuperficie"];

                    aux.Cancha.Deporte = new Deporte();
                    aux.Cancha.Deporte.Id = (int)datos.Lector["IdDeporte"];
                    aux.Cancha.Deporte.Nombre = (string)datos.Lector["NombreDeporte"];

                    lista.Add(aux);
                }

                return lista;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void cambiarEstado(int idReserva, EstadoReserva nuevoEstado)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Reservas SET IdEstado = @estado WHERE Id = @id");
                datos.setearParametro("@estado", (int)nuevoEstado);
                datos.setearParametro("@id", idReserva);
                datos.ejecutarAccion();
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<TimeSpan> obtenerHorariosLibres(int idCancha, DateTime fecha, int duracionBloqueMinutos)
        {
            List<TimeSpan> horariosLibres = new List<TimeSpan>();

            TimeSpan horaApertura = new TimeSpan(10, 0, 0);
            TimeSpan horaCierre = new TimeSpan(23, 0, 0);

            List<Reserva> reservasDelDia = listarPorCanchaYFecha(idCancha, fecha);

            TimeSpan horaActual = horaApertura;

            while (horaActual < horaCierre)
            {
                DateTime posibleInicio = fecha.Date.Add(horaActual);
                DateTime posibleFin = posibleInicio.AddMinutes(duracionBloqueMinutos);

                bool estaOcupado = reservasDelDia.Any(r =>
                    posibleInicio < r.FechaHoraFin && posibleFin > r.FechaHoraInicio
                );

                if (!estaOcupado)
                {
                    horariosLibres.Add(horaActual);
                }

                horaActual = horaActual.Add(TimeSpan.FromMinutes(duracionBloqueMinutos));
            }

            return horariosLibres;
        }

        public int agregarReservaPendiente(Reserva nueva)
        {
            if (nueva.FechaHoraInicio == DateTime.MinValue || nueva.FechaHoraFin == DateTime.MinValue)
            {
                throw new Exception("Error: La fecha de la reserva no fue asignada. Verificá que el frontend esté cargando 'FechaHoraInicio' y 'FechaHoraFin' antes de guardar.");
            }

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Reservas (IdUsuario, IdCancha, FechaHoraInicio, FechaHoraFin, IdEstado, EsTurnoFijo, Observaciones, FechaAlta) VALUES (@idUsuario, @idCancha, @inicio, @fin, @estado, @esFijo, @observaciones, GETDATE()); SELECT SCOPE_IDENTITY();");

                datos.setearParametro("@idUsuario", nueva.Usuario.Id);
                datos.setearParametro("@idCancha", nueva.Cancha.Id);
                datos.setearParametro("@inicio", nueva.FechaHoraInicio);
                datos.setearParametro("@fin", nueva.FechaHoraFin);
                datos.setearParametro("@estado", (int)EstadoReserva.Pendiente);
                datos.setearParametro("@esFijo", nueva.EsTurnoFijo);
                datos.setearParametro("@observaciones", (object)nueva.Observaciones ?? DBNull.Value);

                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    return Convert.ToInt32(datos.Lector[0]);
                }

                throw new Exception("No se pudo obtener el ID de la reserva.");
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void confirmarReservaPagada(int idReserva)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Reservas SET IdEstado = @estado WHERE Id = @id");
                datos.setearParametro("@estado", (int)EstadoReserva.Confirmada);
                datos.setearParametro("@id", idReserva);
                datos.ejecutarAccion();
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void limpiarReservasAbandonadas()
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Reservas SET IdEstado = @estadoCancelada WHERE IdEstado = @estadoPendiente AND DATEDIFF(MINUTE, FechaAlta, GETDATE()) > 15");
                datos.setearParametro("@estadoCancelada", (int)EstadoReserva.Cancelada);
                datos.setearParametro("@estadoPendiente", (int)EstadoReserva.Pendiente);
                datos.ejecutarAccion();
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<Reserva> listarPorCanchaYFecha(int idCancha, DateTime fecha)
        {
            List<Reserva> lista = new List<Reserva>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT Id, IdUsuario, IdCancha, FechaHoraInicio, FechaHoraFin, IdEstado, EsTurnoFijo, FechaAlta FROM Reservas WHERE IdCancha = @idCancha AND CAST(FechaHoraInicio AS DATE) = @fecha AND IdEstado != @estadoCancelada");
                datos.setearParametro("@idCancha", idCancha);
                datos.setearParametro("@fecha", fecha.Date);
                datos.setearParametro("@estadoCancelada", (int)EstadoReserva.Cancelada);

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Reserva aux = new Reserva();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.FechaHoraInicio = (DateTime)datos.Lector["FechaHoraInicio"];
                    aux.FechaHoraFin = (DateTime)datos.Lector["FechaHoraFin"];
                    aux.Estado = (EstadoReserva)(int)datos.Lector["IdEstado"];
                    aux.EsTurnoFijo = (bool)datos.Lector["EsTurnoFijo"];
                    lista.Add(aux);
                }

                return lista;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
