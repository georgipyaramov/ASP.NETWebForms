<%@ Page Title="Create Movie" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateMovie.aspx.cs" Inherits="Cinephile.Admin.CreateMovie" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Create a new movie.</h2>
    <div class="form-horizontal">
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <asp:Label CssClass="text-danger" ID="ValidationSummaryMessages" runat="server"></asp:Label>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TextBoxMovieTitle" CssClass="col-md-2 control-label">Title</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="TextBoxMovieTitle" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxMovieTitle"
                    CssClass="text-danger" ErrorMessage="The Title field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TextBoxMovieStoryline" CssClass="col-md-2 control-label">Storyline</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="TextBoxMovieStoryline" CssClass="form-control" TextMode="MultiLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxMovieStoryline"
                    CssClass="text-danger" ErrorMessage="The Storyline field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TextBoxMovieReleaseDate" CssClass="col-md-2 control-label">Release Date</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="TextBoxMovieReleaseDate" TextMode="Date" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxMovieReleaseDate"
                    CssClass="text-danger" ErrorMessage="The Release Date field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TextBoxMovieRunningTime" CssClass="col-md-2 control-label">Running Time</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="TextBoxMovieRunningTime" TextMode="Number" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxMovieRunningTime"
                    CssClass="text-danger" ErrorMessage="The Running Time field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="DropDownListMovieLanguages" CssClass="col-md-2 control-label">Language</asp:Label>
            <div class="col-md-10">
                <asp:EntityDataSource ID="EntityDataSourceMovieLanguage" runat="server"
                    ConnectionString="name=CinephileDbEntities"
                    DefaultContainerName="CinephileDbEntities"
                    EnableFlattening="False"
                    EntitySetName="Languages">
                </asp:EntityDataSource>
                <asp:DropDownList ID="DropDownListMovieLanguages" runat="server"
                    DataSourceID="EntityDataSourceMovieLanguage"
                    DataTextField="Name"
                    DataValueField="Id"
                    AppendDataBoundItems="true">
                    <asp:ListItem>Select a Language</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="DropDownListMovieLanguages"
                    Display="Dynamic" InitialValue="Select a Language"
                    CssClass="text-danger" ErrorMessage="The Language field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:EntityDataSource ID="EntityDataSourceMovieGenres" runat="server"
                ConnectionString="name=CinephileDbEntities"
                DefaultContainerName="CinephileDbEntities"
                EnableFlattening="False"
                EntitySetName="Genres">
            </asp:EntityDataSource>
            <asp:Label runat="server" AssociatedControlID="ListBoxMovieGenres" CssClass="col-md-2 control-label">Geners</asp:Label>
            <div class="col-md-10">
                <asp:ListBox ID="ListBoxMovieGenres" runat="server"
                    DataSourceID="EntityDataSourceMovieGenres"
                    DataTextField="Name"
                    DataValueField="Id"
                    AppendDataBoundItems="True"
                    SelectionMode="Multiple"
                    Rows="10"></asp:ListBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ListBoxMovieGenres"
                    CssClass="text-danger" ErrorMessage="The Gener field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:EntityDataSource ID="EntityDataSourceMovieCountries" runat="server"
                ConnectionString="name=CinephileDbEntities"
                DefaultContainerName="CinephileDbEntities"
                EnableFlattening="False"
                EntitySetName="Countries">
            </asp:EntityDataSource>
            <asp:Label runat="server" AssociatedControlID="ListBoxMovieCountries" CssClass="col-md-2 control-label">Countries</asp:Label>
            <div class="col-md-10">
                <asp:ListBox ID="ListBoxMovieCountries" runat="server"
                    DataTextField="Name"
                    DataValueField="Id"
                    AppendDataBoundItems="True"
                    SelectionMode="Multiple"
                    Rows="10" DataSourceID="EntityDataSourceMovieCountries"></asp:ListBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ListBoxMovieCountries"
                    CssClass="text-danger" ErrorMessage="The Country field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FileUploadMoviePoster" CssClass="col-md-2 control-label">Opload poster</asp:Label>
            <div class="col-md-10">
                <asp:FileUpload ID="FileUploadMoviePoster" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="FileUploadMoviePoster"
                    CssClass="text-danger" ErrorMessage="The Poster field is required." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="ButtonCreateMovie_Click" Text="Create" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
