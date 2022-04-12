using MapaCovid.Models.DB;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Models
{
    public class Ubicacion
    {
        public int UbicacionId { get; set; }
        [Required]
        public int DistritoId { get; set; }
        [Required]
        public string Lat { get; set; }
        [Required]
        public string Long { get; set; }
        [Required]
        public string Calle { get; set; }
        [Required]
        public int NroCasa { get; set; }
        public string Referencia { get; set; }
        public Distrito Distrito { get ;set; }
    }
}
