
using MapaCovid.Models;
using MapaCovid.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace MapaCovid.Controllers
{
    public class RecetaController : Controller
    {
        private readonly IRecetaRepository repositoryR;
        public RecetaController(IRecetaRepository repositoryR)
        {
            this.repositoryR = repositoryR;
        }
        public IActionResult Index(int CuadroClinicoId)
        {
            var recetas = repositoryR.GetRecetasByCuadroClinico(CuadroClinicoId);
            return View(recetas);
        }
        [HttpGet]
        public IActionResult Create(int CuadroClinicoId)
        {
            ViewBag.CuadroClinicoId = CuadroClinicoId;
            return View(new Receta());
        }
        //[Authorize]
        [HttpPost]
        public IActionResult Create(Receta receta)
        {

            if (ModelState.IsValid)
            {
                repositoryR.AñadirRecetas(receta);
                return RedirectToAction("Index", "Receta",new { CuadroClinicoId = receta.CuadroClinicoId });
            }
            return View(receta);
        }
        [HttpGet]
        public ViewResult Update(int RecetaId)
        {
            var receta = repositoryR.GetReceta(RecetaId);
            return View(receta);
        }

        [HttpPost]
        public IActionResult Update(Receta receta)
        {

            if (ModelState.IsValid)
            {
                repositoryR.ModificarReceta(receta);
                return RedirectToAction("Index", "Receta", new { CuadroClinicoId = receta.CuadroClinicoId });
            }
            return View(receta);
        }

        [HttpGet]
        public IActionResult Delete(int RecetaId)
        {
            int cuadroClinicoId = repositoryR.EliminarReceta(RecetaId);

            return RedirectToAction("Index", "Receta", new { CuadroClinicoId = cuadroClinicoId });
        }
    }
}
