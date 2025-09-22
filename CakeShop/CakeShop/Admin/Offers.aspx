<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Offers.aspx.cs" Inherits="CakeShop.Admin.Offers" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-3xl font-bold text-pink-600 mb-6">Manage Offers</h2>

    <div class="bg-white p-6 rounded-2xl shadow">
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-pink-100">
                    <tr>
                        <th class="px-4 py-2 text-left text-gray-700">Offer ID</th>
                        <th class="px-4 py-2 text-left text-gray-700">Title</th>
                        <th class="px-4 py-2 text-left text-gray-700">Description</th>
                        <th class="px-4 py-2 text-left text-gray-700">Discount (%)</th>
                        <th class="px-4 py-2 text-left text-gray-700">Start Date</th>
                        <th class="px-4 py-2 text-left text-gray-700">End Date</th>
                        <th class="px-4 py-2 text-left text-gray-700">Active</th>
                        <th class="px-4 py-2 text-left text-gray-700">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <%
                        string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=cakeshop;Integrated Security=True";
                        SqlConnection con = new SqlConnection(connStr);
                        con.Open();

                        // Handle delete
                        if (!string.IsNullOrEmpty(Request.QueryString["delete"]))
                        {
                            int offerId = Convert.ToInt32(Request.QueryString["delete"]);
                            SqlCommand cmdDel = new SqlCommand("DELETE FROM Offers WHERE OfferID=@id", con);
                            cmdDel.Parameters.AddWithValue("@id", offerId);
                            cmdDel.ExecuteNonQuery();
                            Response.Redirect("~/Admin/Offers.aspx?msg=Offer Deleted&type=success");
                        }

                        SqlCommand cmd = new SqlCommand("SELECT * FROM Offers ORDER BY StartDate DESC", con);
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (!reader.HasRows)
                        {
                    %>
                    <tr>
                        <td colspan="8" class="text-center text-gray-500 py-4">No offers found</td>
                    </tr>
                    <%
                        }

                        while (reader.Read())
                        {
                            string active = (Convert.ToBoolean(reader["IsActive"])) ? "Yes" : "No";
                            string activeColor = (active == "Yes") ? "text-green-600" : "text-red-600";
                    %>
                    <tr>
                        <td class="px-4 py-2"><%= reader["OfferID"] %></td>
                        <td class="px-4 py-2 font-semibold"><%= reader["Title"] %></td>
                        <td class="px-4 py-2"><%= reader["Description"] %></td>
                        <td class="px-4 py-2"><%= reader["DiscountPercent"] %>%</td>
                        <td class="px-4 py-2"><%= Convert.ToDateTime(reader["StartDate"]).ToString("yyyy-MM-dd") %></td>
                        <td class="px-4 py-2"><%= Convert.ToDateTime(reader["EndDate"]).ToString("yyyy-MM-dd") %></td>
                        <td class="px-4 py-2 font-semibold <%= activeColor %>"><%= active %></td>
                        <td class="px-4 py-2 space-x-2">

                            <a href="Offers.aspx?delete=<%= reader["OfferID"] %>" onclick="return confirm('Are you sure?')" class="px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600">Delete</a>
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

        <div class="mt-4">
            <a href="AddOffer.aspx" class="px-4 py-2 bg-pink-600 text-white rounded hover:bg-pink-700">Add New Offer</a>
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

