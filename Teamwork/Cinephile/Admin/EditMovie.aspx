<%@ Page Title="Edit Movie" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditMovie.aspx.cs" Inherits="Cinephile.Admin.EditMovie" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Edit movie.</h2>
    <div class="form-horizontal">
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <asp:Label CssClass="text-danger" ID="ValidationSummaryMessages" runat="server"></asp:Label>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="LiteralMovieTitle" CssClass="col-md-2 control-label">Title</asp:Label>
            <div class="radio col-md-10">
                <asp:Literal runat="server" ID="LiteralMovieTitle"></asp:Literal>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TextBoxNewMovieTitle" CssClass="col-md-2 control-label">New Title</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="TextBoxNewMovieTitle" CssClass="form-control" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="LiteralMovieStoryline" CssClass="col-md-2 control-label">Storyline</asp:Label>
            <div class="radio col-md-10">
                <asp:Literal runat="server" ID="LiteralMovieStoryline"></asp:Literal>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TextBoxNewMovieStoryline" CssClass="col-md-2 control-label">New Storyline</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="TextBoxNewMovieStoryline" CssClass="form-control" TextMode="MultiLine" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="LiteralMovieReleaseDate" CssClass="col-md-2 control-label">Release Date</asp:Label>
            <div class="radio col-md-10">
                <asp:Literal runat="server" ID="LiteralMovieReleaseDate"></asp:Literal>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TextBoxNewMovieReleaseDate" CssClass="col-md-2 control-label">New Release Date</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="TextBoxNewMovieReleaseDate" TextMode="Date" CssClass="form-control" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="LiteralMovieRunningTime" CssClass="col-md-2 control-label">Running Time</asp:Label>
            <div class="radio col-md-10">
                <asp:Literal runat="server" ID="LiteralMovieRunningTime"></asp:Literal>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TextBoxNewMovieRunningTime" CssClass="col-md-2 control-label">New Running Time</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="TextBoxNewMovieRunningTime" TextMode="Number" CssClass="form-control" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="LiteralMovieLanguages" CssClass="col-md-2 control-label">Language</asp:Label>
            <div class="radio col-md-10">
                <asp:Literal runat="server" ID="LiteralMovieLanguages"></asp:Literal>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="DropDownListNewMovieLanguages" CssClass="col-md-2 control-label">New Language</asp:Label>
            <div class="radio col-md-10">
                <asp:EntityDataSource ID="EntityDataSourceMovieLanguage" runat="server"
                    ConnectionString="name=CinephileDbEntities"
                    DefaultContainerName="CinephileDbEntities"
                    EnableFlattening="False"
                    EntitySetName="Languages">
                </asp:EntityDataSource>
                <asp:DropDownList ID="DropDownListNewMovieLanguages" runat="server"
                    DataSourceID="EntityDataSourceMovieLanguage"
                    DataTextField="Name"
                    DataValueField="Id"
                    AppendDataBoundItems="true">
                    <asp:ListItem>Select a Language</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="LiteralMovieGenres" CssClass="col-md-2 control-label">Genres</asp:Label>
            <div class="radio col-md-10">
                <asp:Literal runat="server" ID="LiteralMovieGenres"></asp:Literal>
            </div>
        </div>
        <div class="form-group">
            <asp:EntityDataSource ID="EntityDataSourceMovieGenres" runat="server"
                ConnectionString="name=CinephileDbEntities"
                DefaultContainerName="CinephileDbEntities"
                EnableFlattening="False"
                EntitySetName="Genres">
            </asp:EntityDataSource>
            <asp:Label runat="server" AssociatedControlID="ListBoxNewMovieGenres" CssClass="col-md-2 control-label">New Geners</asp:Label>
            <div class="radio col-md-10">
                <asp:ListBox ID="ListBoxNewMovieGenres" runat="server"
                    DataSourceID="EntityDataSourceMovieGenres"
                    DataTextField="Name"
                    DataValueField="Id"
                    AppendDataBoundItems="True"
                    SelectionMode="Multiple"
                    Rows="10"></asp:ListBox>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="LiteralMovieCountries" CssClass="col-md-2 control-label">Countries</asp:Label>
            <div class="radio col-md-10">
                <asp:Literal runat="server" ID="LiteralMovieCountries"></asp:Literal>
            </div>
        </div>
        <div class="form-group">
            <asp:EntityDataSource ID="EntityDataSourceMovieCountries" runat="server"
                ConnectionString="name=CinephileDbEntities"
                DefaultContainerName="CinephileDbEntities"
                EnableFlattening="False"
                EntitySetName="Countries">
            </asp:EntityDataSource>
            <asp:Label runat="server" AssociatedControlID="ListBoxNewMovieCountries" CssClass="col-md-2 control-label">New Countries</asp:Label>
            <div class="radio col-md-10">
                <asp:ListBox ID="ListBoxNewMovieCountries" runat="server"
                    DataTextField="Name"
                    DataValueField="Id"
                    AppendDataBoundItems="True"
                    SelectionMode="Multiple"
                    Rows="10" DataSourceID="EntityDataSourceMovieCountries"></asp:ListBox>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ImageMoviePoster" CssClass="col-md-2 control-label">Poster</asp:Label>
            <div class="radio col-md-10">
                <asp:Image runat="server" ID="ImageMoviePoster"
                    Width="300px"
                    ImageAlign="AbsMiddle" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FileUploadNewMoviePoster" CssClass="col-md-2 control-label">New poster</asp:Label>
            <div class="radio col-md-10">
                <asp:FileUpload ID="FileUploadNewMoviePoster" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="ButtonEditMovie_Click" Text="Edit" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
