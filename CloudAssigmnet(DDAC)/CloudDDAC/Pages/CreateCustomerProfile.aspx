<%@ Page Title="Create New Customer | Partner" Language="C#" MasterPageFile="~/Master Pages/Partner.Master" AutoEventWireup="true" CodeBehind="CreateCustomerProfile.aspx.cs" Inherits="CloudDDAC.Pages.CreateCustomerProfile" %>
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
             <h1><strong>Create Customer Profile </strong> <br />Enter the <br />Customer's Details.</h1>           
            </div>
            </div>

            <div class="col-md-6 col-sm-6">
                <!-- Red color scheme -->
                <form class="form-horizontal" runat="server">
                <header>Customer'Profile Form</header>

                    <fieldset>
                    <section>
						<label class="label">First Name:</label>
						<label class="input">
							<input type="text" id="fname" runat="server" placeholder="Enter First Name"/>
						        <asp:RequiredFieldValidator runat="server" ControlToValidate="fname"
                                      ErrorMessage="The first name field is required." ForeColor="#d400ff" Font-Bold="True" />						
                        </label>
					</section>
                </fieldset>
            <fieldset>
                    <section>
						<label class="label">Last Name:</label>
						<label class="input">
							<input type="text" id="lname" runat="server" placeholder="Enter Last Name"/>
						        <asp:RequiredFieldValidator runat="server" ControlToValidate="lname"
                                      ErrorMessage="The last name field is required." ForeColor="#d400ff" Font-Bold="True" />						
						
                        </label>
					</section>
                </fieldset>
                    <fieldset>
                    <section>
						<label class="label">Gender:</label>
						     <asp:DropDownList ID="dropGender" runat="server" Width="143px" Height="36px" Font-Bold="True" ForeColor="#8b7491" Font-Size="Small">
                            <asp:ListItem Selected="True">Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
					</section>
                </fieldset>
                     <fieldset>
                    <section>
						<label class="label">Phone Number:</label>
						<label class="input">
                            <input type="text" id="phone" runat="server" placeholder="Enter Phone Number (Length 10 Numeric)"/>
						        <asp:RequiredFieldValidator runat="server" ControlToValidate="phone"
                                      ErrorMessage="The phone number field is required." ForeColor="#d400ff" Font-Bold="True" />
                        </label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Email:</label>
						<label class="input">
                            <asp:Label ID="vali" runat="server" Text="Email Address Lacks Proper Formatting. Format eg: XXXXX@gmail.com or Is not Authentic" ForeColor="Red"></asp:Label>
                            <input type="text" id="Email" runat="server" placeholder="Enter Email Address" />
                            <asp:Label ID="melchk" runat="server" Text="Email Address Already Used" ForeColor="Red"></asp:Label>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                      ErrorMessage="The email field is required." ForeColor="#d400ff" Font-Bold="True" />
						</label>
					</section>
                </fieldset>

                <fieldset>
                    <section>
						<label class="label">Password:</label>
						<label class="input">
							<input type="password" id="Password" runat="server" placeholder="Enter Password (Minimum 7 Characters)" />   
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                      ErrorMessage="The password field is required." ForeColor="#d400ff" Font-Bold="True" />
                        </label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Confirm Password:</label>
						<label class="input">
							<input type="password" id="ConfirmPassword" runat="server" placeholder="Enter Matching Password (Minimum 7 Characters)"/>
						        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                     Display="Dynamic" ErrorMessage="The confirm password field is required." Font-Bold="True" ForeColor="#FF3300" />
                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                     Display="Dynamic" ErrorMessage="The password and confirmation password do not match." Font-Bold="True" ForeColor="#d400ff" />
                        </label>
					</section>
                </fieldset>
                 
                 
                <fieldset>
                    <section>
						<label class="label">Address</label>
						<label class="input">
							<input type="text" id="address" runat="server" placeholder="Enter Address"/>
						        <asp:RequiredFieldValidator runat="server" ControlToValidate="address"
                                      ErrorMessage="The address field is required." ForeColor="#d400ff" Font-Bold="True" />						
						</label>
					</section>
                </fieldset>
                
                  
            
                <fieldset>
                    <section>
                            <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="Upanel" runat="server">
                                        <ContentTemplate>
                                             <div class="form-group">
                                                      <label class="label">Date of Birth:</label>
                                              <div class="col-md-10">
                                                   <asp:DropDownList ID="dropYear" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dropYear_SelectedIndexChanged1" >
                                                    </asp:DropDownList>
                                                   <asp:DropDownList ID="dropMonth" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dropMonth_SelectedIndexChanged1" >
                                                    </asp:DropDownList>
                                                    <br />
                                                    <asp:TextBox ID="txtDate" runat="server" Width="317px" Height="37px" Enabled="false" BackColor="#ff99d6" Font-Bold="True" ForeColor="#b2a0b2"></asp:TextBox>
                                                    <br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtDate" Display="Dynamic" ErrorMessage="The Date of Birth is Required." Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                    <br />
                                                    <asp:Calendar ID="Calendar1" runat="server" BackColor="#234435" BorderColor="#b2a0b2" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" Width="264px"  ShowGridLines="True" OnSelectionChanged="Calendar1_SelectionChanged" >
                                                        <DayHeaderStyle BackColor="#FFCC66" Height="1px" Font-Bold="True" />
                                                        <NextPrevStyle Font-Size="9pt" ForeColor="#234435" />
                                                        <OtherMonthDayStyle ForeColor="#CC9966" />
                                                        <SelectedDayStyle BackColor="#234435" Font-Bold="True" />
                                                        <SelectorStyle BackColor="#b2a0b2" />
                                                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#234435" />
                                                        <TodayDayStyle BackColor="#b2a0b2" ForeColor="White" />
                                                    </asp:Calendar>
                                            </div>
                                       </div>
                                       </ContentTemplate>
                            </asp:UpdatePanel>
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
