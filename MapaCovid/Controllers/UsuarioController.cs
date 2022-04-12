using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using MapaCovid.Extensions;
using MapaCovid.Models;
using MapaCovid.Repositories;
using MapaCovid.Services;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace MapaCovid.Controllers
{

    public class UsuarioController : Controller
    {
        private readonly IUsuarioRepository repository;
        private readonly ICookieAuthService cookieService;
        public UsuarioController(IUsuarioRepository repository, ICookieAuthService cookieService) 
        {
            this.repository = repository;
            this.cookieService = cookieService;
        }
        [Authorize]
        public IActionResult Index()
        {
            return View();
        }
        [Authorize]
        [HttpGet]
        public IActionResult Create()
        {
            ViewBag.Tipo = repository.GetTipos();
            return View(new Usuario());
        }
        //[Authorize]
        [HttpPost]
        public IActionResult Create(Usuario usuario)
        {
            if (repository.FindNumberOfUsersByName(usuario.NombreUsuario) > 0)
                ModelState.AddModelError("NombreUsuario", "Ya existe un usuario con ese nombre");

            if (ModelState.IsValid)
            {
                repository.AñadirUsuarios(usuario);
                return RedirectToAction("Index", "Home");
            }
            return View(usuario);
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Login(string nombreUsuario, string password)
       {

            var usuariodb = repository.FindUserLogin(nombreUsuario, password);
            if (usuariodb == null)
            {
                ModelState.AddModelError("Usuario", "Usuario y/o contraseña incorrectos");
                return View();
            }
            cookieService.SetHttpContext(HttpContext);
            cookieService.SetSessionContext(usuariodb);
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name,usuariodb.NombreUsuario)
            };
           
            var Identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var principal = new ClaimsPrincipal(Identity);

            cookieService.Login(principal);
            return RedirectToAction("Index", "Usuario");
        }
        [Authorize]
        [HttpGet]
        public ViewResult Profile()
        {
            cookieService.SetHttpContext(HttpContext);
            var userLogged = cookieService.UsuarioLogueado();
            var usuario = repository.UsuarioConTipo(userLogged.UsuarioId);

            return View(usuario);
        }
        [Authorize]
        [HttpGet]
        public ViewResult Update(int UsuarioId)
        {
            ViewBag.Tipo = repository.GetTipos();
            var usuario = repository.UserById(UsuarioId);
            return View(usuario);
        }
        [Authorize]
        [HttpPost]
        public IActionResult Update(Usuario usuario)
        {
            if (usuario == null)
            {
                ModelState.AddModelError("Usuario","El usuario no es correcto");
                ViewBag.Tipo = repository.GetTipos();
                
            }
            if (ModelState.IsValid)
            {
                repository.ModificarUsuario(usuario);
                return RedirectToAction("Profile", "Usuario");
            }
            return View(usuario);
        }
        [Authorize]
        [HttpGet]
        public IActionResult Logout()
        {
            cookieService.SetHttpContext(HttpContext);
            cookieService.LogOut();
            return RedirectToAction("Index", "Home");
        }
    }
}