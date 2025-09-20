
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CakeShop.Register" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register | Cake Delight</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-pink-50 flex items-center justify-center min-h-screen">

<div class="w-full max-w-md bg-white p-8 rounded-2xl shadow-xl">
    <h2 class="text-3xl font-bold text-center text-pink-600 mb-6">🎂 Create Account</h2>
    
    <form id="registerForm" class="space-y-4" onsubmit="return validateForm()" method="post" action="RegisterLogic.aspx">
        <!-- Full Name -->
        <div>
            <label class="block text-gray-700 font-semibold mb-1">Full Name</label>
            <input type="text" id="name" placeholder="Enter your full name" name="name"
                class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-pink-400">
            <p class="text-red-500 text-sm mt-1 hidden" id="nameError">Please enter your full name.</p>
        </div>
        
        <!-- Email -->
        <div>
            <label class="block text-gray-700 font-semibold mb-1">Email</label>
            <input type="email" id="email" placeholder="Enter your email" name="email"
                class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-pink-400">
            <p class="text-red-500 text-sm mt-1 hidden" id="emailError">Please enter a valid email.</p>
        </div>
        
        <!-- Password -->
        <div>
            <label class="block text-gray-700 font-semibold mb-1">Password</label>
            <input type="password" id="password" placeholder="Enter your password" name="password"
                class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-pink-400">
            <p class="text-red-500 text-sm mt-1 hidden" id="passwordError">Password must be at least 6 characters.</p>
        </div>
        
        <!-- Confirm Password -->
        <div>
            <label class="block text-gray-700 font-semibold mb-1">Confirm Password</label>
            <input type="password" id="confirmPassword" placeholder="Confirm your password" name="cpassword"
                class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-pink-400">
            <p class="text-red-500 text-sm mt-1 hidden" id="confirmError">Passwords do not match.</p>
        </div>
        
        <button type="submit"
            class="w-full bg-pink-500 text-white py-2 rounded-lg hover:bg-pink-600 transition duration-300">
            Register
        </button>
    </form>
    
    <p class="text-center text-gray-600 mt-4">
        Already have an account? 
        <a href="Login.aspx" class="text-pink-600 font-semibold hover:underline">Login</a>
    </p>
</div>

<!-- JavaScript Validation -->
<script>
function validateForm() {
    let isValid = true;

    // Elements
    const name = document.getElementById('name');
    const email = document.getElementById('email');
    const password = document.getElementById('password');
    const confirmPassword = document.getElementById('confirmPassword');

    const nameError = document.getElementById('nameError');
    const emailError = document.getElementById('emailError');
    const passwordError = document.getElementById('passwordError');
    const confirmError = document.getElementById('confirmError');

    // Reset errors
    [nameError, emailError, passwordError, confirmError].forEach(e => e.classList.add('hidden'));

    // Name validation
    if(name.value.trim() === "") {
        nameError.classList.remove('hidden');
        isValid = false;
    }

    // Email validation
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if(email.value.trim() === "" || !emailPattern.test(email.value.trim())) {
        emailError.classList.remove('hidden');
        isValid = false;
    }

    // Password validation
    if(password.value.length < 6) {
        passwordError.classList.remove('hidden');
        isValid = false;
    }

    // Confirm password
    if(password.value !== confirmPassword.value || confirmPassword.value === "") {
        confirmError.classList.remove('hidden');
        isValid = false;
    }

    return isValid; // Submit only if valid
}
</script>

</body>
</html>

