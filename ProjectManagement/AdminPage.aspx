<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AdminLanding.Master" CodeBehind="AdminPage.aspx.cs" Inherits="ProjectManagement.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="top">
       <asp:Label ID="greeting" runat="server" Text="Welcome"></asp:Label>
</div>

    
<div id="left">
</div>

<div id="right">

        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Create New Project</asp:LinkButton>

        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="projectid" DataSourceID="SqlDataSource1" PageSize="4" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1119px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="projectname" HeaderText="projectname" SortExpression="projectname" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                <asp:BoundField DataField="startdate" HeaderText="startdate" SortExpression="startdate" />
                <asp:BoundField DataField="duedate" HeaderText="duedate" SortExpression="duedate" />
                <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
            </Columns>
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
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="projectid" DataSourceID="SqlDataSource2" Width="325px" OnItemDeleted="FormView1_ItemDeleted" OnItemInserted="FormView1_ItemInserted" OnItemUpdated="FormView1_ItemUpdated" OnPageIndexChanging="FormView1_PageIndexChanging">
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
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString4 %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [projects]">
        </asp:SqlDataSource>

</div>

<div id="footer">
</div>

</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
</asp:Content>