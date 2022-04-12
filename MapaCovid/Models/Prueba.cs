using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Models
{
    public class Prueba
    {
        public int PruebaId { get; set; }
        public int HistoriaClinicaId { get; set; }
        public DateTime FechaHoraRealizada { get; set; }
        public string Resultado { get; set; }
        public string Observacion { get; set; }
        public string TipoMuestra { get; set; }
    }
}
