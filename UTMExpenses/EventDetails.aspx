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
            <asp:DetailsView ID="dvEventDetails" CssClass="table table-bordered" runat="server" Height="50px" Width="125px" AllowPaging="True" DataSourceID="dsEventDetails" AutoGenerateRows="False" DataKeyNames="EventID">
                <Fields>
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
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="dsEventDetails" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" DeleteCommand="DELETE FROM [TravelEvent] WHERE [EventID] = @EventID" InsertCommand="INSERT INTO [TravelEvent] ([Event_Name], [Location], [LocationType], [EventType], [City], [State], [Country], [OrganizedByOrganization], [EventURL], [StartDate], [EndDate], [AcademicSession], [Event_Status], [Record_Status]) VALUES (@Event_Name, @Location, @LocationType, @EventType, @City, @State, @Country, @OrganizedByOrganization, @EventURL, @StartDate, @EndDate, @AcademicSession, @Event_Status, @Record_Status)" SelectCommand="SELECT EventID, Event_Name, Location, LocationType, EventType, City, State, Country, OrganizedByOrganization, EventURL, StartDate, EndDate, AcademicSession, Event_Status, Record_Status FROM UTM.TravelEvent WHERE (EventID = @EventID)" UpdateCommand="UPDATE [TravelEvent] SET [Event_Name] = @Event_Name, [Location] = @Location, [LocationType] = @LocationType, [EventType] = @EventType, [City] = @City, [State] = @State, [Country] = @Country, [OrganizedByOrganization] = @OrganizedByOrganization, [EventURL] = @EventURL, [StartDate] = @StartDate, [EndDate] = @EndDate, [AcademicSession] = @AcademicSession, [Event_Status] = @Event_Status, [Record_Status] = @Record_Status WHERE [EventID] = @EventID">
                <DeleteParameters>
                    <asp:Parameter Name="EventID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Event_Name" Type="String" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="LocationType" Type="String" />
                    <asp:Parameter Name="EventType" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="OrganizedByOrganization" Type="String" />
                    <asp:Parameter Name="EventURL" Type="String" />
                    <asp:Parameter DbType="Date" Name="StartDate" />
                    <asp:Parameter DbType="Date" Name="EndDate" />
                    <asp:Parameter Name="AcademicSession" Type="String" />
                    <asp:Parameter Name="Event_Status" Type="String" />
                    <asp:Parameter Name="Record_Status" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="EventID" SessionField="ssEventID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Event_Name" Type="String" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="LocationType" Type="String" />
                    <asp:Parameter Name="EventType" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="OrganizedByOrganization" Type="String" />
                    <asp:Parameter Name="EventURL" Type="String" />
                    <asp:Parameter DbType="Date" Name="StartDate" />
                    <asp:Parameter DbType="Date" Name="EndDate" />
                    <asp:Parameter Name="AcademicSession" Type="String" />
                    <asp:Parameter Name="Event_Status" Type="String" />
                    <asp:Parameter Name="Record_Status" Type="String" />
                    <asp:Parameter Name="EventID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-lg-2">
            &nbsp;
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>