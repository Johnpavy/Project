<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Tasks.aspx.cs" Inherits="ProjectManagement.Tasks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString5 %>" SelectCommand="SELECT * FROM [task] WHERE ([userid] = @userid)" DeleteCommand="DELETE FROM [task] WHERE [taskid] = @taskid" InsertCommand="INSERT INTO [task] ([projectid], [milestoneid], [description], [userid]) VALUES (@projectid, @milestoneid, @description, @userid)" UpdateCommand="UPDATE [task] SET [projectid] = @projectid, [milestoneid] = @milestoneid, [description] = @description, [userid] = @userid WHERE [taskid] = @taskid">
           <DeleteParameters>
               <asp:Parameter Name="taskid" Type="Int32" />
           </DeleteParameters>
           <InsertParameters>
               <asp:Parameter Name="projectid" Type="Int32" />
               <asp:Parameter Name="milestoneid" Type="Int32" />
               <asp:Parameter Name="description" Type="String" />
               <asp:Parameter Name="userid" Type="Int32" />
           </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="userid" SessionField="userID" Type="Int32" />
        </SelectParameters>
           <UpdateParameters>
               <asp:Parameter Name="projectid" Type="Int32" />
               <asp:Parameter Name="milestoneid" Type="Int32" />
               <asp:Parameter Name="description" Type="String" />
               <asp:Parameter Name="userid" Type="Int32" />
               <asp:Parameter Name="taskid" Type="Int32" />
           </UpdateParameters>
    </asp:SqlDataSource>

        <div id="top">
    </div>
    
    <div id="left">
    </div>
    <div id="right">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="taskid" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                taskid:
                <asp:Label ID="taskidLabel1" runat="server" Text='<%# Eval("taskid") %>' />
                <br />
                projectid:
                <asp:TextBox ID="projectidTextBox" runat="server" Text='<%# Bind("projectid") %>' />
                <br />
                milestoneid:
                <asp:TextBox ID="milestoneidTextBox" runat="server" Text='<%# Bind("milestoneid") %>' />
                <br />
                description:
                <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
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
                milestoneid:
                <asp:TextBox ID="milestoneidTextBox" runat="server" Text='<%# Bind("milestoneid") %>' />
                <br />
                description:
                <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                <br />
                userid:
                <asp:TextBox ID="useridTextBox" runat="server" Text='<%# Bind("userid") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                taskid:
                <asp:Label ID="taskidLabel" runat="server" Text='<%# Eval("taskid") %>' />
                <br />
                projectid:
                <asp:Label ID="projectidLabel" runat="server" Text='<%# Bind("projectid") %>' />
                <br />
                milestoneid:
                <asp:Label ID="milestoneidLabel" runat="server" Text='<%# Bind("milestoneid") %>' />
                <br />
                description:
                <asp:Label ID="descriptionLabel" runat="server" Text='<%# Bind("description") %>' />
                <br />
                userid:
                <asp:Label ID="useridLabel" runat="server" Text='<%# Bind("userid") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <br />
                            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="taskid" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="taskid" HeaderText="taskid" InsertVisible="False" ReadOnly="True" SortExpression="taskid" />
                <asp:BoundField DataField="projectid" HeaderText="projectid" SortExpression="projectid" />
                <asp:BoundField DataField="milestoneid" HeaderText="milestoneid" SortExpression="milestoneid" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
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