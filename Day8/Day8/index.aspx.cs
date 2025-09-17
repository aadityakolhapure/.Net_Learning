using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace Day8
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            string path = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Employees;Integrated Security=True;";


            SqlConnection conn = new SqlConnection(path);
            conn.Open();
            Response.Write("Connection established");
        }
    }
}