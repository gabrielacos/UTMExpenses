<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UTMExpenses.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--1. User Login
a. You must design a window that will allow the user to input the login information
to be authenticated using the data on the UTMUsers table -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <div class="container">
        <div class="card card-container">

            <img id="profile-img" class="profile-img-card" src="Resources/Logo.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin">

                <h5>UserName</h5>
                <asp:TextBox ID="txtUser" runat="server" CssClass="form-control "></asp:TextBox>

                <asp:RequiredFieldValidator ID="reqUsername" runat="server"
                    ControlToValidate="txtUser" ErrorMessage="Required."
                    ValidationGroup="val1">
                </asp:RequiredFieldValidator>
                <h5>Password</h5>
                <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>

                <asp:RequiredFieldValidator ID="reqPassword" runat="server"
                    ControlToValidate="txtPass" ErrorMessage="Required."
                    ValidationGroup="val1"></asp:RequiredFieldValidator>
                <asp:Button ID="btnLogin" CssClass="btn btn-lg btn-primary btn-block btn-signin" runat="server" Text="Login" OnClick="btnLogin_Click1" />
            </form>
        </div>
    </div>
</asp:Content>