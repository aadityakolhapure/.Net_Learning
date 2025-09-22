<%@ Page Title="" Language="C#" MasterPageFile="~/Customers/Header.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="CakeShop.Customers.Cart" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="flex flex-col lg:flex-row gap-6">

        <!-- Cake List -->
        <div class="flex-1">
            <h2 class="text-2xl font-bold mb-4 text-pink-600">Order Cakes Online</h2>
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
            <div class="flex gap-4 items-center mb-4 border p-4 rounded-lg bg-white shadow hover:shadow-md">
                <img src="<%= reader["Image"] %>" alt="<%= reader["Name"] %>" class="w-24 h-24 object-cover rounded-lg" />
                <div class="flex-1">
                    <h3 class="text-lg font-semibold"><%= reader["Name"] %></h3>
                    <p class="text-gray-600 text-sm"><%= reader["Description"] %></p>
                    <p class="text-pink-600 font-bold mt-1">₹<%= reader["Price"] %></p>
                </div>
                <form method="post" action="AddToCart.aspx" class="flex flex-col items-center">
                    <input type="hidden" name="CakeID" value="<%= reader["CakeID"] %>" />
                    <input type="number" name="Quantity" value="1" min="1" max="<%= reader["Quantity"] %>" class="w-16 border rounded px-2 py-1 mb-2 text-center" />
                    <button type="submit" class="bg-pink-600 text-white px-4 py-2 rounded flex items-center hover:bg-pink-700">
                        <span class="material-symbols-outlined mr-1">add_shopping_cart</span> Add
                    </button>
                </form>
            </div>
            <% 
                    }
                    reader.Close();
                }
            %>
        </div>

        <div class="w-full lg:w-1/3 bg-white p-4 rounded-lg shadow">
            <h3 class="text-xl font-bold text-pink-600 mb-4">Cart</h3>
            <%
                if (Session["id"] != null)
                {
                    int customerId = Convert.ToInt32(Session["id"]);
                    using (SqlConnection con = new SqlConnection(connStr))
                    {
                        con.Open();
                        SqlCommand cartCmd = new SqlCommand(@"SELECT c.Quantity, c.CartID, ck.Name, ck.Price, ck.Image
                                                      FROM Cart c 
                                                      INNER JOIN Cakes ck ON c.CakeID = ck.CakeID
                                                      WHERE c.CustomerID=@CustomerID", con);
                        cartCmd.Parameters.AddWithValue("@CustomerID", customerId);
                        SqlDataReader cartReader = cartCmd.ExecuteReader();
                        decimal subtotal = 0;
                        bool hasItems = false;
                        while (cartReader.Read())
                        {
                            hasItems = true;
                            int qty = Convert.ToInt32(cartReader["Quantity"]);
                            decimal price = Convert.ToDecimal(cartReader["Price"]);
                            subtotal += qty * price;
            %>
            <div class="flex items-center justify-between mb-3">
                <div class="flex items-center gap-2">
                    <img src="<%= cartReader["Image"] %>" alt="<%= cartReader["Name"] %>" class="w-12 h-12 object-cover rounded" />
                    <div>
                        <p class="text-sm font-semibold"><%= cartReader["Name"] %></p>
                        <p class="text-gray-600 text-xs">Qty: <%= qty %></p>
                    </div>
                </div>
                <p class="font-bold">₹<%= qty * price %></p>
            </div>
            <%
                }
                cartReader.Close();
            %>
            <hr class="my-2">
            <div class="flex justify-between font-bold text-pink-600 mb-2">
                <span>Subtotal:</span>
                <span>₹<%= subtotal %></span>
            </div>
            <%
                if (hasItems)
                {
            %>
            <a href="Cart.aspx" class="block w-full text-center bg-pink-600 text-white py-2 rounded hover:bg-pink-700 mb-2">View Basket</a>
            <a href="Checkout.aspx" class="block w-full text-center bg-gray-800 text-white py-2 rounded hover:bg-gray-900">Checkout</a>
            <%
                }
                else
                {
            %>
            <p class="text-gray-500">Your cart is empty. Please login to add items.</p>
            <%
                        }
                    }
                }
                else
                {
            %>
            <p class="text-gray-500">Please login to add items to your cart.</p>
            <%
                }
            %>
        </div>
    </div>
</asp:Content>

