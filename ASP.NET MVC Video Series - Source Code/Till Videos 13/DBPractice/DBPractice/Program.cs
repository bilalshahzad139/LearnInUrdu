using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBPractice
{
    class Program
    {
        static void Main(string[] args)
        {
            //var dto = new PMS.Entities.ProductDTO();
            //dto.ProductID = 0;
            //dto.Name = "Mobile 2";
            //dto.Price = 200;
            //dto.PictureName = "abc.jpg";
            //dto.CreatedOn = DateTime.Now;
            //dto.CreatedBy = 1;

            //PMS.BAL.ProductBO.Save(dto);


            //var data = PMS.BAL.ProductBO.GetAllProducts();

            //PMS.BAL.ProductBO.DeleteProduct(1);

            //var prod = PMS.BAL.ProductBO.GetProductById(1);


            var user = PMS.BAL.UserBO.ValidateUser("admin", "admin");

            var user2 = PMS.BAL.UserBO.ValidateUser("admin", "admin12");

            System.Console.ReadKey();


        }
    }
}
