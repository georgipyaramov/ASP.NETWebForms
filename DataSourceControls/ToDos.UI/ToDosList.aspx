<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ToDosList.aspx.cs" EnableViewState="false" Inherits="ToDos.UI.ToDosList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styles/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
     <h1>Categories</h1>   <asp:DropDownList CssClass="form-control" runat="server" ID="DropDownListCategories" DataSourceID="EntityDataSourceCategories" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
        <asp:Button runat="server" ID="ButtonCreateCategory" CssClass="btn btn-primary" Text="New Category" OnClick="ButtonCreateCategory_Click" />
        <asp:Button runat="server" ID="ButtonUpdateCategory" CssClass="btn btn-primary" Text="Edit Category" OnClick="ButtonUpdateCategory_Click" />
        <asp:Button runat="server" ID="ButtonDeleteCategory" CssClass="btn btn-primary" Text="Delete Category" OnClick="ButtonDeleteCategory_Click" />
        <div id="DivCreateCategory" runat="server" class="form-group">
            <asp:TextBox runat="server" ID="TextBoxCreateCategory"></asp:TextBox>
            <asp:Button runat="server" ID="ButtonSaveCategoryCreate" CssClass="btn btn-sm btn-primary" Text="Save" OnClick="ButtonSaveCategoryCreate_Click" />
            <asp:Button runat="server" ID="ButtonCancelCategoryCreate" CssClass="btn btn-sm btn-primary"  OnClick="ButtonCancelCategoryCreate_Click" Text="Cancel" />
        </div>
        <div id="DivUpdateCategory" runat="server">
            <asp:TextBox runat="server" ID="TextBoxUpdateCategory"></asp:TextBox>
            <asp:Button runat="server" ID="ButtonSaveCategoryUpdate" CssClass="btn btn-sm btn-primary" Text="Save" OnClick="ButtonSaveCategoryUpdate_Click" />
            <asp:Button runat="server" ID="ButtonCancelUpdate" CssClass="btn btn-sm btn-primary" OnClick="ButtonCancelUpdate_Click" Text="Cancel" />
        </div>

        <div>
            <h1>Tasks</h1>
            <asp:ListView ID="ListViewTasks" runat="server" DataSourceID="EntityDataSourceTasks" DataKeyNames="Id" ItemType="ToDos.UI.Task" InsertItemPosition="LastItem">
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button runat="server" CommandName="Update" Text="Update" OnClick="UpdateButton_Click" CssClass="btn btn-sm btn-primary" CommandArgument="<%# Item.Id %>" ID="UpdateButton" />
                            <asp:Button runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-sm btn-primary" ID="CancelButton" />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" Text='<%# Bind("Title") %>' runat="server" ID="TitleTextBox" /></td>
                        <td>
                            <asp:TextBox CssClass="form-control" Text='<%# Bind("Body") %>' runat="server" ID="BodyTextBox" /></td>
                        <td></td>
                        <td>
                            <asp:DropDownList CssClass="form-control" runat="server" ID="DDLCategoryInsert" DataSourceID="EntityDataSourceCategories"
                                DataValueField="Id" DataTextField="Name" SelectedValue="<%#: Item.CategoryId %>" /></td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button runat="server" CssClass="btn btn-sm btn-primary" Text="Insert" ID="InsertButton" OnClick="InsertButton_Click" />
                            <asp:Button runat="server" CssClass="btn btn-sm btn-primary" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                        </td>
                        <td>
                            <asp:TextBox AutoPostBack="false" runat="server" ID="TitleTextBox" /></td>
                        <td>
                            <asp:TextBox AutoPostBack="false" runat="server" ID="BodyTextBox" /></td>
                        <td></td>
                        <td>
                            <asp:DropDownList CssClass="form-control" AutoPostBack="false" runat="server" ID="DDLCategoryInsert" DataSourceID="EntityDataSourceCategories"
                                DataValueField="Id" DataTextField="Name" /></td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button runat="server" CssClass="btn btn-sm btn-primary" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                            <asp:Button runat="server" CssClass="btn btn-sm btn-primary" CommandName="Edit" Text="Edit" ID="EditButton" />
                        </td>
                        <td>
                            <asp:Label Text='<%#: Eval("Title") %>' runat="server" ID="TitleLabel" /></td>
                        <td>
                            <asp:Label Text='<%# HttpUtility.JavaScriptStringEncode(Item.Body) %>' runat="server" ID="BodyLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("DateOfLastChange") %>' runat="server" ID="DateOfLastChangeLabel" /></td>
                        <td>
                            <asp:Label Text='<%#: Eval("Category.Name") %>' runat="server" ID="CategoryLabel" /></td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table runat="server" id="itemPlaceholderContainer" class="table table-bordered">
                                    <tr runat="server" style="">
                                        <th runat="server">
                                            <asp:LinkButton CssClass="btn btn-sm btn-primary" runat="server" ID="ButtonShowAddNewTask" OnClick="ButtonShowAddNewTask_Click">Add New Task</asp:LinkButton></th>
                                        <th runat="server">Title</th>
                                        <th runat="server">Body</th>
                                        <th runat="server">DateOfLastChange</th>
                                        <th runat="server">Category</th>
                                    </tr>
                                    <tr runat="server" class="" id="itemPlaceholder"></tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager runat="server" ID="DataPager1">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                        <asp:NumericPagerField></asp:NumericPagerField>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
            <asp:EntityDataSource runat="server" ID="EntityDataSourceTasks"
                ConnectionString="name=ToDosEntities1"
                DefaultContainerName="ToDosEntities1"
                EnableDelete="True"
                EnableFlattening="False"
                EnableInsert="True"
                EnableUpdate="True"
                EntitySetName="Tasks"
                Include="Category">
            </asp:EntityDataSource>

            <asp:EntityDataSource runat="server"
                ConnectionString="name=ToDosEntities1"
                DefaultContainerName="ToDosEntities1"
                EnableDelete="True"
                EnableFlattening="False"
                EnableInsert="True" ID="EntityDataSourceCategories"
                EnableUpdate="True"
                EntitySetName="Categories">
            </asp:EntityDataSource>
        </div>
    </form>
</body>
</html>
