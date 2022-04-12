using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Models.DB
{
    public class Distrito {
        public int DistritoId { get; set; }
        public string Nombre { get; set; }
        public List<Ubicacion> Ubicaciones { get; set; }
    }
}
