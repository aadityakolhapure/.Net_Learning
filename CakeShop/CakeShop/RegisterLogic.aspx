<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterLogic.aspx.cs" Inherits="CakeShop.RegisterLogic" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%
        String a = Request.Params["name"];
        String b = Request.Params["email"];
        String c = Request.Params["password"];
        String d = "Customer";

        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=cakeshop; Integrated Security=True;");

        con.Open();

        SqlCommand cmd = new SqlCommand("INSERT INTO Users (Name, Email, PasswordHash, Role) VALUES (@Name, @Email, @Password, @Role)", con);

        cmd.Parameters.AddWithValue("@Name", a);
        cmd.Parameters.AddWithValue("@Email", b);
        cmd.Parameters.AddWithValue("@Password", c);
        cmd.Parameters.AddWithValue("@Role", d);

        cmd.ExecuteNonQuery();
        Response.Redirect("Login.aspx?msg=Register%20Successfully&type=success");

    %>
</body>
</html>
