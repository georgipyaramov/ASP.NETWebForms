<%@ Page Language="C#" 
AutoEventWireup="true" 
CodeBehind="Search.aspx.cs" 
Inherits="CarSearch.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Search</title>
        <link href="Styles/bootstrap.min.css" rel="stylesheet" />
        <link href="Styles/Site.css" rel="stylesheet" />
    </head>
    <body>
        <form id="mainSearch" runat="server" class="container">
            <h2 class="text-center">Car Search</h2>
            <br />
            <hr />
            <asp:Panel runat="server" ID="searchForm" CssClass="form-horizontal">
                <asp:Panel runat="server" CssClass="form-group">
                    <asp:DropDownList runat="server" ID="dropDownProducer" CssClass="form-control dropdown" DataTextField="Name" DataValueField="Name" AutoPostBack="true" OnSelectedIndexChanged="dropDownProducer_SelectedIndexChanged" >
                    </asp:DropDownList>
                </asp:Panel>
                <asp:Panel runat="server" CssClass="form-group">
                    <asp:DropDownList runat="server" ID="dropDownModel" CssClass="form-control dropdown" AutoPostBack="true" >
                    </asp:DropDownList>
                </asp:Panel>
                <asp:Panel runat="server" CssClass="form-group">
                    <asp:CheckBoxList runat="server" ID="checkBoxExtras">
                    </asp:CheckBoxList>
                </asp:Panel>
                <asp:Panel runat="server" CssClass="form-group">
                    <asp:RadioButtonList runat="server" ID="radioButtonEngineTypes" CssClass="radio-btn-list" >
                    </asp:RadioButtonList>
                </asp:Panel>
                <asp:Panel runat="server" CssClass="form-group">
                    <asp:Button Text="Search" ID="searchBtn" runat="server" OnClick="searchBtn_Click" />
                </asp:Panel>
            </asp:Panel>

            <asp:Panel ID="resultPanel" runat="server">
                <asp:Literal ID="ltlSubmit" runat="server"></asp:Literal>
            </asp:Panel>
        </form>
        <script src="Scripts/jquery-1.10.2.min.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
    </body>
</html>
