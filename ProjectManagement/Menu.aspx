<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="ProjectManagement.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString %>" SelectCommand="SELECT * FROM [projects]"></asp:SqlDataSource>
<!DOCTYPE html>
    <div id="top">
    </div>
<div id="container">
    
    <div id="left">
    </div>
    <div id="right">
        <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" OnDayRender="Calendar1_DayRender" ShowGridLines="True" Width="406px">
            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
            <OtherMonthDayStyle ForeColor="#CC9966" />
            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
            <SelectorStyle BackColor="#FFCC66" />
            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        </asp:Calendar>
        <br />
        <asp:TextBox ID="taskTxt" runat="server" Height="108px" ReadOnly="True" TextMode="MultiLine" Width="400px"></asp:TextBox>
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
        <div id="footer">
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
</asp:Content>
