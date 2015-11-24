<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="projects.aspx.cs" Inherits="ProjectManagement.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString5 %>" SelectCommand="SELECT * FROM [projects]"></asp:SqlDataSource>

        <div id="top">
    </div>
    
    <div id="left">
    </div>
    <div id="right">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="projectid" DataSourceID="SqlDataSource1">
    <ItemTemplate>
        projectname:
        <asp:Label ID="projectnameLabel" runat="server" Text='<%# Eval("projectname") %>' />
        <br />
        projectid:
        <asp:Label ID="projectidLabel" runat="server" Text='<%# Eval("projectid") %>' />
        <br />
        description:
        <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
        <br />
        startdate:
        <asp:Label ID="startdateLabel" runat="server" Text='<%# Eval("startdate") %>' />
        <br />
        duedate:
        <asp:Label ID="duedateLabel" runat="server" Text='<%# Eval("duedate") %>' />
        <br />
        userid:
        <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' />
        <br />
<br />
    </ItemTemplate>
</asp:DataList>
        </div>
        <div id="footer">
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="projectid" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                <asp:BoundField DataField="startdate" HeaderText="startdate" SortExpression="startdate" />
                <asp:BoundField DataField="duedate" HeaderText="duedate" SortExpression="duedate" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
