<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpDetails.aspx.cs" Inherits="EmployeesUsingGridAndDetails.EmpDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Employee Details</title>
        <link href="Styles/bootstrap.min.css" rel="stylesheet" />
        <link href="Styles/Site.css" rel="stylesheet" />
    </head>
    <body>
        <form id="form1" runat="server" class="container">
            <h2 class="text-center">Employyes</h2>
            <br />
            <hr />
            <asp:Panel runat="server" ID="employeesNames">
                <asp:DetailsView runat="server" AutoGenerateRows="true" ID="detailsViewEmployee" CssClass="table table-bordered">
                </asp:DetailsView>
            </asp:Panel>
            <asp:Panel runat="server">
                <asp:HyperLink NavigateUrl="~/Employees.aspx" runat="server" CssClass="btn btn-default">Back</asp:HyperLink>
            </asp:Panel>
        </form>
        <script src="Scripts/jquery-1.10.2.min.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
    </body>
</html>
