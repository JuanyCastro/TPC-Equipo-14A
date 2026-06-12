using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Cancha
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public Deporte Deporte { get; set; }
        public decimal PrecioBase { get; set; }
        public bool EnMantenimiento { get; set; }
        public bool Activa { get; set; }
    }
}
