<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ecms.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- custom css file-->
    <link href="asset/css/categories.css" rel="stylesheet" />
     <!-- datatable css file -->
    <link href="asset/datatable/datatables.min.css" rel="stylesheet" />
    <!-- bootstrap file -->
    <link href="asset/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- fontawesome -->
    <link href="asset/fontawesome/css/all.css" rel="stylesheet" />   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container_table">
               <div class="grid_table">
             <h2 class="text-center text-primary "> LASTEST CATEGORIES </h2>
            <asp:GridView ID="GridView1" CssClass="table_grid" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="category_id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="rowCommand">

                <Columns>
                    <asp:BoundField DataField="category_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="category_id" />
                    <asp:BoundField DataField="category_title" HeaderText="Title" SortExpression="category_title" />
                    <asp:BoundField DataField="category_type" HeaderText="Type" SortExpression="category_type" />
                    <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                    <asp:BoundField DataField="category_end_date" HeaderText="Deadline" SortExpression="category_end_date" />
                    <asp:ButtonField ButtonType="Button" Text="JOIN" CommandName="select" ControlStyle-CssClass="btn btn-secondary btn-sm" />
                </Columns>
       
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />  
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
       
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand=""></asp:SqlDataSource>
            
            <br />
        </div>
        </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <!-- bootstrap js file-->
    <script src="asset/bootstrap/js/bootstrap.min.js"></script>
    <!-- jquery js file -->
    <script src="asset/datatable/jquery.js"></script>
    <!-- datatable js file -->
    <script src="asset/datatable/datatables.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var table = $('.table_grid').prepend($("<thead></thead>").append($(this).find("tr:first")));
            table.DataTable();
        });
    </script>
</asp:Content>
