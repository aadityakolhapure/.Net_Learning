<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOfferLogic.aspx.cs" Inherits="CakeShop.Admin.AddOfferLogic" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%
        string msg = "";
        string type = "";

        // Only run insert logic if form was submitted

        string a = Request.Form["title"];
        string b = Request.Form["description"];
        string c = Request.Form["discount"];
        string d = Request.Form["start"]; // lowercase
        string e = Request.Form["end"];
        int f = 1;

        using (SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=cakeshop;Integrated Security=True"))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(@"INSERT INTO Offers
                 (Title, Description, DiscountPercent, StartDate, EndDate, IsActive) 
                 VALUES(@title,@description,@discount,@start,@end,@active)", con);

            cmd.Parameters.AddWithValue("@title", a);
            cmd.Parameters.AddWithValue("@description", b);
            cmd.Parameters.AddWithValue("@discount", c);
            cmd.Parameters.AddWithValue("@start", d);
            cmd.Parameters.AddWithValue("@end", string.IsNullOrEmpty(e) ? (object)DBNull.Value : e);
            cmd.Parameters.AddWithValue("@active", f);

            int rows = cmd.ExecuteNonQuery();

            Response.Redirect("AddOffer.aspx?msg=Offer%20Added!!&type=success");
        }

    %>
</body>
</html>
