<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cinephile._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1 class="home-page-title">Cinephile</h1>
        <div class="row">
            <p class="col-md-8 lead">The place for all your favorite movies information.</p>
            <div class="col-md-4 pull-right home-page-search-container">
                <asp:Panel runat="server" DefaultButton="SearchSubmitBtn">
                    <asp:TextBox runat="server" ID="HomeSearchBox"
                        CssClass="form-control"
                        placeholder="Search for a movie...">
                    </asp:TextBox>
                    <asp:Button ID="SearchSubmitBtn" runat="server"
                        Style="display: none"
                        OnClick="SearchSubmitBtn_Click" />
                </asp:Panel>
            </div>
        </div>
    </div>

    <div class="row">
        <asp:Repeater ID="HomeMoviesRepeater" runat="server"
            ItemType="Cinephile.Data.Movie">
            <ItemTemplate>
                <div class="col-md-4 movie-poster-container">
                    <asp:ImageButton runat="server" ID="MovieDetailsImageBtn"
                        ImageUrl="<%# Item.PosterPath %>"
                        CssClass="movie-poster"
                        PostBackUrl='<%# "~/MovieDetails.aspx?id=" + Item.Id %>'
                        Width="95%"
                        ImageAlign="AbsMiddle"
                        AlternateText="<%# Item.Title %>" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
