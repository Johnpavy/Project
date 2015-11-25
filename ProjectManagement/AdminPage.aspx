<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AdminLanding.Master" CodeBehind="AdminPage.aspx.cs" Inherits="ProjectManagement.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div id="top">
</div>

    
<div id="left">
</div>

<div id="right">
    o<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="userid" DataSourceID="SqlDataSource2" Height="320px" ShowFooter="True" Width="781px">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="userid" HeaderText="userid" InsertVisible="False" ReadOnly="True" SortExpression="userid" />
            <asp:BoundField DataField="groupid" HeaderText="groupid" SortExpression="groupid" />
            <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
            <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:inetConnectionString6 %>" DeleteCommand="DELETE FROM [username] WHERE [userid] = @original_userid AND [groupid] = @original_groupid AND (([firstname] = @original_firstname) OR ([firstname] IS NULL AND @original_firstname IS NULL)) AND (([lastname] = @original_lastname) OR ([lastname] IS NULL AND @original_lastname IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([password] = @original_password) OR ([password] IS NULL AND @original_password IS NULL))" InsertCommand="INSERT INTO [username] ([groupid], [firstname], [lastname], [email], [password]) VALUES (@groupid, @firstname, @lastname, @email, @password)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [username]" UpdateCommand="UPDATE [username] SET [groupid] = @groupid, [firstname] = @firstname, [lastname] = @lastname, [email] = @email, [password] = @password WHERE [userid] = @original_userid AND [groupid] = @original_groupid AND (([firstname] = @original_firstname) OR ([firstname] IS NULL AND @original_firstname IS NULL)) AND (([lastname] = @original_lastname) OR ([lastname] IS NULL AND @original_lastname IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([password] = @original_password) OR ([password] IS NULL AND @original_password IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_userid" Type="Int32" />
            <asp:Parameter Name="original_groupid" Type="Int32" />
            <asp:Parameter Name="original_firstname" Type="String" />
            <asp:Parameter Name="original_lastname" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_password" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="groupid" Type="Int32" />
            <asp:Parameter Name="firstname" Type="String" />
            <asp:Parameter Name="lastname" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="password" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="groupid" Type="Int32" />
            <asp:Parameter Name="firstname" Type="String" />
            <asp:Parameter Name="lastname" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="original_userid" Type="Int32" />
            <asp:Parameter Name="original_groupid" Type="Int32" />
            <asp:Parameter Name="original_firstname" Type="String" />
            <asp:Parameter Name="original_lastname" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_password" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="userid" DataSourceID="SqlDataSource3" Width="776px" OnItemDeleted="FormView1_ItemDeleted" OnItemInserted="FormView1_ItemInserted" OnItemUpdated="FormView1_ItemUpdated" OnPageIndexChanging="FormView1_PageIndexChanging">
        <EditItemTemplate>
            userid:
            <asp:Label ID="useridLabel1" runat="server" Text='<%# Eval("userid") %>' />
            <br />
            groupid:
            <asp:TextBox ID="groupidTextBox" runat="server" Text='<%# Bind("groupid") %>' />
            <br />
            firstname:
            <asp:TextBox ID="firstnameTextBox" runat="server" Text='<%# Bind("firstname") %>' />
            <br />
            lastname:
            <asp:TextBox ID="lastnameTextBox" runat="server" Text='<%# Bind("lastname") %>' />
            <br />
            email:
            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
            <br />
            password:
            <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            groupid:
            <asp:TextBox ID="groupidTextBox" runat="server" Text='<%# Bind("groupid") %>' />
            <br />
            firstname:
            <asp:TextBox ID="firstnameTextBox" runat="server" Text='<%# Bind("firstname") %>' />
            <br />
            lastname:
            <asp:TextBox ID="lastnameTextBox" runat="server" Text='<%# Bind("lastname") %>' />
            <br />
            email:
            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
            <br />
            password:
            <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            userid:
            <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' />
            <br />
            groupid:
            <asp:Label ID="groupidLabel" runat="server" Text='<%# Bind("groupid") %>' />
            <br />
            firstname:
            <asp:Label ID="firstnameLabel" runat="server" Text='<%# Bind("firstname") %>' />
            <br />
            lastname:
            <asp:Label ID="lastnameLabel" runat="server" Text='<%# Bind("lastname") %>' />
            <br />
            email:
            <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
            <br />
            password:
            <asp:Label ID="passwordLabel" runat="server" Text='<%# Bind("password") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString7 %>" DeleteCommand="DELETE FROM [username] WHERE [userid] = @original_userid" InsertCommand="INSERT INTO [username] ([groupid], [firstname], [lastname], [email], [password]) VALUES (@groupid, @firstname, @lastname, @email, @password)" SelectCommand="SELECT * FROM [username]" UpdateCommand="UPDATE [username] SET [groupid] = @groupid, [firstname] = @firstname, [lastname] = @lastname, [email] = @email, [password] = @password WHERE [userid] = @original_userid" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_userid" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="username" PropertyName="SelectedValue" Type="Double" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="groupid" Type="Int32" />
            <asp:Parameter Name="firstname" Type="String" />
            <asp:Parameter Name="lastname" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="password" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="groupid" Type="Int32" />
            <asp:Parameter Name="firstname" Type="String" />
            <asp:Parameter Name="lastname" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="original_userid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</div>

<div id="footer">
</div>

</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
</asp:Content>
