<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="CakeShop.Admin.Customers" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="text-3xl font-bold text-pink-600 mb-6">Manage Customers</h2>


    <div class="bg-white p-6 rounded-2xl shadow">
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-pink-100">
                    <tr>
                        <th class="px-4 py-2 text-left text-gray-700">Customer ID</th>
                        <th class="px-4 py-2 text-left text-gray-700">Name</th>
                        <th class="px-4 py-2 text-left text-gray-700">Email</th>
                        <th class="px-4 py-2 text-left text-gray-700">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <%
                        string path = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=cakeshop;Integrated Security=True";
                        SqlConnection con = new SqlConnection(path);
                        con.Open();

                        if (!string.IsNullOrEmpty(Request.QueryString["delete"]))
                        {
                            int userId = Convert.ToInt32(Request.QueryString["delete"]);
                            SqlCommand cmdDel = new SqlCommand("DELETE FROM Users WHERE UserID=@id", con);
                            cmdDel.Parameters.AddWithValue("@id", userId);
                            cmdDel.ExecuteNonQuery();
                            Response.Redirect("~/Admin/Customers.aspx?msg=Customer Deleted&type=success");
                        }

                        SqlCommand cmd = new SqlCommand("SELECT UserID, Name, Email FROM Users WHERE Role='Customer' ORDER BY UserID DESC", con);

                        SqlDataReader reader = cmd.ExecuteReader();



                        if (!reader.HasRows)
                        {
                    %>
                    <tr>
                        <td colspan="7" class="text-center text-gray-500 py-4">No customers found</td>
                    </tr>
                    <%
                        }

                        while (reader.Read())
                        {

                    %>
                    <tr>
                        <td class="px-4 py-2"><%= reader["UserID"] %></td>
                        <td class="px-4 py-2 font-semibold"><%= reader["Name"] %></td>
                        <td class="px-4 py-2"><%= reader["Email"] %></td>
                        <td class="px-4 py-2 space-x-2">
                            <a href="Customers.aspx?delete=<%= reader["UserID"] %>" onclick="return confirm('Are you sure?')" class="px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600">Delete</a>
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
    </div>
    <%
        string msg = Request.QueryString["msg"];
        string type = Request.QueryString["type"];
        if (!string.IsNullOrEmpty(msg))
        {
            string bgColor = "bg-green-100 text-green-700";
            if (type == "error") bgColor = "bg-red-100 text-red-700";
    %>
    <div class="<%= bgColor %> p-3 rounded mb-4 fixed bottom-4 right-4 z-50 shadow-lg">
        <%= msg %>
    </div>
    <% } %>
</asp:Content>