
using Microsoft.AspNetCore.Mvc;

using MapaCovid.Repositories;

namespace MapaCovid.Controllers
{
    public class HomeController : Controller
    {
        private readonly IPersonaRepository repositoryP;
        private readonly IDistritoRepository repositoryD;
        public HomeController(IPersonaRepository repositoryP, IDistritoRepository repositoryD)
        {
            this.repositoryP = repositoryP;
            this.repositoryD = repositoryD;
        }

        public IActionResult Index()
        {
            var model = repositoryD.ListaDistritosBD();
            return View(model);
        }
        public IActionResult _Index()
        {
            var model = repositoryD.ListaDistritosBD();
            return View(model);
        }
        public string Cords()
        {
            var model = repositoryP.ListaPersonasConUbicacion();
            return System.Text.Json.JsonSerializer.Serialize(model);
        }
        public string Pintar(string tipo)
        {
            var model = repositoryP.PintarUbicacion(tipo);
            return System.Text.Json.JsonSerializer.Serialize(model);
        }

    }
}
