<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Cake.aspx.cs" Inherits="CakeShop.Admin.Cake" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


        <h2 class="text-3xl font-bold text-pink-600 mb-6">Manage Cakes</h2>

        <div class="bg-white p-6 rounded-2xl shadow mb-10">
            <h3 class="text-xl font-bold mb-4">Add New Cake</h3>
            <form method="post" action="Cake.aspx" enctype="multipart/form-data">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <input type="text" name="name" placeholder="Cake Name" class="border p-2 rounded w-full" required />
                    <input type="text" name="category" placeholder="Category" class="border p-2 rounded w-full" required />
                    <input type="number" name="price" placeholder="Price" class="border p-2 rounded w-full" required />
                    <input type="number" name="quantity" placeholder="Quantity" class="border p-2 rounded w-full" required />
                    <input type="file" name="imageFile" class="border p-2 rounded w-full" />
                    <input type="text" name="description" placeholder="Description" class="border p-2 rounded w-full" />
                </div>
                <button type="submit" name="addCake" class="mt-4 px-4 py-2 bg-pink-600 text-white rounded hover:bg-pink-700">Add Cake</button>
            </form>
        </div>

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
                            <th class="px-4 py-2 text-left text-gray-700">Image</th>
                            <th class="px-4 py-2 text-left text-gray-700">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                        <%
                            string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=cakeshop;Integrated Security=True";
                            SqlConnection con = new SqlConnection(connStr);
                            con.Open();

                            if (Request.Form["addCake"] != null)
                            {
                                string name = Request.Form["name"];
                                string category = Request.Form["category"];
                                string price = Request.Form["price"];
                                string quantity = Request.Form["quantity"];
                                string description = Request.Form["description"];
                                string imagePath = "";

                                // Save uploaded image[error in it and did't understand]
                                if (Request.Files["imageFile"] != null && Request.Files["imageFile"].ContentLength > 0)
                                {
                                    var file = Request.Files["imageFile"];
                                    string fileName = System.IO.Path.GetFileName(file.FileName);
                                    string savePath = Server.MapPath("~/Images/Cakes/") + fileName;
                                    file.SaveAs(savePath);
                                    imagePath = "~/Images/Cakes/" + fileName;
                                }

                                SqlCommand cmdAdd = new SqlCommand("INSERT INTO Cakes (Name, Category, Price, Quantity, Image, Description) VALUES (@name,@category,@price,@quantity,@image,@description)", con);
                                cmdAdd.Parameters.AddWithValue("@name", name);
                                cmdAdd.Parameters.AddWithValue("@category", category);
                                cmdAdd.Parameters.AddWithValue("@price", price);
                                cmdAdd.Parameters.AddWithValue("@quantity", quantity);
                                cmdAdd.Parameters.AddWithValue("@image", imagePath);
                                cmdAdd.Parameters.AddWithValue("@description", description);
                                cmdAdd.ExecuteNonQuery();
                                Response.Redirect("~/Admin/Cake.aspx?msg=Cake Added Successfully&type=success");
                            }

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
                            <td class="px-4 py-2">
                                <% if (reader["Image"] != DBNull.Value && !string.IsNullOrEmpty(reader["Image"].ToString()))
                                    { %>
                                <img src="<%= reader["Image"] %>" alt="Cake Image" class="h-16 w-16 object-cover rounded" />
                                <% }
                                else
                                { %>
                                <span class="text-gray-400">No Image</span>
                                <% } %>
                            </td>
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

