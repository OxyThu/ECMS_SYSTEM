<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="update_category.aspx.cs" Inherits="ecms.update_category" %>
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
                <div class="col-8 row">
                         <p class="col-7" style="font-family:  Geneva, Verdana, sans-serif; font-size: 2em;"> Update Categroy 
                             
                         </p>
                        <div class="col-5 text-end">
                            <asp:Button ID="open_btn" runat="server" Text="Open" CssClass="btn btn-warning w-75" OnClick="open_form_Click" />
                        </div>
                 </div>
            </div>
            <div class="row  my-2">
                <div class="col-3">
                    <span class="text-secondary form-label fw-bold">
                        Title          
                    </span>
                </div>
                <div class="col-8">
                    <asp:TextBox ID="TitleTxt" runat="server" CssClass="form-control d-none"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TitleTxt" Display="Dynamic" ErrorMessage="Please Enter Title" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Label ID="TitleLabel" runat="server" Text="Label" CssClass="form-control"></asp:Label>
                </div>
            </div>
            <div class="row  my-2">
                <div class="col-3">
                    <span class="text-secondary form-label fw-bold">
                        Type
                    </span>
                </div>
                <div class="col-8">
                     <asp:TextBox ID="Type" runat="server" CssClass="form-control  d-none"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Type" Display="Dynamic" ErrorMessage="Please Enter Type" ForeColor="Red"></asp:RequiredFieldValidator>
                     <asp:Label ID="TypeLabel" runat="server" Text="Label" CssClass="form-control"></asp:Label>
                </div>
            </div><div class="row  my-2">
                <div class="col-3">
                    <span class="text-secondary form-label fw-bold">
                        Detail
                    </span>
                </div>
                <div class="col-8">
                     <asp:TextBox ID="DetailTxt" runat="server" CssClass="form-control  d-none" TextMode="MultiLine"></asp:TextBox>
                    
                     <asp:Label ID="DetailLabel" runat="server" Text="Label" CssClass="form-control"></asp:Label>
                    
                </div>
            </div><div class="row  my-2">
                <div class="col-3">
                    <span class="text-secondary form-label fw-bold">
                        Amount
                    </span>
                </div>
                <div class="col-8">
                    <asp:TextBox ID="AmountTxt" runat="server" CssClass="form-control  d-none"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="AmountTxt" Display="Dynamic" ErrorMessage="Please Enter Amount" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Label ID="AmountLabel" runat="server" Text="Label" CssClass="form-control"></asp:Label>
                </div>
            </div>
            <div class="row  my-2">
                <div class="col-3 ">
                    <span class="text-secondary form-label fw-bold">
                        Status
                    </span>
                </div>
                <div class="col-8  my-2">
                    <asp:TextBox ID="StatusTxt" runat="server" CssClass="form-control  d-none"></asp:TextBox>
                    <asp:Label ID="StatusLabel" runat="server" Text="Label" CssClass="form-control"></asp:Label>
                </div>
            </div>
            <div class="row  my-2">
                <div class="col-3">
                    <span class="text-secondary form-label fw-bold">
                        End Date
                    </span>
                </div>
                <div class="col-8">
                    <asp:TextBox ID="DateTxt" runat="server" CssClass="form-control  d-none" TextMode="DateTimeLocal" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DateTxt" Display="Dynamic" ErrorMessage="Please Select End Date" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Label ID="DateLabel" runat="server" Text="Label" CssClass="form-control"></asp:Label>
                </div>
            </div>
            <div class="row  my-4">
                <div class="col-3">
                    
                </div>
                <div class="col-8 text-start">
                   <asp:Button ID="UpdateBtn" runat="server" Text="Edit" CssClass="btn btn-primary w-25" OnClick="UpdateBtn_Click" CommandName="update"  /> &nbsp;               
                  <asp:Button ID="CancelBtn" runat="server" Text="Cancel" CssClass="btn btn-danger w-25" OnClick="CancelBtn_Click" CommandName="cancel"/> &nbsp;         
                    <asp:Button ID="BackBtn" runat="server" Text="Back" CssClass="btn btn-dark w-25" OnClick="BackBtn_Click"/> &nbsp; 
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
