using PMS.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebPrac.Security;

namespace WebPrac.Controllers
{
    public class Product2Controller : Controller
    {
        
        public ActionResult New()
        {
            return View();
        }

        public JsonResult GetAllProducts()
        {
            var products = PMS.BAL.ProductBO.GetAllProducts(true);

            var d = new { 
                data = products
            };
            return Json(d, JsonRequestBehavior.AllowGet);
        }


        public JsonResult GetProductById(int pid)
        {
            var prod = PMS.BAL.ProductBO.GetProductById(pid);
            var d = new
            {
                data = prod
            };
            return Json(d, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult DeleteProduct(int pid)
        {
            PMS.BAL.ProductBO.DeleteProduct(pid);
            var data = new { 
                success = true
            };
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        
        [HttpPost]
        public JsonResult Save(ProductDTO dto)
        {
            var uniqueName = "";

            if (Request.Files["Image"] != null)
            {
                var file = Request.Files["Image"];
                if (file.FileName != "")
                {
                    var ext = System.IO.Path.GetExtension(file.FileName);

                    //Generate a unique name using Guid
                    uniqueName = Guid.NewGuid().ToString() + ext;

                    //Get physical path of our folder where we want to save images
                    var rootPath = Server.MapPath("~/UploadedFiles");

                    var fileSavePath = System.IO.Path.Combine(rootPath, uniqueName);

                    // Save the uploaded file to "UploadedFiles" folder
                    file.SaveAs(fileSavePath);

                    dto.PictureName = uniqueName;
                }
            }
            

            if (dto.ProductID > 0)
            {
                dto.ModifiedOn = DateTime.Now;
                dto.ModifiedBy = 1;
            }
            else
            {
                dto.CreatedOn = DateTime.Now;
                dto.CreatedBy = 1;
            }

            var pid = PMS.BAL.ProductBO.Save(dto);

            var data = new
            {
                success = true,
                ProductID = pid,
                PictureName = dto.PictureName
            };
            return Json(data, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult SaveComment(CommentDTO dto)
        {
            dto.CommentOn = DateTime.Now;
            dto.UserID = SessionManager.User.UserID;

            PMS.BAL.CommentBO.Save(dto);
            var data = new
            {
                success = true,
                UserName = SessionManager.User.Name,
                CommentOn = dto.CommentOn,
                PictureName = SessionManager.User.PictureName
            };
            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}