<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="UsersList.aspx.cs" Inherits="taskForROI.UserList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top: 20px;">
        
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-hover" DataKeyNames="Id" DataSourceID="SqlDataSource1" EnableTheming="True" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="Действия" ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" ValidationGroup="updateGroup" runat="server" CausesValidation="True" CommandName="Update" Text="Обновить"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена"></asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ValidationGroup="addGroup" ID="LinkButton3" runat="server" CommandName="Insert">Добавить</asp:LinkButton>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Правка"></asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="True" CommandName="Delete" Text="Удалить" OnClientClick="return confirm('Вы уверены, что хотите удалить этого пользователя?');" ></asp:LinkButton>
                        
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name" SortExpression="FirstName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox1" ErrorMessage="Заполните поле FirstName для правки" ForeColor="red" ID="rfvTextBox1" runat="server" Text="*" ValidationGroup="updateGroup"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox1" ForeColor="red" ErrorMessage="Поле 'FirstName' должно содержать от 3 до 20 букв и цифр и начинаться с буквы" ID="regexpUpdateFirstName" runat="server" Text="*" ValidationExpression="^[A-Zа-яА-Яa-z][A-Za-zа-яА-Я0-9]{3,20}$" ValidationGroup="updateGroup"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="addFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="addFirstName" ErrorMessage="Заполните поле 'Имя'" ForeColor="red" ID="rfvFirstName" runat="server" Text="*" ValidationGroup="addGroup"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ControlToValidate="addFirstName" ForeColor="red" ErrorMessage="Поле 'FirstName' должно содержать от 3 до 20 букв и цифр и начинаться с буквы" ID="regexpAddFirstName" runat="server" Text="*" ValidationExpression="^[A-Zа-яА-Яa-z][A-Zа-яА-Яa-z0-9]{3,20}$" ValidationGroup="addGroup"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name" SortExpression="LastName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox2" ErrorMessage="Заполните поле LastName для правки" ForeColor="red" ID="rfvTextBox2" runat="server" Text="*" ValidationGroup="updateGroup"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator  ControlToValidate="TextBox2" ForeColor="red" ErrorMessage="Поле 'LastName' должно содержать от 3 до 20 букв и цифр и начинаться с буквы" ID="regexpUpdateLastName" runat="server" Text="*" ValidationExpression="^[A-Zа-яА-Яa-z][A-Zа-яА-Яa-z0-9]{3,20}$" ValidationGroup="updateGroup"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="addLastName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="addLastName" ErrorMessage="Заполните поле LastName" ForeColor="red" ID="rfvLastName" runat="server" Text="*" ValidationGroup="addGroup" Visible="True">    
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ControlToValidate="addLastName" ForeColor="red" ErrorMessage="Поле 'LastName' должно содержать от 3 до 20 букв и цифр и начинаться с буквы" ID="regexpAddLastName" runat="server" Text="*" ValidationExpression="^[A-Zа-яА-Яa-z][A-Zа-яА-Яa-z0-9]{3,20}$" ValidationGroup="addGroup"></asp:RegularExpressionValidator>       
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle Font-Italic="True" ForeColor="#2C2C2C" />
            <FooterStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            <HeaderStyle Font-Bold="False" Font-Italic="True" Font-Overline="False" ForeColor="#003366" HorizontalAlign="Left" VerticalAlign="Bottom" />
            <PagerSettings Mode="NumericFirstLast" />
            <RowStyle CssClass="users-table-row" HorizontalAlign="Left" VerticalAlign="Middle" />
        </asp:GridView>
        <asp:ValidationSummary ValidationGroup="addGroup" ID="ValidationSummary2" ForeColor="red" runat="server" />
        <asp:ValidationSummary ValidationGroup="updateGroup" ID="ValidationSummary1" ForeColor="red" runat="server" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [Users] ([Id], [FirstName], [LastName]) VALUES (@Id, @FirstName, @LastName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [FirstName], [LastName] FROM [Users]" UpdateCommand="UPDATE [Users] SET [FirstName] = @FirstName, [LastName] = @LastName WHERE [Id] = @original_Id">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="original_Id" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
