using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Models.DB.Configurations
{
    public class HistoriaClinicaConfiguration : IEntityTypeConfiguration<HistoriaClinica>
    {
        public void Configure(EntityTypeBuilder<HistoriaClinica> builder)
        {
            builder.ToTable("HistoriaClinica");
            builder.HasKey(o=>o.HistoriaClinicaId);

            builder.HasOne(o => o.Persona)
                .WithOne(o => o.HistoriaClinica)
                .HasForeignKey<HistoriaClinica>(o => o.PersonaId);
        }
    }
}
