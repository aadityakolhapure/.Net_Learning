using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            Student s1 = new Student();
            s1.Id = 1;
            s1.Name = "John Doe";
            s1.EnrollmentNumber = "EN12345";
            return View(s1);
        }
    }
}