<%@ Page Title="View Article" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewArticle.aspx.cs" 
Inherits="NewsSystem.Web.ViewArticle" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView runat="server" ID="FormViewArticleDetails" ItemType="NewsSystem.Web.Models.Article" SelectMethod="FormViewArticleDetails_GetItem">
        <ItemTemplate>
            <div class="row">
                <div runat="server" class="col-md-1" visible="<%# User.Identity.IsAuthenticated %>">
                    <div>Likes</div>
                    <div>
                        <a class="btn btn-default glyphicon glyphicon-chevron-up" href="#"></a>
                        <span class="like-value">0</span>
                        <a class="btn btn-default glyphicon glyphicon-chevron-down" href="#"></a>
                    </div>
                </div>
                <h2><%#: Item.Title %> <small>Category: <%#: Item.Category.Name %></small></h2>
                <p><%#: Item.Content %></p>
                <p>
                    <span>Author: <%#: Item.Author.UserName %></span>
                    <span class="pull-right"><%#: Item.DateCreated %></span>
                </p>
            </div>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
