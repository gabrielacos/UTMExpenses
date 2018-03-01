<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="UTMExpenses.Details" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=14.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Message" runat="server">
    <asp:Label ID="lblMessage" runat="server" Text="" CssClass="label label-info"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>

    <div class="row">
        <div class="">
            <h1 style="text-align: center;">Students

                <asp:Image ID="Image3" runat="server" Height="80px" ImageUrl="Resources/Logo.png" Width="79px" />
            </h1>
        </div>
    </div>

    <script>$("#liStudents").addClass("active");</script>
    <div class="event-title">
        <h3>Select Student</h3>
    </div>
    <div class="flex-container">

        <asp:Button CssClass="btn btn-primary" ID="btnInformeEstudiante" runat="server" OnClick="btnInformeEstudiante_Click" text-="Alphabetical Form" />
    </div>

    <div class="flex-container">
        <div class="create-button">
            <asp:Button ID="btnRegisterStudent" runat="server" Text="Register New Student" CssClass="btn btn-primary" OnClick="btnRegisterStudent_Click" />
        </div>
        <div class="drop-down dropdown">
            <div class="dropdown show">
                <asp:DropDownList ID="ddlStudent" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="ddlDSdropdownlist" DataTextField="Name" DataValueField="StudentID">
                    <asp:ListItem Value="%">Select All</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="ddlDSdropdownlist" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT DISTINCT StudentID, Name, Lastname, Initial FROM UTM.Student"></asp:SqlDataSource>
            </div>
        </div>
    </div>

    <div class="">
        <div class="table table-hover table-striped grid-view">
            <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID" DataSourceID="dsUTMStudents" CssClass="table table-bordered" AllowPaging="True">
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="StudentID" DataNavigateUrlFormatString="StudentDetails.aspx?ecode={0}&amp;act=&quot;r&quot;" Text="Select" />
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
                    <asp:BoundField DataField="created_by" HeaderText="created_by" SortExpression="created_by" />
                    <asp:BoundField DataField="creation_date" HeaderText="creation_date" SortExpression="creation_date" />
                    <asp:BoundField DataField="updated_by" HeaderText="updated_by" SortExpression="updated_by" />
                    <asp:BoundField DataField="update_date" HeaderText="update_date" SortExpression="update_date" />
                    <asp:HyperLinkField DataNavigateUrlFields="StudentID" DataNavigateUrlFormatString="StudentDetails.aspx?ecode={0}&amp;act=u" Text="Edit" />
                    <asp:HyperLinkField DataNavigateUrlFields="StudentID" DataNavigateUrlFormatString="StudentDetails.aspx?ecode={0}&amp;act=&quot;d&quot;" Text="Delete" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsUTMStudents" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT [StudentID], [Name], [Lastname], [Initial], [DOB], [Address_line1], [Address_line2], [Record_Status], [Total_Amount_Received], [Institutional_Email], [Celular_Phone], [Zipcode], [Country], [State], [City], [created_by], [creation_date], [updated_by], [update_date] FROM [UTM].[Student]
 WHERE StudentID LIKE '%' + @parmStudentID+ '%'">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlStudent" Name="parmStudentID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-2">
         <h2>  <asp:Label runat="server" CssClass="label label-info" Text="Total Student Displayed "></asp:Label></h2>
        </div>
        <!-- Text and a Label Control to display totals -->
        <div class="col-lg-8">

          <h2>  <asp:Label ID="lblTotal" CssClass="label label-info" runat="server"></asp:Label></h2>
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