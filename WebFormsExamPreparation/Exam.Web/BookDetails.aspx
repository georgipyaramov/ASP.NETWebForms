<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="Exam.Web.BookDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Book Details</h1>
    <asp:FormView runat="server" ID="FormViewBookDetails" SelectMethod="BookDetails_GetItem" ItemType="Exam.Web.Models.Book">
        <ItemTemplate>
            <h2><%#: Item.Title %></h2>
            <p><i>by <%#: Item.Author %></i></p>
            <p runat="server" visible='<%# !(Item.ISBN == null) %>'><i>ISBN <%#: Item.ISBN %></i></p>
            <p runat="server" visible='<%# !(Item.WebSite == null) %>'><i>Web site</i> <a href='<%# Item.WebSite %>'><i><%#: Item.WebSite %></i></a></p>
            <p runat="server" visible='<%# !(Item.Description == null) %>'><%#: Item.Description %></p>
            <a href="Default.aspx">Back to books</a>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
