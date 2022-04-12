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
    public interface IHistoriaClinicaRepository
    {
        public Persona PersonaConHistoriaClinica(int id);
        public HistoriaClinica FindHistoriaClinicaById(int historiaClinicaId);
    }
    public class HistoriaClinicaRepository : IHistoriaClinicaRepository
    {
        private readonly AppDbContext context;

        public HistoriaClinicaRepository(AppDbContext context)
        {
            this.context = context;
        }

        public Persona PersonaConHistoriaClinica(int id)
        {
            var model = context.Personas.Include(o => o.HistoriaClinica).FirstOrDefault(o => o.PersonaId == id);

            return model;
        }
        public HistoriaClinica FindHistoriaClinicaById(int historiaClinicaId)
        {
            var model = context.HistoriaClinicas.FirstOrDefault(o => o.HistoriaClinicaId == historiaClinicaId);
            return model;
        }
    }
}
