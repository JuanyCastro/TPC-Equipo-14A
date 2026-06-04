using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio.Enums;

namespace dominio
{
    public class Reserva
    {
        public int Id { get; set; }
        public Usuario Usuario { get; set; }
        public Cancha Cancha { get; set; }
        public DateTime FechaHoraInicio { get; set; }
        public DateTime FechaHoraFin { get; set; }
        public EstadoReserva Estado { get; set; }
        public bool EsTurnoFijo { get; set; }
        public string Observaciones { get; set; }
        public DateTime FechaAlta { get; set; }
    }
}
