<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="ec-categories.aspx.cs" Inherits="ecms.ec_categories" %>
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
            <div class="d-flex justify-content-between">
                <div>
                     <h2 class="text-center text-primary ">  MANAGE CATEGORIES </h2>
                </div>
                <div>
                    <asp:Button ID="CreateBtn" runat="server" Text="Create" CssClass="btn btn-primary" OnClick="CreateBtn_Click" />
                    <br />
                </div>
            </div> 
                 <asp:GridView ID="GridView1" CssClass="ec_categories_table" runat="server" AutoGenerateColumns="False" DataKeyNames="category_id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="detail_rowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                       <AlternatingRowStyle BackColor="White" />
                       <Columns>
                           <asp:BoundField DataField="category_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="category_id" />
                           <asp:BoundField DataField="category_title" HeaderText="Title" SortExpression="category_title" />
                           <asp:BoundField DataField="category_type" HeaderText="Type" SortExpression="category_type" />
                           <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                           <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                           <asp:BoundField DataField="category_updated_date" HeaderText="Last Updated" SortExpression="category_updated_date" />
                           <asp:BoundField DataField="category_end_date" HeaderText="Deadline" SortExpression="category_end_date" />
                           <asp:ButtonField ButtonType="Button" Text="Detail"  ControlStyle-CssClass="btn btn-primary btn-sm" CommandName="detail"/>
                       </Columns>
                       <EditRowStyle BackColor="#2461BF" />
                       <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                       <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                       <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                       <RowStyle BackColor="#EFF3FB" />
                       <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                       <SortedAscendingCellStyle BackColor="#F5F7FB" />
                       <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                       <SortedDescendingCellStyle BackColor="#E9EBEF" />
                       <SortedDescendingHeaderStyle BackColor="#4870BE" />
                   </asp:GridView>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [category_id], [category_title], [category_type], [amount], [status], [category_updated_date], [category_end_date] FROM [tbl_category]"></asp:SqlDataSource>
                      
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
            var table = $('.ec_categories_table').prepend($("<thead></thead>").append($(this).find("tr:first")));
            table.DataTable();
        });
    </script>
</asp:Content>
