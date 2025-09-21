<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="CakeShop.Admin.Order" %>


<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="bg-white p-6 rounded-2xl shadow">
        <h3 class="text-xl font-bold mb-4 text-pink-600">All Cakes</h3>
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-pink-100">
                    <tr>
                        <th class="px-4 py-2 text-left text-gray-700">ID</th>
                        <th class="px-4 py-2 text-left text-gray-700">Name</th>
                        <th class="px-4 py-2 text-left text-gray-700">Category</th>
                        <th class="px-4 py-2 text-left text-gray-700">Price</th>
                        <th class="px-4 py-2 text-left text-gray-700">Quantity</th>
                        <th class="px-4 py-2 text-left text-gray-700">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <%
                        string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=cakeshop;Integrated Security=True";
                        SqlConnection con = new SqlConnection(connStr);
                        con.Open();

                        // Fetch all cakes
                        SqlCommand cmd = new SqlCommand("SELECT * FROM Cakes", con);
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                    %>
                    <tr>
                        <td class="px-4 py-2"><%= reader["CakeID"] %></td>
                        <td class="px-4 py-2"><%= reader["Name"] %></td>
                        <td class="px-4 py-2"><%= reader["Category"] %></td>
                        <td class="px-4 py-2">₹<%= reader["Price"] %></td>
                        <td class="px-4 py-2"><%= reader["Quantity"] %></td>
                       
                        <td class="px-4 py-2 space-x-2">
                            <a href="EditCake.aspx?id=<%= reader["CakeID"] %>" class="px-3 py-1 bg-blue-500 text-white rounded hover:bg-blue-600">Edit</a>
                            <a href="DeleteCake.aspx?id=<%= reader["CakeID"] %>" class="px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                        reader.Close();
                        con.Close();
                    %>
                </tbody>
            </table>
        </div>
</asp:Content>
