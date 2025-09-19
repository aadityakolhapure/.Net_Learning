<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="employees.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 flex items-center justify-center h-screen">
    <div class="bg-white p-8 rounded-xl shadow-md w-96">
        <h2 class="text-2xl font-bold mb-6">Employee Form</h2>
        <form id="empForm" method="post" class="space-y-4">

            <div>
                <label class="block text-sm font-medium">Name</label>
                <input type="text" name="name" class="w-full border border-gray-400 p-2 rounded" required />
            </div>

            <div>
                <label class="block text-sm font-medium">Country</label>
                <select name="country" id="country" class="w-full border border-gray-400 p-2 rounded" required>
                    <option value="">--Select Country--</option>
                </select>
            </div>

            <div>
                <label class="block text-sm font-medium">State</label>
                <select name="state" id="state" class="w-full border border-gray-400 p-2 rounded" required>
                    <option value="">--Select State--</option>
                </select>
            </div>

            <div>
                <label class="block text-sm font-medium">City</label>
                <select name="city" id="city" class="w-full border border-gray-400 p-2 rounded" required>
                    <option value="">--Select City--</option>
                </select>
            </div>

            <button type="submit" class="w-full bg-indigo-600 text-white p-2 rounded hover:bg-indigo-700">Submit</button>
        </form>
    </div>

    <script>
windows.load
</script>
</body>
</html>

