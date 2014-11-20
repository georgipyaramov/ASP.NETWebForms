<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Exam.Web._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" ID="HeaderSearch" CssClass="row">
        <asp:Panel runat="server" CssClass="col-md-8">
            <h1>Books</h1>
        </asp:Panel>
        <asp:Panel runat="server" CssClass="col-md-4 margin-top-20" ID="PanelSearch">
            <asp:TextBox runat="server" ID="TextBoxSearch"></asp:TextBox>
            <asp:Button runat="server" ID="ButtonSearch" Text="Search" OnClick="ButtonSearch_Click" />
        </asp:Panel>
    </asp:Panel>
    <asp:Repeater runat="server" ID="RepeaterCategories"
                  SelectMethod="RepeaterCategories_GetData" 
                  ItemType="Exam.Web.Models.Category">
        <ItemTemplate>
            <asp:Panel runat="server" ID="PanelCategory" CssClass="col-md-4">
                <h2 runat="server" id="CategoryHeader"><%#: Item.Name %></h2>
                <ul>
                    <asp:ListView runat="server" ID="RepeaterInnerBooks" DataSource="<%# Item.Books %>" ItemType="Exam.Web.Models.Book">
                        <ItemTemplate>
                            <li>
                                <a href="BookDetails.aspx?id=<%#:Item.Id%>"><%#: Item.Title %> by <%#: Item.Author %></a>
                            </li>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <i>No books in this category</i>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </ul>
            </asp:Panel>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
