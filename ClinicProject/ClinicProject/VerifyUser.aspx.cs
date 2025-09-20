using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicProject
{
    public partial class VerifyUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                string userId = Request.Form["userId"];
                if (!string.IsNullOrEmpty(userId))
                {
                    string path = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=hospital;Integrated Security=True";
                    using (SqlConnection con = new SqlConnection(path))
                    {
                        SqlCommand cmd = new SqlCommand("UPDATE Users SET isApproved = 1 WHERE userId = @userId", con);
                        cmd.Parameters.AddWithValue("@userId", userId);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                // Redirect back to the main page
                Response.Redirect("adminDoctor.aspx");
            }
        }
    }
}