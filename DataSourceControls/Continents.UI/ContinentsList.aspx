<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContinentsList.aspx.cs" Inherits="Continents.UI.ContinentsList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styles/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container">
        <div>
            <asp:EntityDataSource ID="EntityDataSourceContinents" runat="server"
                ConnectionString="name=ContinentsEntities"
                DefaultContainerName="ContinentsEntities"
                EnableDelete="True" EnableFlattening="False"
                EnableInsert="True" EnableUpdate="True"
                EntitySetName="Continents">
            </asp:EntityDataSource>
            <h1>Continents</h1>
            <asp:ListBox ID="ListBoxContinents" DataSourceID="EntityDataSourceContinents" CssClass="table form-control"
                runat="server"
                DataTextField="Name" DataValueField="Id"
                Rows="7" AutoPostBack="True"></asp:ListBox>

            <h1>Countries</h1>
            <asp:GridView ID="GridViewCountries" runat="server" CssClass="table table-bordered"
                AutoGenerateColumns="False"
                DataKeyNames="Id"
                DataSourceID="EntityDataSourceCountries"
                ItemType="Continents.Model.Country"
                AllowSorting="True" AllowPaging="True" ShowHeader="true" HeaderStyle-BackColor="WhiteSmoke"
                PageSize="3" GridLines="None">
                <EmptyDataTemplate>
                    <table runat="server">
                        <tr>
                            <td>No countries to display.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField>

                        <HeaderTemplate>

                            <asp:LinkButton ID="ButtonDisplayAddCountry" CommandName="Insert" CssClass="btn btn-primary"
                                Text="Add New Country" runat="server" OnClick="ButtonDisplayAddCountry_Click" />
                            <th>
                                <asp:LinkButton runat="server" CommandName="Sort" Text="Name" CommandArgument="Name" />
                            </th>
                            <th>
                                <asp:LinkButton runat="server" CommandName="Sort" Text="Language" CommandArgument="Language.Name" />
                            </th>
                            <th>
                                <asp:LinkButton runat="server" CommandName="Sort" Text="Population" CommandArgument="Population" />
                            </th>
                            <th>
                                <asp:LinkButton runat="server" CommandName="Sort" Text="Continent" CommandArgument="Continent.Name" />
                            </th>
                            <th>
                                <asp:Label runat="server" Text="Flag" />
                            </th>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="ButtonEditCountry" CommandName="Edit" Text="Edit" runat="server" CssClass="btn btn-primary btn-xs" />
                            <asp:LinkButton ID="ButtonDeleteCountry" CommandName="Delete" Text="Delete" runat="server" CssClass="btn btn-primary btn-xs" />
                            <asp:LinkButton ID="ButtonSelectCountry" CommandName="Select" Text="Select" runat="server" CssClass="btn btn-primary btn-xs" />
                            <td>
                                <%#:Item.Name %>
                            </td>
                            <td>
                                <%#:Item.Language.Name %>
                            </td>
                            <td>
                                <%#:Item.Population %>
                            </td>
                            <td>
                                <%#:Item.Continent.Name %>
                            </td>
                            <td>
                                <asp:Image ID="ImageFlag" runat="server" Width="36px" ImageUrl='<%# GetImage(Item.Flag) %>' />
                            </td>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="ButtonUpdateCountry" OnClick="ButtonUpdateCountry_Click" CommandArgument="<%# Item.Id %>" Text="Update" runat="server" CssClass="btn btn-primary btn-xs" />
                            <asp:LinkButton ID="ButtonCancelCountry" CommandName="Cancel" Text="Cancel" runat="server" CssClass="btn btn-primary btn-xs" />
                            <td>
                                <asp:TextBox ID="TextBoxCountryName" runat="server" Text="<%#:BindItem.Name %>" />
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListLanguage" runat="server" DataSourceID="EntityDataSourceLanguages"
                                    DataTextField="Name" DataValueField="Id" SelectedValue="<%#:BindItem.Language.Id %>">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxCountryPopulation" runat="server" Text="<%#:BindItem.Population %>" />
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListContinent" runat="server" DataSourceID="EntityDataSourceContinents"
                                    DataTextField="Name" DataValueField="Id" SelectedValue="<%#:BindItem.Continent.Id %>">
                                </asp:DropDownList>
                            </td>
                            <td>
                                    <asp:Image ID="FlagImage" runat="server" Width="36px" ImageUrl='<%#:GetImage(Item.Flag) %>' />
                                    <asp:FileUpload ID="ChangeFlagPicture" runat="server"  />
                                    <asp:Label ID="LabelChangeFlagPictureValidate" Text="" runat="server" />
                                    <asp:Button ID="ImageButtonChangeFlag" 
                                        CssClass="btn btn-primary btn-sm" Text="Save the new flag" runat="server" 
                                        OnClick="ImageButtonChangeFlag_Click" />
                            </td>
                        </EditItemTemplate>

                        <FooterTemplate>
                            <asp:LinkButton ID="ButtonAddCountry" CommandName="Insert" Text="Add" runat="server" OnClick="ButtonAddCountry_Click" CssClass="btn btn-primary btn-xs" />
                            <td>
                                <asp:TextBox ID="CountryNameInsert" runat="server" Text="<%#: BindItem.Name %>" AutoPostBack="true" CssClass="form-control">
                                </asp:TextBox>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListLanguageInsert" runat="server" DataSourceID="EntityDataSourceLanguages"
                                    DataTextField="Name" DataValueField="Id" SelectedValue="<%#:BindItem.Continent.Id %>" AutoPostBack="true" CssClass="form-control">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="CountryPopulationInsert" runat="server" Text="<%#: BindItem.Population %>" AutoPostBack="true" CssClass="form-control">
                                </asp:TextBox>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListContinentInsert" runat="server" DataSourceID="EntityDataSourceContinents"
                                    DataTextField="Name" DataValueField="Id" SelectedValue="<%#:BindItem.Continent.Id %>" AutoPostBack="true" CssClass="form-control">
                                </asp:DropDownList>
                            </td>
                        </FooterTemplate>
                    </asp:TemplateField>

                </Columns>

                <HeaderStyle BackColor="WhiteSmoke"></HeaderStyle>
            </asp:GridView>

            <asp:EntityDataSource ID="EntityDataSourceLanguages" runat="server"
                ConnectionString="name=ContinentsEntities"
                DefaultContainerName="ContinentsEntities"
                EnableDelete="True"
                EnableFlattening="False"
                EnableInsert="True"
                EnableUpdate="True"
                EntitySetName="Languages">
            </asp:EntityDataSource>

            <asp:EntityDataSource ID="EntityDataSourceCountries"
                EnableUpdate="true"
                EnableInsert="true"
                EnableDelete="true"
                runat="server"
                ConnectionString="name=ContinentsEntities"
                DefaultContainerName="ContinentsEntities"
                EnableFlattening="False"
                EntitySetName="Countries"
                Include="Language, Continent"
                Where="it.ContinentId=@ContID">
                <WhereParameters>
                    <asp:ControlParameter Name="ContID" Type="Int32"
                        ControlID="ListBoxContinents" />
                </WhereParameters>
            </asp:EntityDataSource>

            <h1>Towns</h1>
            <asp:ListView ID="ListViewTowns" runat="server"
                DataKeyNames="Id"
                DataSourceID="EntityDataSourceTowns" ItemType="Continents.Model.Town" InsertItemPosition="LastItem">
                <EditItemTemplate>
                    <tr class="table table-bordered" style="">
                        <td>
                            <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-primary btn-xs" />
                            <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary btn-xs" />
                        </td>
                        <td>
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PopulationTextBox" runat="server" Text='<%# Bind("Population") %>' />
                        </td>
                        <td>
                             <asp:DropDownList ID="DdlCountryEdit" runat="server" DataTextField="Name" DataValueField="Id" DataSourceID="EntityDataSourceCountries"
                                SelectedValue="<%# Item.CountryId %>" CssClass="form-control" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" class="table table-bordered">
                        <tr>
                            <td>No towns to display.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr>
                        <td>
                            <asp:LinkButton ID="ButtonInsert" runat="server" CommandName="Insert" Text="Insert" OnClick="ButtonInsert_Click" CssClass="btn btn-primary btn-xs" />
                            <asp:LinkButton ID="ButtonCancel" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-primary btn-xs" />
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxNameInsert" runat="server" Text='<%# Bind("Name") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxPopulationInsert" runat="server" Text='<%# Bind("Population") %>' />
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListCountryInsert" runat="server"
                                DataTextField="Name" DataValueField="Id" DataSourceID="EntityDataSourceCountries" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-primary btn-xs" />
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-primary btn-xs" />
                        </td>
                        <td>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PopulationLabel" runat="server" Text='<%# Eval("Population") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country.Name") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table class="table table-bordered" id="itemPlaceholderContainer" runat="server" border="0" style="">
                        <tr runat="server" class="table table-bordered">
                            <th runat="server">
                                <asp:LinkButton ID="ButtonAddTown" runat="server" Text="Add New Town"
                                    CommandName="Create" OnClick="ButtonAddTown_Click" CssClass="btn btn-primary" /></th>
                            <th runat="server">Name</th>
                            <th runat="server">Population</th>
                            <th runat="server">Country</th>
                        </tr>
                        <tr runat="server" class="table table-bordered" id="itemPlaceholder">
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button"
                                            ShowFirstPageButton="True"
                                            ShowNextPageButton="False"
                                            ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button"
                                            ShowLastPageButton="True"
                                            ShowNextPageButton="False"
                                            ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PopulationLabel" runat="server" Text='<%# Eval("Population") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country.Name") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>

            </asp:ListView>
            <asp:EntityDataSource ID="EntityDataSourceTowns" runat="server"
                ConnectionString="name=ContinentsEntities"
                DefaultContainerName="ContinentsEntities"
                EnableFlattening="False"
                EntitySetName="Towns"
                Include="Country"
                Where="it.CountryId=@CountryID" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
                <WhereParameters>
                    <asp:ControlParameter Name="CountryID" Type="Int32"
                        ControlID="GridViewCountries" />
                </WhereParameters>

            </asp:EntityDataSource>
        </div>
    </form>
</body>
</html>
