<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCart.aspx.cs" Inherits="CakeShop.Customers.AddCart" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>


    <%
        if (Session["id"] != null && Request.Form["CakeID"] != null)
        {
            int customerId = Convert.ToInt32(Session["id"]);
            int cakeId = Convert.ToInt32(Request.Form["CakeID"]);
            int quantity = Convert.ToInt32(Request.Form["Quantity"]);

            string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=cakeshop;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Cart (CustomerID, CakeID, Quantity) VALUES (@CustomerID,@CakeID,@Quantity)", con);
                cmd.Parameters.AddWithValue("@CustomerID", customerId);
                cmd.Parameters.AddWithValue("@CakeID", cakeId);
                cmd.Parameters.AddWithValue("@Quantity", quantity);
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("cakes.aspx?msg=Added to cart&type=success");
        }
        else
        {
            Response.Redirect("~/Customers/cakes.aspx");
        }
    %>
</body>
</html>
