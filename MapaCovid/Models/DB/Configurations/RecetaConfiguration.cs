using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Models.DB.Configurations
{
    public class RecetaConfiguration : IEntityTypeConfiguration<Receta>
    {
        public void Configure(EntityTypeBuilder<Receta> builder)
        {
            builder.ToTable("Receta");
            builder.HasKey(o => o.RecetaId);
            builder.HasOne(o => o.CuadroClinico)
                .WithMany(o => o.Recetas)
                .HasForeignKey(o => o.CuadroClinicoId);
        }
    }
}
