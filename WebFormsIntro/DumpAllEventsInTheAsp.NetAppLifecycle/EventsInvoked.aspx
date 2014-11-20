<%@ Page Language="C#" 
    AutoEventWireup="true" 
    CodeBehind="EventsInvoked.aspx.cs" 
    Inherits="DumpAllEventsInTheAsp.NetAppLifecycle.EventsInvoked" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button Text="Press me!" ID="btn" runat="server" 
            OnClick="btn_Click" 
            OnInit="btn_Init" 
            OnLoad="btn_Load" 
            OnPreRender="btn_PreRender" />
    </div>
    </form>
</body>
</html>
