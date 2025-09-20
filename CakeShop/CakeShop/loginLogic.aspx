<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginLogic.aspx.cs" Inherits="CakeShop.loginLogic" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%
        string email = Request.Params["email"];
        string password = Request.Params["password"];

        using (SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=cakeshop;Integrated Security=True;"))
        {
            con.Open();

            SqlCommand cmd = new SqlCommand(
                "SELECT * FROM Users WHERE Email=@Email AND PasswordHash=@Password", con);

            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", password);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["email"] = dr["Email"].ToString();
                Session["name"] = dr["Name"].ToString();
                Session["role"] = dr["Role"].ToString();


                string role = dr["Role"].ToString();
                if (role == "Admin")
                {
                    Response.Redirect("Admin/Dashboard.aspx?msg=Welcome%20To%20Admin%20Dashboard!!&type=success");
                }
                else if (role == "Customer")
                {
                    Response.Redirect("Customers/cakes.aspx?msg=Login%20Successful!!&type=success");
                }
                else
                {
                    Response.Redirect("Login.aspx?msg=Unauthorized%20Access!!&type=error");
                }
            }
            else
            {
                Response.Redirect("Login.aspx?msg=Invalid%20Email%20or%20Password!!&type=error");
            }

            dr.Close();
        }
    %>
</body>
</html>
