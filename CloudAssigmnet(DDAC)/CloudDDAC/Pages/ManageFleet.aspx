﻿<%@ Page Title="Manage Fleet | Administrator" Language="C#" MasterPageFile="~/Master Pages/MainSet.Master" AutoEventWireup="true" CodeBehind="ManageFleet.aspx.cs" Inherits="CloudDDAC.Pages.ManageFleet" %>
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
             <h1><strong>Manage Fleet Table </strong> <br />Enter the <br />Table Details.</h1>           
            </div>
            </div>
            <div class="col-md-6 col-sm-6">
                <!-- Red color scheme -->
                <form class="form-horizontal" runat="server">
                <header>Fleet Details</header>
                <fieldset>
                    <section>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" Height="232px" Width="201px" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                <asp:BoundField DataField="registration_num" HeaderText="registration_num" SortExpression="registration_num" />
                                <asp:BoundField DataField="maximum_capacity" HeaderText="maximum_capacity" SortExpression="maximum_capacity" />
                                <asp:BoundField DataField="typ" HeaderText="typ" SortExpression="typ" />
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
					    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Msk2 %>" SelectCommand="SELECT * FROM [Fleet]" UpdateCommand="Update [Fleet] set [name]=@name,[registration_num]=@registration_num,[maximum_capacity]=@maximum_capacity,typ=@typ where [id]=@id" DeleteCommand="Delete from [Fleet] where [id]=@id">
                            <DeleteParameters>
                                <asp:Parameter Name="id" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="name" />
                                <asp:Parameter Name="registration_num" />
                                <asp:Parameter Name="maximum_capacity" />
                                <asp:Parameter Name="typ" />
                                <asp:Parameter Name="id" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Name:</label>
						<label class="input">
							<input type="text" id="name" runat="server" placeholder="Enter ship name"/>
						</label>
                        <asp:Label ID="nmlb" runat="server" Text="ship name is required" Font-Bold="True" ForeColor="Red"></asp:Label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Registration Number:</label>
						<label class="input">
                            <input type="text" id="register" runat="server" placeholder="Enter the registration number"/>
						</label>
                        <asp:Label ID="numlb" runat="server" Text="registration number is required" Font-Bold="True" ForeColor="Red"></asp:Label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Maximum Capacity:</label>
						<label class="input">
							<input type="text" id="max" runat="server" placeholder="Enter maximum capacity"/>
						</label>
                        <asp:Label ID="mxlb" runat="server" Text="maximum capacity is required" Font-Bold="True" ForeColor="Red"></asp:Label>
					</section>
                </fieldset>
                <fieldset>
                    <section>
						<label class="label">Type:</label>
						<label class="input">
                            <asp:DropDownList ID="tyyp" runat="server" DataSourceID="SqlDataSource3" DataTextField="Ship_Type" DataValueField="Ship_Type"></asp:DropDownList>	
						<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Msk2 %>" SelectCommand="SELECT [Ship_Type] FROM [CostingTable]"></asp:SqlDataSource>
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