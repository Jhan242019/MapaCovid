using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MapaCovid.Models.DB;
using MapaCovid.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MapaCovid.Controllers
{
    public class HistoriaClinicaController : Controller
    {
        private readonly IHistoriaClinicaRepository repositoryH;

        public HistoriaClinicaController(IHistoriaClinicaRepository repositoryH)
        {
            this.repositoryH = repositoryH;
        }
        public IActionResult Index(int id)
        {
            var model = repositoryH.PersonaConHistoriaClinica(id);
            return View(model);
        }
         
    }
}