<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="ProjectManagement.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString %>" SelectCommand="SELECT * FROM [projects]"></asp:SqlDataSource>
<!DOCTYPE html>
<div id="container">
    <div id="top">
        <asp:Label ID="greeting" runat="server" Text="Welcome"></asp:Label>
    </div>
   <div id="left">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/dashboard.aspx">DASHBOARD</asp:HyperLink>

        <p>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/projects.aspx">PROJECTS</asp:HyperLink>
        </p>
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/milestones.aspx">MILESTONES</asp:HyperLink>
        <p>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/tasks.aspx">TASKS</asp:HyperLink>
        </p>
        <div id ="calendar">


        </div>
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/AdminLogin.aspx">ADMIN</asp:HyperLink>
    </div>
    <div id="right">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="projectid" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                <asp:BoundField DataField="startdate" HeaderText="startdate" SortExpression="startdate" />
                <asp:BoundField DataField="duedate" HeaderText="duedate" SortExpression="duedate" />
            </Columns>
        </asp:GridView>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
</asp:Content>
