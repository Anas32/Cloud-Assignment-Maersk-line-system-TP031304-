<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/Partner.Master" AutoEventWireup="true" CodeBehind="Manshipment.aspx.cs" Inherits="CloudDDAC.Pages.Manshipment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Manage Shipment</title>
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
             <h1><strong>Manage Shipment </strong> <br />Enter the <br />Product's Details.</h1>           
            </div>
            </div>

            <div class="col-md-6 col-sm-6">
                <!-- Red color scheme -->
                <form class="form-horizontal" runat="server">
                <header>Make Shipment Form</header>
                <fieldset>
                    <section>
						<label class="label">Package ID:</label>
                        <asp:DropDownList ID="ddl" runat="server" Height="23px" Width="206px" AutoPostBack="True" OnSelectedIndexChanged="ddl_SelectedIndexChanged"></asp:DropDownList>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Email Address:</label>
							<label class="input">
							<input type="text" id="email" runat="server" readonly="readonly" />					
                        </label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Shipment Weight (Kg):</label>
						<label class="input">
							<input type="text" id="wgt" runat="server" readonly="readonly" />					
                          
                        </label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Phone Number:</label>
						<label class="input">
							<input type="text" id="fon" runat="server" readonly="readonly" />
                            </label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Package Value:</label>
						<label class="input">
							<input type="text" id="pval" runat="server" readonly="readonly"/>
                            </label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Shipment Number:</label>
							<label class="input">
							<input type="text" id="num" runat="server" readonly="readonly" />					
                        </label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Price($):</label>
						<label class="input">
							<input type="text" id="price" runat="server" readonly="readonly" />					
                        </label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">User Account Amount($):</label>
						<label class="input">
							<input type="text" id="vvv" runat="server" readonly="readonly" />					
                        </label>
                    </section>
                </fieldset>
                 <fieldset>
                    <section>
						<label class="label">User Account Amount Carried Down($):</label>
						<label class="input">
							<input type="text" id="vv" runat="server" readonly="readonly" />					
                        </label>
                        <asp:Label ID="pcx" runat="server" Text="The user possesses insufficient funds to continue" Font-Bold="True" ForeColor="Red"></asp:Label>
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