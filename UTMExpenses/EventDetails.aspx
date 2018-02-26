﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EventDetails.aspx.cs" Inherits="UTMExpenses.EventDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Message" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblInstructions" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <script type="text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want to delete the record?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>

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
            <asp:DetailsView ID="dvEventDetails" CssClass="table table-bordered" runat="server" Height="50px" Width="125px" DataSourceID="dsEventDetails" AutoGenerateRows="False" DataKeyNames="EventID" OnItemDeleted="dvEventDetails_ItemDeleted" OnItemDeleting="dvEventDetails_ItemDeleting" OnItemInserting="dvEventDetails_ItemInserting" OnItemUpdated="dvEventDetails_ItemUpdated" OnItemUpdating="dvEventDetails_ItemUpdating" OnPreRender="dvEventDetails_PreRender" OnDataBound="dvEventDetails_DataBound" OnItemCommand="dvEventDetails_ItemCommand">
                <Fields>
                    <asp:TemplateField HeaderText="EventID" SortExpression="EventID">
                        <EditItemTemplate>
                            <asp:Label ID="eocde" runat="server" Text='<%# Eval("EventID") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtEcodeIn" runat="server" Text='<%# Bind("EventID") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("EventID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Event_Name" HeaderText="Event_Name" SortExpression="Event_Name" />
                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                    <asp:BoundField DataField="LocationType" HeaderText="LocationType" SortExpression="LocationType" />
                    <asp:BoundField DataField="EventType" HeaderText="EventType" SortExpression="EventType" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                    <asp:BoundField DataField="OrganizedByOrganization" HeaderText="OrganizedByOrganization" SortExpression="OrganizedByOrganization" />
                    <asp:BoundField DataField="EventURL" HeaderText="EventURL" SortExpression="EventURL" />
                    <asp:BoundField DataField="AcademicSession" HeaderText="AcademicSession" SortExpression="AcademicSession" />
                    <asp:TemplateField HeaderText="StartDate" SortExpression="StartDate">
                        <EditItemTemplate>
                            <asp:TextBox TextMode="Date" ID="TextBox1" runat="server" Text='<%# Bind("StartDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox TextMode="Date" ID="TextBox1" runat="server" Text='<%# Bind("StartDate") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("StartDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="EndDate" SortExpression="EndDate">
                        <EditItemTemplate>
                            <asp:TextBox TextMode="Date" ID="TextBox2" runat="server" Text='<%# Bind("EndDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox TextMode="Date" runat="server" Text='<%# Bind("EndDate") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("EndDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Event_Status" SortExpression="Event_Status">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEventStatus" runat="server" Text='<%# Bind("Event_Status") %>'>
                                <asp:ListItem Value="P">Pending</asp:ListItem>
                                <asp:ListItem Value="D">Done</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="ddlEventStatus" runat="server" Text='<%# Bind("Event_Status") %>'>
                                <asp:ListItem Value="P">Pending</asp:ListItem>
                                <asp:ListItem Value="D">Done</asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Event_Status") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Record_Status" SortExpression="Record_Status">
                        <EditItemTemplate>
                            <asp:DropDownList ID="TextBox4" runat="server" Text='<%# Bind("Record_Status") %>'>
                                <asp:ListItem Value="A"> Active </asp:ListItem>
                                <asp:ListItem Value="I">Inactive </asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="TextBox4" runat="server" Text='<%# Bind("Record_Status") %>'>
                                <asp:ListItem Value="A"> Active </asp:ListItem>
                                <asp:ListItem Value="I">Inactive </asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Record_Status") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="created_by" SortExpression="created_by">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtcreatedby" runat="server" Text='<%# Bind("created_by") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtcreatedby" runat="server" Text='<%# Bind("created_by") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("created_by") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="creation_date" SortExpression="creation_date">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtcreationdate" runat="server" Text='<%# Bind("creation_date") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtcreationdate" runat="server" Text='<%# Bind("creation_date") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("creation_date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="updated_by" SortExpression="updated_by">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtupdatedby" runat="server" Text='<%# Bind("updated_by") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtupdateby" runat="server" Text='<%# Bind("updated_by") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("updated_by") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="dsEventDetails" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" DeleteCommand="DELETE FROM [TravelEvent] WHERE [EventID] = @EventID" InsertCommand="INSERT INTO UTM.TravelEvent(Event_Name, Location, LocationType, EventType, City, State, Country, OrganizedByOrganization, EventURL, StartDate, EndDate, AcademicSession, Event_Status, Record_Status, created_by, creation_date, updated_by, update_date) VALUES (@Event_Name, @Location, @LocationType, @EventType, @City, @State, @Country, @OrganizedByOrganization, @EventURL, @StartDate, @EndDate, @AcademicSession, @Event_Status, @Record_Status, @created_by, @creation_date, @updated_by, @update_date)" SelectCommand="SELECT EventID, Event_Name, Location, LocationType, EventType, City, State, Country, OrganizedByOrganization, EventURL, StartDate, EndDate, AcademicSession, Event_Status, Record_Status, created_by, creation_date, updated_by FROM UTM.TravelEvent WHERE (EventID = @EventID)" UpdateCommand="UPDATE UTM.TravelEvent SET Event_Name = @Event_Name, Location = @Location, LocationType = @LocationType, EventType = @EventType, City = @City, State = @State, Country = @Country, OrganizedByOrganization = @OrganizedByOrganization, EventURL = @EventURL, StartDate = @StartDate, EndDate = @EndDate, AcademicSession = @AcademicSession, Event_Status = @Event_Status, Record_Status = @Record_Status, created_by = @created_by, creation_date = @creation_date, updated_by = @updated_by, update_date = @update_date WHERE (EventID = @EventID)">
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
                    <asp:Parameter Name="created_by" />
                    <asp:Parameter Name="creation_date" />
                    <asp:Parameter Name="updated_by" />
                    <asp:Parameter Name="update_date" />
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
                    <asp:Parameter Name="created_by" />
                    <asp:Parameter Name="creation_date" />
                    <asp:Parameter Name="updated_by" />
                    <asp:Parameter Name="update_date" />
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