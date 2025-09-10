<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="task.aspx.cs" Inherits="day3project.task" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span>Enter name-  </span>
            <asp:TextBox ID="TextBox1" runat="server" Width="235px"></asp:TextBox> <br /><br />
            <span>Select color- </span>
            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="color" Text="red" /> 
            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="color" Text="green" /> 
            <asp:RadioButton ID="RadioButton3" runat="server" GroupName="color" Text="yellow" /> 
            <asp:RadioButton ID="RadioButton4" runat="server" GroupName="color" Text="blue" />  <br /> <br />
            <asp:Button ID="Button1" runat="server" Text="Apply Changes" ForeColor="#FF99FF" OnClick="Button1_Click" Width="154px" />


        </div>
    </form>
</body>
</html>
