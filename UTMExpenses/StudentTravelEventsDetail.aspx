<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="StudentTravelEventsDetail.aspx.cs" Inherits="UTMExpenses.StudentTravelEventsDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheet" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Message" runat="server">
    <asp:Label runat="server" ID="lblMessage" CssClass="label label-info"></asp:Label>
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
            <asp:DetailsView ID="dlStudentTravelEvents" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="StudentID,EventID" DataSourceID="dsTravelEvents" OnDataBound="dlStudentTravelEvents_DataBound" OnItemDeleted="dlStudentTravelEvents_ItemDeleted" OnItemDeleting="dlStudentTravelEvents_ItemDeleting" OnItemInserted="dlStudentTravelEvents_ItemInserted" OnItemInserting="dlStudentTravelEvents_ItemInserting" OnItemUpdated="dlStudentTravelEvents_ItemUpdated" OnItemUpdating="dlStudentTravelEvents_ItemUpdating" OnPreRender="dlStudentTravelEvents_PreRender" OnItemCommand="dlStudentTravelEvents_ItemCommand">
                <Fields>
                    <asp:TemplateField HeaderText="StudentID" SortExpression="StudentID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlStudentID" DataSourceID="dsStudentID" DataTextField="Name" DataValueField="StudentID" SelectedValue='<%# Bind("StudentID") %>' runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="ddlStudentID" DataSourceID="dsStudentID" DataTextField="Name" DataValueField="StudentID" SelectedValue='<%# Bind("StudentID") %>' runat="server"></asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="EventID" SortExpression="EventID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEventID" DataSourceID="dsEvents" DataTextField="Event_Name" DataValueField="EventID" SelectedValue='<%# Bind("EventID") %>' runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="ddlEventID" DataSourceID="dsEvents" DataTextField="Event_Name" DataValueField="EventID" SelectedValue='<%# Bind("EventID") %>' runat="server"></asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("EventID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ExpenseAmount" SortExpression="ExpenseAmount">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtExpenseAmount" runat="server" Text='<%# Bind("ExpenseAmount") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtExpenseAmount" runat="server" Text='<%# Bind("ExpenseAmount") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("ExpenseAmount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Expense_Status" SortExpression="Expense_Status">
                        <EditItemTemplate>
                            <asp:Label ID="lblExpenseStatus" runat="server" Text='<%# Bind("Expense_Status") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Label ID="lblExpenseStatus" runat="server" Text='<%# Bind("Expense_Status") %>'></asp:Label>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblExpenseStatus" runat="server" Text='<%# Bind("Expense_Status") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="StudentTravel_Status" SortExpression="StudentTravel_Status">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlStudentTravelStatus" runat="server" Text='<%# Bind("StudentTravel_Status") %>'>
                                <asp:ListItem Value="P">Pending</asp:ListItem>
                                <asp:ListItem Value="D">Done</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="ddlStudentTravelStatus" runat="server" Text='<%# Bind("StudentTravel_Status") %>'>
                                <asp:ListItem Value="P">Pending</asp:ListItem>
                                <asp:ListItem Value="D">Done</asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("StudentTravel_Status") %>'></asp:Label>
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
                    <asp:TemplateField HeaderText="created_by" SortExpression="created_by">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtcreatedby" runat="server" Text='<%# Bind("created_by") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtcreatedby" runat="server" Text='<%# Bind("created_by") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("created_by") %>'></asp:Label>
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
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("creation_date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="updated_by" SortExpression="updated_by">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUpdatedby" runat="server" Text='<%# Bind("updated_by") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtUpdatedby" runat="server" Text='<%# Bind("updated_by") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("updated_by") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="update_date" SortExpression="update_date">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUpdatedate" runat="server" Text='<%# Bind("update_date") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtUpdatedate" runat="server" Text='<%# Bind("update_date") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("update_date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="dsStudentID" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT Name, StudentID FROM UTM.Student"></asp:SqlDataSource>
            <asp:SqlDataSource ID="dsEvents" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" SelectCommand="SELECT EventID, Event_Name FROM UTM.TravelEvent"></asp:SqlDataSource>
            <asp:SqlDataSource ID="dsTravelEvents" runat="server" ConnectionString="<%$ ConnectionStrings:connctrionstringdbUMTExpenses %>" DeleteCommand="DELETE FROM UTM.StudentTravelEvent WHERE (StudentID = @StudentID) AND (EventID = @EventID)" InsertCommand="INSERT INTO UTM.StudentTravelEvent(StudentID, EventID, ExpenseAmount, Expense_Status, StudentTravel_Status, Record_Status, created_by, creation_date, updated_by, update_date) VALUES (@StudentID, @EventID, @ExpenseAmount, @Expense_Status, @StudentTravel_Status, @Record_Status, @created_by, @creation_date, @updated_by, @update_date)" SelectCommand="SELECT StudentID, EventID, ExpenseAmount, Expense_Status, StudentTravel_Status, Record_Status, created_by, creation_date, updated_by, update_date FROM UTM.StudentTravelEvent
Where StudentID=@StudentID and EventID=@EventID"
                UpdateCommand="UPDATE UTM.StudentTravelEvent SET ExpenseAmount = @ExpenseAmount, Expense_Status = @Expense_Status, StudentTravel_Status = @StudentTravel_Status, Record_Status = @Record_Status, updated_by = @updated_by, update_date = @update_date WHERE (StudentID = @StudentID) AND (EventID = @EventID)">
                <DeleteParameters>
                    <asp:Parameter Name="StudentID" Type="String" />
                    <asp:Parameter Name="EventID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="StudentID" Type="String" />
                    <asp:Parameter Name="EventID" Type="Int32" />
                    <asp:Parameter Name="ExpenseAmount" Type="Decimal" />
                    <asp:Parameter Name="Expense_Status" Type="String" />
                    <asp:Parameter Name="StudentTravel_Status" Type="String" />
                    <asp:Parameter Name="Record_Status" Type="String" />
                    <asp:Parameter Name="created_by" Type="String" />
                    <asp:Parameter DbType="Date" Name="creation_date" />
                    <asp:Parameter Name="updated_by" Type="String" />
                    <asp:Parameter DbType="Date" Name="update_date" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="StudentID" QueryStringField="scode" />
                    <asp:QueryStringParameter Name="EventID" QueryStringField="ecode" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ExpenseAmount" Type="Decimal" />
                    <asp:Parameter Name="Expense_Status" Type="String" />
                    <asp:Parameter Name="StudentTravel_Status" Type="String" />
                    <asp:Parameter Name="Record_Status" Type="String" />
                    <asp:Parameter Name="updated_by" Type="String" />
                    <asp:Parameter Name="update_date" DbType="Date" />
                    <asp:Parameter Name="StudentID" Type="String" />
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