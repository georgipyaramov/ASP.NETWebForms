<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sumator.aspx.cs" Inherits="Sumator.Sumator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Sumator</h1>
        First number:
        <asp:TextBox ID="TextBoxFirstNum" runat="server"></asp:TextBox>
        <br />
        Second number:  
        <asp:TextBox ID="TextBoxSecondNum" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="ButtonCalculateSum" runat="server" 
            onclick="ButtonCalculateSum_Click" Text="Calculate Sum" />
        <br />
        Sum:
        <asp:TextBox ID="TextBoxSum" runat="server"></asp:TextBox>
    </form>
</body>
</html>
