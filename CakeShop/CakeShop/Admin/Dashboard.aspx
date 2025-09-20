<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CakeShop.Admin.WebForm1" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="text-3xl font-bold text-pink-600 mb-6">Dashboard</h2>
    <span class="font-bold text-2xl text-green-500 m-4 underline pb-4">
        <% Response.Write(Session["name"]); %>
    </span>
    <%
        // Initialize variables
        int totalOrders = 0;
        int pendingOrders = 0;
        int completedOrders = 0;
        decimal totalSales = 0;

        var recentOrders = new List<Dictionary<string, string>>();

        string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=cakeshop;Integrated Security=True";

        SqlConnection con = new SqlConnection(connStr);
        con.Open();

        // Total Orders
        SqlCommand cmdTotal = new SqlCommand("SELECT COUNT(*) FROM Orders", con);
        totalOrders = (int)cmdTotal.ExecuteScalar();

        // Pending Orders
        SqlCommand cmdPending = new SqlCommand("SELECT COUNT(*) FROM Orders WHERE Status='Pending'", con);
        pendingOrders = (int)cmdPending.ExecuteScalar();

        // Completed Orders
        SqlCommand cmdCompleted = new SqlCommand("SELECT COUNT(*) FROM Orders WHERE Status='Completed'", con);
        completedOrders = (int)cmdCompleted.ExecuteScalar();

        // Total Sales
        SqlCommand cmdSales = new SqlCommand("SELECT ISNULL(SUM(TotalAmount),0) FROM Orders WHERE Status='Completed'", con);
        totalSales = Convert.ToDecimal(cmdSales.ExecuteScalar());

        // Recent Orders
        string recentOrdersQuery = @"
        SELECT TOP 5 o.OrderID, u.Name AS CustomerName, o.TotalAmount, o.Status
        FROM Orders o
        INNER JOIN Users u ON o.UserID = u.UserID
        ORDER BY o.OrderDate DESC";

        SqlCommand cmdRecent = new SqlCommand(recentOrdersQuery, con);
        SqlDataReader reader = cmdRecent.ExecuteReader();

        while (reader.Read())
        {
            var order = new Dictionary<string, string>();
            order["OrderID"] = reader["OrderID"].ToString();
            order["CustomerName"] = reader["CustomerName"].ToString();
            order["TotalAmount"] = reader["TotalAmount"].ToString();
            order["Status"] = reader["Status"].ToString();
            recentOrders.Add(order);
        }

        // Close reader and connection manually
        reader.Close();
        con.Close();
    %>


    <!-- Stats Cards -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-10">
        <div class="bg-white p-6 rounded-2xl shadow flex flex-col items-center">
            <p class="text-gray-500 font-semibold">Total Orders</p>
            <p class="text-2xl font-bold mt-2 text-pink-600"><%= totalOrders %></p>
        </div>
        <div class="bg-white p-6 rounded-2xl shadow flex flex-col items-center">
            <p class="text-gray-500 font-semibold">Pending Orders</p>
            <p class="text-2xl font-bold mt-2 text-yellow-500"><%= pendingOrders %></p>
        </div>
        <div class="bg-white p-6 rounded-2xl shadow flex flex-col items-center">
            <p class="text-gray-500 font-semibold">Completed Orders</p>
            <p class="text-2xl font-bold mt-2 text-green-500"><%= completedOrders %></p>
        </div>
        <div class="bg-white p-6 rounded-2xl shadow flex flex-col items-center">
            <p class="text-gray-500 font-semibold">Total Sales</p>
            <p class="text-2xl font-bold mt-2 text-pink-800">₹<%= totalSales %></p>
        </div>
    </div>

    <!-- Recent Orders Table -->
    <div class="bg-white p-6 rounded-2xl shadow">
        <h3 class="text-xl font-bold mb-4 text-pink-600">Recent Orders</h3>
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-pink-100">
                    <tr>
                        <th class="px-4 py-2 text-left text-gray-700">Order ID</th>
                        <th class="px-4 py-2 text-left text-gray-700">Customer</th>
                        <th class="px-4 py-2 text-left text-gray-700">Total</th>
                        <th class="px-4 py-2 text-left text-gray-700">Status</th>

                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <tbody class="divide-y divide-gray-200">
                        <% foreach (var order in recentOrders)
                            { %>
                        <tr>
                            <td class="px-4 py-2"><%= order["OrderID"] %></td>
                            <td class="px-4 py-2"><%= order["CustomerName"] %></td>
                            <td class="px-4 py-2">₹<%= order["TotalAmount"] %></td>
                            <td class="px-4 py-2 font-semibold 
    <% 
                                if (order["Status"] == "Pending")
                                { %> text-yellow-500 <% }
                                else if (order["Status"] == "Completed")
                                { %> text-green-500 <% }
                                else if (order["Status"] == "Rejected")
                                { %> text-red-500 <% }
                                else if (order["Status"] == "Accepted")
                                { %> text-blue-500 <% }
    %>">
                                <%= order["Status"] %>
                            </td>

                        </tr>
                        <% } %>
                    </tbody>
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
