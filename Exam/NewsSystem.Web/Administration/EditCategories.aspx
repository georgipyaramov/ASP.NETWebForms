<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditCategories.aspx.cs" Inherits="NewsSystem.Web.Administration.EditCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView runat="server" ID="ListViewAllCategories" 
                  ItemType="NewsSystem.Web.Models.Category" 
                  SelectMethod="ListViewAllCategories_GetData" 
                  AllowSorting="true" AllowPaging="true" 
                  UpdateMethod="ListViewAllCategories_UpdateItem" 
                  DeleteMethod="ListViewAllCategories_DeleteItem"  
                  InsertMethod="ListViewAllCategories_InsertItem"
                  DataKeyNames="Id" 
                  InsertItemPosition="LastItem">
        <LayoutTemplate>
            <div class="row">
                <asp:LinkButton runat="server" CssClass="btn btn-default" Text="Sort by Name" CommandName="Sort" CommandArgument="Name"></asp:LinkButton>
            </div>
            <asp:PlaceHolder runat="server" ID="ItemPlaceholder"/>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="row">
                <div class="col-md-3"><%#: Item.Name %></div>
                <asp:LinkButton runat="server" CssClass="btn btn-info" Text="Edit" CommandName="Edit" ></asp:LinkButton>
                <asp:LinkButton runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="Delete"></asp:LinkButton>
            </div>
        </ItemTemplate>
        <EditItemTemplate>
            <div class="row">
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="TextBoxCategoryNameEdit" Text="<%# BindItem.Name %>" />
                    <asp:RequiredFieldValidator 
                        ErrorMessage="The name of the category is required" 
                        ControlToValidate="TextBoxCategoryNameEdit" 
                        runat="server" Display="Dynamic" ValidationGroup="ValidationGroupEdit" />
                </div>
                <asp:LinkButton runat="server" CssClass="btn btn-success" Text="Save" CommandName="Update"></asp:LinkButton>
                <asp:LinkButton runat="server" CssClass="btn btn-danger" Text="Cancel" CommandName="Cancel"></asp:LinkButton>
            </div>
        </EditItemTemplate>
        <InsertItemTemplate>
            <div class="row">
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="TextBoxCategoryNameInsert" Text="<%#: BindItem.Name %>" />
                    <asp:RequiredFieldValidator 
                        ErrorMessage="The name of the category is required" 
                        ControlToValidate="TextBoxCategoryNameInsert" 
                        runat="server" Display="Dynamic" ValidationGroup="ValidationGroupInsert"/>
                </div>
                <asp:LinkButton runat="server" CssClass="btn btn-info" Text="Save" CommandName="Insert"></asp:LinkButton>
                <asp:LinkButton runat="server" CssClass="btn btn-danger" Text="Cancel" CommandName="Cancel"></asp:LinkButton>
            </div>
        </InsertItemTemplate>
    </asp:ListView>
    <div class="row">
        <hr />
        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListViewAllCategories"
                       PageSize="5">
            <Fields>
                <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" ButtonCssClass="btn btn-sml btn-default" />
                <asp:NumericPagerField NumericButtonCssClass="btn btn-sml btn-default" CurrentPageLabelCssClass="btn btn-sml btn-primary"/>
                <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" ButtonCssClass="btn btn-sml btn-default" />
            </Fields>
        </asp:DataPager>
    </div>
</asp:Content>
