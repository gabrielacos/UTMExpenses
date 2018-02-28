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
     <asp:Label ID="lblMessage" runat="server" Text="" CssClass="label label-info"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <script>$("#liStudents").addClass("active");</script>
    <div class="row">
        <div class="">
            <h1 style="text-align:center">Student Travel Expenses
             <asp:Image ID="Image2" runat="server" Height="80px" ImageUrl="Resources/Logo.png" Width="79px" />
            </h1>
        </div>
    </div>

    <div class="event-title">
        <h3>Select Student</h3>
    </div>

    <div class="flex-container">
        <div class="col-lg-6">
            <asp:DropDownList  ID="ddlEvents" runat="server" AutoPostBack="True" DataSourceID="DDDLdEvent" DataTextField="Event_Name" DataValueField="EventID" CssClass="dropdown dropdown-toggle" AppendDataBoundItems="True">
                <asp:ListItem Value="%">Select All</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="DDDLdEvent" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT UTM.StudentTravelEvent.EventID, UTM.TravelEvent.Event_Name FROM UTM.StudentTravelEvent INNER JOIN UTM.TravelEvent ON UTM.StudentTravelEvent.EventID = UTM.TravelEvent.EventID"></asp:SqlDataSource>
        </div>
        <div class="col-lg-6">
            <asp:DropDownList ID="ddlStudent" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="StudentID" CssClass="dropdown dropdown-toggle" AppendDataBoundItems="True">
                <asp:ListItem Value="%">Select All</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT UTM.StudentTravelEvent.StudentID, UTM.Student.Name FROM UTM.StudentTravelEvent INNER JOIN UTM.Student ON UTM.StudentTravelEvent.StudentID = UTM.Student.StudentID"></asp:SqlDataSource>
        </div>
    </div>

    <div class="">
        <div class="table table-hover table-striped grid-view">
            <asp:GridView ID="gvStudentTravelExpense" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="StudentID,EventID" DataSourceID="dsStudenttravelExpense" CssClass=" table table-bordered">
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="StudentID,EventID" DataNavigateUrlFormatString="TravelExpenseDetails.aspx?scode={0}&amp;ecode={1}&amp;act=&quot;r&quot;" Text="Select" />
                    <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                    <asp:BoundField DataField="EventName" HeaderText="EventName" SortExpression="EventName" />
                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" ReadOnly="True" SortExpression="StudentID" />
                    <asp:BoundField DataField="EventID" HeaderText="EventID" ReadOnly="True" SortExpression="EventID" />
                    <asp:BoundField DataField="ExpenseAmount" HeaderText="ExpenseAmount" SortExpression="ExpenseAmount" />
                    <asp:BoundField DataField="Expense_Status" HeaderText="Expense_Status" SortExpression="Expense_Status" />
                    <asp:BoundField DataField="Record_Status" HeaderText="Record_Status" SortExpression="Record_Status" />
                    <asp:BoundField DataField="created_by" HeaderText="created_by" SortExpression="created_by" />
                    <asp:BoundField DataField="creation_date" HeaderText="creation_date" SortExpression="creation_date" />
                    <asp:BoundField DataField="updated_by" HeaderText="updated_by" SortExpression="updated_by" />
                    <asp:BoundField DataField="update_date" HeaderText="update_date" SortExpression="update_date" />
                    <asp:HyperLinkField DataNavigateUrlFields="StudentID,EventID" DataNavigateUrlFormatString="TravelExpenseDetail.aspx?scode={0}&amp;ecode={1}&amp;act=u" Text="Edit" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsStudenttravelExpense" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT UTM.StudentTravelEvent.StudentID, UTM.StudentTravelEvent.EventID, UTM.StudentTravelEvent.ExpenseAmount, UTM.StudentTravelEvent.Expense_Status, UTM.StudentTravelEvent.Record_Status, UTM.StudentTravelEvent.created_by, UTM.StudentTravelEvent.creation_date, UTM.StudentTravelEvent.updated_by, UTM.StudentTravelEvent.update_date, UTM.Student.Name AS StudentName, UTM.TravelEvent.Event_Name AS EventName FROM UTM.StudentTravelEvent INNER JOIN UTM.Student ON UTM.StudentTravelEvent.StudentID = UTM.Student.StudentID INNER JOIN UTM.TravelEvent ON UTM.StudentTravelEvent.EventID = UTM.TravelEvent.EventID WHERE (UTM.StudentTravelEvent.EventID LIKE '%' + @parmEventID + '%') AND (UTM.StudentTravelEvent.StudentID LIKE '%' + @parmStudentID + '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlEvents" Name="parmEventID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddlStudent" Name="parmStudentID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
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