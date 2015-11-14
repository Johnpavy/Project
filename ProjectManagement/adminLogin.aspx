<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="ProjectManagement.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="AdminUserName" runat="server" style="text-align: center"></asp:TextBox>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Admin User Name<br />
    <asp:TextBox ID="AdminPassword" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
    <div style="margin-left: 120px">
        Password<br />
        <br />
    </div>
    <br />
    <br />
</asp:Content>
