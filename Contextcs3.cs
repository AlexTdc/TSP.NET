using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab5_tsp.net
{
    class Contextcs3 : DbContext
    {
        public DbSet<Business> Businesses { get; set; }
        public Contextcs3() : base("name=ModelSelfReferences")
        { }

    }
}
