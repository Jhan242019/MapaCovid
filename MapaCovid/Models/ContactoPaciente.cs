using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Models
{
    public class ContactoPaciente
    {
        public int ContactoId { get; set; }
        public int SeguimientoId { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Parentesco { get; set; }
        public int Edad { get; set; }
        public char Sexo { get; set; }
        public string Celular { get; set; }
        public string Direccion { get; set; }
        public Seguimiento Seguimiento { get; set; }
    }
}
