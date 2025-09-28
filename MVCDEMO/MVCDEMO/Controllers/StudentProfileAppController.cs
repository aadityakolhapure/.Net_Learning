using System.Web.Mvc;

namespace StudentProfileApp.Controllers
{
    public class StudentController : Controller
    {
        public ActionResult Profile()
        {
            // Passing data using ViewBag
            Session["Name"] = "Aaditya Kolhapure";

            // Passing data using ViewData
            Session["Course"] = "Computer Science";

            // Using Session
            Session["Age"] = 21;

            return View();
        }
    }
}
