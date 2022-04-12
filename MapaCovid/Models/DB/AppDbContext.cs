using MapaCovid.Models.DB.Configurations;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.Web.CodeGeneration.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Models.DB
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        { }

        public DbSet<Ubicacion> Ubicaciones { get; set; }
        public DbSet<Distrito> Distritos { get; set; }
        public DbSet<Persona> Personas { get; set; }
        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Tipo> Tipos { get; set; }
        public DbSet<HistoriaClinica> HistoriaClinicas { get; set; }
        public DbSet<CuadroClinico> CuadrosClinicos { get; set; }
        public DbSet<Prueba> Pruebas { get; set; }
        public DbSet<Receta> Recetas { get; set; }
        public DbSet<Seguimiento> Seguimientos { get; set; }
        public DbSet<ContactoPaciente> Contactos { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            //Configuracion de tablas
            modelBuilder.ApplyConfiguration(new UbicacionConfiguration());
            modelBuilder.ApplyConfiguration(new DistritoConfiguration());
            modelBuilder.ApplyConfiguration(new PersonaConfiguration());
            modelBuilder.ApplyConfiguration(new UsuarioConfiguration());
            modelBuilder.ApplyConfiguration(new TipoConfiguration());
            modelBuilder.ApplyConfiguration(new HistoriaClinicaConfiguration());
            modelBuilder.ApplyConfiguration(new CuadroClinicoConfiguration());
            modelBuilder.ApplyConfiguration(new PruebaConfiguration());
            modelBuilder.ApplyConfiguration(new RecetaConfiguration());
            modelBuilder.ApplyConfiguration(new SeguimientoConfiguration());
            modelBuilder.ApplyConfiguration(new ContactoPacienteConfiguration());
        }
    }
}
