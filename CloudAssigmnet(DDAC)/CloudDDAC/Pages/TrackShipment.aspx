<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/Customer.Master" AutoEventWireup="true" CodeBehind="TrackShipment.aspx.cs" Inherits="CloudDDAC.Pages.TrackShipment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Create New Customer</title>
    <!-- ============ Google fonts ============ -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <!-- ============ Add CSS here ============ -->
    <link href="../Styles/CSS/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSS/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSS/sheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="container">
        <div class="row">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <div class="col-md-6 col-sm-6 text-center">
            <div id="banner">
             <h1><strong>Track Shipment </strong> <br />View the <br />Customer's Details.</h1>           
            </div>
            </div>

            <div class="col-md-6 col-sm-6">
                <!-- Red color scheme -->
                <form class="form-horizontal" runat="server">
                <header>Track Shipment Form</header>
                <fieldset>
                    <section>
						<label class="label">Package ID:</label>
						<label class="input">
							<asp:DropDownList ID="piD" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="#660066" Height="27px" Width="306px" AutoPostBack="True" OnSelectedIndexChanged="piD_SelectedIndexChanged">
                         </asp:DropDownList>
						</label>
					</section>
                </fieldset>


                <fieldset>
                    <section>
						<label class="label">Shipment Status:</label>
						<label class="input">
							<input type="text" id="stat" runat="server" readonly="readonly" />					
                        </label>
					</section>
                </fieldset>
                <footer>
                </footer>
                </form>
                <!--/ Red color scheme -->
            </div>
        </div>
    </div>
    <script src="../Styles/js/jquery.js" type="text/javascript"></script>
    <script src="../Styles/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Styles/js/html5shiv.js" type="text/javascript"></script>
</body>
</html>
</asp:Content>
