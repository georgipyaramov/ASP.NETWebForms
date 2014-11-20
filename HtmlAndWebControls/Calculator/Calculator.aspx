<%@ Page
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="Calculator.aspx.cs"
    Inherits="Calculator.Calculator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calculator</title>
    <webopt:BundleReference runat="server" Path="~/Styles/css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel runat="server" CssClass="container">
            <h2 class="text-center">Student Registration Form</h2>
            <hr />
            <asp:Panel runat="server" CssClass="row" ID="main">
                <asp:Panel runat="server" CssClass="col-md-4 col-md-offset-4 no-padding">
                    <asp:TextBox runat="server" ID="textBoxCalcDisplay" Text="" CssClass="col-md-12 form-control text-right" ReadOnly="true" />
                </asp:Panel>
                <asp:Panel runat="server" CssClass="col-md-4 col-md-offset-4">
                    <asp:Panel runat="server" CssClass="row">
                        <asp:Button runat="server" ID="oneBtn" Text="1" CssClass="col-sm-3 btn btn-default" OnClick="digitBtn_Click" />
                        <asp:Button runat="server" ID="twoBtn" Text="2" CssClass="col-sm-3 btn btn-default" OnClick="digitBtn_Click" />
                        <asp:Button runat="server" ID="threeBtn" Text="3" CssClass="col-sm-3 btn btn-default" OnClick="digitBtn_Click" />
                        <asp:Button runat="server" ID="plusBtn" Text="+" CssClass="col-sm-3 btn btn-default" OnClick="plusBtn_Click" />
                    </asp:Panel>
                    <asp:Panel runat="server" CssClass="row">
                        <asp:Button runat="server" ID="fourBtn" Text="4" CssClass="col-sm-3 btn btn-default" OnClick="digitBtn_Click" />
                        <asp:Button runat="server" ID="fiveBtn" Text="5" CssClass="col-sm-3 btn btn-default" OnClick="digitBtn_Click" />
                        <asp:Button runat="server" ID="sixBtn" Text="6" CssClass="col-sm-3 btn btn-default" OnClick="digitBtn_Click" />
                        <asp:Button runat="server" ID="minusBtn" Text="-" CssClass="col-sm-3 btn btn-default" OnClick="minusBtn_Click" />
                    </asp:Panel>
                    <asp:Panel runat="server" CssClass="row">
                        <asp:Button runat="server" ID="sevenBtn" Text="7" CssClass="col-sm-3 btn btn-default" OnClick="digitBtn_Click" />
                        <asp:Button runat="server" ID="eightBtn" Text="8" CssClass="col-sm-3 btn btn-default" OnClick="digitBtn_Click" />
                        <asp:Button runat="server" ID="nineBtn" Text="9" CssClass="col-sm-3 btn btn-default" OnClick="digitBtn_Click" />
                        <asp:Button runat="server" ID="multiplyByBtn" Text="x" CssClass="col-sm-3 btn btn-default" OnClick="multiplyByBtn_Click" />
                    </asp:Panel>
                    <asp:Panel runat="server" CssClass="row">
                        <asp:Button runat="server" ID="clearBtn" Text="Clear" CssClass="col-sm-3 btn btn-default" OnClick="clearBtn_Click" />
                        <asp:Button runat="server" ID="zeroBtn" Text="0" CssClass="col-sm-3 btn btn-default" OnClick="digitBtn_Click" />
                        <asp:Button runat="server" ID="devideByBtn" Text="/" CssClass="col-sm-3 btn btn-default" OnClick="devideByBtn_Click" />
                        <asp:Button runat="server" ID="sqrtBtn" CssClass="col-sm-3 btn btn-default" OnClick="sqrtBtn_Click" />
                    </asp:Panel>
                    <asp:Panel runat="server" CssClass="row">
                        <asp:Button runat="server" ID="equalsBtn" Text="=" CssClass="col-md-12 btn btn-default" OnClick="equalsBtn_Click" />
                    </asp:Panel>
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
    </form>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
