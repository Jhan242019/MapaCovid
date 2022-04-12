using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Models
{
    public class Persona
    {
        public int PersonaId { get; set; }
        public int UbicacionId { get; set; }
        [Required]
        public string Nombres { get; set; }
        [Required]
        public string Apellidos { get; set; }
        [Required]
        public string DNI { get; set; }
        [Required]
        public string NroCelular { get; set; }
        [Required]
        public string Estado { get; set; }
        [Required]
        public char Sexo { get; set; }
        [Required]
        public string TelefonoEmergencia { get; set; }
        [Required]
        public string CorreoElectronico { get; set; }
        [Required]
        public string CondicionDeRiesgo { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public Ubicacion Ubicacion { get; set; }
        public HistoriaClinica HistoriaClinica { get; set; }
    }
}
