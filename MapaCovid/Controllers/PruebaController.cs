using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MapaCovid.Models;
using MapaCovid.Models.DB;
using MapaCovid.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace MapaCovid.Controllers
{
    public class PruebaController : Controller
    {
        private readonly IPruebasRepository pruebasRepository;
        private readonly IHistoriaClinicaRepository repositoryH;
        private readonly IPersonaRepository repositoryP;
        private readonly ISeguimientoRepostory repostoryS;
        public PruebaController(IPruebasRepository pruebasRepository, IHistoriaClinicaRepository repositoryH, IPersonaRepository repositoryP, ISeguimientoRepostory repostoryS)
        {
            this.pruebasRepository = pruebasRepository;
            this.repositoryH = repositoryH;
            this.repositoryP = repositoryP;
            this.repostoryS = repostoryS;
        }
        public IActionResult Index(int historiaClinicaId)
        {
            var model = pruebasRepository.PruebasByHistoriaClinicaId(historiaClinicaId);
            ViewBag.Cantidad = pruebasRepository.Count(model);
            return View(model);
        }
        public IActionResult Create(int historiaClinicaId)
        {
            ViewBag.HistoriaClinicaId = repositoryH.FindHistoriaClinicaById(historiaClinicaId);
            return View();
        }
        [HttpPost]
        public IActionResult Create(Prueba prueba)
        {
            if (ModelState.IsValid)
            {
                pruebasRepository.AgregarPrueba(prueba);
                var historiaClinica = repositoryH.FindHistoriaClinicaById(prueba.HistoriaClinicaId);
                if (prueba.Resultado == "IgG Reactivo" || prueba.Resultado == "IgM e IgG Reactivo")
                {
                    var userdb = repositoryP.FindPersonaById(historiaClinica.PersonaId);
                    userdb.Estado = "Positivo";
                    pruebasRepository.SaveChanges();
                    
                    if (repostoryS.comprobarExistencia(historiaClinica.HistoriaClinicaId))
                    {
                        var seguimiento = new Seguimiento();
                        seguimiento.HistoriaClinicaId = historiaClinica.HistoriaClinicaId;
                        repostoryS.createSeguimiento(seguimiento);
                    }
                    
                    
                }
                if (prueba.Resultado == "IgM Reactivo" )
                {
                    var userdb = repositoryP.FindPersonaById(historiaClinica.PersonaId);
                    userdb.Estado = "Recuperado";
                    pruebasRepository.SaveChanges();
                }
                if (prueba.Resultado == "Indeterminado")
                {
                    var userdb = repositoryP.FindPersonaById(historiaClinica.PersonaId);
                    userdb.Estado = "Indeterminado";
                    pruebasRepository.SaveChanges();
                }

                return RedirectToAction("Index", "HistoriaClinica", new { id = historiaClinica.PersonaId });
            }
            ViewBag.HistoriaClinicaId = repositoryH.FindHistoriaClinicaById(prueba.HistoriaClinicaId);
            return View(prueba);
        }
        [HttpGet]
        public IActionResult Ver(int id)
        {
            var model = pruebasRepository.PruebaById(id);
            return View(model);
        }
    }
}
