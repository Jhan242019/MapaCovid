using MapaCovid.Models;
using MapaCovid.Models.DB;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Repositories
{
    public interface ISeguimientoRepostory
    {
        public bool comprobarExistencia(int historiaClinicaId);
        public void createSeguimiento(Seguimiento seguimiento);
        public Seguimiento FindAllSeguimientos(int historiaClinicaId);
        public int NroCelularPersonasIguales(ContactoPaciente contacto);
        public void AddPersonaContactoPaciente(ContactoPaciente contacto, Ubicacion ubicacion);
        public void AddPersonaContacto(ContactoPaciente contacto);
        public Seguimiento SeguimientoById(ContactoPaciente contacto);
        public int HistoriaClinicaById(Seguimiento seguimiento);
        public ContactoPaciente ContactoById(int contactoId);
        public void UpdateContacto(ContactoPaciente contacto);
    }
    public class SeguimientoRepository : ISeguimientoRepostory
    {
        private readonly AppDbContext context;

        public SeguimientoRepository(AppDbContext context)
        {
            this.context = context;
            
        }
        public Seguimiento FindAllSeguimientos(int historiaClinicaId)
        {
            return context.Seguimientos.Include(o => o.Contactos).FirstOrDefault(o => o.HistoriaClinicaId == historiaClinicaId);
        }
        public int NroCelularPersonasIguales(ContactoPaciente contacto)
        {
            return (context.Personas.Where(o => o.NroCelular == contacto.Celular)).Count();
        }
        public void AddPersonaContactoPaciente(ContactoPaciente contacto, Ubicacion ubicacion)
        {
            var persona = new Persona();
            persona.Nombres = contacto.Nombre;
            persona.Apellidos = contacto.Apellido;
            persona.NroCelular = contacto.Celular;
            persona.Estado = "Sin evaluación";
            persona.Sexo = contacto.Sexo;
            persona.DNI = "";
            persona.FechaNacimiento = new DateTime(2000, 1, 1, 0, 0, 0);
            persona.UbicacionId = 0;
            persona.TelefonoEmergencia = "";
            persona.CorreoElectronico = "";
            persona.CondicionDeRiesgo = "";
            persona.UbicacionId = InsertUbicacion(ubicacion);
            context.Personas.Add(persona);
            context.SaveChangesAsync().Wait();
            int perid = persona.PersonaId;
            InsertHistoriaClinica(perid);
            context.SaveChanges();
        }
        public int InsertUbicacion(Ubicacion ubicacion)
        {
            context.Ubicaciones.Add(ubicacion);
            context.SaveChangesAsync().Wait();
            return ubicacion.UbicacionId;
        }
        public void InsertHistoriaClinica(int personaId)
        {
            var historiaClinica = new HistoriaClinica();
            historiaClinica.PersonaId = personaId;
            context.HistoriaClinicas.Add(historiaClinica);
            context.SaveChangesAsync().Wait();
        }
        public void AddPersonaContacto(ContactoPaciente contacto)
        {
            contacto.Direccion = "";
            context.Contactos.Add(contacto);
            context.SaveChanges();
        }
        public Seguimiento SeguimientoById(ContactoPaciente contacto)
        {
            return context.Seguimientos.FirstOrDefault(o => o.SeguimientoId == contacto.SeguimientoId);
        }
        public int HistoriaClinicaById(Seguimiento seguimiento)
        {
            var historiaClinica = context.HistoriaClinicas.FirstOrDefault(o => o.HistoriaClinicaId == seguimiento.HistoriaClinicaId);
            return historiaClinica.PersonaId;
            
        }
        public ContactoPaciente ContactoById(int contactoId)
        {
            return context.Contactos.FirstOrDefault(o => o.ContactoId == contactoId);
        }
        public void UpdateContacto(ContactoPaciente contacto)
        {
            context.Entry(contacto).State = EntityState.Modified;
            context.SaveChanges();
        }

        public bool comprobarExistencia(int historiaClinicaId)
        {
            if (context.Seguimientos.Where(o => o.HistoriaClinicaId == historiaClinicaId).Count() > 0)
            {
                return false;
            }
            return true;
        }

        public void createSeguimiento(Seguimiento seguimiento)
        {
            context.Seguimientos.Add(seguimiento);
            context.SaveChanges();
        }
    }
}
