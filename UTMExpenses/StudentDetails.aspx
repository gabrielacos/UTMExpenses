<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="StudentDetails.aspx.cs" Inherits="UTMExpenses.StudentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">
    <!-- Students
a. You must design windows that will allow the users to display all values for the
Student table, or a specific Student, add a new Student, delete and modify an
existing Student, and calculate and display total count of the displayed Students.
b. You must design a Report that lists All the Students (alphabetical order by last
name) by major and year of study.-->
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
    </div>
    <div class="col-lg-8">
        <asp:DetailsView ID="dvStudentsDetails" runat="server" Height="50px" Width="125px" CssClass="table table-bordered" AllowPaging="True" DataSourceID="dsStudentDetails" AutoGenerateRows="False" DataKeyNames="StudentID">
            <Fields>
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" ReadOnly="True" SortExpression="StudentID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
                <asp:BoundField DataField="Initial" HeaderText="Initial" SortExpression="Initial" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="Address_line1" HeaderText="Address_line1" SortExpression="Address_line1" />
                <asp:BoundField DataField="Address_line2" HeaderText="Address_line2" SortExpression="Address_line2" />
                <asp:BoundField DataField="Record_Status" HeaderText="Record_Status" SortExpression="Record_Status" />
                <asp:BoundField DataField="Total_Amount_Received" HeaderText="Total_Amount_Received" SortExpression="Total_Amount_Received" />
                <asp:BoundField DataField="Institutional_Email" HeaderText="Institutional_Email" SortExpression="Institutional_Email" />
                <asp:BoundField DataField="Celular_Phone" HeaderText="Celular_Phone" SortExpression="Celular_Phone" />
                <asp:BoundField DataField="Zipcode" HeaderText="Zipcode" SortExpression="Zipcode" />
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsStudentDetails" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT StudentID, Name, Lastname, Initial, DOB, Address_line1, Address_line2, Record_Status, Total_Amount_Received, Institutional_Email, Celular_Phone, Zipcode, Country, State, City FROM UTM.Student" DeleteCommand="DELETE FROM [ UTM.Student] WHERE [StudentID] = @StudentID" InsertCommand="INSERT INTO [Student] ([StudentID], [Name], [Lastname], [Initial], [DOB], [Address_line1], [Address_line2], [Record_Status], [Total_Amount_Received], [Institutional_Email], [Celular_Phone], [Zipcode], [Country], [State], [City]) VALUES (@StudentID, @Name, @Lastname, @Initial, @DOB, @Address_line1, @Address_line2, @Record_Status, @Total_Amount_Received, @Institutional_Email, @Celular_Phone, @Zipcode, @Country, @State, @City)" UpdateCommand="UPDATE [Student] SET [Name] = @Name, [Lastname] = @Lastname, [Initial] = @Initial, [DOB] = @DOB, [Address_line1] = @Address_line1, [Address_line2] = @Address_line2, [Record_Status] = @Record_Status, [Total_Amount_Received] = @Total_Amount_Received, [Institutional_Email] = @Institutional_Email, [Celular_Phone] = @Celular_Phone, [Zipcode] = @Zipcode, [Country] = @Country, [State] = @State, [City] = @City WHERE [StudentID] = @StudentID">
            <DeleteParameters>
                <asp:Parameter Name="StudentID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StudentID" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Lastname" Type="String" />
                <asp:Parameter Name="Initial" Type="String" />
                <asp:Parameter DbType="Date" Name="DOB" />
                <asp:Parameter Name="Address_line1" Type="String" />
                <asp:Parameter Name="Address_line2" Type="String" />
                <asp:Parameter Name="Record_Status" Type="String" />
                <asp:Parameter Name="Total_Amount_Received" Type="Decimal" />
                <asp:Parameter Name="Institutional_Email" Type="String" />
                <asp:Parameter Name="Celular_Phone" Type="String" />
                <asp:Parameter Name="Zipcode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="City" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Lastname" Type="String" />
                <asp:Parameter Name="Initial" Type="String" />
                <asp:Parameter DbType="Date" Name="DOB" />
                <asp:Parameter Name="Address_line1" Type="String" />
                <asp:Parameter Name="Address_line2" Type="String" />
                <asp:Parameter Name="Record_Status" Type="String" />
                <asp:Parameter Name="Total_Amount_Received" Type="Decimal" />
                <asp:Parameter Name="Institutional_Email" Type="String" />
                <asp:Parameter Name="Celular_Phone" Type="String" />
                <asp:Parameter Name="Zipcode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="StudentID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div class="col-lg-2">
        &nbsp;
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>