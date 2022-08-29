<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ecms.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel = "icon" href ="asset/img/EC%20Management%20System.png" type = "image/x-icon">
    <title>ECMS SYSTEM</title>
       <!-- bootstrap file -->
    <link href="asset/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- fontawesome -->
    <link href="asset/fontawesome/css/all.css" rel="stylesheet" />  
    <style>
        .body_{
            background-image :url("/asset/img/bg.jpg");
            background-size : cover;
            background-position : center;
            background-repeat : no-repeat;
        }
    </style>
</head>
<body class="body_">
    <form id="form1" runat="server">
        <div class="d-flex justify-content-center" style ="margin-top:100px; border-radius:20px;">
           
        </div>
        <div class="d-flex justify-content-center" style="margin-top:10px;">
                        <div class="w-25 p-3 text-white" style="background-color : #355FB8; border-radius:20px;">
                            <p class="text-center fw-bolder fs-4 text-white bg-dark p-3 " style="border-radius:25px;">EC Management System</p>
                            <hr />
                            <!-- for error message  -->
                            <div class ="text-center m-1 bg-danger text-white" style="border-radius:10px;">
                                <asp:Label ID="errorMessage" runat="server" Text="Label" CssClass="d-none"></asp:Label>
                            </div>
                            <!-- end error message -->

                            <div class="login py-3 px-3">
                                <label class="form_label fw-bold">Email</label>
                                <div class="input-group flex-nowrap">
                                    
                                    <asp:TextBox ID="EmailTxt" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="EmailTxt_TextChanged"></asp:TextBox>
                                </div>
                                <label class="form_label pt-2 fw-bold">Password</label>
                                <div class="input-group flex-nowrap" >
                                   
                                    <asp:TextBox ID="PasswordTxt" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="PasswordTxt_TextChanged" ></asp:TextBox>
                                </div>
                            </div>
            
                          
                            <div class="my-3 px-3">
                                <div class="input-group form-group justify-content-center">
                                    <asp:Button ID="loginBtn" runat="server" Text="Login"  CssClass="btn btn-warning fw-bold w-100" OnClick="loginBtn_Click" ValidationGroup="loginVal" />
                                </div>
                              
                              </div>
                        </div>
        </div>         
    </form>
      <!-- bootstrap js file-->
    <script src="asset/bootstrap/js/bootstrap.min.js"></script>
    <!-- jquery js file -->
    <script src="asset/datatable/jquery.js"></script>
</body>
</html>
