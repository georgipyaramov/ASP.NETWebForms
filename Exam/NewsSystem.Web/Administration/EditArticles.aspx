<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditArticles.aspx.cs" Inherits="NewsSystem.Web.Administration.EditArticles" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView runat="server" ID="ListViewAllArticles"
                  ItemType="NewsSystem.Web.Models.Article"
                  SelectMethod="ListViewAllArticles_GetData"
                  UpdateMethod="ListViewAllArticles_UpdateItem"
                  DeleteMethod="ListViewAllArticles_DeleteItem"
                  InsertMethod="ListViewAllArticles_InsertItem"
                  AllowSorting="true" AllowPaging="true"
                  DataKeyNames="Id" 
                  InsertItemPosition="None">
        <LayoutTemplate>
            <div class="row">
                <asp:LinkButton runat="server" CausesValidation="false" 
                                CssClass="col-md-2 btn btn-default" Text="Sort by Title" 
                                CommandName="Sort" CommandArgument="Title" />
                <asp:LinkButton runat="server" CausesValidation="false" 
                                CssClass="col-md-2 btn btn-default" Text="Sort by Date" 
                                CommandName="Sort" CommandArgument="DateCreated" />
                <asp:LinkButton runat="server" CausesValidation="false" 
                                CssClass="col-md-2 btn btn-default" Text="Sort by Category" />
                <asp:LinkButton runat="server" CausesValidation="false" 
                                CssClass="col-md-2 btn btn-default" Text="Sort by Likes" 
                                CommandName="Sort" CommandArgument="Likes" />
            </div>
            <asp:PlaceHolder runat="server" ID="ItemPlaceholder"/>

        </LayoutTemplate>
        <ItemTemplate>
            <div class="row">
                <h3>
                    <%#: Item.Title %>
                    <asp:LinkButton runat="server" CssClass="btn btn-info" Text="Edit" CommandName="Edit" ></asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="Delete"></asp:LinkButton>
                </h3>
                <p>Category: <%#: Item.Category.Name %></p>
                <p><%#: Item.Content %></p>
                <p>Likes count: 0</p>
                <div>
                    <i>by <%#: Item.Author.UserName %></i>
                    <i>created on: <%#: Item.DateCreated %></i>
                </div>
            </div>
        </ItemTemplate>
        <EditItemTemplate>
            <div class="row">
                <h3>
                    <asp:TextBox runat="server" ID="TextBoxArticlesEditTitle" Text="<%#: BindItem.Title %>"/>
                    <asp:RequiredFieldValidator 
                        ErrorMessage="The title of the article is required" 
                        ControlToValidate="TextBoxArticlesEditTitle" 
                        runat="server" Display="Dynamic" 
                        ValidationGroup="ValidationGroupEdit" 
                        Font-Bold="true" ForeColor="Red" />
                    <asp:LinkButton runat="server" CssClass="btn btn-success" Text="Save" CommandName="Update" ></asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="btn btn-danger" Text="Cancel" CommandName="Cancel"></asp:LinkButton>
                </h3>
                <p>
                    <asp:DropDownList runat="server" ID="DropDownListArticlesEditCategories" 
                                      ItemType="NewsSystem.Web.Models.Category" 
                                      SelectMethod="DropDownListCategoriesArticlesEdit_GetData"
                                      DataTextField="Name"
                                      DataValueField="Id"
                                      SelectedValue="<%#: BindItem.CategoryId %>"
                                      AutoPostBack="true" >
                    </asp:DropDownList>
                </p>
                <p>
                    <asp:TextBox ID="TextBoxArticlesEditContent" runat="server" Rows="6" CssClass="col-md-12" TextMode="MultiLine" Text="<%# BindItem.Content %>" />
                    <asp:RequiredFieldValidator 
                        ErrorMessage="The content of the article is required" 
                        ControlToValidate="TextBoxArticlesEditContent" 
                        runat="server" Display="Dynamic" 
                        ValidationGroup="ValidationGroupEdit"
                        Font-Bold="true" ForeColor="Red" />
                </p>
                <div>
                    <i>by <%#: Item.Author.UserName %></i>
                    <i>created on: <%#: Item.DateCreated %></i>
                </div>
            </div>
        </EditItemTemplate>
        <InsertItemTemplate>
            <div class="row">
                <h3>
                    Title:
                    <asp:TextBox runat="server" ID="TextBoxArticlesInsertTitle" Text="<%#: BindItem.Title %>"/>
                    <asp:RequiredFieldValidator 
                        ErrorMessage="The title of the article is required" 
                        ControlToValidate="TextBoxArticlesInsertTitle" 
                        runat="server" Display="Dynamic" 
                        Font-Bold="true" ForeColor="Red" />
                </h3>
                <p>
                    Category:
                    <asp:DropDownList runat="server" ID="DropDownListArticlesInsertCategories" 
                                      ItemType="NewsSystem.Web.Models.Category" 
                                      SelectMethod="DropDownListCategoriesArticlesEdit_GetData"
                                      DataTextField="Name"
                                      DataValueField="Id"
                                      SelectedValue="<%#: BindItem.CategoryId %>"
                                      AutoPostBack="true" >
                    </asp:DropDownList>
                </p>
                <p>
                    Content:
                    <asp:TextBox ID="TextBoxArticlesInsertContent" runat="server" Rows="6" Width="300px" TextMode="MultiLine" Text="<%# BindItem.Content %>" />
                    <asp:RequiredFieldValidator 
                        ErrorMessage="The title of the article is required" 
                        ControlToValidate="TextBoxArticlesInsertContent" 
                        runat="server" Display="Dynamic"
                        Font-Bold="true" ForeColor="Red" />
                </p>
                <div>
                    <asp:LinkButton runat="server" CssClass="btn btn-success" Text="Save" CausesValidation="true" CommandName="Insert" ></asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="btn btn-danger" CausesValidation="false" 
                                    ID="LinkButtonCancelInsertForm" Text="Cancel" 
                                    CommandName="Cancel" OnClick="LinkButtonCancelInsertForm_Click"></asp:LinkButton>
                </div>
            </div>
        </InsertItemTemplate>
    </asp:ListView>
    <div class="row">
        <hr />
        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListViewAllArticles"
                       PageSize="3">
            <Fields>
                <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" ButtonCssClass="btn btn-sml btn-default" />
                <asp:NumericPagerField NumericButtonCssClass="btn btn-sml btn-default" CurrentPageLabelCssClass="btn btn-sml btn-primary"/>
                <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" ButtonCssClass="btn btn-sml btn-default" />
            </Fields>
        </asp:DataPager>
        <asp:LinkButton runat="server" CssClass="btn btn-info pull-right"  
                        ID="LinkButtonShowInsertForm" Text="Insert new Article" OnClick="LinkButtonShowInsertForm_Click" />
    </div>

</asp:Content>
