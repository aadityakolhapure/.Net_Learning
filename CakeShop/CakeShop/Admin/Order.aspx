<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="CakeShop.Admin.Order" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-3xl font-bold text-pink-600 mb-6">Manage Orders</h2>

    <div class="bg-white p-6 rounded-2xl shadow">
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-pink-100">
                    <tr>
                        <th class="px-4 py-2 text-left text-gray-700">Order ID</th>
                        <th class="px-4 py-2 text-left text-gray-700">Customer</th>
                        <th class="px-4 py-2 text-left text-gray-700">Cake</th>
                        <th class="px-4 py-2 text-left text-gray-700">Quantity</th>
                        <th class="px-4 py-2 text-left text-gray-700">Total Price</th>
                        <th class="px-4 py-2 text-left text-gray-700">Delivery Type</th>
                        <th class="px-4 py-2 text-left text-gray-700">Status</th>
                        <th class="px-4 py-2 text-left text-gray-700">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <%
                        string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=cakeshop;Integrated Security=True";
                        SqlConnection con = new SqlConnection(connStr);
                        con.Open();

                        // Handle status update
                        if (!string.IsNullOrEmpty(Request.QueryString["action"]) && !string.IsNullOrEmpty(Request.QueryString["id"]))
                        {
                            string action = Request.QueryString["action"];
                            int orderId = Convert.ToInt32(Request.QueryString["id"]);
                            string newStatus = "";

                            if (action == "accept") newStatus = "Accepted";
                            else if (action == "complete") newStatus = "Completed";
                            else if (action == "reject") newStatus = "Rejected";

                            if (newStatus != "")
                            {
                                SqlCommand cmdUpdate = new SqlCommand("UPDATE Orders SET Status=@status WHERE OrderID=@id", con);
                                cmdUpdate.Parameters.AddWithValue("@status", newStatus);
                                cmdUpdate.Parameters.AddWithValue("@id", orderId);
                                cmdUpdate.ExecuteNonQuery();
                                Response.Redirect("~/Admin/Order.aspx?msg=Order " + newStatus + "&type=success");
                            }
                        }

                        SqlCommand cmd = new SqlCommand(@"
SELECT o.OrderID,
       u.Name AS CustomerName,
       u.Email AS CustomerEmail,
       c.Name AS CakeName,
       od.Quantity,
       (od.Quantity * od.Price) AS TotalPrice,
       o.TotalAmount,
       o.DeliveryType,
       o.DeliveryCharge,
       o.Address,
       o.OrderDate,
       o.Status
FROM Orders o
JOIN Users u ON o.UserID = u.UserID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Cakes c ON od.CakeID = c.CakeID
ORDER BY o.OrderDate DESC", con);


                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            string status = reader["Status"].ToString();
                            string statusColor = "text-yellow-600"; // Pending default
                            if (status == "Accepted") statusColor = "text-blue-600";
                            else if (status == "Completed") statusColor = "text-green-600";
                            else if (status == "Rejected") statusColor = "text-red-600";
                    %>
                    <tr>
                        <td class="px-4 py-2"><%= reader["OrderID"] %></td>
                        <td class="px-4 py-2"><%= reader["CustomerName"] %></td>
                        <td class="px-4 py-2"><%= reader["CakeName"] %></td>
                        <td class="px-4 py-2"><%= reader["Quantity"] %></td>
                        <td class="px-4 py-2">₹<%= reader["TotalPrice"] %></td>
                        <td class="px-4 py-2"><%= reader["DeliveryType"] %></td>
                        <td class="px-4 py-2 font-semibold <%= statusColor %>"><%= status %></td>
                        <td class="px-4 py-2 space-x-2">
                            <% if (status == "Pending")
                                { %>
                            <a href="Order.aspx?action=accept&id=<%= reader["OrderID"] %>" class="px-3 py-1 bg-blue-500 text-white rounded hover:bg-blue-600">Accept</a>
                            <a href="Order.aspx?action=reject&id=<%= reader["OrderID"] %>" class="px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600">Reject</a>
                            <% }
                                else if (status == "Accepted")
                                { %>
                            <a href="Order.aspx?action=complete&id=<%= reader["OrderID"] %>" class="px-3 py-1 bg-green-500 text-white rounded hover:bg-green-600">Mark Completed</a>
                            <% }
                                else
                                { %>
                            <span class="text-gray-400">No Action</span>
                            <% } %>
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

    <!-- Success/Error Message -->
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

