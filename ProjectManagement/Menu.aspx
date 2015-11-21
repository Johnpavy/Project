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
        <asp:Calendar ID="Calendar1" runat="server" BackColor="#55FFCC" BorderColor="#55CC66" BorderWidth="1px" DayNameFormat="Short" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="300px" ShowGridLines="True" Width="700px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" OnVisibleMonthChanged="Calendar1_VisibleMonthChanged">
            <DayHeaderStyle BackColor="#00CC66" Font-Bold="True" Height="1px" BorderStyle="Solid" Font-Overline="False" Font-Underline="False" ForeColor="Blue" />
            <NextPrevStyle Font-Size="9pt" ForeColor="#AAFFCC" />
            <OtherMonthDayStyle ForeColor="#666666" Font-Strikeout="True" />
            <SelectedDayStyle BackColor="#00CCFF" Font-Bold="True" />
            <SelectorStyle BackColor="#44FFFF" />
            <TitleStyle BackColor="#008888" Font-Bold="True" Font-Size="9pt" ForeColor="#40FFCC" />
            <TodayDayStyle BackColor="#70A0FF" ForeColor="White" />
        </asp:Calendar>
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
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
</asp:Content>
