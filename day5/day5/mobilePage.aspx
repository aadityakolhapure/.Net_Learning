<%@ Page Title="" Language="C#" MasterPageFile="~/sample.Master" AutoEventWireup="true" CodeBehind="mobilePage.aspx.cs" Inherits="day5.mobilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="t1 mt-6 grid grid-cols-1 gap-x-6 gap-y-10 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8 p-4">

        <!-- iPhone -->
        <div class="groud relative border-2 border-gray-400 rounded-md p-4 bg-gray-100">
            <img src="https://m.media-amazon.com/images/I/71fVoqRC0wL._SL1500_.jpg"
                alt="iPhone 14 Pro"
                class="aspect-square w-full rounded-md bg-gray-200 object-cover lg:aspect-auto lg:h-80" />
            <div class="mt-4 flex justify-between items-center">
                <div>
                    <h3 class="text-sm text-gray-700">
                        <a href="#">
                            <span aria-hidden="true" class="absolute inset-0"></span>
                            Apple iPhone 14 Pro
                        </a>
                    </h3>
                    <p class="mt-1 text-sm text-gray-500">128GB</p>
                </div>
                <asp:Label ID="Mobile1Price" runat="server" Text="120000/-"
                    class="text-sm font-bold text-yellow-500"></asp:Label>
                <asp:Button ID="Mobile1Order" runat="server" Text="Order"
                    CssClass="px-4 py-2 bg-blue-800 rounded-md text-white" />
                <br />
                
            </div>
        </div>

        <!-- Samsung Galaxy -->
        <div class="groud relative border-2 border-gray-400 rounded-md p-4 bg-gray-100">
            <img src="https://m.media-amazon.com/images/I/71HUnJvHsbL._SL1500_.jpg"
                alt="Samsung Galaxy S23 Ultra"
                class="aspect-square w-full rounded-md bg-gray-200 object-cover lg:aspect-auto lg:h-80" />
            <div class="mt-4 flex justify-between items-center">
                <div>
                    <h3 class="text-sm text-gray-700">
                        <a href="#">
                            <span aria-hidden="true" class="absolute inset-0"></span>
                            Samsung Galaxy S23 Ultra
                        </a>
                    </h3>
                    <p class="mt-1 text-sm text-gray-500">256GB</p>
                </div>
                <asp:Label ID="Mobile2Price" runat="server" Text="95000/-"
                    class="text-sm font-bold text-yellow-500"></asp:Label>
                <asp:Button ID="Mobile2Order" runat="server" Text="Order"
                    CssClass="px-4 py-2 bg-blue-800 rounded-md text-white" />
            </div>
        </div>

        <!-- OnePlus -->
        <div class="groud relative border-2 border-gray-400 rounded-md p-4 bg-gray-100">
            <img src="https://m.media-amazon.com/images/I/61+Q6Rh3OQL._SL1500_.jpg"
                alt="OnePlus 11 5G"
                class="aspect-square w-full rounded-md bg-gray-200 object-cover lg:aspect-auto lg:h-80" />
            <div class="mt-4 flex justify-between items-center">
                <div>
                    <h3 class="text-sm text-gray-700">
                        <a href="#">
                            <span aria-hidden="true" class="absolute inset-0"></span>
                            OnePlus 11 5G
                        </a>
                    </h3>
                    <p class="mt-1 text-sm text-gray-500">16GB RAM</p>
                </div>
                <asp:Label ID="Mobile3Price" runat="server" Text="65000/-"
                    class="text-sm font-bold text-yellow-500"></asp:Label>
                <asp:Button ID="Mobile3Order" runat="server" Text="Order"
                    CssClass="px-4 py-2 bg-blue-800 rounded-md text-white" />
            </div>
        </div>


    </div>

</asp:Content>
