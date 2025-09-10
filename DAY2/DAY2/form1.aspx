<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form1.aspx.cs" Inherits="DAY2.form1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="display: flex; flex-direction: column; justify-content: center; padding: 10px">
            <h1>
                <center>Sign Up form</center>
            </h1>

            <asp:TextBox ID="TextBox1" runat="server" placeholder="UserName" Style="padding: 2px;"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Password" Style="padding: 2px; margin-top: 20px"></asp:TextBox>
            <asp:TextBox ID="TextBox3" runat="server" placeholder="Confirm Password" Style="padding: 2px; margin-top: 20px"></asp:TextBox>
            <textarea id="TextArea1" rows="2" placeholder="Address" style="margin-top: 20px;"></textarea>

            <div button="" server="" style="display: flex; flex-direction: row; justify-items: start; margin-top: 30px; margin-bottom: 30px; <asp: Button runat=">
                <asp:CheckBox ID="CheckBox1" runat="server" />
                <span style="margin-left: 10px">I have read all the rule.</span>
            </div>
        </div>
        <center>
            <asp:Button ID="Button1" runat="server" Text="Button" Width="50px" />
        </center>


    </form>
</body>
</html>
