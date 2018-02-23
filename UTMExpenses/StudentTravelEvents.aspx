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

    <script>$("#liTravelEvents").addClass("active");</script>
    <div class="row">

        <div class="col-lg-12">
            <h5>Select Events</h5>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-2">
            <asp:DropDownList ID="ddlTravelEvent" CssClass="dropdown dropdown-toggle" runat="server" AppendDataBoundItems="True" DataSourceID="dsddlTravelEvent" DataTextField="Event_Name" DataValueField="EventID">
                <asp:ListItem>Event</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="dsddlTravelEvent" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT UTM.StudentTravelEvent.EventID, UTM.TravelEvent.Event_Name FROM UTM.TravelEvent INNER JOIN UTM.StudentTravelEvent ON UTM.TravelEvent.EventID = UTM.StudentTravelEvent.EventID"></asp:SqlDataSource>
        </div>
        <div class="col-lg-10">
                    &nbsp;
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <asp:GridView ID="gvStudentEvents" runat="server" CssClass="table table-bordered" DataSourceID="dsStudentTravelEvent" OnPreRender="gvStudentEvents_PreRender" OnSelectedIndexChanged="gvStudentEvents_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsStudentTravelEvent" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT { fn CONCAT(UTM.Student.Name, '', UTM.Student.Initial, ' ', UTM.Student.Lastname) } AS Student_Name, UTM.TravelEvent.Event_Name, UTM.StudentTravelEvent.ExpenseAmount, UTM.StudentTravelEvent.Expense_Status, UTM.StudentTravelEvent.StudentTravel_Status, UTM.StudentTravelEvent.Record_Status, UTM.StudentTravelEvent.created_by, UTM.StudentTravelEvent.creation_date, UTM.StudentTravelEvent.updated_by, UTM.StudentTravelEvent.update_date FROM UTM.Student INNER JOIN UTM.StudentTravelEvent ON UTM.Student.StudentID = UTM.StudentTravelEvent.StudentID INNER JOIN UTM.TravelEvent ON UTM.StudentTravelEvent.EventID = UTM.TravelEvent.EventID
where  UTM.StudentTravelEvent.StudentID = @parmEventID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlTravelEvent" Name="parmEventID" PropertyName="SelectedValue" />
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