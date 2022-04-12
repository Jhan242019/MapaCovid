using MapaCovid.Models;
using MapaCovid.Models.DB;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;

namespace MapaCovid.Repositories
{
    public interface ICuadrosClinicosRepository
    {
        public List<CuadroClinico> CadrosClinicosBD(int historiaClinicaId);
        public void CreateCuadroClinico(CuadroClinico cuadroClinico);
        public CuadroClinico FindCuadroClinicoById(int Id);
        public void UpdateCuadroClinico(CuadroClinico cuadroClinico);
    }
    public class CuadrosClinicosRepository : ICuadrosClinicosRepository
    {
        public readonly AppDbContext context;
        public CuadrosClinicosRepository(AppDbContext context)
        {
            this.context = context;
        }
        public List<CuadroClinico> CadrosClinicosBD(int historiaClinicaId)
        {
            var model = context.CuadrosClinicos.Where(o => o.HistoriaClinicaId == historiaClinicaId).ToList();

            return model;
        }

        public void CreateCuadroClinico(CuadroClinico cuadroClinico)
        {
            context.CuadrosClinicos.Add(cuadroClinico);
            context.SaveChanges();
        }

        public CuadroClinico FindCuadroClinicoById(int Id)
        {
            var model = context.CuadrosClinicos.FirstOrDefault(o => o.CuadroClinicoId == Id);
            return model;
        }

        public void UpdateCuadroClinico(CuadroClinico cuadroClinico)
        {
            context.Entry(cuadroClinico).State = EntityState.Modified;
            context.SaveChangesAsync().Wait();
        }
    }
}
