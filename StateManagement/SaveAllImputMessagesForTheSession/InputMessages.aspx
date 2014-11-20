<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InputMessages.aspx.cs" Inherits="SaveAllImputMessagesForTheSession.InputMessages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <link href="Styles/bootstrap.min.css" rel="stylesheet" />
        <link href="Styles/Site.css" rel="stylesheet" />
    </head>
    <body>
        <form id="form1" runat="server" class="container form-horizontal">
            <div class="form-group">
                <asp:Label Text="Enter your message here" runat="server" AssociatedControlID="TextBoxInputMessages" />
                <asp:TextBox runat="server" ID="TextBoxInputMessages" CssClass="form-control" />
            </div>
            <asp:Button ID="ButtonSaveMessage" Text="Save message" runat="server" CssClass="btn btn-primary" OnClick="ButtonSaveMessage_Click" />
            <div id="MessagesContainer" runat="server" class="margin-top-10">

            </div>
        </form>
    </body>
</html>
