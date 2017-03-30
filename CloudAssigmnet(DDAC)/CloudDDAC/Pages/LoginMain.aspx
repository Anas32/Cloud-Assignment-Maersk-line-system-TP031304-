<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginMain.aspx.cs" Inherits="CloudDDAC.Pages.LoginMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="../Styles/CSS/style.css" />
    <link rel="stylesheet" type="text/css" href="../Styles/CSS/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="../Styles/CSS/font-awesome.min.css" />
</head>
<body>
    <div class="container">
        
     

       <!-- <img src="../Images/worker.PNG" /> -->
     <img src="../Images/loginpic.png" /> 
        
         

        <form id="form1" runat="server">
            <div class="vald">
                <asp:Label ID="checklbl" runat="server" Text="Warning! Username or Password is Incorrect" BackColor="#CCCCFF" Font-Bold="True" ForeColor="#006649"></asp:Label>
                <br />
            </div>
            <div class="form-input">
                <input type="text" runat="server" id="usr" placeholder="Enter Your Email Address" />
            </div>
            <div class="vald">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="The Email is Required!" ForeColor="#006649" ControlToValidate="usr" Font-Bold="True" Font-Size="Medium" BackColor="#CCCCFF"></asp:RequiredFieldValidator>
            </div>
            <br />
            <div class="form-input">
                <input type="password" runat="server" id="pass" placeholder="Enter Your Password" />
            </div>
            <div class="vald">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="The Password is Required!" ForeColor="#006649" ControlToValidate="pass" Font-Bold="True" Font-Size="Medium" BackColor="#CCCCFF"></asp:RequiredFieldValidator>
            </div>
            <div class="loginButton">
                <br />
                <asp:Button ID="login" runat="server" Text="Submit" BackColor="#006649" Font-Bold="True" Font-Size="Large" ForeColor="White" Width="186px" Height="47px" OnClick="login_Click" />
            </div>
            &nbsp;
        </form>
        <div id="fgt">
        </div>
    </div>
</body>
</html>

