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
            <asp:GridView ID="GridView1" CssClass="table_grid" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="category_id" DataSourceID="SqlDataSource1" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="rowCommand">

                <AlternatingRowStyle BackColor="#F7F7F7" />

                <Columns>
                    <asp:BoundField DataField="category_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="category_id" />
                    <asp:BoundField DataField="category_title" HeaderText="Title" SortExpression="category_title" />
                    <asp:BoundField DataField="category_type" HeaderText="Type" SortExpression="category_type" />
                    <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                    <asp:BoundField DataField="category_end_date" HeaderText="Deadline" SortExpression="category_end_date" />
                    <asp:ButtonField ButtonType="Button" Text="JOIN" CommandName="select" ControlStyle-CssClass="btn btn-secondary btn-sm" >
<ControlStyle CssClass="btn btn-dark btn-sm w-75"></ControlStyle>
                    </asp:ButtonField>
                </Columns>
       
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />  
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
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
