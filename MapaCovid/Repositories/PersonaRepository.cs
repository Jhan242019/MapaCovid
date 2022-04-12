using MapaCovid.Models;
using MapaCovid.Models.DB;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Repositories
{
    public interface IPersonaRepository
    {
        public List<Persona> ListaPersonasBD();
        public List<Persona> ListaPersonasConUbicacion();
        public void AgregarPersonas(Persona persona, Ubicacion ubicacion);
        public List<Persona> BuscarPersonas(string nombre, string dni);
        public IQueryable<Persona> PintarUbicacion(string tipo);
        public Persona FindPersonaById(int id);
        public void ActualizarPersona(Persona persona, Ubicacion ubicacion);
        public Ubicacion ListarUbicacion(int UbicacionId);
    }
    public class PersonaRepository : IPersonaRepository
    {
        public readonly AppDbContext context;

        public PersonaRepository(AppDbContext context)
        {
            this.context = context;
        }

        public List<Persona> ListaPersonasBD()
        {
            var personas = context.Personas.ToList();

            return personas;
        }
        public List<Persona> ListaPersonasConUbicacion()
        {
            return context.Personas.Include(o => o.Ubicacion).ToList();
        }
        public void AgregarPersonas(Persona persona, Ubicacion ubicacion)
        {
            persona.UbicacionId = InsertUbicacion(ubicacion);
            context.Personas.Add(persona);
            context.SaveChangesAsync().Wait();
            int perid = persona.PersonaId;
            InsertHistoriaClinica(perid);
            //CreateHistClinica(persona);
        }
        public List<Persona> BuscarPersonas(string nombre, string dni)
        {
            
            if (!String.IsNullOrEmpty(nombre)  )
            {
                var model = context.Personas.Where(o => o.Nombres.Contains(nombre)).ToList();
                return model;
            }
            if (!String.IsNullOrEmpty(dni))
            {
                var model = context.Personas.Where(o => o.DNI.Contains(dni)).ToList();
                return model;
            }
            return context.Personas.ToList();
        }

        public Persona FindPersonaById(int id)
        {
            var model = context.Personas.FirstOrDefault(o => o.PersonaId == id);
            return model;
        }
        //------------------------------------------------------------//
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
            context.SaveChanges();
        }

        public IQueryable<Persona> PintarUbicacion(string tipo)
        {
            var model = context.Personas.AsQueryable();
            if (!String.IsNullOrEmpty(tipo))
            {
                model = model.Where(o => o.Estado == tipo);
            }
            model = model.Include(o => o.Ubicacion).ToList().AsQueryable();

            return model;
        }

        public void ActualizarPersona(Persona persona, Ubicacion ubicacion)
        {
            persona.UbicacionId = InsertUbicacion(ubicacion);
            context.Entry(persona).State = EntityState.Modified;
            context.SaveChanges();
        }

        public Ubicacion ListarUbicacion(int UbicacionId)
        {
            return context.Ubicaciones.Where(o => o.UbicacionId == UbicacionId).FirstOrDefault();
        }
    }
}
