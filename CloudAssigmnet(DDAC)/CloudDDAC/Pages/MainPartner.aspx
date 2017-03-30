<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPartner.aspx.cs" Inherits="CloudDDAC.Pages.MainPartner" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
    <title>Main Menu</title>
    <!-- ============ Google fonts ============ -->
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <!-- ============ Add custom CSS here ============ -->
    <link href="../Styles/CSS/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSS/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSS/style2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand">Agent Main Menu</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="Logout.aspx"><span class="glyphicon glyphicon-off" style="font-size:18px;color:white"></span>Logout</a> </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <br />
            <br />
            <br />
            <br />
            <div id="banner">
                <h1>
                    Welcome<strong> Agent </strong></h1>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                        <legend><i class="glyphicon glyphicon-th-list"></i>Partner Functions </legend>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                 <asp:Button ID="btnA" runat="server" CssClass="btn btn-primary" Text="Create Customer'Profile" Font-Bold="True" Font-Size="Large" Width="280px" OnClick="btnA_Click" />                              
                                 <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Update Customer'Profile" Font-Bold="True" Font-Size="Large" Width="280px" OnClick="Button1_Click" />
                                <asp:Button ID="btnB" runat="server" CssClass="btn btn-primary" Text="Remove Customer'Profile" Font-Bold="True" Font-Size="Large" Width="280px" OnClick="btnB_Click" />                              
                                <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-primary" Text="Manage The Shipment" Font-Bold="True" Font-Size="Large" Width="280px" OnClick="btnCancel_Click" />                              

                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>

    <script src="../Styles/js/jquery.js" type="text/javascript"></script>
    <script src="../Styles/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Styles/js/jquery.backstretch.js" type="text/javascript"></script>
    <script type="text/javascript">
        'use strict';
        /* ========================== */
        /* ::::::: Backstrech ::::::: */
        /* ========================== */
        // You may also attach Backstretch to a block-level element
        $.backstretch(
        [
           /* "../../Images/44.jpg",
            "../../Images/colorful.jpg",
            "../../Images/34.jpg",
            "../../Images/images.jpg"
            */
  
  "../Images/aggent3.jpg",
  "../Images/agent1.jpg",
  "../Images/agent22.jpg",
 
        ],

        {
            duration: 4500,
            fade: 1500
        }
    );
    </script>
    </form>
</body>
</html>