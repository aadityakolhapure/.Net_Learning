<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="LoginSysytem.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>
<body class="flex items-center justify-center bg-gray-50 min-h-screen w-screen">
    <form id="form1" runat="server"
        class="border-2 border-gray-300 rounded-lg p-6 bg-white shadow-md w-full max-w-md">
        <h2 class="text-center text-2xl font-bold mb-4">Login form</h2>
       
        <div class="mb-5">
            <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                Your email
              <asp:RequiredFieldValidator
                  ID="RequiredFieldValidator1"
                  runat="server"
                  ControlToValidate="TextBox1"
                  ErrorMessage="*Enter the Email Address"
                  SetFocusOnError="True"
                  Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </label>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ErrorMessage="*Enter valid Email" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TextBox1"></asp:RegularExpressionValidator>

            <asp:TextBox ID="TextBox1" runat="server" class="shadow-xs bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-xs-light" placeholder="name@flowbite.com"></asp:TextBox>
        </div>
        <div class="mb-5">
            <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                Your password
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2"
                    runat="server"
                    ControlToValidate="TextBox2"
                    ErrorMessage="*Enter the Password"
                    SetFocusOnError="True"
                    Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

            </label>
            <asp:TextBox ID="TextBox2" runat="server" class="shadow-xs bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-xs-light"></asp:TextBox>
        </div>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Login" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" OnClick="Button1_Click"  />
        <br />
        <a href="index.aspx">Don't have account?</a>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"></script>
</body>
</html>

