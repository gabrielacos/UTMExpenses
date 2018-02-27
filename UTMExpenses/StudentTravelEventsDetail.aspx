<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="StudentTravelEventsDetail.aspx.cs" Inherits="UTMExpenses.StudentTravelEventsDetail" %>

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
            <asp:DetailsView ID="dlStudentTravelEvents" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="EventID,StudentID" DataSourceID="dsStudentTravelEvents">
                <Fields>
                    <asp:BoundField DataField="EventID" HeaderText="EventID" ReadOnly="True" SortExpression="EventID" />
                    <asp:BoundField DataField="StudentTravel_Status" HeaderText="StudentTravel_Status" SortExpression="StudentTravel_Status" />
                    <asp:BoundField DataField="Record_Status" HeaderText="Record_Status" SortExpression="Record_Status" />
                    <asp:BoundField DataField="created_by" HeaderText="created_by" SortExpression="created_by" />
                    <asp:BoundField DataField="creation_date" HeaderText="creation_date" SortExpression="creation_date" />
                    <asp:BoundField DataField="updated_by" HeaderText="updated_by" SortExpression="updated_by" />
                    <asp:BoundField DataField="update_date" HeaderText="update_date" SortExpression="update_date" />
                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" ReadOnly="True" SortExpression="StudentID" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="dsStudentTravelEvents" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" DeleteCommand="DELETE FROM [UTM ][StudentTravelEvent] WHERE [EventID] = @EventID AND [StudentID] = @StudentID" InsertCommand="INSERT INTO [URM].[StudentTravelEvent] ([EventID], [StudentTravel_Status], [Record_Status], [created_by], [creation_date], [updated_by], [update_date], [StudentID]) VALUES (@EventID, @StudentTravel_Status, @Record_Status, @created_by, @creation_date, @updated_by, @update_date, @StudentID)" SelectCommand="SELECT UTM.StudentTravelEvent.StudentTravel_Status, UTM.StudentTravelEvent.Record_Status, UTM.StudentTravelEvent.created_by, UTM.StudentTravelEvent.creation_date, UTM.StudentTravelEvent.updated_by, UTM.StudentTravelEvent.update_date, UTM.Student.Name, UTM.Student.Lastname, UTM.Student.Initial, UTM.TravelEvent.Event_Name, UTM.StudentTravelEvent.Expense_Status FROM UTM.StudentTravelEvent INNER JOIN UTM.TravelEvent ON UTM.StudentTravelEvent.EventID = UTM.TravelEvent.EventID INNER JOIN UTM.Student ON UTM.StudentTravelEvent.StudentID = UTM.Student.StudentID" UpdateCommand="UPDATE [UTM].[StudentTravelEvent] SET [StudentTravel_Status] = @StudentTravel_Status, [Record_Status] = @Record_Status, [created_by] = @created_by, [creation_date] = @creation_date, [updated_by] = @updated_by, [update_date] = @update_date WHERE [EventID] = @EventID AND [StudentID] = @StudentID">
                <DeleteParameters>
                    <asp:Parameter Name="EventID" Type="Int32" />
                    <asp:Parameter Name="StudentID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EventID" Type="Int32" />
                    <asp:Parameter Name="StudentTravel_Status" Type="String" />
                    <asp:Parameter Name="Record_Status" Type="String" />
                    <asp:Parameter Name="created_by" Type="String" />
                    <asp:Parameter DbType="Date" Name="creation_date" />
                    <asp:Parameter Name="updated_by" Type="String" />
                    <asp:Parameter DbType="Date" Name="update_date" />
                    <asp:Parameter Name="StudentID" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StudentTravel_Status" Type="String" />
                    <asp:Parameter Name="Record_Status" Type="String" />
                    <asp:Parameter Name="created_by" Type="String" />
                    <asp:Parameter DbType="Date" Name="creation_date" />
                    <asp:Parameter Name="updated_by" Type="String" />
                    <asp:Parameter DbType="Date" Name="update_date" />
                    <asp:Parameter Name="EventID" Type="Int32" />
                    <asp:Parameter Name="StudentID" Type="String" />
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