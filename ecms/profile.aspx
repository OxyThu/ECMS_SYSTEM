    <%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="ecms.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- custom css file-->
    <link href="asset/css/profile.css" rel="stylesheet" />
     <!-- datatable css file -->
    <link href="asset/datatable/datatables.min.css" rel="stylesheet" />
    <!-- bootstrap file -->
    <link href="asset/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- fontawesome -->
    <link href="asset/fontawesome/css/all.css" rel="stylesheet" />   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row d-flex justify-content-center my-4">
        <div class="col-4">
             <asp:Image ID="defaultImg" runat="server" ImageUrl="~/asset/img/profile.jpg" CssClass="profileImg d-none" />
            <asp:Image ID="profileImg" runat="server" ImageUrl="~/asset/img/profile.png" CssClass="profileImg" />
        </div>
        <div class="profile-info-container col-6  p-5">
            <div class="row">
                <div class="col-4">
                   <span>Roll No</span>
                </div>
                <div class="col-6">
                    <asp:Label ID="RollNo" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-4">
                   <span>Name</span>
                </div>
                <div class="col-6">
                    <asp:Label ID="Name" runat="server" Text="Label"></asp:Label>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTxt" Display="Dynamic" ErrorMessage="Please Enter Name" ForeColor="#CC0000" ValidationGroup="vali"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="NameTxt" runat="server" CssClass="d-none"></asp:TextBox>
                </div>
            </div>
             <div class="row">
                <div class="col-4">
                    <asp:Label ID="profileLabel" runat="server" Text="Label" CssClass="d-none">Profile</asp:Label>
                </div>
                <div class="col-6">
                  <asp:FileUpload ID="FileUpload1" runat="server"  CssClass="form-control w-50 d-none"/>
                </div>
            </div>
            <div class="row">
                <div class="col-4">
                   <span>Major</span>
                </div>
                <div class="col-6">
                    <asp:Label ID="Major" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-4">
                   <span>Year</span>
                </div>
                <div class="col-6">
                    <asp:Label ID="Year" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-4">
                   <span>Class</span>
                </div>
                <div class="col-6">
                    <asp:Label ID="Class" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-4">
                   <span>Phone No</span>
                </div>
                <div class="col-6">
                    <asp:Label ID="Phone" runat="server" Text="Label"></asp:Label>
                       <asp:TextBox ID="PhoneTxt" runat="server" CssClass="d-none"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-4">
                   <span>Email</span>
                  
                </div>
                <div class="col-6">
                    <asp:Label ID="Email" runat="server" Text="Label"></asp:Label>
                    
                     
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EmailTxt" Display="Dynamic" ErrorMessage="Incorrect format" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                      <asp:TextBox ID="EmailTxt" runat="server" CssClass="d-none"></asp:TextBox>
                    <div class="bg-danger mt-1" style="border-radius:10px; width:200px">
                         <asp:Label ID="error_email" runat="server" Text="Label" CssClass="d-none"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-4">
                   
                </div>
                <div class="col-6">
                    <asp:Button ID="Open_Form" runat="server" Text="UPDATE" CssClass="btn btn-primary" OnClick="Open_Form_Click"/>&nbsp;
                    <asp:Button ID="Update" runat="server" Text="UPDATE"  CssClass="d-none" OnClick="Update_Click" ValidationGroup="vali"/>&nbsp;
                    <asp:Button ID="Cancel" runat="server" Text="CANCEL"  CssClass="d-none" OnClick="Cancel_Click"/>&nbsp;
                    <asp:Button ID="Logout" runat="server" Text="LOGOUT" CssClass="btn btn-danger" OnClick="Logout_Click"/>       
                </div>
            </div>
        </div>
    </div>
     <div class="container_table row justify-content-center">
               <div class="grid_table col-10">
             <h2 class="my-3"> JOINED CATEGORIES </h2>
               <asp:GridView ID="GridView1" CssClass="table_joined" runat="server" AutoGenerateColumns="False" DataKeyNames="category_id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="rowCommand">
                   <AlternatingRowStyle BackColor="#CCCCCC" />
                   <Columns>
                       <asp:BoundField DataField="category_id" HeaderText="category_id" InsertVisible="False" ReadOnly="True" SortExpression="category_id" />
                       <asp:BoundField DataField="category_title" HeaderText="category_title" SortExpression="category_title" />
                       <asp:BoundField DataField="category_type" HeaderText="category_type" SortExpression="category_type" />
                       <asp:BoundField DataField="amount" HeaderText="amount" SortExpression="amount" />
                       <asp:BoundField HeaderText="status" DataField="status" SortExpression="status" />
                       <asp:BoundField DataField="category_end_date" HeaderText="category_end_date" SortExpression="category_end_date" />
                       <asp:ButtonField ButtonType="Button" Text="UNJOIN" CommandName="unjoin" ControlStyle-CssClass="btn btn-danger btn-sm"/>
                   </Columns>
                   <FooterStyle BackColor="#CCCCCC" />
                   <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                   <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                   <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                   <SortedAscendingCellStyle BackColor="#F1F1F1" />
                   <SortedAscendingHeaderStyle BackColor="#808080" />
                   <SortedDescendingCellStyle BackColor="#CAC9C9" />
                   <SortedDescendingHeaderStyle BackColor="#383838" />
               </asp:GridView>
         <br />
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
            var table = $('.table_joined').prepend($("<thead></thead>").append($(this).find("tr:first")));
            table.DataTable();
        });
    </script>
</asp:Content>
