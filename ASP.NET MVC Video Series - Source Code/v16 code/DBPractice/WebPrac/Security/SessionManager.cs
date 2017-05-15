using PMS.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebPrac.Security
{
    public static class SessionManager
    {

        public static UserDTO User
        {
            get
            {
                UserDTO dto = null;
                if (HttpContext.Current.Session["User"] != null)
                {
                    dto = HttpContext.Current.Session["User"] as UserDTO;
                }

                return dto;
            }
            set
            {
                HttpContext.Current.Session["User"] = value;
            }
        }

        public static Boolean IsValidUser
        {
            get
            {
                if (User != null)
                    return true;
                else
                    return false;
            }
        }

        public static void ClearSession()
        {
            HttpContext.Current.Session.RemoveAll();
            HttpContext.Current.Session.Abandon();
        }
    }
}