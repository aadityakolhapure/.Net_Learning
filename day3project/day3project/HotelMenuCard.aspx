<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HotelMenuCard.aspx.cs" Inherits="day3project.HotelMenuCard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.0.4/dist/tailwind.min.css" rel="stylesheet">
    <title></title>
</head>
<body class="h-screen w-screen flex flex-row justify-center align-center p-8">
    <form id="form1" runat="server" class="h-full w-[500px] bg-sky-200 border-2 rounded-lg">
        <div class="p-5">
            <center>
                <h1 class="p-5">MH11 CAFE</h1>
            </center>
            <hr />

            <marquee>Welcome to Cafe!!</marquee>

            <asp:Table ID="Table1" runat="server" CssClass="w-full border border-gray-300">
                <asp:TableHeaderRow CssClass="bg-gray-200">
                    <asp:TableHeaderCell CssClass="border border-gray-300 p-2">Select</asp:TableHeaderCell>
                    <asp:TableHeaderCell CssClass="border border-gray-300 p-2">Menu Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell CssClass="border border-gray-300 p-2">Price</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="border border-gray-300 p-2 text-center">
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell CssClass="border border-gray-300 p-2">Burger</asp:TableCell>
                    <asp:TableCell CssClass="border border-gray-300 p-2">80rs</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="border border-gray-300 p-2 text-center">
                        <asp:CheckBox ID="CheckBox2" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell CssClass="border border-gray-300 p-2">Pizza</asp:TableCell>
                    <asp:TableCell CssClass="border border-gray-300 p-2">180rs</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="border border-gray-300 p-2 text-center">
                        <asp:CheckBox ID="CheckBox3" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell CssClass="border border-gray-300 p-2">Pasta</asp:TableCell>
                    <asp:TableCell CssClass="border border-gray-300 p-2">120rs</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow RowSpan="3">
                    <asp:TableCell CssClass="bg-gray-300">
                    </asp:TableCell>
                    <asp:TableCell CssClass="bg-gray-300">
   <center><span CssClass="text-gray-900 font-bold bg-gray-300">BEVRAGES</span></center>  
                    </asp:TableCell>
                    <asp:TableCell CssClass="bg-gray-300">
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell CssClass="border border-gray-300 p-2 text-center">
                        <asp:CheckBox ID="CheckBox4" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell CssClass="border border-gray-300 p-2">Tea</asp:TableCell>
                    <asp:TableCell CssClass="border border-gray-300 p-2">20rs</asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell CssClass="border border-gray-300 p-2 text-center">
                        <asp:CheckBox ID="CheckBox5" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell CssClass="border border-gray-300 p-2">Coffee</asp:TableCell>
                    <asp:TableCell CssClass="border border-gray-300 p-2">30rs</asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell CssClass="border border-gray-300 p-2 text-center">
                        <asp:CheckBox ID="CheckBox6" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell CssClass="border border-gray-300 p-2">Black Tea</asp:TableCell>
                    <asp:TableCell CssClass="border border-gray-300 p-2">20rs</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />
            <br />
            <hr />
            <br />

            <center>
                <asp:Button runat="server" Text="Order" CssClass="p-3 border-3 rounded-lg" OnClick="Unnamed1_Click" />
            </center>
            <center>
                <asp:Label ID="Label1" runat="server" CssClass="font-25 font-bold color-green"></asp:Label>

            </center>


            <br />
            <hr />
            <span>Additional 25% off on order above 400rs!!!</span>
            <span></span>



        </div>
    </form>
</body>
</html>
