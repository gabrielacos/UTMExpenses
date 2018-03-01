<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EventbyType.aspx.cs" Inherits="UTMExpenses.EventbyType" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Message" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226">
        <LocalReport ReportPath="Report\Event By Location.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="EventByLocation" />
            </DataSources>
        </LocalReport>
</rsweb:ReportViewer>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="UTMExpenses.dsStudentTableAdapters.TravelEventTableAdapter" UpdateMethod="Update">
    <DeleteParameters>
        <asp:Parameter Name="Original_EventID" Type="Int32" />
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
        <asp:Parameter Name="StartDate" Type="DateTime" />
        <asp:Parameter Name="EndDate" Type="DateTime" />
        <asp:Parameter Name="AcademicSession" Type="String" />
        <asp:Parameter Name="Event_Status" Type="String" />
        <asp:Parameter Name="Record_Status" Type="String" />
        <asp:Parameter Name="created_by" Type="String" />
        <asp:Parameter Name="creation_date" Type="DateTime" />
        <asp:Parameter Name="updated_by" Type="String" />
    </InsertParameters>
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
        <asp:Parameter Name="StartDate" Type="DateTime" />
        <asp:Parameter Name="EndDate" Type="DateTime" />
        <asp:Parameter Name="AcademicSession" Type="String" />
        <asp:Parameter Name="Event_Status" Type="String" />
        <asp:Parameter Name="Record_Status" Type="String" />
        <asp:Parameter Name="created_by" Type="String" />
        <asp:Parameter Name="creation_date" Type="DateTime" />
        <asp:Parameter Name="updated_by" Type="String" />
        <asp:Parameter Name="Original_EventID" Type="Int32" />
    </UpdateParameters>
</asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
