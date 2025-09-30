<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditCake.aspx.cs" Inherits="CakeShop.Admin.EditCake" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="text-2xl font-bold text-blue-600 mb-6">Edit Cake</h2>

    <%
        string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=cakeshop;Integrated Security=True";
        SqlConnection con = new SqlConnection(connStr);
        con.Open();

        int id = Convert.ToInt32(Request.QueryString["id"]);
        SqlCommand cmd = new SqlCommand("SELECT * FROM Cakes WHERE CakeID=@id", con);
        cmd.Parameters.AddWithValue("@id", id);
        SqlDataReader reader = cmd.ExecuteReader();
        string name = "", category = "", price = "", quantity = "", description = "", image = "";
        if (reader.Read())
        {
            name = reader["Name"].ToString();
            category = reader["Category"].ToString();
            price = reader["Price"].ToString();
            quantity = reader["Quantity"].ToString();
            description = reader["Description"].ToString();
            image = reader["Image"].ToString();
        }
        reader.Close();

        if (Request.Form["updateCake"] != null)
        {
            string newName = Request.Form["name"];
            string newCategory = Request.Form["category"];
            string newPrice = Request.Form["price"];
            string newQuantity = Request.Form["quantity"];
            string newDescription = Request.Form["description"];
            string imagePath = image;

            // If new image uploaded
            if (Request.Files["imageFile"] != null && Request.Files["imageFile"].ContentLength > 0)
            {
                var file = Request.Files["imageFile"];
                string fileName = System.IO.Path.GetFileName(file.FileName);
                string savePath = Server.MapPath("../Images/Cakes/") + fileName;
                file.SaveAs(savePath);
                imagePath = "../Images/Cakes/" + fileName;
            }

            SqlCommand cmdUpdate = new SqlCommand("UPDATE Cakes SET Name=@name, Category=@category, Price=@price, Quantity=@quantity, Image=@image, Description=@description WHERE CakeID=@id", con);
            cmdUpdate.Parameters.AddWithValue("@name", newName);
            cmdUpdate.Parameters.AddWithValue("@category", newCategory);
            cmdUpdate.Parameters.AddWithValue("@price", newPrice);
            cmdUpdate.Parameters.AddWithValue("@quantity", newQuantity);
            cmdUpdate.Parameters.AddWithValue("@image", imagePath);
            cmdUpdate.Parameters.AddWithValue("@description", newDescription);
            cmdUpdate.Parameters.AddWithValue("@id", id);

            cmdUpdate.ExecuteNonQuery();
            Response.Redirect("~/Admin/Cake.aspx?msg=Cake Updated Successfully&type=success");
        }

        con.Close();
    %>

    <form method="post" enctype="multipart/form-data">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <input type="text" name="name" value="<%= name %>" class="border p-2 rounded w-full" required />
            <input type="text" name="category" value="<%= category %>" class="border p-2 rounded w-full" required />
            <input type="number" name="price" value="<%= price %>" class="border p-2 rounded w-full" required />
            <input type="number" name="quantity" value="<%= quantity %>" class="border p-2 rounded w-full" required />
            <input type="file" name="imageFile" class="border p-2 rounded w-full" />
            <% if (!string.IsNullOrEmpty(image))
                { %>
            <img src="<%= image %>" class="h-16 w-16 object-cover mt-2 rounded" />
            <% } %>
            <textarea name="description" class="border p-2 rounded w-full"><%= description %></textarea>
        </div>
        <button type="submit" name="updateCake" class="mt-4 px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">Update Cake</button>
    </form>

</asp:Content>

