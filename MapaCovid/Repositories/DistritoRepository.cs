using MapaCovid.Models.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Repositories
{
    public interface IDistritoRepository
    {
        public List<Distrito> ListaDistritosBD();
    }
    public class DistritoRepository : IDistritoRepository
    {
        public readonly AppDbContext context;
        public DistritoRepository(AppDbContext context)
        {
            this.context = context;
        }

        public List<Distrito> ListaDistritosBD()
        {
            return context.Distritos.ToList();
        }
    }
}
