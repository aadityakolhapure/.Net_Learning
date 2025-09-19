<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorRegister.aspx.cs" Inherits="ClinicProject.DoctorRegister" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Doctor Registration</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        function validateForm() {
            var name = document.getElementById("txtName").value.trim();
            var specialization = document.getElementById("txtSpecialization").value.trim();
            var phone = document.getElementById("txtPhone").value.trim();
            var email = document.getElementById("txtEmail").value.trim();
            var password = document.getElementById("txtPassword").value.trim();

            if (name === "") { alert("Name is required."); return false; }
            if (specialization === "") { alert("Specialization is required."); return false; }
            if (phone === "" || !/^\d{7,15}$/.test(phone)) { alert("Phone must be 7-15 digits."); return false; }
            if (email === "" || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) { alert("Invalid email format."); return false; }
            if (password === "" || password.length < 6) { alert("Password must be at least 6 characters."); return false; }

            return true;
        }
    </script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen font-sans">

    <form id="doctorRegisterForm" 
          class="bg-white shadow-lg p-10 rounded-xl w-full max-w-lg border border-gray-200" 
          onsubmit="return validateForm();" action="login.aspx" method="post">

        <h2 class="text-3xl font-bold mb-8 text-center text-blue-600">Doctor Registration</h2>

        <div class="mb-5">
            <label for="txtName" class="block text-gray-700 mb-2 font-medium">Full Name</label>
            <input type="text" id="txtName" name="txtName" 
                   class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-blue-400 focus:border-blue-500 outline-none transition bg-white" />
        </div>

        <div class="mb-5">
            <label for="txtSpecialization" class="block text-gray-700 mb-2 font-medium">Specialization</label>
            <input type="text" id="txtSpecialization" name="txtSpecialization"
                   class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-blue-400 focus:border-blue-500 outline-none transition bg-white" />
        </div>

        <div class="mb-5">
            <label for="txtPhone" class="block text-gray-700 mb-2 font-medium">Phone</label>
            <input type="text" id="txtPhone" name="txtPhone" maxlength="15"
                   class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-blue-400 focus:border-blue-500 outline-none transition bg-white" />
        </div>

        <div class="mb-5">
            <label for="txtEmail" class="block text-gray-700 mb-2 font-medium">Email</label>
            <input type="email" id="txtEmail" name="txtEmail"
                   class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-blue-400 focus:border-blue-500 outline-none transition bg-white" />
        </div>

        <div class="mb-8">
            <label for="txtPassword" class="block text-gray-700 mb-2 font-medium">Password</label>
            <input type="password" id="txtPassword" name="txtPassword"
                   class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-blue-400 focus:border-blue-500 outline-none transition bg-white" />
        </div>

        <button type="submit" 
                class="w-full py-3 rounded-lg text-white font-semibold bg-gradient-to-r from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-700 transition-all shadow-md">
            Register
        </button>

        <p class="text-center text-sm text-gray-600 mt-6">
            Already have an account? 
            <a href="loginUser.aspx" class="text-blue-600 hover:underline font-medium">Login here</a>
        </p>
    </form>


</body>
</html>
