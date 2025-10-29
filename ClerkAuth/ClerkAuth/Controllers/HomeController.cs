using ClerkAuth.Filters;
using System.Web.Mvc;
using ClerkAuth.Filters;

namespace ClerkAuth.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [ClerkAuthFilter]
        public ActionResult SecureArea()
        {
            ViewBag.Message = "You are logged in via Clerk!";
            return View();
        }
    }
}
