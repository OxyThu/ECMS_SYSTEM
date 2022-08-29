<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="create_category.aspx.cs" Inherits="ecms.create_category" %>
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
        <div class="d-flex justify-content-center p-3">
            <div class="w-50 m-3">
            <div class="row  my-2">
                <div class="col-3">
                  
                </div>
                <div class="col-8">
                   <p style="font-family:  Geneva, Verdana, sans-serif; font-size: 2em;"> Create Categroy</p>
                </div>
            </div>
            <div class="row  my-2">
                <div class="col-3">
                    <span class="text-secondary form-label fw-bold">
                        Title       
                         
                          
                    </span>
                </div>
                <div class="col-8">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Title" ControlToValidate="TitleTxt" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="TitleTxt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row  my-2">
                <div class="col-3">
                    <span class="text-secondary form-label fw-bold">
                        Type   </span>
                </div>
                <div class="col-8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Type" Display="Dynamic" ErrorMessage="Please Enter Type" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="Type" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div><div class="row  my-2">
                <div class="col-3">
                    <span class="text-secondary form-label fw-bold">
                        Detail
                    </span>
                </div>
                <div class="col-8">
                    <asp:TextBox ID="DetailTxt" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div><div class="row  my-2">
                <div class="col-3">
                    <span class="text-secondary form-label fw-bold">
                        Amount
                    </span>
                </div>
                <div class="col-8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="AmountTxt" Display="Dynamic" ErrorMessage="Please Enter Amount"  ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="AmountTxt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row  my-2">
                <div class="col-3 ">
                    <span class="text-secondary form-label fw-bold">
                        Status
                    </span>
                </div>
                <div class="col-8  my-2">
                    <asp:TextBox ID="StatusTxt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row  my-2">
                <div class="col-3">
                    <span class="text-secondary form-label fw-bold">
                        End Date
                
                    </span>
                </div>
                <div class="col-8">
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DateTxt" Display="Dynamic" ErrorMessage="Select End Date" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="DateTxt" runat="server" CssClass="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                </div>
            </div>
            <div class="row  my-2">
                <div class="col-3">
                    
                </div>
                <div class="col-8 text-center">
                   <asp:Button ID="SubmitBtn" runat="server" Text="Submit" CssClass="btn btn-primary w-25" OnClick="SubmitBtn_Click"/> &nbsp;               
                  <asp:Button ID="CancelBtn" runat="server" Text="Cancel" CssClass="btn btn-danger w-25" OnClick="CancelBtn_Click"/>            
                </div>
            </div>
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
    
</asp:Content>
