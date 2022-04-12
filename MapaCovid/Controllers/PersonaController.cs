using MapaCovid.Models;
using MapaCovid.Repositories;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;

namespace MapaCovid.Controllers
{
    public class PersonaController : Controller
    {
        private readonly IPersonaRepository repositoryP;
        private readonly IDistritoRepository repositoryD;

        public PersonaController(IPersonaRepository repositoryP, IDistritoRepository repositoryD)
        {
            this.repositoryP = repositoryP;
            this.repositoryD = repositoryD;
        }

        public IActionResult Index(string nombre, string dni)
        {
            var model = repositoryP.BuscarPersonas(nombre, dni);

            if (model == null)
            {
                ModelState.AddModelError("Resultado", "No se encontro ningun resultado");
            }

            return View(model);
        }

        [HttpGet]
        public IActionResult Create()
        {
            ViewBag.distritos = repositoryD.ListaDistritosBD();
            ViewBag.Ubicacion = new Ubicacion();
            return View(new Persona());
        }

        [HttpPost]
        public IActionResult Create(Persona persona, Ubicacion ubicacion)
        {
            if (repositoryP.ListaPersonasBD().Where(o => o.DNI == persona.DNI).Count() > 0)
            {
                ModelState.AddModelError("Paciente", "Ya existe un paciente con ese DNI");
            }
            if (persona == null || ubicacion == null)
            {
                ModelState.AddModelError("Datos Nulos","Los datos no deben ser Nulos");
            }

            if (ModelState.IsValid)
            {
                repositoryP.AgregarPersonas(persona, ubicacion);
                return RedirectToAction("Index", "Usuario");
            }

            ViewBag.distritos = repositoryD.ListaDistritosBD();
            ViewBag.Ubicacion = ubicacion;
            return View(persona);
        }

        [HttpGet]
        public IActionResult Update(int PersonaId)
        {
            ViewBag.distritos = repositoryD.ListaDistritosBD();
            var persona = repositoryP.FindPersonaById(PersonaId);
            ViewBag.Ubicacion = repositoryP.ListarUbicacion(persona.UbicacionId);
            return View(persona);
        }

        [HttpPost]
        public IActionResult Update(Persona persona, Ubicacion ubicacion)
        {
            if (persona == null || ubicacion == null)
            {
                ModelState.AddModelError("Datos Nulos", "Los datos no deben ser Nulos");
            }
            if (ModelState.IsValid)
            {
                repositoryP.ActualizarPersona(persona, ubicacion);
                return RedirectToAction("Index", "Usuario");
            }
            ViewBag.distritos = repositoryD.ListaDistritosBD();
            ViewBag.Ubicacion = ubicacion;
            return View(persona);
        }


    }
}
