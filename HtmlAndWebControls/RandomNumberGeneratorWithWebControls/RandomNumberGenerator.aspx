<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RandomNumberGenerator.aspx.cs" Inherits="RandomNumberGeneratorWithWebControls.RandomNumberGenerator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Random Number Generator</title>
    <webopt:BundleReference runat="server" path="~/Styles/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel runat="server" CssClass="container">
        <h2 class="text-center">Generate Random Number</h2>
        <hr />
        <asp:Panel runat="server" CssClass="row">
            <asp:Panel runat="server" CssClass="col-sm-6">
                <asp:Panel runat="server" CssClass="form-horizontal">
                    <asp:Panel runat="server" CssClass="form-group">
                        <asp:label runat="server" AssociatedControlID="inputRangeMin" Text="Min" class="control-label"></asp:label>
                        <asp:TextBox ID="inputRangeMin" CssClass="form-control" runat="server"/>
                    </asp:Panel>
                    <asp:Panel runat="server" CssClass="form-group">
                        <asp:label runat="server" AssociatedControlID="inputRangeMax" class="control-label" Text="Max"></asp:label>
                        <asp:TextBox ID="inputRangeMax" CssClass="form-control" runat="server"/>
                    </asp:Panel>
                </asp:Panel>
            </asp:Panel>
            <asp:Panel runat="server" CssClass="col-sm-5 col-sm-offset-1">
                <asp:label runat="server" AssociatedControlID="generatedNumber" class="control-label" Text="Generated Number"></asp:label>
                <asp:TextBox CssClass="form-control enabled" runat="server" ID="generatedNumber" ReadOnly="true"></asp:TextBox>
            </asp:Panel>
        </asp:Panel>
        <asp:Panel runat="server" CssClass="row">
            <asp:Panel runat="server" CssClass="col-sm-offset-5 col-sm-2">
                <asp:Button CssClass="btn-default btn" Text="Generate" ID="generateNumberBtn" runat="server" OnClick="generateNumberBtn_Click"/>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
    </form>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
