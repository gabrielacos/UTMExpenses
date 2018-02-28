<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UTMExpenses.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Message" runat="server">
    <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="">
            <h1 style="text-align: center;">Welcome to University Travel Management - Expenses</h1>
            <h2 style="text-align: center;">
                Here you can view, add and edit students, Travel Expenses and Travel Events and acces Reports. <br />
                <asp:Image ID="Image3" runat="server" Height="400px" ImageUrl="Resources/Logo.png" Width="400px" />
            </h2>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>