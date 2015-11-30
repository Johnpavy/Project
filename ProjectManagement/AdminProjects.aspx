<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLanding.Master" AutoEventWireup="true" CodeBehind="AdminProjects.aspx.cs" Inherits="ProjectManagement.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="top">
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString3 %>" SelectCommand="SELECT * FROM [projects]" OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [projects] WHERE [projectid] = @original_projectid" InsertCommand="INSERT INTO [projects] ([projectname], [description], [startdate], [duedate], [userid]) VALUES (@projectname, @description, @startdate, @duedate, @userid)" UpdateCommand="UPDATE [projects] SET [projectname] = @projectname, [description] = @description, [startdate] = @startdate, [duedate] = @duedate, [userid] = @userid WHERE [projectid] = @original_projectid">
            <DeleteParameters>
                <asp:Parameter Name="original_projectid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="projectname" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter DbType="Date" Name="startdate" />
                <asp:Parameter Name="duedate" DbType="Date" />
                <asp:Parameter Name="userid" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="projectname" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter DbType="Date" Name="startdate" />
                <asp:Parameter Name="duedate" DbType="Date" />
                <asp:Parameter Name="userid" Type="Int32" />
                <asp:Parameter Name="original_projectid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="projectid" DataSourceID="SqlDataSource2" Width="325px" OnItemDeleted="FormView1_ItemDeleted" OnItemInserted="FormView1_ItemInserted" OnItemUpdated="FormView1_ItemUpdated" OnPageIndexChanging="FormView1_PageIndexChanging" CssClass="auto-style1">
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
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString4 %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [projects]" DeleteCommand="DELETE FROM [projects] WHERE [projectid] = @original_projectid" InsertCommand="INSERT INTO [projects] ([projectname], [description], [startdate], [duedate], [userid]) VALUES (@projectname, @description, @startdate, @duedate, @userid)" UpdateCommand="UPDATE [projects] SET [projectname] = @projectname, [description] = @description, [startdate] = @startdate, [duedate] = @duedate, [userid] = @userid WHERE [projectid] = @original_projectid">
            <DeleteParameters>
                <asp:Parameter Name="original_projectid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="projectname" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter DbType="Date" Name="startdate" />
                <asp:Parameter DbType="Date" Name="duedate" />
                <asp:Parameter Name="userid" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="projectname" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter DbType="Date" Name="startdate" />
                <asp:Parameter DbType="Date" Name="duedate" />
                <asp:Parameter Name="userid" Type="Int32" />
                <asp:Parameter Name="original_projectid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

</div>

<div id="footer">
</div>

</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            margin-bottom: 2px;
        }
    </style>
</asp:Content>

