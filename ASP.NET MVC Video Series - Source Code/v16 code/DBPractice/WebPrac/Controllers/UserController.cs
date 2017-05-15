using PMS.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebPrac.Security;

namespace WebPrac.Controllers
{
    public class UserController : Controller
    {
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(String login, String password)
        {
            var obj = PMS.BAL.UserBO.ValidateUser(login, password);
            if (obj != null)
            {
                Session["user"] = obj;
                if (obj.IsAdmin == true)
                    return Redirect("~/Home/Admin");
                else
                    return Redirect("~/Home/NormalUser");
            }

            ViewBag.MSG = "Invalid Login/Password";
            ViewBag.Login = login;

            return View();
        }

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Save(UserDTO dto)
        {
            //User Save Logic
            return View();
        }

        [HttpGet]
        public ActionResult Logout()
        {
            SessionManager.ClearSession();
            return RedirectToAction("Login");
        }


        [HttpGet]
        public ActionResult Login2()
        {
            return View();
        }

        [HttpPost]
        public JsonResult ValidateUser(String login, String password)
        {

            Object data = null;

            try
            {
                var url = "";
                var flag = false;

                var obj = PMS.BAL.UserBO.ValidateUser(login, password);
                if (obj != null)
                {
                    flag = true;
                    SessionManager.User = obj;

                    if (obj.IsAdmin == true)
                        url = Url.Content("~/Home/Admin");
                    else
                        url = Url.Content("~/Home/NormalUser");
                }

                data = new
                {
                    valid = flag,
                    urlToRedirect = url
                };
            }
            catch (Exception)
            {
                data = new
                {
                    valid = false,
                    urlToRedirect = ""
                };
            }

            return Json(data, JsonRequestBehavior.AllowGet);
        }
	}
}