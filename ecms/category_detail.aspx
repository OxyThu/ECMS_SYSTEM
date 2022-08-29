<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="category_detail.aspx.cs" Inherits="ecms.category_detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .detail-info-container{
            margin-top: 20px;
            margin-left :200px;
            margin-right :200px;
            font-weight: bold;
            padding: 30px;
            background-color : #355FB8;
            border-radius : 30px;
        }
        .info_title{
            margin : 50px 0px 30px 200px;
            padding-left :30px;
        }
        .child_container{
            width: 550px;
        }
        .table_student{
            margin : 30px 40px 40px  30px;
        }
        .container_table {
            display: flex;
            justify-content: center;
            margin-top: 50px;
        }

        .grid_table {
            width: 65%;
        }


    </style>
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
      <h2 class="info_title"> Detail Information for category</h2>
      <div class="detail-info-container">
          <div class="d-flex justify-content-around">
        <div class="mx-1 child_container">
            <div class="row">
                <div class="col-3 text-end">
                    <span class="text-white">ID</span>
                </div>
                <div class="col-8">
                    &nbsp;<asp:Label ID="id" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-3 text-end">
                    <span  class="text-white">Title</span>
                </div>
                <div class="col-8">
                    <asp:Label ID="title" runat="server" Text="Label"></asp:Label>
                    <asp:TextBox ID="titletxt" runat="server" CssClass="d-none"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-3 text-end">
                    <span class="text-white">Type</span>
                </div>
                <div class="col-8">
                    <asp:Label ID="type" runat="server" Text="Label"></asp:Label>
                    <asp:TextBox ID="typetxt" runat="server" CssClass="d-none"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-3 text-end">
                    <span class="text-white">Detail</span>
                </div>
                <div class="col-8">
                    <asp:Label ID="detail" runat="server" Text="Label"></asp:Label>
                    <asp:TextBox ID="detailtxt" runat="server" CssClass="d-none" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            
        </div>      
        <div class="mx-1 child_container">
            <div class="row">
                <div class="col-3 text-end">
                    <span class="text-white">Amount</span>
                </div>
                <div class="col-8">
                    <asp:Label ID="amount" runat="server" Text="Label"></asp:Label>
                    <asp:TextBox ID="amounttxt" runat="server" CssClass="d-none"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-3 text-end">
                    <span class="text-white">Status</span>
                </div>
                <div class="col-8">
                    <asp:Label ID="status" runat="server" Text="Label"></asp:Label>
                    <asp:TextBox ID="statustxt" runat="server" CssClass="d-none"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-3 text-end">
                    <span class="text-white">Last Updated</span>
                </div>
                <div class="col-8">
                    <asp:Label ID="last_updated" runat="server" Text="Label" ></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-3 text-end">
                    <span class="text-white">DeadLine</span>
                </div>
                <div class="col-8">
                    <asp:Label ID="deadline" runat="server" Text="Label"></asp:Label>
                    <asp:TextBox ID="deadlinetxt" runat="server" CssClass="d-none   " TextMode="DateTimeLocal"></asp:TextBox>
                </div>
            </div>      
         
        </div>
        </div> 
           <div class="text-start mt-3 ms-5 ps-5 row">
               <div class="col-6 mt-4">
                      <asp:Button ID="Update_btn" runat="server" Text="Update" CssClass="btn btn-warning mx-2" OnClick="Button2_Click"/>
                        <asp:Button ID="Delete_btn" runat="server" Text="Delete" CssClass="btn btn-danger mx-2" OnClick="Button1_Click" />
                        <asp:Button ID="Update" runat="server" Text="UPDATE"  CssClass="d-none" OnClick="Update_Click" />&nbsp;
                         <asp:Button ID="Cancel" runat="server" Text="CANCEL"  CssClass="d-none" OnClick="Cancel_Click" />&nbsp;
               </div>
               <div class="col-4">
                      <div class="row ms-2">
                            <div class="col-5 bg-white p-2 text-center me-4" style="border-radius:10px; color:black;">
                                  <span class="text-danger">Total Joined</span> <br />
                                 <asp:Label ID="TotalJoined" runat="server" Text="Label" class="text-dark"></asp:Label>
                            </div>
                            <div class="col-5 bg-white p-2 text-center " style="border-radius:10px;  color:black;">
                                 <span class="text-danger">Total Pay</span> <br />
                                <asp:Label ID="TotalPay" runat="server" Text="Label" class="text-dark"></asp:Label>
                            </div>
                     </div>  
               </div>
           </div>
      </div>
      <div class="container_table">
               <div class="grid_table">
            <div class="d-flex justify-content-between">
                <div>
                     <h2 class="text-center text-dark ">  JOINED Person </h2>
                </div>
            </div>
           <asp:GridView ID="GridView1" CssClass="table_student" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="student_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnRowCommand="get_rowCommand">
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
               <Columns>
                   <asp:BoundField DataField="student_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="student_id" />
                   <asp:BoundField DataField="roll_no" HeaderText="Roll No" SortExpression="roll_no" />
                   <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                   <asp:BoundField DataField="phone_no" HeaderText="Phone" SortExpression="phone_no" />
                   <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                   <asp:ButtonField ButtonType="Button" Text="Get" CommandName="get"  ControlStyle-CssClass="btn btn-dark"/>
               </Columns>
               <EditRowStyle BackColor="#999999" />
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
               <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
               <SortedAscendingCellStyle BackColor="#E9E7E2" />
               <SortedAscendingHeaderStyle BackColor="#506C8C" />
               <SortedDescendingCellStyle BackColor="#FFFDF8" />
               <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
           </asp:GridView>
        </div>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [student_id], [roll_no], [name], [phone_no] FROM [tbl_student]"></asp:SqlDataSource>
      </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
     <!-- bootstrap js file-->
    <script src="asset/bootstrap/js/bootstrap.min.js"></script>
    <!-- jquery js file -->
    <script src="asset/datatable/jquery.js"></script>
    <!-- datatable js file -->
    <script src="asset/datatable/datatables.min.js"></script>
    <script>
            $(document).ready(function () {
            var table = $('.table_student').prepend($("<thead></thead>").append($(this).find("tr:first")));
            table.DataTable();
        });
    </script>
</asp:Content>
