using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebPrac.Controllers
{
    public class SampleController : Controller
    {
        public ActionResult File()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SaveFile(String Name, float Price)
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
                }
            }


            return View("File");
        }


        [HttpPost]
        public ActionResult SaveFile2(String Name, float Price)
        // public ActionResult SaveFile2(PMS.Entities.ProductDTO dto)
        {
            var uniqueName = "";

            if (Request.Files["myfile"] != null)
            {
                var file = Request.Files["myfile"];
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
                }
            }

            var data = new
            {
                success = false,
                name = uniqueName
            };
            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}