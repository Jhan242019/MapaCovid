using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Models
{
    public class HistoriaClinica
    {
        public int HistoriaClinicaId { get; set; }
        public int PersonaId { get; set; }
        public Persona Persona { get; set; }

    }
}
