<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EventDetails.aspx.cs" Inherits="UTMExpenses.EventDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Message" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">

    <div class="row">
        <div class="col-lg-8">
            <h1>Events Details</h1>
        </div>
        <div class="col-lg-4">
            <asp:Image ID="Image1" runat="server" Height="60px" Width="59px" ImageUrl="~/Resources/Logo.png" />
        </div>
    </div>
    <div class="row">
        <div class="col-lg-2">
            &nbsp;
        </div>
        <div class="col-lg-8">
            <asp:DetailsView ID="dvEventsDetails" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="SqlDataSource1">
                <Fields>
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
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT Event_Name, Location, LocationType, EventType, City, State, Country, OrganizedByOrganization, EventURL, StartDate, EndDate, AcademicSession, Event_Status, Record_Status, created_by, creation_date, updated_by FROM UTM.TravelEvent WHERE @parmEventID) " InsertCommand="INSERT INTO UTM.TravelEvent(Event_Name, Location, LocationType, EventType, City, State, Country, OrganizedByOrganization, EventURL, StartDate, EndDate, AcademicSession, Event_Status, Record_Status, created_by, creation_date, updated_by, update_date) VALUES ('INS_EVENT_NAME', 'INS_LOCATEION', 'INS_LOCATIONTYPE', @INSEVENTTYPE, @INSCITY, @INSSTATE, @INSCOUNTRY, '@INSORGANIZATION', @INSEVENTURL, @INSSTARTDATE, @ENDDATE, @ACADEMISSSESION, @EVENT_STATUS, @RECORD_STATUS, @CREATED_BY, @CREATION_DATE, @UPDATED_BY, @UPDATE_DATE)">
                <InsertParameters>
                    <asp:Parameter Name="INSEVENTTYPE" />
                    <asp:Parameter Name="INSCITY" />
                    <asp:Parameter Name="INSSTATE" />
                    <asp:Parameter Name="INSCOUNTRY" />
                    <asp:Parameter Name="INSEVENTURL" />
                    <asp:Parameter Name="INSSTARTDATE" />
                    <asp:Parameter Name="ENDDATE" />
                    <asp:Parameter Name="ACADEMISSSESION" />
                    <asp:Parameter Name="EVENT_STATUS" />
                    <asp:Parameter Name="RECORD_STATUS" />
                    <asp:Parameter Name="CREATED_BY" />
                    <asp:Parameter Name="CREATION_DATE" />
                    <asp:Parameter Name="UPDATED_BY" />
                    <asp:Parameter Name="UPDATE_DATE" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="parmEventID" SessionField="ssEventID" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-lg-2">
            &nbsp;
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>