<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="ProjectManagement.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="AdminUserName" runat="server" style="text-align: center"></asp:TextBox>
    <br />
&nbsp;&nbsp; Admin User Name<br />
    <asp:TextBox ID="AdminPassword" runat="server" TextMode ="Password"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
    <div style="width: 71px; margin-left: 33px">
        Password<br />
        <asp:Button ID="AdminLoginButton" runat="server" OnClick="AdminLoginButton_Click" Text="Login" />
        <br />
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString %>" SelectCommand="SELECT * FROM [username]"></asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
