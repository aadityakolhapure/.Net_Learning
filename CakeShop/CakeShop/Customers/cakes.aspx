<%@ Page Title="" Language="C#" MasterPageFile="~/Customers/Header.Master" AutoEventWireup="true" CodeBehind="cakes.aspx.cs" Inherits="CakeShop.Customers.cakes" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <h2 class="text-3xl font-bold text-pink-600 mb-6 text-center">Our Delicious Cakes</h2>

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
        <%
            string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=cakeshop;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Cakes WHERE Quantity > 0", con);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
        %>
        <div class="bg-white rounded-2xl shadow hover:shadow-lg p-4 flex flex-col">
            <img src="<%= reader["Image"] %>" alt="<%= reader["Name"] %>" class="h-48 w-full object-cover rounded-lg mb-4" />

            <h3 class="text-xl font-bold text-pink-600 mb-2"><%= reader["Name"] %></h3>
            <p class="text-gray-700 mb-2"><%= reader["Description"] %></p>
            <p class="text-lg font-semibold mb-4">₹<%= reader["Price"] %></p>

            <form method="post" action="AddCart.aspx">
                <input type="hidden" name="CakeID" value="<%= reader["CakeID"] %>" />
                <input type="number" name="Quantity" value="1" min="1" max="<%= reader["Quantity"] %>" class="w-20 border rounded px-2 py-1 mb-2" />
                <button type="submit" class="bg-pink-600 hover:bg-pink-700 text-white px-4 py-2 rounded flex items-center justify-center">
                    <span class="material-symbols-outlined mr-1">add_shopping_cart</span> Add to Cart
                </button>
            </form>
        </div>
        <%
                }
                reader.Close();
            }
        %>
    </div>


    <%
        string msg = Request.QueryString["msg"];
        string type = Request.QueryString["type"];
        if (!string.IsNullOrEmpty(msg))
        {
            string bgColor = "bg-green-100 text-green-700";
            if (!string.IsNullOrEmpty(type) && type.ToLower() == "error")
            {
                bgColor = "bg-red-100 text-red-700";
            }
    %>
    <div class="<%= bgColor %> p-3 rounded mb-4 fixed bottom-4 right-4 z-50 shadow-lg">
        <%= msg %>
    </div>
    <% } %>
</asp:Content>
