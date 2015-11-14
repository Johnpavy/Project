<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="ProjectManagement.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="menu" class="auto-style1">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:inetConnectionString %>" SelectCommand="SELECT * FROM [username]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [username] WHERE [userid] = @original_userid AND [groupid] = @original_groupid AND (([firstname] = @original_firstname) OR ([firstname] IS NULL AND @original_firstname IS NULL)) AND (([lastname] = @original_lastname) OR ([lastname] IS NULL AND @original_lastname IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([password] = @original_password) OR ([password] IS NULL AND @original_password IS NULL))" InsertCommand="INSERT INTO [username] ([userid], [groupid], [firstname], [lastname], [email], [password]) VALUES (@userid, @groupid, @firstname, @lastname, @email, @password)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [username] SET [groupid] = @groupid, [firstname] = @firstname, [lastname] = @lastname, [email] = @email, [password] = @password WHERE [userid] = @original_userid AND [groupid] = @original_groupid AND (([firstname] = @original_firstname) OR ([firstname] IS NULL AND @original_firstname IS NULL)) AND (([lastname] = @original_lastname) OR ([lastname] IS NULL AND @original_lastname IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([password] = @original_password) OR ([password] IS NULL AND @original_password IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_userid" Type="Int32" />
                <asp:Parameter Name="original_groupid" Type="Int32" />
                <asp:Parameter Name="original_firstname" Type="String" />
                <asp:Parameter Name="original_lastname" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter Name="original_password" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="userid" Type="Int32" />
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
    

            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="SignupEmailLbl" runat="server" Text="EMAIL" Visible="True" CssClass="auto-style1"></asp:Label>
            <asp:TextBox ID="NewEmailTxtBox" runat="server" Visible="True"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="FNameLbl" runat="server" Text="FIRST NAME" Visible="True" CssClass="auto-style1"></asp:Label>
            <asp:TextBox ID="FNameTxtBox" runat="server" Visible="True"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="LastNameLbl" runat="server" Text="LAST NAME" Visible="True" CssClass="auto-style1"></asp:Label>
        &nbsp;<asp:TextBox ID="LNameTxtbox" runat="server" Visible="True"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="NewPasswordLbl" runat="server" Text="PASSWORD" Visible="True" CssClass="auto-style1"></asp:Label>
        &nbsp;<asp:TextBox ID="NewPassTxtBox" runat="server" Visible="True" TextMode="Password"></asp:TextBox>
            <br />
            <br />
        <asp:Label ID="ConfirmPWLbl" runat="server" Text="CONFIRM PASSWORD" Visible="True" CssClass="auto-style1"></asp:Label>
        &nbsp;<asp:TextBox ID="ConfirmPassTxtBox" runat="server" Visible="True" TextMode="Password"></asp:TextBox>
            <br />
        <br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
         <asp:Label ID="loginLabel" runat="server" Text="Label" Visible="False" CssClass="auto-style1"></asp:Label>
            &nbsp;
        <asp:Label ID="error1" runat="server" Text="Label" Visible="False" CssClass="auto-style1"></asp:Label>
            &nbsp;
        <asp:Label ID="error2" runat="server" Text="Label" Visible="False" CssClass="auto-style1"></asp:Label>
        <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="RegisterBtn" runat="server" Text="Register" OnClick="RegisterBtn_Click" Visible="True" />
        &nbsp;&nbsp;
            <br />
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    

            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Login.aspx" CssClass="auto-style3">Return Home</asp:HyperLink>
            <br />
    

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    

            <br />
    

        </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            color: #FFFFFF;
        }
        .auto-style3 {
            color: #666666;
        }
        </style>
</asp:Content>
