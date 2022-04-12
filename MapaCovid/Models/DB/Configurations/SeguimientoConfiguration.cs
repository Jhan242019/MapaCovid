using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Models.DB.Configurations
{
    public class SeguimientoConfiguration : IEntityTypeConfiguration<Seguimiento>
    {
        public void Configure(EntityTypeBuilder<Seguimiento> builder)
        {
            builder.ToTable("Seguimiento");
            builder.HasKey(o=>o.SeguimientoId);
            builder.HasMany(o => o.Contactos).WithOne(o => o.Seguimiento).HasForeignKey(o => o.SeguimientoId);
        }
    }
}
