﻿<%@ Page Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProjectManagement.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="menu">
          
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
            <asp:Label ID="EmailLbl" runat="server" Text="EMAIL" style="font-size: 13px" CssClass="auto-style4"></asp:Label>
                    <asp:TextBox ID="EmailTxtBox" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <br />
            <br />
                    <asp:Label ID="PasswordLbl" runat="server" Text="PASSWORD" style="font-size: 13px" CssClass="auto-style4"></asp:Label>
                    <asp:TextBox ID="PasswordTxtBox" runat="server" TextMode="Password"></asp:TextBox>
         <br />
            <br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Label ID="loginLabel" runat="server" Text="Label" Visible="False" CssClass="auto-style4"></asp:Label>
            &nbsp;<asp:Label ID="error1" runat="server" Text="Label" Visible="False" CssClass="auto-style4"></asp:Label>
            &nbsp;<asp:Label ID="error2" runat="server" Text="Label" Visible="False" CssClass="auto-style4"></asp:Label>
            <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="LoginBtn" runat="server" Text="Login" OnClick="LoginBtn_Click" />
&nbsp;&nbsp;<asp:Button ID="SignUpBtn" runat="server" OnClick="SignUpBtn_Click" Text="Sign Up" />
        &nbsp;<br />
            <br />
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
    

            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminLogin.aspx" CssClass="auto-style3">Admin Login</asp:HyperLink>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString %>" SelectCommand="SELECT * FROM [username]">
         </asp:SqlDataSource>
    

        </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
</asp:Content>
