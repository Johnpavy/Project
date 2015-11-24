<%@ Page Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="ProjectManagement.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString %>" SelectCommand="SELECT * FROM [projects]"></asp:SqlDataSource>
<!DOCTYPE html>
    <div id="top">
    </div>
    
    <div id="left">
    </div>
    <div id="right">
        <asp:Calendar ID="Calendar1" runat="server" BackColor="#E8DD92" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="20pt" ForeColor="#334018" Width="700px" Height="500px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" OnVisibleMonthChanged="Calendar1_VisibleMonthChanged" NextPrevFormat="FullMonth" TitleFormat="Month" BorderStyle="Solid" BorderWidth="3" BorderColor="#334018">
            <DayHeaderStyle BackColor="#334018" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="14pt"/>
            <DayStyle Width="14%" />
            <NextPrevStyle Font-Size="10pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#334018" />
            <SelectedDayStyle BackColor="#334018" ForeColor="White" />
            <SelectorStyle BackColor="#334018" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt" ForeColor="#333333" Width="1%" />
            <TitleStyle BackColor="#334018" Font-Bold="True" Font-Size="16pt" ForeColor="White" Height="14pt" />
            <TodayDayStyle BackColor="#334018" ForeColor="White"/>
        </asp:Calendar>
        <asp:TextBox ID="taskTxt" runat="server" ReadOnly="True" TextMode="MultiLine" Width="690px" Height="100px" BackColor="#E8DD92" BorderColor="#334018" BorderStyle="Solid" BorderWidth="3"></asp:TextBox>
        <br />
        <br />
        <br />

    </div>
        <div id="footer">
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
</asp:Content>
