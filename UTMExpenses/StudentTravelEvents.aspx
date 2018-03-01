<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="StudentTravelEvents.aspx.cs" Inherits="UTMExpenses.TravelEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">
    <!--4. Student Travel Event

a. You must design windows that will allow the user to display all the travel events
information for a student, add, delete and modify a specific student travel, and
calculate and display totals for all displayed student travel events.

b. You must allow to add a New Event for a specific Student, delete and modify an
existing Event for a Student, and calculate and display total count of the displayed-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Message" runat="server">
     <asp:Label ID="lblMessage" runat="server" Text="" CssClass="label label-info"></asp:Label>
    <script>$("#student-event").addClass("active");</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="">
            <h1 style="text-align:center;">Student Travel Event
                 <asp:Image ID="Image3" runat="server" Height="80px" ImageUrl="Resources/Logo.png" Width="79px" />
            </h1>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <h3>Select Events</h3>
        </div>
    </div>

    <div class="flex-container">
        <div class="col-lg-4 create-button">
            <asp:Button ID="btnStudentTravelEvent" runat="server" Text="Register Travel Event" CssClass="btn btn-primary" OnClick="btnStudentTravelEvent_Click" />
        </div>
        <div class="drop-down dropdown show">
            <asp:DropDownList ID="ddlTravelEvent" CssClass="dropdown dropdown-toggle" runat="server" AppendDataBoundItems="True" DataSourceID="dsddlTravelEvent" DataTextField="Event_Name" DataValueField="EventID" AutoPostBack="True">
                <asp:ListItem Value="%">Select All</asp:ListItem>
            </asp:DropDownList>

            <asp:SqlDataSource ID="dsddlTravelEvent" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT UTM.StudentTravelEvent.EventID, UTM.TravelEvent.Event_Name, UTM.StudentTravelEvent.StudentID, UTM.Student.Name FROM UTM.TravelEvent INNER JOIN UTM.StudentTravelEvent ON UTM.TravelEvent.EventID = UTM.StudentTravelEvent.EventID INNER JOIN UTM.Student ON UTM.StudentTravelEvent.StudentID = UTM.Student.StudentID"></asp:SqlDataSource>
        </div>
        <div class="drop-down dropdown show">
             <asp:DropDownList ID="ddlStudentName" CssClass="dropdown dropdown-toggle" runat="server" AppendDataBoundItems="True" DataSourceID="dsddlTravelEvent" DataTextField="Name" DataValueField="StudentID" AutoPostBack="True">
                <asp:ListItem Value="%">Select All</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>

    <div class="">
        <div class="table table-hover table-striped grid-view">
            <asp:GridView ID="gvStudentEvents" runat="server" CssClass="table table-bordered" DataSourceID="dsStudentTravelEvent" OnPreRender="gvStudentEvents_PreRender" OnSelectedIndexChanged="gvStudentEvents_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="StudentID,EventID">
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="StudentID,EventID" DataNavigateUrlFormatString="StudentTravelEventsDetail.aspx?scode={0}&amp;ecode={1}&amp;act=&quot;r&quot;" Text="Select" />
                    <asp:BoundField DataField="Event_Name" HeaderText="Event_Name" SortExpression="Event_Name" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
                    <asp:BoundField DataField="Initial" HeaderText="Initial" SortExpression="Initial" />
                    <asp:BoundField DataField="ExpenseAmount" HeaderText="ExpenseAmount" SortExpression="ExpenseAmount" />
                    <asp:BoundField DataField="Expense_Status" HeaderText="Expense_Status" SortExpression="Expense_Status" />
                    <asp:BoundField DataField="StudentTravel_Status" HeaderText="StudentTravel_Status" SortExpression="StudentTravel_Status" />
                    <asp:BoundField DataField="Record_Status" HeaderText="Record_Status" SortExpression="Record_Status" />
                    <asp:BoundField DataField="created_by" HeaderText="created_by" SortExpression="created_by" />
                    <asp:BoundField DataField="creation_date" HeaderText="creation_date" SortExpression="creation_date" />
                    <asp:BoundField DataField="updated_by" HeaderText="updated_by" SortExpression="updated_by" />
                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" ReadOnly="True" SortExpression="StudentID" />
                    <asp:BoundField DataField="EventID" HeaderText="EventID" ReadOnly="True" SortExpression="EventID" />
                    <asp:HyperLinkField DataNavigateUrlFields="StudentID,EventID" DataNavigateUrlFormatString="StudentTravelEventsDetail.aspx?scode={0}&amp;ecode={1}&amp;act=&quot;u&quot;" Text="Edit" />
                    <asp:HyperLinkField DataNavigateUrlFields="StudentID,EventID" DataNavigateUrlFormatString="StudentTravelEventsDetail.aspx?scode={0}&amp;ecode={1}&amp;act=&quot;d&quot;" Text="Delete" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsStudentTravelEvent" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT UTM.TravelEvent.Event_Name, UTM.Student.Name, UTM.Student.Lastname, UTM.Student.Initial, UTM.StudentTravelEvent.ExpenseAmount, UTM.StudentTravelEvent.Expense_Status, UTM.StudentTravelEvent.StudentTravel_Status, UTM.StudentTravelEvent.Record_Status, UTM.StudentTravelEvent.created_by, UTM.StudentTravelEvent.creation_date, UTM.StudentTravelEvent.updated_by, UTM.TravelEvent.Location, UTM.StudentTravelEvent.StudentID, UTM.StudentTravelEvent.EventID FROM UTM.Student INNER JOIN UTM.StudentTravelEvent ON UTM.Student.StudentID = UTM.StudentTravelEvent.StudentID INNER JOIN UTM.TravelEvent ON UTM.StudentTravelEvent.EventID = UTM.TravelEvent.EventID WHERE  ( UTM.StudentTravelEvent.EventID LIKE  '%' + @parmEventID + '%') and ( UTM.StudentTravelEvent.StudentID LIKE  '%' + @parmStudentID + '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlTravelEvent" Name="parmEventID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddlStudentName" Name="parmStudentID" PropertyName="SelectedValue" />
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