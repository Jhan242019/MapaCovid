using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Models.DB.Configurations
{
    public class ContactoPacienteConfiguration : IEntityTypeConfiguration<ContactoPaciente>
    {
        public void Configure(EntityTypeBuilder<ContactoPaciente> builder)
        {
            builder.ToTable("ContactoPaciente");
            builder.HasKey(o=>o.ContactoId);
        }
    }
}
