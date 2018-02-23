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
        <asp:DetailsView ID="dvStudentsDetails" runat="server" Height="50px" Width="125px" CssClass="table table-bordered" AllowPaging="True" DataSourceID="dsStudentDetails"></asp:DetailsView>
        <asp:SqlDataSource ID="dsStudentDetails" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT Name, Lastname, Initial, DOB, Address_line1, Address_line2, City, State, Country, Zipcode, Celular_Phone, Institutional_Email, Total_Amount_Received, Record_Status, created_by, creation_date, updated_by, update_date FROM UTM.Student WHERE (SutendID = @parmStudentsID)">
            <SelectParameters>
                <asp:SessionParameter Name="parmStudentsID" SessionField="ssStudents" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="col-lg-2">
        &nbsp;
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>