<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="CakeShop.Admin.Logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%
        Session["name"] = null;
        Session["email"] = null;
        Session["role"] = null;
        Response.Redirect("../Login.aspx?msg=Logout%20Successfully!!&type=success");
        %>
</body>
</html>
