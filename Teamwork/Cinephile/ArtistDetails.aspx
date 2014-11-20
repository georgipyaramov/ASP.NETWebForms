<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtistDetails.aspx.cs" Inherits="Cinephile.ArtistDetails" %>

<asp:Content ID="ArtistDitailsContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:Image ID="ArtistImage" CssClass="col-md-3" runat="server" />
        <div class="col-md-9">
            <div class="row">
                <h1 class="text-center col-md-12 page-header">
                    <asp:Label Text="" ID="HeaderArtistName" runat="server" />
                </h1>
            </div>
        </div>
    </div>

    <div class="row margin-top">
        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <strong>Additional Info</strong>
                </div>
                <ul class="list-group">
                    <li class="list-group-item">
                        <asp:Label Text="Name" ID="LabelArtistName" CssClass="label label-default" runat="server" />
                        <asp:Label Text="" runat="server" ID="ArtistName" />
                    </li>
                    <li class="list-group-item">
                        <asp:Label Text="Born on" ID="LabelArtistBirthDate" CssClass="label label-default" runat="server" />
                        <asp:Label Text="" ID="ArtistBirthDate" runat="server" />
                    </li>
                    <li class="list-group-item">
                        <asp:Label Text="Born in" ID="LabelArtistCountry" CssClass="label label-default" runat="server" />
                        <asp:Label Text="" ID="ArtistCountry" runat="server" />
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-md-5">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1 class="panel-title gold"><strong>Actor</strong></h1>
                        </div>
                        <div class="panel-body">
                            <asp:GridView ID="GridViewMovies" AllowPaging="true" PageSize="4" AutoGenerateColumns="false"
                                AllowSorting="true" runat="server" OnPageIndexChanging="GridViewMovies_PageIndexChanging"
                                OnSorting="GridViewMovies_Sorting" GridLines="None" CellPadding="2" ItemType="Cinephile.Data.Movie">
                                <Columns>
                                    <asp:ImageField DataImageUrlField="PosterPath" ControlStyle-Width="90px" ></asp:ImageField>
                                    <asp:HyperLinkField DataTextField="Title" HeaderText="Title"
                                        SortExpression="Title" DataNavigateUrlFields='Id' ControlStyle-Width="170px" ItemStyle-CssClass="overflo" DataNavigateUrlFormatString="~\MovieDetails?id={0}" />
                                    <asp:BoundField DataField="ReleseDate" DataFormatString="{0:d}" HeaderText="Relese Date" SortExpression="ReleseDate" />
                                </Columns>
                                <PagerStyle CssClass="pagination" HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1 class="panel-title gold"><strong>Derector</strong></h1>
                        </div>
                        <div class="panel-body">
                            <asp:GridView ID="GridViewMoviesDirector" AllowPaging="true" PageSize="4" AutoGenerateColumns="false"
                                AllowSorting="true" runat="server" OnPageIndexChanging="GridViewMovies_PageIndexChanging"
                                OnSorting="GridViewMovies_Sorting" GridLines="None" CellPadding="2" ItemType="Cinephile.Data.Movie">
                                <Columns>
                                    <asp:ImageField DataImageUrlField="PosterPath" ControlStyle-Width="90px" ></asp:ImageField>
                                    <asp:HyperLinkField DataTextField="Title" HeaderText="Title"
                                        SortExpression="Title" DataNavigateUrlFields='Id' DataNavigateUrlFormatString="~\MovieDetails?id={0}" ControlStyle-Width="102px" ItemStyle-CssClass="overflo" />
                                    <asp:BoundField DataField="ReleseDate" DataFormatString="{0:d}" HeaderText="Relese Date" SortExpression="ReleseDate" />
                                </Columns>
                                <PagerStyle CssClass="pagination" HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
