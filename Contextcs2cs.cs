using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace tsp.net_lab5
{
    class Contextcs2 : DbContext
    {
        public DbSet<PhotographFullImage> Photo { get; set; }

        public DbSet<Photograph> PhotoFull { get; set; }

        public Contextcs2() : base("name=ModelSelfReferences")
        {

        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<Photograph>()
                .HasRequired(p => p.PhotographFullImage)
                .WithRequiredPrincipal(p => p.Photograph);
            modelBuilder.Entity<Photograph>()
                .ToTable("Photograph", "BazaDeDate");
            modelBuilder.Entity<PhotographFullImage>()
                .ToTable("Photograph", "BazaDeDate");
        }
    }
}
