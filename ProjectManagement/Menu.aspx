<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="ProjectManagement.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString %>" SelectCommand="SELECT * FROM [projects]"></asp:SqlDataSource>
<!DOCTYPE html>
<div id="container">
    <div id="top">
        <asp:Label ID="greeting" runat="server" Text="Welcome"></asp:Label>
    </div>
  
    <div id="right">
        <br />
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        <br />
        <br />
        <br />
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
