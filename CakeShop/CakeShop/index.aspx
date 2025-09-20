<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CakeShop.index" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cake Shop - Home</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-pink-50 font-sans">

    <!-- Navbar -->
    <nav class="flex justify-between items-center px-8 py-4 bg-white shadow-md">
        <h1 class="text-2xl font-bold text-pink-600">Cake<span class="text-yellow-500">Shop</span></h1>
        <ul class="flex space-x-6 text-gray-700 font-medium">
            <li><a href="Default.aspx" class="hover:text-pink-600">Home</a></li>
            <li><a href="Cakes.aspx" class="hover:text-pink-600">Cakes</a></li>
            <li><a href="Offers.aspx" class="hover:text-pink-600">Offers</a></li>
            <li><a href="Login.aspx" class="hover:text-pink-600">Login</a></li>
        </ul>
    </nav>

    <!-- Hero Section -->
    <section class="relative bg-pink-100 h-[80vh] flex items-center justify-center text-center">
        <div class="absolute inset-0 bg-[url('https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/easy_chocolate_cake_31070_16x9.jpg')] bg-cover bg-center opacity-40"></div>
        <div class="relative z-10 max-w-2xl">
            <h2 class="text-5xl font-extrabold text-pink-700">Delicious Cakes for Every Occasion 🎂</h2>
            <p class="mt-4 text-lg text-gray-700">Freshly baked with love & care. Celebrate your moments with sweetness!</p>
            <div class="mt-6 flex justify-center space-x-4">
                <a href="Cakes.aspx" class="bg-pink-600 text-white px-6 py-3 rounded-lg shadow-lg hover:bg-pink-700">Shop Now</a>
                <a href="Offers.aspx" class="bg-yellow-400 text-gray-800 px-6 py-3 rounded-lg shadow-lg hover:bg-yellow-500">View Offers</a>
            </div>
        </div>
    </section>

    <!-- Categories -->
    <section class="py-16 px-8 text-center">
        <h3 class="text-3xl font-bold text-gray-800 mb-10">Our Specialties</h3>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="bg-white rounded-xl shadow-lg p-6 hover:scale-105 transition">
                <img src="https://www.fnp.com/images/pr/l/v20221205202830/cream-drop-chocolate-cake-half-kg_1.jpg" class="rounded-lg h-48 w-full object-cover" />
                <h4 class="text-xl font-semibold mt-4 text-pink-700">Birthday Cakes</h4>
                <p class="text-gray-600">Make every birthday extra sweet!</p>
            </div>
            <div class="bg-white rounded-xl shadow-lg p-6 hover:scale-105 transition">
                <img src="https://funcakes.com/content/uploads/2022/04/Fun-Cakes-20220324-Roze_trouwtaaart-fondant-02-960x960-c-default.jpg" class="rounded-lg h-48 w-full object-cover" />
                <h4 class="text-xl font-semibold mt-4 text-pink-700">Wedding Cakes</h4>
                <p class="text-gray-600">Celebrate love with elegant cakes.</p>
            </div>
            <div class="bg-white rounded-xl shadow-lg p-6 hover:scale-105 transition">
                <img src="https://www.sendonlinecake.com/images/SOC-Pineapple-Rose-Cake-New.jpg" class="rounded-lg h-48 w-full object-cover" />
                <h4 class="text-xl font-semibold mt-4 text-pink-700">Custom Cakes</h4>
                <p class="text-gray-600">Design your dream cake with us.</p>
            </div>
        </div>
    </section>

    <!-- Offers Section -->
    <section class="bg-pink-200 py-16 text-center">
        <h3 class="text-3xl font-bold text-pink-800 mb-6">Special Offers</h3>
        <p class="text-lg text-gray-700">Check out our latest discounts and deals.</p>
        <a href="Offers.aspx" class="mt-6 inline-block bg-pink-700 text-white px-6 py-3 rounded-lg hover:bg-pink-800">Explore Offers</a>
    </section>

    <!-- Footer -->
    <footer class="bg-gray-800 text-gray-200 py-6 text-center">
        <p>&copy; 2025 CakeShop. All Rights Reserved.</p>
        <p class="mt-2">Follow us on 
            <a href="#" class="text-pink-400 hover:underline">Instagram</a>, 
            <a href="#" class="text-pink-400 hover:underline">Facebook</a>
        </p>
    </footer>

</body>
</html>

