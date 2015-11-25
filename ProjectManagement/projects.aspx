<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="projects.aspx.cs" Inherits="ProjectManagement.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString5 %>" SelectCommand="SELECT * FROM [projects] WHERE ([userid] = @userid)" UpdateCommand="UPDATE [projects] SET [projectname] = @projectname, [description] = @description, [startdate] = @startdate, [duedate] = @duedate, [userid] = @userid WHERE [projectid] = @projectid">
           <DeleteParameters>
               <asp:Parameter Name="projectid" Type="Int32" />
           </DeleteParameters>
           <InsertParameters>
               <asp:Parameter Name="projectname" Type="String" />
               <asp:Parameter Name="description" Type="String" />
               <asp:Parameter DbType="Date" Name="startdate" />
               <asp:Parameter DbType="Date" Name="duedate" />
               <asp:Parameter Name="userid" Type="Int32" />
           </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="userid" SessionField="userID" Type="Int32" />
        </SelectParameters>
           <UpdateParameters>
               <asp:Parameter Name="projectname" Type="String" />
               <asp:Parameter Name="description" Type="String" />
               <asp:Parameter DbType="Date" Name="startdate" />
               <asp:Parameter DbType="Date" Name="duedate" />
               <asp:Parameter Name="userid" Type="Int32" />
               <asp:Parameter Name="projectid" Type="Int32" />
           </UpdateParameters>
    </asp:SqlDataSource>

        <div id="top">
    </div>
    
    <div id="left">
    </div>
    <div id="right">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="projectid" DataSourceID="SqlDataSource1">
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
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <br />
                            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="projectid" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="projectname" HeaderText="projectname" SortExpression="projectname" />
                <asp:BoundField DataField="projectid" HeaderText="projectid" SortExpression="projectid" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                <asp:BoundField DataField="startdate" HeaderText="startdate" SortExpression="startdate" />
                <asp:BoundField DataField="duedate" HeaderText="duedate" SortExpression="duedate" />
                <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
            </Columns>
        </asp:GridView>
        </div>
        <div id="footer">
    </div>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
