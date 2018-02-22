<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UTMExpenses.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--1. User Login
a. You must design a window that will allow the user to input the login information
to be authenticated using the data on the UTMUsers table -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="Resources/Logo.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin">
                <span id="reauth-email" class="reauth-email"></span>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control">UserName</asp:TextBox>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control">Password</asp:TextBox>
                <asp:Button ID="btnLogin" CssClass="btn btn-lg btn-primary btn-block btn-signin" runat="server" Text="Login" />
            </form>
            <!-- /form -->
        </div>
        <!-- /card-container -->
    </div>
</asp:Content>