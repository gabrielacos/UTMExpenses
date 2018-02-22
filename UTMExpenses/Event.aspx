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
        <div class="col-lg-10">
            <h1>Events</h1>
        </div>

        <div class="col-lg-2">
            <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl="Resources/Logo.png" Width="79px" />
        </div>
    </div>

    <script>$("#liEvents").addClass("active");</script>
    <div class="row">

        <div class="col-lg-8">
            <h5>Select Events</h5>
        </div>
        <div class="col-lg-4">
            <asp:Button ID="btnCreateEvent" runat="server" Text="Create New Event" OnClick="btnCreateEvent_Click" CssClass="btn btn-primary" />
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <asp:DropDownList ID="ddlEvents" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="ddlSpecificEvent" DataTextField="Event_Name" DataValueField="EventID">
                <asp:ListItem Value="%">Select All</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="ddlSpecificEvent" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT EventID, Event_Name FROM UTM.TravelEvent"></asp:SqlDataSource>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">

            <asp:GridView ID="gvEvents" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="EventID" DataSourceID="gvEventDataSource" OnSelectedIndexChanged="gvEvents_SelectedIndexChanged" OnPreRender="gvEvents_PreRender">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="EventID" HeaderText="EventID" InsertVisible="False" ReadOnly="True" SortExpression="EventID" />
                    <asp:BoundField DataField="Event_Name" HeaderText="Event_Name" SortExpression="Event_Name" />
                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                    <asp:BoundField DataField="LocationType" HeaderText="LocationType" SortExpression="LocationType" />
                    <asp:BoundField DataField="EventType" HeaderText="EventType" SortExpression="EventType" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                    <asp:BoundField DataField="OrganizedByOrganization" HeaderText="OrganizedByOrganization" SortExpression="OrganizedByOrganization" />
                    <asp:BoundField DataField="EventURL" HeaderText="EventURL" SortExpression="EventURL" />
                    <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
                    <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
                    <asp:BoundField DataField="AcademicSession" HeaderText="AcademicSession" SortExpression="AcademicSession" />
                    <asp:BoundField DataField="Event_Status" HeaderText="Event_Status" SortExpression="Event_Status" />
                    <asp:BoundField DataField="Record_Status" HeaderText="Record_Status" SortExpression="Record_Status" />
                    <asp:BoundField DataField="created_by" HeaderText="created_by" SortExpression="created_by" />
                    <asp:BoundField DataField="creation_date" HeaderText="creation_date" SortExpression="creation_date" />
                    <asp:BoundField DataField="updated_by" HeaderText="updated_by" SortExpression="updated_by" />
                    <asp:BoundField DataField="update_date" HeaderText="update_date" SortExpression="update_date" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="gvEventDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT EventID, Event_Name, Location, LocationType, EventType, City, State, Country, OrganizedByOrganization, EventURL, StartDate, EndDate, AcademicSession, Event_Status, Record_Status, created_by, creation_date, updated_by, update_date FROM UTM.TravelEvent WHERE (EventID LIKE '%' + @parmEventID + '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlEvents" Name="parmEventID" PropertyName="SelectedValue" />
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