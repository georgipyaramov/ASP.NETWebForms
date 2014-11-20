<%@ Page
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="Register.aspx.cs"
    Inherits="StudentRegistrationForm.Register"
    UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration Form</title>
    <webopt:BundleReference runat="server" Path="~/Styles/css" />
</head>
<body>
    <form id="registrationForm" runat="server">
        <asp:Panel runat="server" CssClass="container">
            <h2 class="text-center">Student Registration Form</h2>
            <hr />
            <asp:Panel runat="server" CssClass="row" ID="main">
                <asp:Panel runat="server" CssClass="col-md-6">
                    <asp:Panel runat="server" CssClass="form-horizontal">
                        <asp:Panel runat="server" CssClass="form-group">
                            <asp:TextBox ID="textBoxFirstNameInput" CssClass="form-control" runat="server" placeholder="First name" />
                            <asp:RequiredFieldValidator 
                                ID="firstNameVlidator"
                                runat="server" 
                                ErrorMessage="Please enter first name!"
                                ControlToValidate="textBoxFirstNameInput"
                                Display="Dynamic"
                                CssClass="alert-danger">
                            </asp:RequiredFieldValidator>
                        </asp:Panel>
                        <asp:Panel runat="server" CssClass="form-group">
                            <asp:TextBox ID="textBoxLastNameInput" CssClass="form-control" runat="server" placeholder="Last name" />
                            <asp:RequiredFieldValidator 
                                ID="lastNameValidator"
                                runat="server" 
                                ErrorMessage="Please enter last name!"
                                ControlToValidate="textBoxLastNameInput"
                                Display="Dynamic"
                                CssClass="alert-danger">
                            </asp:RequiredFieldValidator>
                        </asp:Panel>
                        <asp:Panel runat="server" CssClass="form-group">
                            <asp:TextBox ID="textBoxFacultyNumberInput" CssClass="form-control" runat="server" placeholder="Faculty number" />
                            <asp:RequiredFieldValidator 
                                ID="facultyNumberValidator"
                                runat="server" 
                                ErrorMessage="Please enter faculty number name!"
                                ControlToValidate="textBoxFacultyNumberInput"
                                Display="Dynamic"
                                CssClass="alert-danger">
                            </asp:RequiredFieldValidator>
                        </asp:Panel>
                        <asp:Panel runat="server" CssClass="form-group">
                            <asp:DropDownList ID="dropDownListUniversityInput" CssClass="form-control" runat="server" AutoPostBack="false">
                                <asp:ListItem Value="0" Text="Select University" Selected="True" />
                                <asp:ListItem Value="Sofia University" Text="Sofia University" />
                                <asp:ListItem Value="Technical University" Text="Technical University" />
                                <asp:ListItem Value="University of National and World Economy" Text="University of National and World Economy" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator
                                ID="universityValidator"
                                runat="server"
                                ControlToValidate="dropDownListUniversityInput"
                                InitialValue="0"
                                ErrorMessage="Please select university!"
                                Display="Dynamic"
                                CssClass="alert-danger" />
                        </asp:Panel>
                        <asp:Panel runat="server" CssClass="form-group">
                            <asp:DropDownList ID="dropDownListSpecialtyInput" CssClass="form-control" runat="server" AutoPostBack="false">
                                <asp:ListItem Value="0" Text="Select Specialty" Selected="True" />
                                <asp:ListItem Value="Computer Science" Text="Computer Science" />
                                <asp:ListItem Value="Philosophy" Text="Philosophy" />
                                <asp:ListItem Value="Automotive Engineering" Text="Automotive Engineering" />
                                <asp:ListItem Value="Robotics" Text="Robotics" />
                                <asp:ListItem Value="Finantials" Text="Finantials" />
                                <asp:ListItem Value="Economics" Text="Economics" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator1"
                                runat="server"
                                ControlToValidate="dropDownListSpecialtyInput"
                                InitialValue="0"
                                ErrorMessage="Please select specialty!"
                                Display="Dynamic"
                                CssClass="alert-danger" />
                        </asp:Panel>
                        <asp:Panel runat="server" CssClass="form-group">
                            <asp:ListBox ID="dropDownCoursesInput" CssClass="form-control" runat="server" AutoPostBack="false" SelectionMode="Multiple">
                                <asp:ListItem Value="CSS">CSS</asp:ListItem>
                                <asp:ListItem Value="HTML">HTML</asp:ListItem>
                                <asp:ListItem Value="Javascript">Javascript</asp:ListItem>
                                <asp:ListItem Value="C#">C#</asp:ListItem>
                                <asp:ListItem Value="OOP">OOP</asp:ListItem>
                                <asp:ListItem Value="ASP.Net">ASP.Net</asp:ListItem>
                                <asp:ListItem Value="Database">Database</asp:ListItem>
                            </asp:ListBox>
                        </asp:Panel>
                        <asp:Panel runat="server" CssClass="form-group">
                            <asp:Button ID="buttonRegister" CssClass="btn btn-default" runat="server" Text="Register" OnClick="buttonRegister_Click" />
                        </asp:Panel>
                    </asp:Panel>
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
