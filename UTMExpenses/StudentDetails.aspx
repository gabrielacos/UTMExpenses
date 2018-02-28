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
    <div class="row">
        <div class="col-lg-12">
            <asp:Label ID="lblMessage" runat="server" Text="" CssClass="label label-info"></asp:Label>
            <asp:Label ID="lblInstructions" runat="server" Text="" CssClass="label label-info"></asp:Label>
        </div>
    </div>
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
    <div class="table table-hover table-striped grid-view">
        <asp:DetailsView ID="dvStudentsDetails" runat="server" Height="50px" Width="125px" CssClass="table table-bordered" DataSourceID="dsStudentDetails" AutoGenerateRows="False" DataKeyNames="StudentID" OnDataBound="dvStudentsDetails_DataBound" OnItemCommand="dvStudentsDetails_ItemCommand" OnItemDeleted="dvStudentsDetails_ItemDeleted" OnItemDeleting="dvStudentsDetails_ItemDeleting" OnItemInserting="dvStudentsDetails_ItemInserting" OnItemUpdated="dvStudentsDetails_ItemUpdated" OnItemUpdating="dvStudentsDetails_ItemUpdating" OnPreRender="dvStudentsDetails_PreRender" OnItemInserted="dvStudentsDetails_ItemInserted">
            <Fields>
                <asp:TemplateField HeaderText="StudentID" SortExpression="StudentID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("StudentID") %>'></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtStudentID" runat="server" Text='<%# Bind("StudentID") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtFName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Lastname" SortExpression="Lastname">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLName" runat="server" Text='<%# Bind("Lastname") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtLName" runat="server" Text='<%# Bind("Lastname") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Lastname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Initial" HeaderText="Initial" SortExpression="Initial" />
                <asp:TemplateField HeaderText="DOB" SortExpression="DOB">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDOB" runat="server" Text='<%# Bind("DOB") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtDOB" runat="server" Text='<%# Bind("DOB") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("DOB") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Country" SortExpression="Country">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCountry" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtCountry" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State" SortExpression="State">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtState" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtState" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City" SortExpression="City">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address_line1" SortExpression="Address_line1">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAddressLine" runat="server" Text='<%# Bind("Address_line1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtAddressLine" runat="server" Text='<%# Bind("Address_line1") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("Address_line1") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Address_line2" HeaderText="Address_line2" SortExpression="Address_line2" />
                <asp:TemplateField HeaderText="Zipcode" SortExpression="Zipcode">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtZipcode" runat="server" Text='<%# Bind("Zipcode") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtZipcode" runat="server" Text='<%# Bind("Zipcode") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Bind("Zipcode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Celular_Phone" SortExpression="Celular_Phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCelular" runat="server" Text='<%# Bind("Celular_Phone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtCelular" runat="server" Text='<%# Bind("Celular_Phone") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label15" runat="server" Text='<%# Bind("Celular_Phone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Institutional_Email" SortExpression="Institutional_Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Institutional_Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Institutional_Email") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label16" runat="server" Text='<%# Bind("Institutional_Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total_Amount_Received" SortExpression="Total_Amount_Received">
                    <EditItemTemplate>
                        <asp:Label ID="Label17" runat="server" Text='<%# Bind("Total_Amount_Received") %>'></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Label ID="Label17" runat="server" Text='<%# Bind("Total_Amount_Received") %>'></asp:Label>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label17" runat="server" Text='<%# Bind("Total_Amount_Received") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Record_Status" SortExpression="Record_Status">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlRecordStatus" runat="server" Text='<%# Bind("Record_Status") %>'>
                                <asp:ListItem Value="A">Active</asp:ListItem>
                                <asp:ListItem Value="I">Inactive</asp:ListItem>
                            </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Record_Status") %>'></asp:Label>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Record_Status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="created_by" SortExpression="created_by" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("created_by") %>'></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtcreatedby" runat="server" Text='<%# Bind("created_by") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("created_by") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="creation_date" SortExpression="creation_date" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("creation_date") %>'></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtCreationdate" runat="server" Text='<%# Bind("creation_date") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("creation_date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="updated_by" SortExpression="updated_by" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUpdatedby" runat="server" Text='<%# Bind("updated_by") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtUpdatedby" runat="server" Text='<%# Bind("updated_by") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("updated_by") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="update_date" SortExpression="update_date" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUpdatedate" runat="server" Text='<%# Bind("update_date") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtUpdatedate" runat="server" Text='<%# Bind("update_date") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("update_date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsStudentDetails" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT StudentID, Name, Lastname, Initial, DOB, Address_line1, Address_line2, City, State, Country, Zipcode, Celular_Phone, Institutional_Email, Total_Amount_Received, Record_Status, created_by, creation_date, updated_by, update_date FROM UTM.Student where StudentID=@StudentID" DeleteCommand="DELETE FROM UTM.[Student] WHERE [StudentID] = @StudentID" InsertCommand="INSERT INTO UTM.[Student] ([StudentID], [Name], [Lastname], [Initial], [DOB], [Address_line1], [Address_line2], [City], [State], [Country], [Zipcode], [Celular_Phone], [Institutional_Email], [Total_Amount_Received], [Record_Status], [created_by], [creation_date], [updated_by], [update_date]) VALUES (@StudentID, @Name, @Lastname, @Initial, @DOB, @Address_line1, @Address_line2, @City, @State, @Country, @Zipcode, @Celular_Phone, @Institutional_Email, @Total_Amount_Received, @Record_Status, @created_by, @creation_date, @updated_by, @update_date)" UpdateCommand="UPDATE UTM.[Student] SET [Name] = @Name, [Lastname] = @Lastname, [Initial] = @Initial, [DOB] = @DOB, [Address_line1] = @Address_line1, [Address_line2] = @Address_line2, [City] = @City, [State] = @State, [Country] = @Country, [Zipcode] = @Zipcode, [Celular_Phone] = @Celular_Phone, [Institutional_Email] = @Institutional_Email, [Total_Amount_Received] = @Total_Amount_Received, [Record_Status] = @Record_Status, [updated_by] = @updated_by, [update_date] = @update_date WHERE [StudentID] = @StudentID">
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
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Zipcode" Type="String" />
                <asp:Parameter Name="Celular_Phone" Type="String" />
                <asp:Parameter Name="Institutional_Email" Type="String" />
                <asp:Parameter Name="Total_Amount_Received" Type="Decimal" />
                <asp:Parameter Name="Record_Status" Type="String" />
                <asp:Parameter Name="created_by" Type="String" />
                <asp:Parameter DbType="Date" Name="creation_date" />
                <asp:Parameter Name="updated_by" Type="String" />
                <asp:Parameter DbType="Date" Name="update_date" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="StudentID" QueryStringField="ecode" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Lastname" Type="String" />
                <asp:Parameter Name="Initial" Type="String" />
                <asp:Parameter DbType="Date" Name="DOB" />
                <asp:Parameter Name="Address_line1" Type="String" />
                <asp:Parameter Name="Address_line2" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Zipcode" Type="String" />
                <asp:Parameter Name="Celular_Phone" Type="String" />
                <asp:Parameter Name="Institutional_Email" Type="String" />
                <asp:Parameter Name="Total_Amount_Received" Type="Decimal" />
                <asp:Parameter Name="Record_Status" Type="String" />
                <asp:Parameter Name="updated_by" Type="String" />
                <asp:Parameter DbType="Date" Name="update_date" />
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