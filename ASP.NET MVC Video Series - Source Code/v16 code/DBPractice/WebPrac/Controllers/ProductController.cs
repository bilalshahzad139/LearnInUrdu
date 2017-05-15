using PMS.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebPrac.Security;

namespace WebPrac.Controllers
{
    public class ProductController : Controller
    {
        private ActionResult GetUrlToRedirect()
        {
            if (SessionManager.IsValidUser)
            {
                if (SessionManager.User.IsAdmin == false)
                {
                    TempData["Message"] = "Unauthorized Access";
                    return Redirect("~/Home/NormalUser");
                }
            }
            else
            {
                TempData["Message"] = "Unauthorized Access";
                return Redirect("~/User/Login");
            }

            return null;
        }
        public ActionResult ShowAll()
        {
            if (SessionManager.IsValidUser == false)
            {
                return Redirect("~/User/Login");
            }

            var products = PMS.BAL.ProductBO.GetAllProducts();

            return View(products);
        }

        public ActionResult New()
        {
            var redVal = GetUrlToRedirect();
            if (redVal == null)
            {
                var dto = new ProductDTO();
                redVal =  View(dto);
            }

            return redVal;
        }

        public ActionResult Edit(int id)
        {

            var redVal = GetUrlToRedirect();
            if (redVal == null)
            {
                var prod = PMS.BAL.ProductBO.GetProductById(id);
                redVal= View("New", prod);
            }

            return redVal;
            
        }
        public ActionResult Edit2(int ProductID)
        {
            var prod = PMS.BAL.ProductBO.GetProductById(ProductID);
            return View("New", prod);
        }
        public ActionResult Delete(int id)
        {

            if (SessionManager.IsValidUser)
            {

                if (SessionManager.User.IsAdmin == false)
                {
                    TempData["Message"] = "Unauthorized Access";
                    return Redirect("~/Home/NormalUser");
                }
            }
            else
            {
                return Redirect("~/User/Login");
            }

            PMS.BAL.ProductBO.DeleteProduct(id);
            TempData["Msg"] = "Record is deleted!";
            return RedirectToAction("ShowAll");
        }
        [HttpPost]
        public ActionResult Save(ProductDTO dto)
        {

            if (SessionManager.IsValidUser)
            {

                if (SessionManager.User.IsAdmin == false)
                {
                    TempData["Message"] = "Unauthorized Access";
                    return Redirect("~/Home/NormalUser");
                }
            }
            else
            {
                return Redirect("~/User/Login");
            }


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

            PMS.BAL.ProductBO.Save(dto);

            TempData["Msg"] = "Record is saved!";

            return RedirectToAction("ShowAll");
        }

    }
}