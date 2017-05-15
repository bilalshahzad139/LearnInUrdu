using PMS.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMS.BAL
{
    public class ProductBO
    {
        public static int Save(ProductDTO dto)
        {
            return PMS.DAL.ProductDAO.Save(dto);
        }
        public static ProductDTO GetProductById(int pid)
        {
            return PMS.DAL.ProductDAO.GetProductById(pid);
        }
        public static List<ProductDTO> GetAllProducts(Boolean pLoadComments=false)
        {
            return PMS.DAL.ProductDAO.GetAllProducts(pLoadComments);
        }

        public static int DeleteProduct(int pid)
        {
            return PMS.DAL.ProductDAO.DeleteProduct(pid);
        }

    }
}
