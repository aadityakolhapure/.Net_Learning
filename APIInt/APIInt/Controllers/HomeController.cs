using System.Diagnostics;
using APIInt.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace APIInt.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        private readonly HttpClient _httpClient;

        public HomeController(IHttpClientFactory httpClientFactory)
        {
            _httpClient = httpClientFactory.CreateClient();
        }

       

        public async Task<IActionResult> Index()
        {
            var response = await _httpClient.GetStringAsync("https://localhost:7026/api/EMP");  // Replace with correct port
            var employees = JsonConvert.DeserializeObject<List<emp>>(response);
            return View(employees); // Pass to your Razor page
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
