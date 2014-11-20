<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="PersonalInfo.aspx.cs" Inherits="_01_UserProfile.PersonalInfo" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <meta name="author" content="Pesho is cool" />
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <h1>Personal info</h1>
    First name: <strong>Pesho</strong>
    <br />
    Las name: <strong>Peshev</strong>
    <br />
    Address: <strong>Sofia city</strong>
    <br />
    Phone: <strong>Sofia city</strong>
</asp:Content>