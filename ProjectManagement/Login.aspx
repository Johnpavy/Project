<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProjectManagement.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <div style="text-align: center">
    
        <asp:TextBox ID="EmailTxtBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="EmailLbl" runat="server" Text="Email"></asp:Label>
        <br />
        <asp:TextBox ID="PasswordTxtBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="PasswordLbl" runat="server" Text="Password"></asp:Label>
        <br />
        <asp:Button ID="LoginBtn" runat="server" Text="Login" OnClick="LoginBtn_Click" />
&nbsp;&nbsp;
        <asp:Button ID="SignUpBtn" runat="server" OnClick="SignUpBtn_Click" Text="Sign Up" />
        <br />
        <asp:TextBox ID="NewEmailTxtBox" runat="server" Visible="False"></asp:TextBox>
        <br />
        <asp:Label ID="SignupEmailLbl" runat="server" Text="Email" Visible="False"></asp:Label>
        <br />
        <asp:TextBox ID="FNameTxtBox" runat="server" Visible="False"></asp:TextBox>
        <br />
        <asp:Label ID="FNameLbl" runat="server" Text="First Name"></asp:Label>
        <br />
        <asp:TextBox ID="LNameTxtbox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="LastNameLbl" runat="server" Text="Last Name" Visible="False"></asp:Label>
        <br />
        <asp:TextBox ID="NewPassTxtBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="NewPasswordLbl" runat="server" Text="Password" Visible="False"></asp:Label>
        <br />
        <asp:TextBox ID="ConfirmPassTxtBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="ConfirmPWLbl" runat="server" Text="Confirm Password"></asp:Label>
        <br />
        <asp:Button ID="RegisterBtn" runat="server" Text="Register" OnClick="RegisterBtn_Click" />
        <br />
        <asp:Label ID="error1" runat="server" Text="Label" Visible="False"></asp:Label>
        <br />
        <asp:Label ID="error2" runat="server" Text="Label" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString %>" SelectCommand="SELECT * FROM [attachment]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
