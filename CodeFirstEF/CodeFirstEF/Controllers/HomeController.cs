using CodeFirstEF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CodeFirstEF.Controllers
{
    public class HomeController : Controller
    {
        
        StudentContext db = new StudentContext();
        public ActionResult Index()
        {
            var data = db.Stud.ToList();
            return View(data);
        }
    }
}