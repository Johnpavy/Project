<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="ProjectManagement.AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
     <style>
        html
        { 
			    background: url(images/main.png) center fixed;
                background-repeat: no-repeat;
	            background-size: 100% 100%;
	    }

        container
        {
            width: 1024px;
            height: 832px;
        }

        #top
        {
            height: 256px;
            text-align: right;
        }

        #left
        {
            width: 256px;
            height: 512px;
            margin-top: 0px;
            margin-right: 0px;
            margin-left: 0px;
            margin-bottom: 0px;
	        font-size: 16px;
	        font-family: 'Helvetica Neue LT Pro';
	        font-weight: bold;
	        text-align: left;
	        text-shadow: none;
            float: left;
        }

        #right {
            width: 768px;
            height: 512px;
            margin-top: 0px;
            margin-right: 0px;
            margin-left: 300px;
            margin-bottom: 0px;
            font-size: 16px;
            font-family: 'Helvetica Neue LT Pro';
            font-weight: bold;
            text-align: left;
            text-shadow: none;
        }

        #footer
        {
            height: 64px;
            text-align: center;
        }
        
        #calendar
        {
            float: right;

        }
        #left a, #right a
        {
            text-decoration: none;
	        font-size: 16px;
	        color: #334018;
	        padding: 8px 8px 8px 8px;
	        font-family: 'Helvetica Neue LT Pro';
            font-weight: bold;
	        text-align: center;
	        text-shadow: none;
        }

        #left a:hover,#right a:hover
        {
	        color: #7ba02e;
	        border-radius: 10px;
        }

        p
        {
            color: #ffffff;
        }

        #menu *,#signup *
        {
            text-decoration: none;
	        font-size: 12px;
	        padding: 2px 2px 2px 2px;
	        font-family: 'Helvetica Neue LT Pro';
            font-weight: bold;
	        text-align: left;
            color: #000;
	        text-shadow: none;
        }

    </style>
<body>
    <form id="form1" runat="server">
    <div style="margin-left: 117px">
    
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ADMIN PAGE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
    
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Create New Project</asp:LinkButton>
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" DataKeyNames="projectid" DataSourceID="SqlDataSource1" ForeColor="Black" PageSize="4" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1119px" CellSpacing="2">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="projectname" HeaderText="projectname" SortExpression="projectname" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                <asp:BoundField DataField="startdate" HeaderText="startdate" SortExpression="startdate" />
                <asp:BoundField DataField="duedate" HeaderText="duedate" SortExpression="duedate" />
                <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString3 %>" SelectCommand="SELECT [description], [startdate], [duedate], [userid], [projectname], [projectid] FROM [projects]" OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [projects] WHERE [projectid] = @original_projectid" InsertCommand="INSERT INTO [projects] ([description], [startdate], [duedate], [userid], [projectname]) VALUES (@description, @startdate, @duedate, @userid, @projectname)" UpdateCommand="UPDATE [projects] SET [description] = @description, [startdate] = @startdate, [duedate] = @duedate, [userid] = @userid, [projectname] = @projectname WHERE [projectid] = @original_projectid">
            <DeleteParameters>
                <asp:Parameter Name="original_projectid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="startdate" Type="String" />
                <asp:Parameter DbType="Date" Name="duedate" />
                <asp:Parameter Name="userid" Type="Int32" />
                <asp:Parameter Name="projectname" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="startdate" Type="String" />
                <asp:Parameter DbType="Date" Name="duedate" />
                <asp:Parameter Name="userid" Type="Int32" />
                <asp:Parameter Name="projectname" Type="String" />
                <asp:Parameter Name="original_projectid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="projectid" DataSourceID="SqlDataSource2" GridLines="Vertical" Width="325px" OnItemDeleted="FormView1_ItemDeleted" OnItemInserted="FormView1_ItemInserted" OnItemUpdated="FormView1_ItemUpdated" OnPageIndexChanging="FormView1_PageIndexChanging" ForeColor="Black">
            <EditItemTemplate>
                projectname:
                <asp:TextBox ID="projectnameTextBox" runat="server" Text='<%# Bind("projectname") %>' />
                <br />
                projectid:
                <asp:Label ID="projectidLabel1" runat="server" Text='<%# Eval("projectid") %>' />
                <br />
                description:
                <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                <br />
                startdate:
                <asp:TextBox ID="startdateTextBox" runat="server" Text='<%# Bind("startdate") %>' />
                <br />
                duedate:
                <asp:TextBox ID="duedateTextBox" runat="server" Text='<%# Bind("duedate") %>' />
                <br />
                userid:
                <asp:TextBox ID="useridTextBox" runat="server" Text='<%# Bind("userid") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                projectname:
                <asp:TextBox ID="projectnameTextBox" runat="server" Text='<%# Bind("projectname") %>' />
                <br />
                description:
                <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                <br />
                startdate:
                <asp:TextBox ID="startdateTextBox" runat="server" Text='<%# Bind("startdate") %>' />
                <br />
                duedate:
                <asp:TextBox ID="duedateTextBox" runat="server" Text='<%# Bind("duedate") %>' />
                <br />
                userid:
                <asp:TextBox ID="useridTextBox" runat="server" Text='<%# Bind("userid") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                projectname:
                <asp:Label ID="projectnameLabel" runat="server" Text='<%# Bind("projectname") %>' />
                <br />
                projectid:
                <asp:Label ID="projectidLabel" runat="server" Text='<%# Eval("projectid") %>' />
                <br />
                description:
                <asp:Label ID="descriptionLabel" runat="server" Text='<%# Bind("description") %>' />
                <br />
                startdate:
                <asp:Label ID="startdateLabel" runat="server" Text='<%# Bind("startdate") %>' />
                <br />
                duedate:
                <asp:Label ID="duedateLabel" runat="server" Text='<%# Bind("duedate") %>' />
                <br />
                userid:
                <asp:Label ID="useridLabel" runat="server" Text='<%# Bind("userid") %>' />
                <br />
            </ItemTemplate>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString4 %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [projects]">
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
