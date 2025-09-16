<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="LoginSysytem.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.css" rel="stylesheet" />
    <title></title>
</head>
<body class="flex  bg-gray-50 min-h-screen w-screen">
    <form id="form1" runat="server">
        <div class="bg-gray-100 border-b-2 border-gray-900 w-screen flex flex-row items-center justify-between px-6 py-3">
            <div>
                <span class="text-lg font-bold text-gray-800">Dashboard</span>
            </div>

            <div class="flex flex-row">
                <svg class="w-7 h-7 text-gray-800" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                    fill="currentColor" viewBox="0 0 24 24">
                    <path fill-rule="evenodd"
                        d="M12 6a3.5 3.5 0 1 0 0 7 3.5 3.5 0 0 0 0-7Zm-1.5 8a4 4 0 0 0-4 4 2 2 0 0 0 2 2h7a2 2 0 0 0 2-2 4 4 0 0 0-4-4h-3Zm6.82-3.096a5.51 5.51 0 0 0-2.797-6.293 3.5 3.5 0 1 1 2.796 6.292ZM19.5 18h.5a2 2 0 0 0 2-2 4 4 0 0 0-4-4h-1.1a5.503 5.503 0 0 1-.471.762A5.998 5.998 0 0 1 19.5 18ZM4 7.5a3.5 3.5 0 0 1 5.477-2.889 5.5 5.5 0 0 0-2.796 6.293A3.501 3.501 0 0 1 4 7.5ZM7.1 12H6a4 4 0 0 0-4 4 2 2 0 0 0 2 2h.5a5.998 5.998 0 0 1 3.071-5.238A5.505 5.505 0 0 1 7.1 12Z"
                        clip-rule="evenodd" />
                    <span>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </span>

                    <asp:Button ID="Button1" runat="server" Text="Logout" class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900" OnClick="Button1_Click"/>
                </svg>
            </div>
        </div>

        <div class="text-lg font-bold">
            <marquee>
              <span> Welcome! </span>  <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            </marquee>

            <asp:Label ID="Label3" runat="server" Text="" CssClass="mt-4"></asp:Label>

        </div>


    </form>
</body>
</html>
