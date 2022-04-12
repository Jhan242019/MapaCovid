using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Models.DB.Configurations
{
    public class DistritoConfiguration : IEntityTypeConfiguration<Distrito>
    {
        public void Configure(EntityTypeBuilder<Distrito> builder)
        {
            builder.ToTable("Distrito");
            builder.HasKey(o=>o.DistritoId);
            //builder.HasMany(o => o.Ubicaciones).WithOne(o => o.Distrito).HasForeignKey(o => o.DistritoId);
        }
    }
}
