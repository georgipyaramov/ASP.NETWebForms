<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Exam.Web.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 runat="server">
        Search Results for Query "<asp:Label runat="server" ID="SearchParameter"></asp:Label>"
    </h1>
    <asp:ListView runat="server" ID="ListViewSearchedBooksResults" ItemType="Exam.Web.Models.Book" SelectMethod="ListViewSearchedBooksResults_GetData">
        <LayoutTemplate>
            <ul runat="server" id="ItemPlaceholder"></ul>
        </LayoutTemplate>
        <ItemTemplate>
            <li><a href="BookDetails.aspx?id=<%# Item.Id %>">"<%# Item.Title %>" <i>by <%# Item.Author %></i></a> (Category: <%# Item.Category.Name %>)</li>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
