<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DeleteCake.aspx.cs" Inherits="CakeShop.Admin.DeleteCake" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=cakeshop;Integrated Security=True";
        SqlConnection con = new SqlConnection(connStr);
        con.Open();

        int id = Convert.ToInt32(Request.QueryString["id"]);
        SqlCommand cmd = new SqlCommand("DELETE FROM Cakes WHERE CakeID=@id", con);
        cmd.Parameters.AddWithValue("@id", id);
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("~/Admin/Cake.aspx?msg=Cake Deleted Successfully&type=success");
    %>
</asp:Content>
