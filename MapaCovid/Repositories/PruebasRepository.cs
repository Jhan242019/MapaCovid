using MapaCovid.Models;
using MapaCovid.Models.DB;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MapaCovid.Repositories
{
    public interface IPruebasRepository
    {
        public List<Prueba> PruebasByHistoriaClinicaId(int historiaClinicaId);
        public void AgregarPrueba(Prueba prueba);
        public void SaveChanges();
        public Prueba PruebaById(int id);
        public int Count(List<Prueba> model);
    }
    public class PruebasRepository : IPruebasRepository
    {
        public readonly AppDbContext context;
        public PruebasRepository(AppDbContext context)
        {
            this.context = context;
        }

        public List<Prueba> PruebasByHistoriaClinicaId(int historiaClinicaId)
        {
            return context.Pruebas.Where(o => o.HistoriaClinicaId == historiaClinicaId).ToList();
        }

        public void AgregarPrueba(Prueba prueba)
        {
            context.Pruebas.Add(prueba);
            context.SaveChanges();
        }
        public void SaveChanges()
        {
            context.SaveChanges();
        }

        public Prueba PruebaById(int id)
        {
            return context.Pruebas.FirstOrDefault(o => o.PruebaId == id);
        }

        public int Count(List<Prueba> model)
        {
            return model.Count();
        }
    }
}
