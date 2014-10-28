<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditCategories.aspx.cs" Inherits="Exam.Web.Admin.EditCategory" %>

<asp:Content ID="EditCategoriesContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Edit Categories</h1>
    <asp:ListView ID="ListView1" runat="server" 
                  SelectMethod="ListView1_GetData" 
                  ItemType="Exam.Web.Models.Category" 
                  AllowSorting="true" 
                  AllowPaging="true"
                  UpdateMethod="ListView1_UpdateItem" 
                  DeleteMethod="ListView1_DeleteItem" 
                  DataKeyNames="Id" >
        <LayoutTemplate>
            <table>
                <thead>
                    <tr>
                        <th>
                            <asp:LinkButton runat="server" Text="Category Name" CommandName="Sort" CommandArgument="Name"></asp:LinkButton>
                        </th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody runat="server" id="ItemPlaceholder">
                </tbody>

            </table>
            <asp:DataPager runat="server" PagedControlID="ListView1" PageSize="5">
                <Fields>
                    <asp:NumericPagerField />
                </Fields>
            </asp:DataPager>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%#: Item.Name %></td>
                <td>
                    <asp:Button runat="server" ID="ButtonEdit" CommandName="Edit" Text="Edit"/>
                    <asp:Button runat="server" ID="ButtonDelete" CommandName="Delete" Text="Delete"/>
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr>
                <td>
                    <asp:TextBox runat="server" ID="TextBoxEditCategoryName" Text="<%#: BindItem.Name %>"></asp:TextBox>
                </td>
                <td>
                    <asp:Button runat="server" ID="ButtonEdit" CommandName="Update" Text="Update"/>
                    <asp:Button runat="server" ID="ButtonDelete" Text="Cancel"/>
                </td>
            </tr>
        </EditItemTemplate>
    </asp:ListView>
</asp:Content>
