<%@ Page Title="Deactivate Customer| Partner" Language="C#" MasterPageFile="~/Master Pages/Partner.Master" AutoEventWireup="true" CodeBehind="DeActivateCustomerProfile.aspx.cs" Inherits="CloudDDAC.Pages.DeActivateCustomerProfile" %>
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
             <h1><strong>Delete Customer Profile </strong> <br />Select the <br />Customer's Details.</h1>           
            </div>
            </div>

            <div class="col-md-6 col-sm-6">
                <!-- Red color scheme -->
                <form class="form-horizontal" runat="server">
                <header>Delete Profile Form</header>
                <fieldset>
                    <section>
						<label class="label">Email Address</label>
						<label class="input">
							<asp:DropDownList ID="Email" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="#660066" Height="27px" Width="306px" AutoPostBack="True" OnSelectedIndexChanged="Name_SelectedIndexChanged">
                                    <asp:ListItem Selected="True">--Email--</asp:ListItem>
                                    <asp:ListItem>Email Loaded from DB</asp:ListItem>
                         </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                      ErrorMessage="The email field is required." ForeColor="#FF3300" Font-Bold="True" />
						</label>
					</section>
                </fieldset>


                <fieldset>
                    <section>
						<label class="label">Status:</label>
						<label class="input">
							<input type="text" id="stat" runat="server" readonly="readonly" />					
                        </label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Shipment:</label>
						<label class="input">
							<input type="text" id="ship" runat="server" readonly="readonly"/>
                        </label>
					</section>
                </fieldset>
                <footer>
                    <asp:Button ID="submit" runat="server" Text="Submit" BackColor="#000066" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="49px" Width="189px" OnClick="submit_Click" />
                    <asp:Label ID="save" runat="server" Text="Saved Successfully!" Font-Bold="True" Font-Size="Medium" ForeColor="#009933"></asp:Label>
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
