<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditOffers.aspx.cs" Inherits="CakeShop.Admin.EditOffers" %>



<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="text-3xl font-bold text-pink-600 mb-6">Edit Offer</h2>

    <%
        string msg = "";
        string type = "";
        string offerId = Request.QueryString["id"];
        string title = "", description = "", discount = "", expiry = "", imagePath = "";

        string path = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=cakeshop;Integrated Security=True";
        SqlConnection con = new SqlConnection(path);
        con.Open();

        if (!IsPostBack && !string.IsNullOrEmpty(offerId))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Offers WHERE OfferID=@id", con);
            cmd.Parameters.AddWithValue("@id", offerId);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                title = reader["Title"].ToString();
                description = reader["Description"].ToString();
                discount = reader["Discount"].ToString();
                expiry = Convert.ToDateTime(reader["ExpiryDate"]).ToString("yyyy-MM-dd");
                imagePath = reader["Image"].ToString();
            }
            reader.Close();
        }

        if (IsPostBack && !string.IsNullOrEmpty(offerId))
        {
            title = Request.Form["title"];
            description = Request.Form["description"];
            discount = Request.Form["discount"];
            expiry = Request.Form["expiry"];

           

            SqlCommand cmdUpdate = new SqlCommand("UPDATE Offers SET Title=@title, Description=@desc, Discount=@discount, ExpiryDate=@expiry, Image=@img WHERE OfferID=@id", con);
            cmdUpdate.Parameters.AddWithValue("@title", title);
            cmdUpdate.Parameters.AddWithValue("@desc", description);
            cmdUpdate.Parameters.AddWithValue("@discount", discount);
            cmdUpdate.Parameters.AddWithValue("@expiry", expiry);
            cmdUpdate.Parameters.AddWithValue("@id", offerId);

            int rows = cmdUpdate.ExecuteNonQuery();
            if (rows > 0)
            {
                msg = "Offer Updated Successfully!";
                type = "success";
            }
            else
            {
                msg = "Update Failed!";
                type = "error";
            }
        }
        con.Close();
    %>

    <form method="post" enctype="multipart/form-data" class="space-y-4">
        <input type="text" name="title" value="<%= title %>" placeholder="Offer Title" class="w-full border p-2 rounded" required />
        <textarea name="description" class="w-full border p-2 rounded" required><%= description %></textarea>
        <input type="number" name="discount" value="<%= discount %>" class="w-full border p-2 rounded" required />
        <input type="date" name="expiry" value="<%= expiry %>" class="w-full border p-2 rounded" required />
        <input type="file" name="image" class="w-full border p-2 rounded" />
        <% if (!string.IsNullOrEmpty(imagePath))
            { %>
        <img src="<%= imagePath %>" alt="Offer Image" class="w-32 mt-2" />
        <% } %>
        <button type="submit" class="px-4 py-2 bg-pink-600 text-white rounded hover:bg-pink-700">Update Offer</button>
    </form>

    <% if (!string.IsNullOrEmpty(msg))
        {
            string bg = (type == "success") ? "bg-green-100 text-green-700" : "bg-red-100 text-red-700"; %>
    <div class="<%= bg %> p-3 rounded mt-4"><%= msg %></div>
    <% } %>
</asp:Content>
