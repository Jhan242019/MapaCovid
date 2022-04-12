using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MapaCovid.Models;
using MapaCovid.Models.DB;
using MapaCovid.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MapaCovid.Controllers
{
    public class SeguimientoController : Controller
    {
        private readonly ISeguimientoRepostory repositoryS;
        private readonly IDistritoRepository repositoryD;
        public SeguimientoController(ISeguimientoRepostory repositoryS, IDistritoRepository repositoryD)
        {
            this.repositoryS = repositoryS;
            this.repositoryD = repositoryD;
        }
        public IActionResult Index(int historiaClinicaId)
        {
            var model = repositoryS.FindAllSeguimientos(historiaClinicaId);
            return View(model);
        } 
        [HttpGet]
        public IActionResult CreateContacto(int seguimientoId)
        {
            ViewBag.distritos = repositoryD.ListaDistritosBD() ;
            ViewBag.Ubicacion = new Ubicacion();
            ViewBag.Seguimiento = seguimientoId;
            return View();
        }
        [HttpPost]
        public IActionResult CreateContacto(ContactoPaciente contacto, Ubicacion ubicacion, int SeguimientoId)
        {
            if (ubicacion == null || contacto == null)
                ModelState.AddModelError("Datos Nulos", "Los datos no deben ser Nulos");
            

            if (ModelState.IsValid)
            {
                if (repositoryS.NroCelularPersonasIguales(contacto) == 0)
                    repositoryS.AddPersonaContactoPaciente(contacto, ubicacion);
                
                repositoryS.AddPersonaContacto(contacto);
                var seguimiento = repositoryS.SeguimientoById(contacto);
                var historiaClinica = repositoryS.HistoriaClinicaById(seguimiento);
                return RedirectToAction("Index", "HistoriaClinica", new { id = historiaClinica });
            }
            ViewBag.distritos = repositoryD.ListaDistritosBD();
            ViewBag.Ubicacion = new Ubicacion();
            ViewBag.Seguimiento = SeguimientoId;
            return View();
        }
        
        public IActionResult VerContacto(int contactoId)
        {
            var model = repositoryS.ContactoById(contactoId);
            return View(model);
        }
        [HttpGet]
        public IActionResult UpdateContacto(int contactoId)
        {
            var model = repositoryS.ContactoById(contactoId);
            return View(model);
        }
        [HttpPost]
        public IActionResult UpdateContacto(ContactoPaciente contacto)
        {
            if (contacto == null)
                ModelState.AddModelError("Datos Nulos", "Los datos no deben ser Nulos");

            if (ModelState.IsValid)
            {
                repositoryS.UpdateContacto(contacto);

                var seguimiento = repositoryS.SeguimientoById(contacto);
                var historiaClinica = repositoryS.HistoriaClinicaById(seguimiento);
                return RedirectToAction("Index", "HistoriaClinica", new { id = historiaClinica });
            }

            return View(contacto);
        }
    }
}
