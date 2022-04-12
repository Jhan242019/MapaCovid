using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;
using MapaCovid.Extensions;
using MapaCovid.Models;
using MapaCovid.Models.DB;
using MapaCovid.Repositories;
using MapaCovid.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MapaCovid.Controllers
{
    public class CuadroClinicoController : Controller
    {
        private readonly IHistoriaClinicaRepository repositoryH;
        private readonly ICuadrosClinicosRepository repositoryC;
        private readonly ICookieAuthService cookieAuthService;
        private readonly IUsuarioRepository repositoryU;
        public CuadroClinicoController(IHistoriaClinicaRepository repositoryH, ICuadrosClinicosRepository repositoryC, ICookieAuthService cookieAuthService, IUsuarioRepository repositoryU)
        {
            this.repositoryH = repositoryH;
            this.repositoryC = repositoryC;
            this.cookieAuthService = cookieAuthService;
            this.repositoryU = repositoryU;
        }
        public IActionResult Index(int historiaClinicaId)
        {
            ViewBag.HistoriaClinica = repositoryH.FindHistoriaClinicaById(historiaClinicaId);
            var model = repositoryC.CadrosClinicosBD(historiaClinicaId);
            return View(model);
        }
        [HttpGet]
        public IActionResult Create(int historiaClinicaId)
        {
            ViewBag.HistoriaClinicaId = repositoryH.FindHistoriaClinicaById(historiaClinicaId);
            return View();
        }
        [HttpPost]
        public IActionResult Create(CuadroClinico cuadroClinico, FuncionesVitales vitales, List<Sintomas> sintomas, List<Sintomas> alarma)
        {
            cookieAuthService.SetHttpContext(HttpContext);
            var usuario = cookieAuthService.UsuarioLogueado();

            cuadroClinico.FuncionesVitales = JsonSerializer.Serialize(vitales).ToString();
            cuadroClinico.SignosSintomas = JsonSerializer.Serialize(sintomas);
            cuadroClinico.SintomasAlarma = JsonSerializer.Serialize(alarma);
            cuadroClinico.UsuarioId = usuario.UsuarioId;

            if (ModelState.IsValid) {
                repositoryC.CreateCuadroClinico(cuadroClinico);
                var historiaClinica = repositoryH.FindHistoriaClinicaById(cuadroClinico.HistoriaClinicaId);
                return RedirectToAction("Index","HistoriaClinica", new { id = historiaClinica.PersonaId });
            }
            ViewBag.HistoriaClinicaId = repositoryH.FindHistoriaClinicaById(cuadroClinico.HistoriaClinicaId);

            return View(cuadroClinico);
        }
        [HttpGet]
        public IActionResult Ver(int id)
        {
            var cuadroClinico = repositoryC.FindCuadroClinicoById(id);
            ViewBag.funcionesVitales = JsonSerializer.Deserialize<FuncionesVitales>(cuadroClinico.FuncionesVitales);
            ViewBag.Sintomas = JsonSerializer.Deserialize<List<Sintomas>>(cuadroClinico.SignosSintomas);
            ViewBag.SintomasAlarma = JsonSerializer.Deserialize<List<Sintomas>>(cuadroClinico.SintomasAlarma);
            ViewBag.Usuario = repositoryU.UserByCuadroClinico(cuadroClinico);
            return View(cuadroClinico);
        }
        [HttpGet]
        public IActionResult Update(int id)
        {
            var model = repositoryC.FindCuadroClinicoById(id);
            ViewBag.HistoriaClinicaId = repositoryH.FindHistoriaClinicaById(model.HistoriaClinicaId);
            ViewBag.funcionesVitales = JsonSerializer.Deserialize<FuncionesVitales>(model.FuncionesVitales);
            ViewBag.Sintomas = JsonSerializer.Deserialize<List<Sintomas>>(model.SignosSintomas);
            ViewBag.SintomasAlarma = JsonSerializer.Deserialize<List<Sintomas>>(model.SintomasAlarma);
            return View(model);
        }
        [HttpPost]
        public IActionResult Update(CuadroClinico cuadroClinico, FuncionesVitales vitales, List<Sintomas> sintomas, List<Sintomas> alarma)
        {
            cookieAuthService.SetHttpContext(HttpContext);
            var usuario = cookieAuthService.UsuarioLogueado();
            cuadroClinico.FuncionesVitales = JsonSerializer.Serialize(vitales).ToString();
            cuadroClinico.SignosSintomas = JsonSerializer.Serialize(sintomas);
            cuadroClinico.SintomasAlarma = JsonSerializer.Serialize(alarma);
            cuadroClinico.UsuarioId = usuario.UsuarioId;
            if (ModelState.IsValid)
            {
                repositoryC.UpdateCuadroClinico(cuadroClinico);
                var historiaClinica = repositoryH.FindHistoriaClinicaById(cuadroClinico.HistoriaClinicaId);
                return RedirectToAction("Index", "HistoriaClinica", new { id = historiaClinica.PersonaId });
            }
            ViewBag.HistoriaClinicaId = repositoryH.FindHistoriaClinicaById(cuadroClinico.HistoriaClinicaId);
            return View(cuadroClinico);
        }
    }
}
