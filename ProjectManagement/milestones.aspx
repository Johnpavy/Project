<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="milestones.aspx.cs" Inherits="ProjectManagement.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString5 %>" SelectCommand="SELECT * FROM milestone INNER JOIN projects ON milestone.projectid = projects.projectid WHERE userid = @userid" DeleteCommand="DELETE FROM [projects] WHERE [projectid] = @projectid" InsertCommand="INSERT INTO [projects] ([projectname], [description], [startdate], [duedate], [userid]) VALUES (@projectname, @description, @startdate, @duedate, @userid)" UpdateCommand="UPDATE [projects] SET [projectname] = @projectname, [description] = @description, [startdate] = @startdate, [duedate] = @duedate, [userid] = @userid WHERE [projectid] = @projectid">
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
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="milestoneid,projectid1" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                milestoneid:
                <asp:Label ID="milestoneidLabel1" runat="server" Text='<%# Eval("milestoneid") %>' />
                <br />
                projectid:
                <asp:TextBox ID="projectidTextBox" runat="server" Text='<%# Bind("projectid") %>' />
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
                projectname:
                <asp:TextBox ID="projectnameTextBox" runat="server" Text='<%# Bind("projectname") %>' />
                <br />
                projectid1:
                <asp:Label ID="projectid1Label1" runat="server" Text='<%# Eval("projectid1") %>' />
                <br />
                description1:
                <asp:TextBox ID="description1TextBox" runat="server" Text='<%# Bind("description1") %>' />
                <br />
                startdate1:
                <asp:TextBox ID="startdate1TextBox" runat="server" Text='<%# Bind("startdate1") %>' />
                <br />
                duedate1:
                <asp:TextBox ID="duedate1TextBox" runat="server" Text='<%# Bind("duedate1") %>' />
                <br />
                userid:
                <asp:TextBox ID="useridTextBox" runat="server" Text='<%# Bind("userid") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                projectid:
                <asp:TextBox ID="projectidTextBox" runat="server" Text='<%# Bind("projectid") %>' />
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
                projectname:
                <asp:TextBox ID="projectnameTextBox" runat="server" Text='<%# Bind("projectname") %>' />
                <br />

                description1:
                <asp:TextBox ID="description1TextBox" runat="server" Text='<%# Bind("description1") %>' />
                <br />
                startdate1:
                <asp:TextBox ID="startdate1TextBox" runat="server" Text='<%# Bind("startdate1") %>' />
                <br />
                duedate1:
                <asp:TextBox ID="duedate1TextBox" runat="server" Text='<%# Bind("duedate1") %>' />
                <br />
                userid:
                <asp:TextBox ID="useridTextBox" runat="server" Text='<%# Bind("userid") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                milestoneid:
                <asp:Label ID="milestoneidLabel" runat="server" Text='<%# Eval("milestoneid") %>' />
                <br />
                projectid:
                <asp:Label ID="projectidLabel" runat="server" Text='<%# Bind("projectid") %>' />
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
                projectname:
                <asp:Label ID="projectnameLabel" runat="server" Text='<%# Bind("projectname") %>' />
                <br />
                projectid1:
                <asp:Label ID="projectid1Label" runat="server" Text='<%# Eval("projectid1") %>' />
                <br />
                description1:
                <asp:Label ID="description1Label" runat="server" Text='<%# Bind("description1") %>' />
                <br />
                startdate1:
                <asp:Label ID="startdate1Label" runat="server" Text='<%# Bind("startdate1") %>' />
                <br />
                duedate1:
                <asp:Label ID="duedate1Label" runat="server" Text='<%# Bind("duedate1") %>' />
                <br />
                userid:
                <asp:Label ID="useridLabel" runat="server" Text='<%# Bind("userid") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <br />
                            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="milestoneid,projectid1" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="milestoneid" HeaderText="milestoneid" InsertVisible="False" ReadOnly="True" SortExpression="milestoneid" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                <asp:BoundField DataField="startdate" HeaderText="startdate" SortExpression="startdate" />
                <asp:BoundField DataField="duedate" HeaderText="duedate" SortExpression="duedate" />
                <asp:BoundField DataField="projectname" HeaderText="projectname" SortExpression="projectname" />
                <asp:BoundField DataField="projectid1" HeaderText="projectid1" InsertVisible="False" ReadOnly="True" SortExpression="projectid1" />
                <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
            </Columns>
        </asp:GridView>
        <br />
        </div>
        <div id="footer">
    </div>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>