﻿<%@ Page Title="Setup Costing Table | Maersk" Language="C#" MasterPageFile="~/Master Pages/MainSet.Master" AutoEventWireup="true" CodeBehind="SetupCosting.aspx.cs" Inherits="CloudDDAC.Pages.SetupCosting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Setup Costing Table</title>
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
             <h1><strong>Setup Costing Table </strong> <br />Enter the <br />Table Details.</h1>           
            </div>
            </div>

            <div class="col-md-6 col-sm-6">
                <!-- Red color scheme -->
                <form class="form-horizontal" runat="server">
                <header>Costing Table</header>
                
                <fieldset>
                    <section>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" Height="155px" Width="265px" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="Ship_Type" HeaderText="Ship_Type" SortExpression="Ship_Type" />
                                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                            </Columns>
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" ForeColor="#003399" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                            <SortedDescendingHeaderStyle BackColor="#002876" />
                        </asp:GridView>
					    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Msk2 %>" SelectCommand="SELECT * FROM [CostingTable]" UpdateCommand="Update [CostingTable] set [Ship_Type]=@Ship_Type,[Cost]=@Cost where [id]=@id" DeleteCommand="Delete from [CostingTable] where [id] =@id">
                            <DeleteParameters>
                                <asp:Parameter Name="id" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="ship" />
                                <asp:Parameter Name="cost" />
                                <asp:Parameter Name="id" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Ship Type:</label>
						<label class="input">
							<input type="text" id="ship" runat="server" placeholder="Enter ship type"/>
						</label>
                        <asp:Label ID="lbship" runat="server" Text="ship type is required" Font-Bold="True" ForeColor="Red"></asp:Label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Cost ($):</label>
						<label class="input">
                            <input type="text" id="cost" runat="server" placeholder="Enter the Cost"/>
						</label>
                        <asp:Label ID="lbcost" runat="server" Text="cost is required" Font-Bold="True" ForeColor="Red"></asp:Label>
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
