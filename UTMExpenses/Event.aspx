<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="UTMExpenses.Event" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">
    <!-- 3. Event
a. You must design windows that will allow the users to display all values for the
Event table, or a specific event, add a new event, delete and modify an existing
event, and calculate and display total count of the displayed Events.

b. You must design a Report that lists All the Events by Type.-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Message" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="col-lg-2">
            <asp:Image ID="imgLogo" runat="server" Height="60px" Width="59px" src="Resources/Logo.png"  />
           
        </div>
        <div class="col-lg-10">
             <h1>Event</h1>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>