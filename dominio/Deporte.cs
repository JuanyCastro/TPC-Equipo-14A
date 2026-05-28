using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Deporte
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int DuracionBloqueMinutos { get; set; }
        public bool Activo { get; set; }
    }
}
