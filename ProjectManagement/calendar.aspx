<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar.aspx.cs" Inherits="teamproj.calander" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Calendar ID="Calendar1" runat="server" BackColor="#55FFCC" BorderColor="#55CC66" BorderWidth="1px" DayNameFormat="Short" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="300px" ShowGridLines="True" Width="700px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged">
            <DayHeaderStyle BackColor="#00CC66" Font-Bold="True" Height="1px" BorderStyle="Solid" Font-Overline="False" Font-Underline="False" ForeColor="Blue" />
            <NextPrevStyle Font-Size="9pt" ForeColor="#AAFFCC" />
            <OtherMonthDayStyle ForeColor="#666666" Font-Strikeout="True" />
            <SelectedDayStyle BackColor="#00CCFF" Font-Bold="True" />
            <SelectorStyle BackColor="#44FFFF" />
            <TitleStyle BackColor="#008888" Font-Bold="True" Font-Size="9pt" ForeColor="#40FFCC" />
            <TodayDayStyle BackColor="#70A0FF" ForeColor="White" />
        </asp:Calendar>
    
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" Width="464px">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
