using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace ClassLibraryNetCore.Model
{
    public partial class OrderDetails
    {
        public int OrderDetailId { get; set; }

        [MaxLength(20)]
        public string NameOfStore { get; set; }

        public virtual Order Order { get; set; }

        public virtual Product Product { get; set; }
    }
}
