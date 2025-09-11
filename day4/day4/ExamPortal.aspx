<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExamPortal.aspx.cs" Inherits="day4.ExamPortal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.0.4/dist/tailwind.min.css" rel="stylesheet" />
    <title>Exam Portal</title>
    <style>
        #DropDownList1 {
            border: groove;
            border-radius: 5px;
        }

        body {
            background-image: url("https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=1470&q=80");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
        }
    </style>
</head>
<body class="min-h-screen flex align-center item-center justify-center border-gray-200 bg-opacity-50 m-4 ">
    <form id="form2" runat="server" class="w-full bg-white bg-opacity-90 max-w-3xl rounded-2xl border border-gray-300 p-8 h-full">
        <div class="text-center mb-6">
            <div class="text-center p-5 bg-[A8FBD3]">
                <h1 class="text-4xl font-bold mb-4 text-indigo-500">SkillSphere Exam Portal</h1>

                <div class="flex justify-center space-x-12 mt-3 text-indigo-700 font-semibold text-lg">
                    <span>Total Questions: <span class="font-bold">11</span></span>
                    <span>Visited Questions:
                        <asp:Label ID="Label4" runat="server" CssClass="font-bold"></asp:Label></span>
                </div>

                <hr class="border-indigo-300 mb-6" />

                <label for="DropDownList1" class="block mb-2 text-lg font-semibold text-indigo-800">Select Question</label>

                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="w-full p-3 rounded-md border border-indigo-400 focus:outline-none focus:ring-4 focus:ring-indigo-300" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>Question1</asp:ListItem>
                    <asp:ListItem>Question2</asp:ListItem>
                    <asp:ListItem>Question3</asp:ListItem>
                    <asp:ListItem>Question4</asp:ListItem>
                    <asp:ListItem>Question5</asp:ListItem>
                    <asp:ListItem>Question6</asp:ListItem>
                    <asp:ListItem>Question7</asp:ListItem>
                    <asp:ListItem>Question8</asp:ListItem>
                    <asp:ListItem>Question9</asp:ListItem>
                    <asp:ListItem>Question10</asp:ListItem>
                    <asp:ListItem>Question11</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="TextBox1" runat="server" Height="61px" BorderStyle="Solid" BorderColor="#003300" BorderWidth="2px" CssClass="mb-4 mt-4 row-4 w-full border-indigo-300 rounded-lg bg-indigo-50 text-indigo-900 font-semibold p-4"></asp:TextBox>


                <br />
                <br />

                <div class="mt-6 grid grid-cols-2 gap-x-10 gap-y-4 text-indigo-800">
                    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="opt" CssClass="cursor-pointer text-lg" Font-Size="Large" />
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="opt" CssClass="cursor-pointer text-lg" Font-Size="Large" />
                    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="opt" CssClass="cursor-pointer text-lg" Font-Size="Large" />
                    <asp:RadioButton ID="RadioButton4" runat="server" GroupName="opt" CssClass="cursor-pointer text-lg" Font-Size="Large" />
                </div>

                <center>
                    <asp:Button ID="Button1" runat="server" Text="Submit Answer" CssClass="bg-indigo-600 text-white font-bold py-3 px-8 rounded-xl shadow hover:bg-indigo-700 transition duration-200" OnClick="Button1_Click" />
                    
                    <span class="block text-sm text-gray-700 mb-1 mt-6">
                        <asp:Label ID="Label1" runat="server" CssClass="inline-block font-bold text-sky-700"></asp:Label>
                    </span>
                    <br />
                    <div class="mt-3 space-y-2">
                        <asp:Label ID="Label3" runat="server" CssClass="block text-2xl font-extrabold text-indigo-900"></asp:Label>
                        <asp:Label ID="Label2" runat="server" CssClass="block text-2xl font-bold text-indigo-600"></asp:Label>
                    </div>

                </center>
            </div>
    </form>
</body>
</html>
