using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Reserva
    {
        public int Id { get; set; }
        public int IdCliente { get; set; }
        public int IdCancha { get; set; }
        public DateTime FechaHoraInicio { get; set; }
        public DateTime FechaHoraFin { get; set; }
        public int IdEstado { get; set; }
        public bool EsTurnoFijo { get; set; }
        public string Observaciones { get; set; }
        public DateTime FechaAlta { get; set; }
    }
}
