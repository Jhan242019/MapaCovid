using MapaCovid.Models;
using MapaCovid.Models.DB;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Repositories
{
    public interface IRecetaRepository
    {
        public void AñadirRecetas(Receta receta);
        public Receta GetReceta(int RecetaId);
        public void ModificarReceta(Receta receta);
        public List<Receta> GetRecetasByCuadroClinico(int CuadroClinicoId);
        public int EliminarReceta(int RecetaId);
    }
    public class RecetaRepository : IRecetaRepository
    {
        public readonly AppDbContext context;
        public RecetaRepository(AppDbContext context)
        {
            this.context = context;
        }
        public void AñadirRecetas(Receta receta)
        {
            receta.FechaEmision = DateTime.Now.Date;
            context.Recetas.Add(receta);
            context.SaveChanges();
        }
        public Receta GetReceta(int RecetaId)
        {
            return context.Recetas
                .Where(o => o.RecetaId == RecetaId)
                .FirstOrDefault();
        }
        public void ModificarReceta(Receta receta)
        {
            context.Entry(receta).State = EntityState.Modified;
            context.SaveChanges();
        }
        public List<Receta> GetRecetasByCuadroClinico(int CuadroClinicoId)
        {
            var recetas = context.Recetas.Where(o => o.CuadroClinicoId == CuadroClinicoId)
                .Include(o => o.CuadroClinico).ToList();
            return recetas;
        }
        public int EliminarReceta(int RecetaId)
        {
            
            var receta = context.Recetas.Where(o => o.RecetaId == RecetaId).First();
            var cuadroId = receta.CuadroClinicoId;
            context.Recetas.Remove(receta);
            context.SaveChanges();
            return cuadroId;
        }
    }
}
