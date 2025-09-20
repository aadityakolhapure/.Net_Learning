<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginUser.aspx.cs" Inherits="ClinicProject.loginUser" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen font-sans">

    <div class="w-full max-w-md bg-white shadow-lg rounded-xl p-10 border border-gray-200">

        <!-- Logo / Title -->
        <div class="text-center mb-8">
            <h1 class="text-3xl font-bold text-blue-600">Welcome Back</h1>
            <p class="text-gray-500 mt-2">Login to your account</p>
        </div>

        <form method="post" action="loginUser.aspx">

            <div class="mb-5">
                <label for="txtEmail" class="block text-gray-700 font-medium mb-2">Email</label>
                <input type="email" id="txtEmail" name="txtEmail"
                    class="w-full px-4 py-3 rounded-lg border border-gray-300 bg-white 
                              focus:ring-2 focus:ring-blue-400 focus:border-blue-500 outline-none transition"
                    placeholder="you@example.com" required />
            </div>

            <div class="mb-6">
                <label for="txtPassword" class="block text-gray-700 font-medium mb-2">Password</label>
                <input type="password" id="txtPassword" name="txtPassword"
                    class="w-full px-4 py-3 rounded-lg border border-gray-300 bg-white 
                              focus:ring-2 focus:ring-blue-400 focus:border-blue-500 outline-none transition"
                    placeholder="••••••••" required />
            </div>

            <button type="submit"
                class="w-full py-3 rounded-lg text-white font-semibold 
                           bg-gradient-to-r from-blue-500 to-blue-600 
                           hover:from-blue-600 hover:to-blue-700 
                           transition-all shadow-md">
                Login
            </button>

            <!-- Extra Options -->
            <div class="flex justify-between items-center mt-6 text-sm">
                <a href="forgotpassword.aspx" class="text-blue-600 hover:underline">Forgot Password?</a>
                <a href="DoctorRegister.aspx" class="text-blue-600 hover:underline">Register</a>
            </div>

            <%


                string a = Request.Params["txtEmail"];
                string b = Request.Params["txtPassword"];
                string path = "Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog=hospital;Integrated Security=True";

                SqlConnection con = new SqlConnection(path);

                SqlCommand cmd = new SqlCommand("select * from Users where Email='" + a + "' and Password='" + b + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();


                if (dr.Read())
                {
                    int userId = Convert.ToInt32(dr["userId"]);
                    int roleId = Convert.ToInt32(dr["roleId"]);
                    string email = dr["Email"].ToString();
                    bool isApproved = Convert.ToBoolean(dr["isApproved"]);
                    string name = dr["username"].ToString(); 
                    string specilization = dr["specialization"].ToString();
                   

                    Session["userId"] = userId;
                    Session["email"] = email;
                    Session["roleId"] = roleId;
                    Session["name"] = name;
                    Session["specilization"] = specilization;
                   

                    if (roleId == 2)
                    {
                        Response.Redirect("AdminPanel.aspx");
                    }
                    else if (roleId == 1)
                    {
                        if (isApproved)
                        {
                            Response.Redirect("DoctorPanel.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Your account is pending approval. Please wait for admin approval.');</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Unauthorized Access!!');</script>");
                    }
                    dr.Close();
                }
            %>
        </form>
    </div>

</body>
</html>

