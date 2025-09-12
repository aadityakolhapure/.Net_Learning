<%@ Page Title="" Language="C#" MasterPageFile="~/sample.Master" AutoEventWireup="true" CodeBehind="tvPage.aspx.cs" Inherits="day5.indedx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /*        .t1{
            background-image:url("https://img.freepik.com/free-vector/ecommerce-web-store-hand-drawn-illustration_107791-10966.jpg");
            background-repeat:no-repeat;
            opacity:75%;
            background-size:cover;
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <div class="t1 mt-6 grid grid-cols-1 gap-x-6 gap-y-10 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8 p-4">
            <div class="groud relative border-2 border-gray-400 rounded-md p-4 bg-gray-100">
                <img src="https://m.media-amazon.com/images/I/71UXAXZwFLL.jpg" alt="Front of men&#039;s Basic Tee in black." class="aspect-square w-full rounded-md bg-gray-200 object-cover lg:aspect-auto lg:h-80" />
                <div class="mt-4 flex justify-between">
                    <div>
                        <h3 class="text-sm text-gray-700">
                            <a href="#">
                                <span aria-hidden="true" class="absolute inset-0"></span>
                                Samsung HD-Smart TV
                            </a>
                        </h3>
                        <p class="mt-1 text-sm text-gray-500">44-Inch</p>
                    </div>
                    <asp:Label ID="Label2" runat="server" Text="50000/-" class="text-sm font-bold text-yellow-500"></asp:Label>
                    <asp:Button ID="Button2" runat="server" Text="Order" CssClass="p-4 bg-blue-800 rounded-md text-white" />
                </div>
            </div>

            <div class="groud relative border-2 border-gray-400 rounded-md p-4 bg-gray-100">
                <img src="https://media.istockphoto.com/id/638043774/photo/modern-curved-4k-ultrahd-tv.jpg?s=612x612&w=0&k=20&c=ZJBK7-64tG3uPBtXuUnWt-lAPSqz_nBlYXNYsVtmRtc=" alt="Front of men&#039;s Basic Tee in black." class="aspect-square w-full rounded-md bg-gray-200 object-cover lg:aspect-auto lg:h-80" />
                <div class="mt-4 flex justify-between">
                    <div>
                        <h3 class="text-sm text-gray-700">
                            <a href="#">
                                <span aria-hidden="true" class="absolute inset-0"></span>
                                LG HD-Curved Smart TV
                            </a>
                        </h3>
                        <p class="mt-1 text-sm text-gray-500">44-Inch</p>
                    </div>
                    <asp:Label ID="Label1" runat="server" Text="90000/-" class="text-sm font-bold text-yellow-500"></asp:Label>
                    <asp:Button ID="Button1" runat="server" Text="Order" CssClass="p-4 bg-blue-800 rounded-md text-white" OnClientClick="openPopup(); return false;" />
                </div>
            </div>
            <div class="groud relative border-2 border-gray-400 rounded-md p-4 bg-gray-100">
                <img src="https://thomsonhome.in//wp-content/uploads/2025/03/43505565771000x1000-600x600.webp" alt="Front of men&#039;s Basic Tee in black." class="aspect-square w-full rounded-md bg-gray-200 object-cover lg:aspect-auto lg:h-80" />
                <div class="mt-4 flex justify-between">
                    <div>
                        <h3 class="text-sm text-gray-700">
                            <a href="#">
                                <span aria-hidden="true" class="absolute inset-0"></span>
                                Thomson Oled Screen
                            </a>
                        </h3>
                        <p class="mt-1 text-sm text-gray-500">65-Inch</p>
                    </div>
                    <asp:Label ID="Label3" runat="server" Text="80000/-" class="text-sm font-bold text-yellow-500"></asp:Label>
                    
                </div>
            </div>
        </div>
</asp:Content>
