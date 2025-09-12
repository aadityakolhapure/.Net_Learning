<%@ Page Title="" Language="C#" MasterPageFile="~/sample.Master" AutoEventWireup="true" CodeBehind="laptopPage.aspx.cs" Inherits="day5.laptopPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="t1 mt-6 grid grid-cols-1 gap-x-6 gap-y-10 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8 p-4">

        <!-- Dell Laptop -->
        <div class="groud relative border-2 border-gray-400 rounded-md p-4 bg-gray-100">
            <img src="https://m.media-amazon.com/images/I/71vFKBpKakL._SL1500_.jpg"
                alt="Dell Inspiron 15"
                class="aspect-square w-full rounded-md bg-gray-200 object-cover lg:aspect-auto lg:h-80" />
            <div class="mt-4 flex justify-between items-center">
                <div>
                    <h3 class="text-sm text-gray-700">
                        <a href="#">
                            <span aria-hidden="true" class="absolute inset-0"></span>
                            Dell Inspiron 15
                        </a>
                    </h3>
                    <p class="mt-1 text-sm text-gray-500">16GB RAM | 512GB SSD</p>
                </div>
                <asp:Label ID="Laptop1Price" runat="server" Text="65000/-"
                    class="text-sm font-bold text-yellow-500"></asp:Label>
                <asp:Button ID="Laptop1Order" runat="server" Text="Order"
                    CssClass="px-4 py-2 bg-blue-800 rounded-md text-white" />
            </div>
        </div>

        <!-- HP Laptop -->
        <div class="groud relative border-2 border-gray-400 rounded-md p-4 bg-gray-100">
            <img src="https://media.istockphoto.com/id/1389603578/photo/laptop-blank-screen-on-wood-table-with-blurred-coffee-shop-cafe-interior-background-and.jpg?s=612x612&w=0&k=20&c=bPf3XxUZJZ6HRw7BE75ur1wBMCm_r4QAr-_lajERIyU="
                alt="HP Pavilion 14"
                class="aspect-square w-full rounded-md bg-gray-200 object-cover lg:aspect-auto lg:h-80" />
            <div class="mt-4 flex justify-between items-center">
                <div>
                    <h3 class="text-sm text-gray-700">
                        <a href="#">
                            <span aria-hidden="true" class="absolute inset-0"></span>
                            HP Pavilion 14
                        </a>
                    </h3>
                    <p class="mt-1 text-sm text-gray-500">8GB RAM | 512GB SSD</p>
                </div>
                <asp:Label ID="Laptop2Price" runat="server" Text="58000/-"
                    class="text-sm font-bold text-yellow-500"></asp:Label>
                <asp:Button ID="Laptop2Order" runat="server" Text="Order"
                    CssClass="px-4 py-2 bg-blue-800 rounded-md text-white" />
            </div>
        </div>

        <!-- Lenovo Laptop -->
        <div class="groud relative border-2 border-gray-400 rounded-md p-4 bg-gray-100">
            <img src="https://cdn.mos.cms.futurecdn.net/FUi2wwNdyFSwShZZ7LaqWf.jpg"
                alt="Lenovo IdeaPad Slim 5"
                class="aspect-square w-full rounded-md bg-gray-200 object-cover lg:aspect-auto lg:h-80" />
            <div class="mt-4 flex justify-between items-center">
                <div>
                    <h3 class="text-sm text-gray-700">
                        <a href="#">
                            <span aria-hidden="true" class="absolute inset-0"></span>
                            Lenovo IdeaPad Slim 5
                        </a>
                    </h3>
                    <p class="mt-1 text-sm text-gray-500">16GB RAM | 1TB SSD</p>
                </div>
                <asp:Label ID="Laptop3Price" runat="server" Text="72000/-"
                    class="text-sm font-bold text-yellow-500"></asp:Label>
                <asp:Button ID="Laptop3Order" runat="server" Text="Order"
                    CssClass="px-4 py-2 bg-blue-800 rounded-md text-white" />
            </div>
        </div>

    </div>

</asp:Content>
