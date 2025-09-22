<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddOffer.aspx.cs" Inherits="CakeShop.Admin.AddOffer" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="text-3xl font-bold text-pink-600 mb-6">Add New Offer</h2>

   
    <form method="post" class="space-y-4" action="AddOfferLogic.aspx">
        <input type="text" name="title" placeholder="Offer Title" class="w-full border p-2 rounded" required />
        <textarea name="description" placeholder="Description" class="w-full border p-2 rounded" required></textarea>
        <input type="number" name="discount" placeholder="Discount %" class="w-full border p-2 rounded" required />
        <input type="date" name="start" class="w-full border p-2 rounded" required />  <%-- lowercase fixed --%>
        <input type="date" name="end" class="w-full border p-2 rounded" />
        <button type="submit" class="px-4 py-2 bg-pink-600 text-white rounded hover:bg-pink-700">Add Offer</button>
    </form>

   
</asp:Content>
