using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace ClassLibraryNetCore.Model
{
    public partial class Product
    {
        public int ProductId { get; set; }

        [MaxLength(20)]
        public string TypeOfProduct { get; set; }

        [MaxLength(20)]
        public string Price { get; set; }

        public ICollection<OrderDetails> OrderDetails { get; set; }

        protected Product() { }
    }
}
