<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ClinicProject.login" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <% 

        string a = Request.Params["txtName"];
        string b = Request.Params["txtPassword"];
        string c = Request.Params["txtEmail"];
        string d = Request.Params["txtPhone"];
        string e = Request.Params["txtSpecialization"];
        int f = 1;
        int g = 0;

        string path = "Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog=hospital;Integrated Security=True";

        SqlConnection con = new SqlConnection(path);
        con.Open();

        SqlCommand cmd = new SqlCommand("insert into Users values('" + a + "','" + b + "','" + c + "','" + d + "','" + e + "','" + f + "','"+g+"')", con);

        cmd.ExecuteNonQuery();
        Response.Redirect("DoctorRegister.aspx");

    %>
</body>
</html>
