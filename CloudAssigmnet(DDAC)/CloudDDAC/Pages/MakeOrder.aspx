<%@ Page Title="Make Order | Customer" Language="C#" MasterPageFile="~/Master Pages/Customer.Master" AutoEventWireup="true" CodeBehind="MakeOrder.aspx.cs" Inherits="CloudDDAC.Pages.MakeOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Make Order</title>
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
             <h1><strong>Make Product Order </strong> <br />Enter the <br />Product's Details.</h1>           
            </div>
            </div>

            <div class="col-md-6 col-sm-6">
                <!-- Red color scheme -->
                <form class="form-horizontal" runat="server">
                <header>Make Order Form</header>
                <fieldset>
                    <section>
						<label class="label">Package ID:</label>
						<label class="input">
							<input type="text" id="idx" runat="server"/>					
                        </label>
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
							<input type="text" id="wgt" runat="server" placeholder="Enter the Weight in KG"  />					
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="wgt"
                                      ErrorMessage="The weight field is required." ForeColor="#FF3300" Font-Bold="True" />
                            <asp:Label ID="err" runat="server" Text="Value must be numeric" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Phone Number:</label>
						<label class="input">
							<input type="text" id="fon" runat="server" placeholder="Enter the Phone number"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="fon"
                                      ErrorMessage="The phone field is required." ForeColor="#FF3300" Font-Bold="True" />
                        </label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Package Value:</label>
						<label class="input">
							<input type="text" id="pval" runat="server" placeholder="Enter the value"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="pval"
                                      ErrorMessage="The package value field is required." ForeColor="#FF3300" Font-Bold="True" />
                        </label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Destination:</label>
						<label class="input">
                            <asp:DropDownList ID="route" runat="server" DataSourceID="SqlDataSource1" DataTextField="tripname" DataValueField="tripname" Height="16px" Width="316px">
                                <asp:ListItem></asp:ListItem>

                            </asp:DropDownList>
                            
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Msk2 %>" SelectCommand="SELECT [tripname] FROM [Schedule]"></asp:SqlDataSource>
                            
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
