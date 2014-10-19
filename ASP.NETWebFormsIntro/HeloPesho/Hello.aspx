<%@ Page Language="C#" 
    AutoEventWireup="true" 
    CodeBehind="Hello.aspx.cs" 
    Inherits="HeloPesho.Hello" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hello Pesho</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBoxNameInput" placeholder="Enter name" runat="server">
        </asp:TextBox>
        <asp:Button runat="server" ID="WriteNameButton" OnClick="WriteNameButton_Click" Text="Write Name" />
        <br />
        <asp:Label Text="" runat="server" ID="LabelHello" />
    </div>
    </form>
</body>
</html>
