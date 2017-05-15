using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebPrac.Security;

namespace WebPrac.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Admin()
        {
            if (SessionManager.IsValidUser)
            {

                if (SessionManager.User.IsAdmin)
                {
                    return View();
                }
                else
                {
                    return RedirectToAction("NormalUser");
                }
            }
            else
            {
                return Redirect("~/User/Login");
            }
        }
        public ActionResult NormalUser()
        {
            if (SessionManager.IsValidUser)
            {

                if (SessionManager.User.IsAdmin)
                {
                    return RedirectToAction("Admin");
                }
                else
                {
                    return View();
                }
            }
            else
            {
                return Redirect("~/User/Login");
            }
        }
    }
}