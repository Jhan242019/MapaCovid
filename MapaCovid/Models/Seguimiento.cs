using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Models
{
    public class Seguimiento
    {
        public int SeguimientoId { get; set; }
        public int HistoriaClinicaId { get; set; }
        public List<ContactoPaciente> Contactos { get; set; }
    }
}
