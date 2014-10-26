<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BrowserInfoAndIP.aspx.cs" Inherits="ShowClientBrowserInfoAndIP.BrowserInfoAndIP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Browser Info and Client IP</title>
    <link href="Styles/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="jumbotron">
            <p runat="server" id="BrowserInfo"></p>
            <p runat="server" id="ClientIP"></p>
        </div>
    </div>
    </form>
</body>
</html>
