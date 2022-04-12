using MapaCovid.Models;
using MapaCovid.Models.DB;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Repositories
{
    public interface IUsuarioRepository
    {
        public int FindNumberOfUsersByName(string NombreUsuario);
        public List<Tipo> GetTipos();
        public void AñadirUsuarios(Usuario usuario);
        public Usuario FindUserLogin(string nombreUsuario, string password);
        public Usuario UsuarioConTipo(int usuarioId);
        public Usuario UserById(int UsuarioId);
        public Usuario UserByCuadroClinico(CuadroClinico cuadroClinico);
        public void ModificarUsuario(Usuario usuario);
    }
    public class UsuarioRepository : IUsuarioRepository
    {
        private readonly AppDbContext context;

        public UsuarioRepository(AppDbContext context)
        {
            this.context = context;
        }

        public int FindNumberOfUsersByName(string NombreUsuario)
        {
            return context.Usuarios.Where(o => o.NombreUsuario == NombreUsuario).Count();
        }
        public List<Tipo> GetTipos()
        {
            return context.Tipos.ToList();
        }
        public void AñadirUsuarios(Usuario usuario)
        {
            context.Usuarios.Add(usuario);
            context.SaveChanges();
        }
        public Usuario FindUserLogin(string nombreUsuario, string password)
        {
            return context.Usuarios.FirstOrDefault(o => o.NombreUsuario == nombreUsuario & o.Password == password);
        }
        public Usuario UsuarioConTipo(int usuarioId)
        {
            return context.Usuarios
                .Include(o => o.Tipo)
                .Where(o => o.UsuarioId == usuarioId)
                .FirstOrDefault();
        }
        public Usuario UserById(int UsuarioId)
        {
            return context.Usuarios
                .Where(o => o.UsuarioId == UsuarioId)
                .FirstOrDefault();
        }
        public void ModificarUsuario(Usuario usuario)
        {
            context.Entry(usuario).State = EntityState.Modified;
            context.SaveChanges();
        }

        public Usuario UserByCuadroClinico(CuadroClinico cuadroClinico)
        {
            var model = context.Usuarios.FirstOrDefault(o => o.UsuarioId == cuadroClinico.UsuarioId);
            return model;
        }
    }
}
