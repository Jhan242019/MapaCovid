using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Models
{
    public class CuadroClinico
    {
        public int CuadroClinicoId { get; set; }
        [Required]
        public int HistoriaClinicaId { get; set; }
        [Required]
        public DateTime Fecha { get; set; }
        [Required]
        public string TipoMonitoreo { get; set; }
        public string FuncionesVitales { get; set; }
        public string SignosSintomas { get; set; }
        public string SintomasAlarma { get; set; }
        [Required]
        public string Evolucion { get; set; }
        public string Observaciones { get; set; }
        public int UsuarioId { get; set; }
        public List<Receta> Recetas { set; get; }

    }
}
