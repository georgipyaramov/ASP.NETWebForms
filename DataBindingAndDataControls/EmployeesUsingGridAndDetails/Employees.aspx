<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="EmployeesUsingGridAndDetails.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Employees</title>
        <link href="Styles/bootstrap.min.css" rel="stylesheet" />
        <link href="Styles/Site.css" rel="stylesheet" />
    </head>
    <body>
        <form id="form1" runat="server" class="container">
            <h2 class="text-center">Employyes</h2>
            <br />
            <hr />
            <asp:Panel runat="server" ID="employeesNames">
                <asp:GridView runat="server" ID="gridViewEmployees" AutoGenerateColumns="false" CssClass="table table-bordered" ItemType="Northwind.Entities.Employee" DataKeyNames="EmployeeID">
                    <Columns>
                        <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <%# Item.EmployeeID %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:HyperLink NavigateUrl='<%# "EmpDetails.aspx?id=" + Item.EmployeeID %>' runat="server"><%# Item.FirstName + " " + Item.LastName %></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:Panel>
        </form>
        <script src="Scripts/jquery-1.10.2.min.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
    </body>
</html>
