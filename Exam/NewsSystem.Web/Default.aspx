<%@ Page Title="News" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NewsSystem.Web._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%: Page.Title %></h1>
    <h2>Most popular articles</h2>
    <asp:Repeater runat="server" ID="RepeaterPopularArticles" ItemType="NewsSystem.Web.Models.Article" SelectMethod="RepeaterPopularArticles_GetData">
        <ItemTemplate>
            <asp:Panel runat="server" CssClass="row">
                <h3>
                    <a runat="server" href='<%# string.Format("~/ViewArticle.aspx?id={0}", Item.Id) %>'><%#: Item.Title %></a> <small><%#: Item.Category.Name %></small>
                </h3>
                <p><%#: Item.Content %></p>
                <p>Likes: <%# Item.Likes %></p>
                <div>
                    <i>by <%#: Item.Author.UserName %></i>
                    <i>created on: <%# Item.DateCreated %></i>
                </div>
            </asp:Panel>
        </ItemTemplate>
    </asp:Repeater>
    <h2>All categories</h2>
    <asp:ListView runat="server" ID="ListViewAllCategories" 
                  ItemType="NewsSystem.Web.Models.Category" 
                  SelectMethod="ListViewAllCategories_GetData" 
                  GroupItemCount="2">
        <GroupTemplate>
            <div class="row">
                <asp:PlaceHolder runat="server" ID="ItemPlaceholder"></asp:PlaceHolder>
            </div>
        </GroupTemplate>
        <ItemTemplate>
            <div class="col-md-6">
                <h3><%# Item.Name %></h3> 
                <asp:ListView runat="server" ItemType="NewsSystem.Web.Models.Article" DataSource="<%# Item.Articles.OrderBy(a => a.DateCreated).Take(3) %>">
                    <LayoutTemplate>
                        <ul>
                            <asp:PlaceHolder runat="server" ID="ItemPlaceholder"></asp:PlaceHolder>
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <li>
                            <asp:HyperLink NavigateUrl='<%# string.Format("~/ViewArticle.aspx?id={0}", Item.Id) %>' runat="server"
                                Text='<%# string.Format(@"""{0}"" by <i>{1}</i>", Item.Title, Item.Author.UserName) %>'  />
                        </li>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        No articles.
                    </EmptyDataTemplate>
                </asp:ListView>                   
            </div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
