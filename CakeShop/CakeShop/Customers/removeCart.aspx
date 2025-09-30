<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="removeCart.aspx.cs" Inherits="CakeShop.Customers.removeCart" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%
    
        int removeCartId = Convert.ToInt32(Request.Form["RemoveCartID"]);
        string connSt = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=cakeshop;Integrated Security=True";

        using (SqlConnection con = new SqlConnection(connSt))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM Cart WHERE CartID=@CartID", con);
            cmd.Parameters.AddWithValue("@CartID", removeCartId);
            cmd.ExecuteNonQuery();
        }

        // Refresh the page
        Response.Redirect("~/Customers/Cart.aspx");
  
%>
</body>
</html>
