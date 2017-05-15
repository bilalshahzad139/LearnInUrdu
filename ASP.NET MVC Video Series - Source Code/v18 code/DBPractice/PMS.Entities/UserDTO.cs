using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMS.Entities
{
    public class UserDTO
    {
        public int UserID { get; set; }
        public String Name { get; set; }
        public String Login { get; set; }
        public String Password { get; set; }

        public String PictureName { get; set; }
        public Boolean IsAdmin { get; set; }

        public Boolean IsActive { get; set; }
    }
}
