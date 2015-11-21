<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="ProjectManagement.AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">New Project</asp:LinkButton>
        <br />
        <br />
        <br />
    
        You made it to the admin page!<br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="projectid" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" AllowPaging="True" PageSize="4" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="duedate" HeaderText="duedate" SortExpression="duedate" />
                <asp:BoundField DataField="startdate" HeaderText="startdate" SortExpression="startdate" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                <asp:BoundField DataField="projectid" HeaderText="projectid" InsertVisible="False" ReadOnly="True" SortExpression="projectid" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString3 %>" SelectCommand="SELECT [duedate], [startdate], [description], [projectid] FROM [projects]" OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [projects] WHERE [projectid] = @original_projectid AND (([duedate] = @original_duedate) OR ([duedate] IS NULL AND @original_duedate IS NULL)) AND (([startdate] = @original_startdate) OR ([startdate] IS NULL AND @original_startdate IS NULL)) AND [description] = @original_description" ConflictDetection="CompareAllValues" InsertCommand="INSERT INTO [projects] ([duedate], [startdate], [description]) VALUES (@duedate, @startdate, @description)" UpdateCommand="UPDATE [projects] SET [duedate] = @duedate, [startdate] = @startdate, [description] = @description WHERE [projectid] = @original_projectid AND (([duedate] = @original_duedate) OR ([duedate] IS NULL AND @original_duedate IS NULL)) AND (([startdate] = @original_startdate) OR ([startdate] IS NULL AND @original_startdate IS NULL)) AND [description] = @original_description">
            <DeleteParameters>
                <asp:Parameter Name="original_projectid" Type="Int32" />
                <asp:Parameter Name="original_duedate" Type="String" />
                <asp:Parameter Name="original_startdate" Type="String" />
                <asp:Parameter Name="original_description" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="duedate" Type="String" />
                <asp:Parameter Name="startdate" Type="String" />
                <asp:Parameter Name="description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="duedate" Type="String" />
                <asp:Parameter Name="startdate" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="original_projectid" Type="Int32" />
                <asp:Parameter Name="original_duedate" Type="String" />
                <asp:Parameter Name="original_startdate" Type="String" />
                <asp:Parameter Name="original_description" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="projectid" DataSourceID="SqlDataSource2" GridLines="Both" Width="413px" OnItemDeleted="FormView1_ItemDeleted" OnItemInserted="FormView1_ItemInserted" OnItemUpdated="FormView1_ItemUpdated" OnPageIndexChanging="FormView1_PageIndexChanging">
            <EditItemTemplate>
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
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <InsertItemTemplate>
                description:
                <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                <br />
                startdate:
                <asp:TextBox ID="startdateTextBox" runat="server" Text='<%# Bind("startdate") %>' />
                <br />
                duedate:
                <asp:TextBox ID="duedateTextBox" runat="server" Text='<%# Bind("duedate") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
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
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:inetConnectionString4 %>" DeleteCommand="DELETE FROM [projects] WHERE [projectid] = @original_projectid AND [description] = @original_description AND (([startdate] = @original_startdate) OR ([startdate] IS NULL AND @original_startdate IS NULL)) AND (([duedate] = @original_duedate) OR ([duedate] IS NULL AND @original_duedate IS NULL))" InsertCommand="INSERT INTO [projects] ([description], [startdate], [duedate]) VALUES (@description, @startdate, @duedate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [description], [startdate], [duedate], [projectid] FROM [projects]" UpdateCommand="UPDATE [projects] SET [description] = @description, [startdate] = @startdate, [duedate] = @duedate WHERE [projectid] = @original_projectid AND [description] = @original_description AND (([startdate] = @original_startdate) OR ([startdate] IS NULL AND @original_startdate IS NULL)) AND (([duedate] = @original_duedate) OR ([duedate] IS NULL AND @original_duedate IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_projectid" Type="Int32" />
                <asp:Parameter Name="original_description" Type="String" />
                <asp:Parameter Name="original_startdate" Type="String" />
                <asp:Parameter Name="original_duedate" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="startdate" Type="String" />
                <asp:Parameter Name="duedate" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="startdate" Type="String" />
                <asp:Parameter Name="duedate" Type="String" />
                <asp:Parameter Name="original_projectid" Type="Int32" />
                <asp:Parameter Name="original_description" Type="String" />
                <asp:Parameter Name="original_startdate" Type="String" />
                <asp:Parameter Name="original_duedate" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
