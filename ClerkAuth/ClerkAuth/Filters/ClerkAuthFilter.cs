using Newtonsoft.Json.Linq;
using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;

namespace ClerkAuth.Filters
{
    public class ClerkAuthFilter : ActionFilterAttribute
    {
        private const string ClerkSecretKey = "YOUR_CLERK_SECRET_KEY";

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var token = filterContext.HttpContext.Request.Headers["Authorization"];

            if (string.IsNullOrEmpty(token) || !VerifyClerkTokenAsync(token.Replace("Bearer ", "")).Result)
            {
                filterContext.Result = new RedirectResult("/Account/Login");
            }
            base.OnActionExecuting(filterContext);
        }

        private async Task<bool> VerifyClerkTokenAsync(string token)
        {
            using (var client = new HttpClient())
            {
                client.DefaultRequestHeaders.Authorization =
                    new AuthenticationHeaderValue("Bearer", ClerkSecretKey);

                client.DefaultRequestHeaders.Add("Clerk-Session-Token", token);
                var response = await client.GetAsync("https://api.clerk.dev/v1/me");

                if (!response.IsSuccessStatusCode)
                    return false;

                var json = await response.Content.ReadAsStringAsync();
                var user = JObject.Parse(json);
                return user["id"] != null;
            }
        }
    }
}
