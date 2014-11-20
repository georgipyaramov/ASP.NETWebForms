<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="Friends.aspx.cs" Inherits="_01_UserProfile.Friends" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <meta name="author" content="Pesho is cool" />
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <h1>Friends</h1>
    <ul>
        <li>Gosho</li>
        <li>Sasho</li>
        <li>Misho</li>
        <li>Nasko</li>
    </ul>
</asp:Content>
