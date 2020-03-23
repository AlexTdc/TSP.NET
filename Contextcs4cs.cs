using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab5_tsp.net
{
    public class Contextcs4 : DbContext
    {
        public DbSet<Employee> Employees { get; set; }
        public Contextcs4() : base("name=ModelSelfReferences")
        { }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<Employee>()
            .Map<FullTimeEmp>(m => m.Requires("EmployeeType")
            .HasValue(1))
            .Map<HourlyEmp>(m => m.Requires("EmployeeType")
            .HasValue(2));
        }

    }
}