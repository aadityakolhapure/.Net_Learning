<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="day4.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter the number:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:ListBox ID="ListBox1" runat="server" Height="196px" Width="118px"></asp:ListBox>
            <asp:Button ID="Button2" runat="server" Text="Check Prime" OnClick="Button2_Click" />
            <asp:ListBox ID="ListBox2" runat="server" Height="211px" Width="86px"></asp:ListBox>


        </div>
    </form>
</body>
</html>
