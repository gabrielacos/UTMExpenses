<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="TravelExpenses.aspx.cs" Inherits="UTMExpenses.TravelExpenses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">
    <!--Expense by Travel Event
a. You must design a window that allow the user select an Event and view each the
expense for each student that participated including the expense status
(paid/unpaid) and display total expenses amount by each expense status.
b. You must allow edit the expense payment, date and status for a specific Student
travel event.-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Message" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
     <div class="row">
        <div class="col-lg-10">
            <h1>Students</h1>
        </div>

        <div class="col-lg-2">
            <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl="Resources/Logo.png" Width="79px" />
        </div>
    </div>

    <script>$("#liStudents").addClass("active");</script>
    <div class="row">

         <div class="col-lg-8">
            <h5>Select Student</h5>
        </div>
        
        <div class="col-lg-4">
            <asp:Button ID="btnTravelExpense" runat="server" Text="Register New TravelExpense"  CssClass="btn btn-primary" OnClick="btnRegisterStudent_Click" />
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <!--DDL-->
             </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <!--GridView-->
              </div>
    </div>
    <div class="row">
        <div class="col-lg-2">
            &nbsp;
        </div>
        <!-- Text and a Label Control to display totals -->
        <div class="col-lg-8">
            <asp:Label ID="lblTotal" runat="server"></asp:Label>
        </div>
        <div class="col-lg-2">
            &nbsp;
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            &nbsp;
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            &nbsp;
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>