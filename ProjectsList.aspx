<%@ Page Title="Проекты" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectsList.aspx.cs" Inherits="taskForROI.ProjectList" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
     <div>
         <h2><%: Title %></h2>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProjectId" DataSourceID="ProjectsSDS" ShowFooter="True" CssClass="table table-hover" OnRowCommand="GridView1_RowCommand" >
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" ValidationGroup="updateGroup" CommandName="Update" Text="Обновить"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отменить"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Правка"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server"  CausesValidation="False" CommandName="Delete" Text="Удалить" OnClientClick="return confirm('Вы уверены, что хотите удалить эту запись?');"></asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ValidationGroup="addGroup" ID="LinkButton3" runat="server" CommandName="Insert">Добавить</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ProjectId" HeaderText="ProjectId" InsertVisible="False" ReadOnly="True" SortExpression="ProjectId" Visible="False" />
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox1" ErrorMessage="Заполните поле 'Name' для правки" ForeColor="red" ID="rfvupdateName" runat="server" Text="*" ValidationGroup="updateGroup"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox1" ErrorMessage="Поле 'Name' должно содержать от 5 до 20 букв или цифр" ID="regexpupdateName" runat="server" Text="*" ValidationExpression="^[a-zа-яА-ЯA-Z0-9_\s]*$" ValidationGroup="updateGroup"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"  Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="addName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="addName" ErrorMessage="Заполните поле 'Name'" ForeColor="red" ID="rfvName" runat="server" Text="*" ValidationGroup="addGroup"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ControlToValidate="addName" ErrorMessage="Поле 'Name' должно содержать от 5 до 20 букв или цифр" ID="regexpAddName" runat="server" Text="*" ValidationExpression="^[a-zа-яА-ЯA-Z0-9_\s]*$" ValidationGroup="addGroup"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Start date"  SortExpression="StartDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" type="text" Text='<%# Bind("StartDate","{0:dd.MM.yyyy}") %>'></asp:TextBox>
                        <asp:CompareValidator ControlToValidate="TextBox2" ErrorMessage="Введите корректную дату dd.mm.yyyy для правки" ID="CompareValidatorTextBox2" Operator="DataTypeCheck" runat="server"  Text="*" ForeColor="red" Type="Date" ValidationGroup="updateGroup"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox2" ErrorMessage="Заполните поле 'StartDate' для правки" ForeColor="red" ID="rfvTextBox2" runat="server" Text="*" ValidationGroup="updateGroup"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("StartDate","{0:dd.MM.yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="addStartDate" type="date" placeholder="e.g. 31.12.2014" runat="server"></asp:TextBox>
                        <asp:CompareValidator ControlToValidate="addStartDate" ErrorMessage="Введите корректную дату dd.mm.yyyy" ID="CompareValidator1" Operator="DataTypeCheck" runat="server"  Text="*" ForeColor="red" Type="Date" ValidationGroup="addGroup"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ControlToValidate="addStartDate" ErrorMessage="Заполните поле 'StartDate'" ForeColor="red" ID="rfvStartDate" runat="server" Text="*" ValidationGroup="addGroup">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="End date" SortExpression="EndDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" type="text" runat="server" Text='<%# Bind("EndDate","{0:dd.MM.yyyy}") %>'></asp:TextBox>
                        <asp:CompareValidator ControlToValidate="TextBox3" ErrorMessage="Введите корректную дату dd.mm.yyyy для правки" ID="CompareValidatorTextBox3" Operator="DataTypeCheck" runat="server"  Text="*" ForeColor="red" Type="Date" ValidationGroup="updateGroup"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox3" ErrorMessage="Заполните поле 'EndDate' для правки" ForeColor="red" ID="rfvTextBox3" runat="server" Text="*" ValidationGroup="updateGroup"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("EndDate","{0:dd.MM.yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="addEndDate" type="date" placeholder="e.g. 31.12.2014" runat="server"></asp:TextBox>
                        <asp:CompareValidator ControlToValidate="addEndDate" ErrorMessage="Введите корректную дату dd.mm.yyyy" ID="CompareValidator2" Operator="DataTypeCheck" runat="server"  Text="*" ForeColor="red" Type="Date" ValidationGroup="addGroup"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ControlToValidate="addEndDate" ErrorMessage="Заполните поле 'EndDate'" ForeColor="red" ID="rfvEndDate" runat="server" Text="*" ValidationGroup="addGroup"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Estimated revenue" SortExpression="EstimatedRevenue">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("EstimatedRevenue") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("EstimatedRevenue") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="addEstimatedRevenue" type="text" placeholder="e.g. 2000,50" runat="server"></asp:TextBox>
                        <asp:CompareValidator ControlToValidate="addEstimatedRevenue" ErrorMessage="Заполните поле Estimated Revenue корректно (e.g 12,50)" ID="CompareValidator3" Operator="DataTypeCheck" runat="server"  Text="*" ForeColor="red" Type="Double" ValidationGroup="addGroup"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ControlToValidate="addEstimatedRevenue" ErrorMessage="Заполните поле 'Estimated Revenue'" ForeColor="red" ID="rfvEstimatedRevenue" runat="server" Text="*" ValidationGroup="addGroup"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
         </asp:GridView>
         <asp:SqlDataSource ID="ProjectsSDS" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Projects] WHERE [ProjectId] = @original_ProjectId AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([EstimatedRevenue] = @original_EstimatedRevenue) OR ([EstimatedRevenue] IS NULL AND @original_EstimatedRevenue IS NULL))" InsertCommand="INSERT INTO [Projects] ([Name], [StartDate], [EndDate], [EstimatedRevenue]) VALUES (@Name, @StartDate, @EndDate, @EstimatedRevenue)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Projects]" UpdateCommand="UPDATE [Projects] SET [Name] = @Name, [StartDate] = @StartDate, [EndDate] = @EndDate, [EstimatedRevenue] = @EstimatedRevenue WHERE [ProjectId] = @original_ProjectId AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([EstimatedRevenue] = @original_EstimatedRevenue) OR ([EstimatedRevenue] IS NULL AND @original_EstimatedRevenue IS NULL))">
             <DeleteParameters>
                 <asp:Parameter Name="original_ProjectId" Type="Int32" />
                 <asp:Parameter Name="original_Name" Type="String" />
                 <asp:Parameter Name="original_StartDate" Type="DateTime" />
                 <asp:Parameter Name="original_EndDate" Type="DateTime" />
                 <asp:Parameter Name="original_EstimatedRevenue" Type="Decimal" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Name" Type="String" />
                 <asp:Parameter Name="StartDate" Type="DateTime" />
                 <asp:Parameter Name="EndDate" Type="DateTime" />
                 <asp:Parameter Name="EstimatedRevenue" Type="Decimal" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Name" Type="String" />
                 <asp:Parameter Name="StartDate" Type="DateTime" />
                 <asp:Parameter Name="EndDate" Type="DateTime" />
                 <asp:Parameter Name="EstimatedRevenue" Type="Decimal" />
                 <asp:Parameter Name="original_ProjectId" Type="Int32" />
                 <asp:Parameter Name="original_Name" Type="String" />
                 <asp:Parameter Name="original_StartDate" Type="DateTime" />
                 <asp:Parameter Name="original_EndDate" Type="DateTime" />
                 <asp:Parameter Name="original_EstimatedRevenue" Type="Decimal" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <asp:ValidationSummary ValidationGroup="addGroup" ID="ValidationSummary2" ForeColor="red" runat="server" />
        <asp:ValidationSummary ValidationGroup="updateGroup" ID="ValidationSummary1" ForeColor="red" runat="server" />
    </div>
    <script type="text/javascript">
        if (!Modernizr.inputtypes.date) {
            $(function () {
                $("input[type='date']")
                            .datepicker({ dateFormat: 'dd.mm.yy' })
                            .get(0)
                            .setAttribute("type", "text");
            });
        }
        $("input[name*='TextBox2'").each(function() {
            $(this).datepicker({ dateFormat: 'dd.mm.yy' });
        });
        $("input[name*='TextBox3'").each(function () {
            $(this).datepicker({ dateFormat: 'dd.mm.yy' });
        });
    </script>
</asp:Content>
