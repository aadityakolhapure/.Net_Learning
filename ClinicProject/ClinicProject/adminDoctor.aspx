<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminDoctor.aspx.cs" Inherits="ClinicProject.adminDoctor" %>


<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.css" rel="stylesheet" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" />
</head>
<body>

    <%

        if (Session["userId"] == null || Session["email"] == null || Session["roleId"] == null || Convert.ToInt32(Session["roleId"]) == 1)
        {
            Response.Redirect("loginUser.aspx");
        }

    %>


    <nav class="fixed top-0 z-50 w-full bg-white border-b border-gray-200 dark:bg-gray-800 dark:border-gray-700">
        <div class="px-3 py-3 lg:px-5 lg:pl-3">
            <div class="flex items-center justify-between">
                <div class="flex items-center justify-start rtl:justify-end">
                    <button data-drawer-target="logo-sidebar" data-drawer-toggle="logo-sidebar" aria-controls="logo-sidebar" type="button" class="inline-flex items-center p-2 text-sm text-gray-500 rounded-lg sm:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
                        <span class="sr-only">Open sidebar</span>
                        <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path clip-rule="evenodd" fill-rule="evenodd" d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z"></path>
                        </svg>
                    </button>
                    <a href="#" class="flex items-center gap-3">
                        <div class="w-10 h-10 rounded-lg bg-indigo-600 flex items-center justify-center text-white font-semibold">HC</div>
                        <span class="font-semibold text-lg">HealthyCare</span>
                    </a>
                </div>
                <div class="flex items-center">
                    <div class="flex items-center ms-3">
                        <div>
                            <button type="button" class="flex text-sm bg-gray-800 rounded-full focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600" aria-expanded="false" data-dropdown-toggle="dropdown-user">
                                <span class="sr-only">Open user menu</span>
                                <img class="w-8 h-8 rounded-full" src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" alt="user photo">
                            </button>
                        </div>
                        <div class="z-50 hidden my-4 text-base list-none bg-white divide-y divide-gray-100 rounded-sm shadow-sm dark:bg-gray-700 dark:divide-gray-600" id="dropdown-user">
                            <div class="px-4 py-3" role="none">
                                <p class="text-sm text-gray-900 dark:text-white" role="none">
                                    <%Response.Write(Session["name"]); %>
                                </p>
                                <p class="text-sm font-medium text-gray-900 truncate dark:text-gray-300" role="none">
                                    <%Response.Write(Session["email"]);

                                    %>
                                </p>
                            </div>
                            <ul class="py-1" role="none">
                                <li>
                                    <a href="DoctorPanel.aspx" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-600 dark:hover:text-white" role="menuitem">Dashboard</a>
                                </li>
                                <li>
                                    <form id="form1" runat="server">
                                        <asp:Button ID="Button1" runat="server" Text="Sign out" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-600 dark:hover:text-white" role="menuitem" OnClick="Button1_Click" />
                                    </form>

                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <aside id="logo-sidebar" class="fixed top-0 left-0 z-40 w-64 h-screen pt-20 transition-transform -translate-x-full bg-white border-r border-gray-200 sm:translate-x-0 dark:bg-gray-800 dark:border-gray-700" aria-label="Sidebar">
        <div class="h-full px-3 pb-4 overflow-y-auto bg-white dark:bg-gray-800">
            <ul class="space-y-2 font-medium">
                <li>
                    <a href="AdminPanel.aspx" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                        <svg class="w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 21">
                            <path d="M16.975 11H10V4.025a1 1 0 0 0-1.066-.998 8.5 8.5 0 1 0 9.039 9.039.999.999 0 0 0-1-1.066h.002Z" />
                            <path d="M12.5 0c-.157 0-.311.01-.565.027A1 1 0 0 0 11 1.02V10h8.975a1 1 0 0 0 1-.935c.013-.188.028-.374.028-.565A8.51 8.51 0 0 0 12.5 0Z" />
                        </svg>
                        <span class="ms-3">Dashboard</span>
                    </a>
                </li>



                <li>
                    <a href="adminPatient.aspx" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                        <svg class="shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 18 20">
                            <path d="M17 5.923A1 1 0 0 0 16 5h-3V4a4 4 0 1 0-8 0v1H2a1 1 0 0 0-1 .923L.086 17.846A2 2 0 0 0 2.08 20h13.84a2 2 0 0 0 1.994-2.153L17 5.923ZM7 9a1 1 0 0 1-2 0V7h2v2Zm0-5a2 2 0 1 1 4 0v1H7V4Zm6 5a1 1 0 1 1-2 0V7h2v2Z" />
                        </svg>
                        <span class="flex-1 ms-3 whitespace-nowrap">Patients</span>
                    </a>
                </li>

                <li>
                    <a href="adminDoctor.aspx" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white bg-gray-100 dark:hover:bg-gray-700 group">
                        <span class="material-symbols-outlined text-gray-500">clinical_notes</span>
                        <span class="flex-1 ms-3 whitespace-nowrap">Doctors</span>
                    </a>
                </li>


            </ul>
        </div>
    </aside>

    <div class="p-4 sm:ml-64">




        <center class="p-4 mt-14">
            <h2 class="text-blue-800 font-semibold underline text-3xl border-2 rounded-full border-blue-300 p-4">Patients Details</h2>
        </center>

        <div class="flex items-center p-8 mb-8 bg-gradient-to-r from-blue-50 to-blue-100 dark:from-gray-800 dark:to-gray-700 shadow-xl rounded-2xl space-x-8" id="patient">
            <table class="min-w-full border border-gray-300 dark:border-gray-600 rounded-lg overflow-hidden">
                <thead class="bg-blue-600 text-white">
                    <tr>
                        <th class="px-6 py-3 text-left text-sm font-semibold">Patient Name</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold">Phone</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold">Email</th>
                        <th class="px-6 py-3 text-center text-sm font-semibold">Verified</th>
                        <th class="px-6 py-3 text-center text-sm font-semibold">Action</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                    <%
                        string path = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=hospital;Integrated Security=True";
                        using (SqlConnection con = new SqlConnection(path))
                        {
                            SqlCommand cmd = new SqlCommand(@"
                    SELECT u.userId, u.username, u.email, u.phone, u.isApproved
                    FROM Users u
                    WHERE u.roleId = 1", con);

                            con.Open();
                            SqlDataReader dr = cmd.ExecuteReader();
                            while (dr.Read())
                            {
                    %>
                    <tr class="hover:bg-gray-100 dark:hover:bg-gray-700 transition">
                        <td class="px-6 py-3"><%= dr["username"] %></td>
                        <td class="px-6 py-3"><%= dr["phone"] %></td>
                        <td class="px-6 py-3"><%= dr["email"] %></td>
                        <td class="px-6 py-3 text-center">
                            <% if (Convert.ToBoolean(dr["isApproved"]))
                                { %>
                    ✅
                <% }
                    else
                    { %>
                    ❌
                <% } %>
                        </td>
                        <td class="px-6 py-3 text-center">
                            <% if (!Convert.ToBoolean(dr["isApproved"]))
                                { %>
                            <form method="post" action="VerifyUser.aspx">
                                <input type="hidden" name="userId" value="<%= dr["userId"] %>" />
                                <button type="submit" class="px-4 py-2 bg-green-600 text-white rounded hover:bg-green-700">
                                    Approve
                                </button>
                            </form>
                            <% }
                                else
                                { %>
                            <span class="text-gray-500">Approved</span>
                            <% } %>
                        </td>
                    </tr>
                    <%
                            }
                            dr.Close();
                        }
                    %>
                </tbody>
            </table>

        </div>
    </div>




    <script src="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"></script>
</body>
</html>


