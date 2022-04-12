using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MapaCovid.Models.DB.Configurations
{
    public class CuadroClinicoConfiguration : IEntityTypeConfiguration<CuadroClinico>
    {
        public void Configure(EntityTypeBuilder<CuadroClinico> builder)
        {
            builder.ToTable("CuadroClinico");
            builder.HasKey(o => o.CuadroClinicoId);

        }
    }
}
