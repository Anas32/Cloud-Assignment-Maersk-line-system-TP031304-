<%@ Page Title="Manage Schedule|Partner" Language="C#" MasterPageFile="~/Master Pages/MainSet.Master" AutoEventWireup="true" CodeBehind="ManageSchedule.aspx.cs" Inherits="CloudDDAC.Pages.CreateSchedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Manage Schedule</title>
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
             <h1><strong>Manage Schedule </strong> <br />Enter the <br />Schedule Details.</h1>           
            </div>
            </div>

            <div class="col-md-6 col-sm-6">
                <!-- Red color scheme -->
                <form class="form-horizontal" runat="server">
                <header>Schedule</header>
                
                <fieldset>
                    <section>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" Height="210px" Width="257px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                            <Columns>
                                <asp:BoundField DataField="shipid" HeaderText="shipid" SortExpression="shipid" />
                                <asp:BoundField DataField="Arrival_point" HeaderText="Arrival_point" SortExpression="Arrival_point" />
                                <asp:BoundField DataField="Departure_point" HeaderText="Departure_point" SortExpression="Departure_point" />
                                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
<asp:BoundField DataField="tripname" HeaderText="tripname" SortExpression="tripname"></asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                            <SortedDescendingHeaderStyle BackColor="#7E0000" />
                        </asp:GridView>
					    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Msk2 %>" SelectCommand="SELECT [shipid], [Arrival_point], [Departure_point], [id],[tripname] FROM [Schedule]" UpdateCommand="Update [Schedule] set [shipid]=@shipid, [Arrival_point]=@Arrival_point, [Departure_point]=@Departure_point,[tripname]=@tripname where [id]=@id">
                            <UpdateParameters>
                                <asp:Parameter Name="shipid" />
                                <asp:Parameter Name="Arrival_point" />
                                <asp:Parameter Name="Departure_point" />
                                <asp:Parameter Name="tripname" />
                                <asp:Parameter Name="id" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Ship ID:</label>
						<label class="input">
                            <asp:DropDownList ID="shippid" runat="server"></asp:DropDownList>
						</label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Trip Name:</label>
							<label class="input">
							<input type="text" id="loc" runat="server" />					
                        </label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Departure Point:</label>
						<label class="input">
                            <asp:DropDownList ID="dp" runat="server">
                                <asp:ListItem>Johor_Sandan_Port</asp:ListItem>
                                <asp:ListItem>Kuala_Lumpur_Klang_Port</asp:ListItem>
                                <asp:ListItem>Terrenganu_Tebaway_Port</asp:ListItem>
                            </asp:DropDownList>
						</label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Arrival Point:</label>
						<label class="input">
                            <asp:DropDownList ID="arrP" runat="server">
                                <asp:ListItem>Thailand_Krabby_Port</asp:ListItem> 
                                <asp:ListItem>Philipines_Manila_Port</asp:ListItem>
                                <asp:ListItem>Brunei_Darussalam_Port</asp:ListItem>
                            </asp:DropDownList>
                            </label>
                        <asp:Label ID="lp" runat="server" Text="This ID has already a set destination. Please Edit" Font-Bold="True" ForeColor="Red"></asp:Label>
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
