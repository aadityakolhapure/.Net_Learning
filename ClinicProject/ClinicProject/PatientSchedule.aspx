<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientSchedule.aspx.cs" Inherits="ClinicProject.WebForm1" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Appointment Confirmation</title>
</head>
<body>
    <%
        string a = Request.Params["name"];
        string b = Request.Params["phone"];
        string c = Request.Params["email"];
        int d = int.Parse(Request.Params["doctor"]);
        string e = Request.Params["pdate"];
        string f = Request.Params["ptime"];
        string g = Request.Params["note"];

        string path = "Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog=hospital;Integrated Security=True";

        SqlConnection con = new SqlConnection(path);
        con.Open();

        SqlCommand cmd = new SqlCommand("insert into patients values('" + a + "','" + b + "','" + c + "','" + d + "','" + e + "','" + f + "','" + g + "')", con);

        cmd.ExecuteNonQuery();

        Response.Redirect("index.aspx?msg=success\"");

    %>
</body>
</html>
