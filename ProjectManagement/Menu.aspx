<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="ProjectManagement.menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/dashboard.aspx">DASHBOARD</asp:HyperLink>
    
    </div>
        <p>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/projects.aspx">PROJECTS</asp:HyperLink>
        </p>
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/milestones.aspx">MILESTONES</asp:HyperLink>
        <p>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/tasks.aspx">TASKS</asp:HyperLink>
        </p>
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/AdminLogin.aspx">ADMIN</asp:HyperLink>
    </form>
</body>
</html>
