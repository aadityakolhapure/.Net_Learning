<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CakeShop.Login" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Cake Delight</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-pink-50 flex items-center justify-center min-h-screen">

    <!-- Login Card -->
    <div class="w-full max-w-md bg-white p-8 rounded-2xl shadow-xl">
        <h2 class="text-3xl font-bold text-center text-pink-600 mb-6">🍰 Welcome Back</h2>

        <form id="loginForm" class="space-y-4" method="post" action="loginLogic.aspx">
            <div>
                <label class="block text-gray-700 font-semibold mb-1">Email</label>
                <input type="email" name="email" placeholder="Enter your email" required
                    class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-pink-400">
            </div>

            <div>
                <label class="block text-gray-700 font-semibold mb-1">Password</label>
                <input type="password" name="password" placeholder="Enter your password" required
                    class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-pink-400">
            </div>

            <button type="submit"
                class="w-full bg-pink-500 text-white py-2 rounded-lg hover:bg-pink-600 transition duration-300">
                Login
            </button>
        </form>

        <p class="text-center text-gray-600 mt-4">
            Don’t have an account? 
            <a href="Register.aspx" class="text-pink-600 font-semibold hover:underline">Sign up</a>
        </p>
    </div>

    <%
        string msg = Request.QueryString["msg"];
        string type = Request.QueryString["type"]; // "success" or "error"

        if (!string.IsNullOrEmpty(msg))
        {
            string bgColor = "bg-green-100 text-green-700"; // default success
            if (!string.IsNullOrEmpty(type) && type.ToLower() == "error")
            {
                bgColor = "bg-red-100 text-red-700"; // error message
            }
    %>
    <div class="<%= bgColor %> p-3 rounded mb-4 fixed bottom-4 right-4 z-50 shadow-lg">
        <%= msg %>
    </div>
    <% } %>
</body>
</html>
