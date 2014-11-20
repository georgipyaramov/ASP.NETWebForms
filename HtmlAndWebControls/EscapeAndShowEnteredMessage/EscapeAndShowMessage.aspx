<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EscapeAndShowMessage.aspx.cs" Inherits="EscapeAndShowEnteredMessage.EscapeAndShowMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Escape And Show Message</title>
    <webopt:BundleReference runat="server" path="~/Styles/css" />
</head>
<body>
    <form id="mainContent" runat="server">
        <asp:Panel runat="server" CssClass="container">
            <h2 class="text-center">Show Entered Message</h2>
            <hr />
            <asp:Panel ID="formCotrolContainer" runat="server" CssClass="form-horizontal">
                <asp:Panel runat="server" CssClass="form-group">
                    <asp:Label Text="Message" AssociatedControlID="textBoxMessageInput" runat="server" />
                    <asp:TextBox runat="server" ID="textBoxMessageInput" CssClass="form-control" />
                </asp:Panel>
                <asp:Panel runat="server" CssClass="form-group">
                    <asp:Button Text="Show Massage" runat="server" ID="showMessageBtn" OnClick="showMessageBtn_Click" CssClass="btn btn-default"/>
                </asp:Panel>
            </asp:Panel>            
        </asp:Panel>
    </form>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
