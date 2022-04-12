using MapaCovid.Models;
using MapaCovid.Extensions;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http; 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace MapaCovid.Services
{
    public interface ICookieAuthService
    {
        public void SetHttpContext(HttpContext httpContext);
        public void SetSessionContext(Usuario usuariodb);
        public void Login(ClaimsPrincipal claim);
        public Usuario UsuarioLogueado();
        public void LogOut();
    }

    public class CookieAuthService : ICookieAuthService
    {
        private HttpContext httpContext;
        public void SetHttpContext(HttpContext httpContext)
        {
            this.httpContext = httpContext;
        }
        public void Login(ClaimsPrincipal claim)
        {
            httpContext.SignInAsync(claim);
        }
        public void SetSessionContext(Usuario usuariodb)
        {
            httpContext.Session.Set("LoggedUser", usuariodb);
        }
        public Usuario UsuarioLogueado()
        {
            return httpContext.Session.Get<Usuario>("LoggedUser"); 
        }
        public void LogOut()
        {
            httpContext.SignOutAsync();
        }
    }
}
