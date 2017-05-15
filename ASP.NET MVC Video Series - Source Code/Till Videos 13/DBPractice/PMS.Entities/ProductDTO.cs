using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMS.Entities
{
    public class ProductDTO
    {
        public int ProductID { get; set; }
        public String Name { get; set; }

        public double Price { get; set; }
        public String PictureName { get; set; }
        public DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public DateTime ModifiedOn { get; set; }
        public int ModifiedBy { get; set; }
        public Boolean IsActive { get; set; }
    }
}
