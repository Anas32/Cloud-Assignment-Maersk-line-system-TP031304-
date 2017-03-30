<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/Partner.Master" AutoEventWireup="true" CodeBehind="TrackShipmentPart.aspx.cs" Inherits="CloudDDAC.Pages.TrackShipmentPart" %>
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
                <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="3600" ontick="Timer1_Tick"></asp:Timer>
                <fieldset>
                    <section>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PackageID" DataSourceID="SqlDataSource1" Width="299px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                            <Columns>
                                <asp:BoundField DataField="PackageID" HeaderText="PackageID" ReadOnly="True" SortExpression="PackageID" />
                                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                                <asp:BoundField DataField="number" HeaderText="number" SortExpression="number" />
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
					    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Msk2 %>" SelectCommand="SELECT [PackageID], [status], [number] FROM [Shipment]"></asp:SqlDataSource>
					</section>
                </fieldset>
                 </ContentTemplate>
               </asp:UpdatePanel>
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