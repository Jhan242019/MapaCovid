using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Models
{
    public class Receta
    { 
        public int RecetaId { set; get; }
        public int CuadroClinicoId { set; get; }
        public DateTime FechaEmision { set; get; }
        public string Descripcion { set; get; }
        public CuadroClinico CuadroClinico { set; get; }
    }
}
