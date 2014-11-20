<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="RegisterPageValidation.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styles/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="form-horizontal" role="form">
        <h1>Register</h1>
        <div class="container">
            <asp:ValidationSummary runat="server" CssClass="alert-danger" />
            <asp:Label ID="LabelFinalResult" runat="server" Text=""></asp:Label>
            <br />
        </div>
        <div class="container">
            <div class="table table-bordered panel-body">
                <div class="form-group ">
                    <asp:Label ID="LabelUsername" CssClass="control-label col-sm-1" runat="server" Text="Username: "
                        AssociatedControlID="TextBoxUsername"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="TextBoxUsername" CssClass="form-control " runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ValidationGroup="LoginInfo" ID="RequiredFieldValidatorUsername" runat="server" CssClass="alert-danger"
                        ErrorMessage="Username is required" Display="Dynamic"
                        ControlToValidate="TextBoxUsername" EnableClientScript="True" />
                    <asp:CustomValidator ValidationGroup="LoginInfo" ID="CustomValidatorUsername" runat="server" CssClass="alert-danger"
                        OnServerValidate="CustomValidatorUsername_ServerValidate" ClientValidationFunction="ClientValidate"
                        ErrorMessage="Username should be more than 3 symbols." ControlToValidate="TextBoxUsername" />
                </div>

                <div class="form-group ">
                    <asp:Label ID="LabelPass" CssClass="control-label col-sm-1" runat="server" Text="Password: "
                        AssociatedControlID="TextBoxPassword"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="TextBoxPassword" TextMode="Password" CssClass="form-control " runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ValidationGroup="LoginInfo" ID="RequiredFieldValidatorPass" runat="server" CssClass="alert-danger"
                        ErrorMessage="Password is required" ControlToValidate="TextBoxPassword" EnableClientScript="True"
                        Display="Dynamic" />
                    <asp:CustomValidator ValidationGroup="LoginInfo" ID="CustomValidatorPass" runat="server"
                        OnServerValidate="CustomValidatorUsername_ServerValidate" ClientValidationFunction="ClientValidate"
                        ErrorMessage="Password should be more than 3 symbols." ControlToValidate="TextBoxPassword" Display="Dynamic" />
                </div>

                <div class="form-group ">
                    <asp:Label ID="LabelConfirmPass" CssClass="control-label col-sm-1" runat="server" Text="Confirm password: "
                        AssociatedControlID="TextBoxConfirmPass"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="TextBoxConfirmPass" TextMode="Password" CssClass="form-control " runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ValidationGroup="LoginInfo" ID="RequiredFieldValidatorConfirmPass" runat="server" CssClass="alert-danger"
                        ErrorMessage="Field is required" ControlToValidate="TextBoxConfirmPass" Display="Dynamic"
                        EnableClientScript="True" />
                    <asp:CompareValidator ValidationGroup="LoginInfo" ID="CompareValidatorConfirmPass" runat="server" CssClass="alert-danger"
                        ErrorMessage="Password do not match." ControlToValidate="TextBoxConfirmPass"
                        ControlToCompare="TextBoxPassword" Display="Dynamic" Font-Italic="True" />
                </div>
                <asp:Button ID="ButtonSubmitLoginInfo" Text="Submit only LogIn info" runat="server" 
                    OnClick="ButtonSubmitLoginInfo_Click" CommandName="Submit" CssClass="btn btn-primary" />
            </div>

            <div class="table table-bordered panel-body">
                <div class="form-group ">
                    <asp:Label ID="LabelFName" CssClass="control-label col-sm-1" runat="server" Text="First name: "
                        AssociatedControlID="TextBoxFirstName"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="TextBoxFirstName" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ValidationGroup="PersonalInfo" ID="RequiredFieldValidatorFName" runat="server" CssClass="alert-danger"
                        ErrorMessage="First name is required" Display="Dynamic"
                        ControlToValidate="TextBoxFirstName" EnableClientScript="True" />
                    <asp:CustomValidator ValidationGroup="PersonalInfo" ID="CustomValidator1" runat="server" CssClass="alert-danger"
                        OnServerValidate="CustomValidatorUsername_ServerValidate" ClientValidationFunction="ClientValidate"
                        ErrorMessage="First name should be more than 3 symbols." ControlToValidate="TextBoxFirstName" />
                </div>

                <div class="form-group ">
                    <asp:Label ID="LabelLName" CssClass="control-label col-sm-1" runat="server" Text="Last name: "
                        AssociatedControlID="TextBoxUsername"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="TextBoxLastName" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ValidationGroup="PersonalInfo" ID="RequiredFieldValidator1" runat="server" CssClass="alert-danger"
                        ErrorMessage="Last name is required" Display="Dynamic"
                        ControlToValidate="TextBoxLastName" EnableClientScript="True" />
                    <asp:CustomValidator ValidationGroup="PersonalInfo" ID="CustomValidator2" runat="server" CssClass="alert-danger"
                        OnServerValidate="CustomValidatorUsername_ServerValidate" ClientValidationFunction="ClientValidate"
                        ErrorMessage="Last name should be more than 3 symbols." ControlToValidate="TextBoxLastName" />
                </div>

                <div class="form-group ">
                    <asp:Label ID="LabelAge" ValidationGroup="PersonalInfo" CssClass="control-label col-sm-1" runat="server" Text="Age: "
                        AssociatedControlID="TextBoxAge"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="TextBoxAge" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ValidationGroup="PersonalInfo" ID="RequiredFieldValidator2" runat="server" CssClass="alert-danger"
                        ErrorMessage="Age is required" Display="Dynamic"
                        ControlToValidate="TextBoxAge" EnableClientScript="True" />
                    <asp:RangeValidator ValidationGroup="PersonalInfo" ID="RangeValidatorAge" runat="server" Display="Dynamic" 
                        ErrorMessage="Age should be between 18 and 81 years."
                        MinimumValue="18" MaximumValue="81" ControlToValidate="TextBoxAge" Type="Integer" CssClass="alert-danger" />
                </div>
                <asp:Button ID="ButtonSubmitPersonalInfo" Text="Submit only Personal info" runat="server" CommandName="Submit"
                     CssClass="btn btn-primary" OnClick="ButtonSubmitPersonalInfo_Click" />
            </div>

            <div class="table table-bordered panel-body">
                <div class="form-group ">
                    <asp:Label ID="LabelEmail" CssClass="control-label col-sm-1" runat="server" Text="Email: "
                        AssociatedControlID="TextBoxEmail"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="TextBoxEmail" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ValidationGroup="ContactInfo" ID="RequiredFieldValidatorEmail" runat="server" CssClass="alert-danger"
                        ErrorMessage="Email is required" Display="Dynamic"
                        ControlToValidate="TextBoxEmail" EnableClientScript="True" />
                    <asp:RegularExpressionValidator ValidationGroup="ContactInfo" ID="RegularExpressionValidatorEmail" runat="server" CssClass="alert-danger"
                        ErrorMessage="Invalid email!" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" ControlToValidate="TextBoxEmail" />
                </div>

                <div class="form-group ">
                    <asp:Label ID="LabelAddress" CssClass="control-label col-sm-1" runat="server" Text="Address: "
                        AssociatedControlID="TextBoxAddress"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="TextBoxAddress" CssClass="form-control" runat="server" ></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ValidationGroup="ContactInfo" ID="RequiredFieldValidator3" runat="server" CssClass="alert-danger"
                        ErrorMessage="Address is required" Display="Dynamic"
                        ControlToValidate="TextBoxAddress" EnableClientScript="True" />
                </div>

                <div class="form-group ">
                    <asp:Label ID="LabelPhone" CssClass="control-label col-sm-1" runat="server" Text="Phone: "
                        AssociatedControlID="TextBoxPhone"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="TextBoxPhone" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ValidationGroup="ContactInfo" ID="RequiredFieldValidator4" runat="server" CssClass="alert-danger"
                        ErrorMessage="Phone is required" Display="Dynamic"
                        ControlToValidate="TextBoxPhone" EnableClientScript="True" />
                    <asp:RegularExpressionValidator ValidationGroup="ContactInfo" ID="RegularExpressionValidator1" runat="server" CssClass="alert-danger"
                        ErrorMessage="Invalid phone!" ValidationExpression="^\+?[0-9]{3}-?[0-9]{5,12}$" ControlToValidate="TextBoxPhone" />
                </div>

                <asp:Button Text="Submit only Contact info" runat="server" ID="ButtonSubmitContactInfo" 
                    OnClick="ButtonSubmitContactInfo_Click" CommandName="Submit" CssClass="btn btn-primary" />
            </div>

            <div class="form-group ">
                <asp:Label ID="LabelAccept" CssClass="control-label col-sm-1" runat="server" Text="I accept"
                    AssociatedControlID="CheckBoxAccept"></asp:Label>
                <div class="col-sm-6 ">
                    <div class="checkbox">
                        <label class="checkbox-inline">
                            <asp:CheckBox ID="CheckBoxAccept" CssClass="" runat="server"></asp:CheckBox></label>
                    </div>
                </div>
                <asp:CustomValidator ID="CustomValidatorCheckBox" CssClass="alert-danger" runat="server"
                    ClientValidationFunction="CheckBoxAccept_ClientValidate" Display="Dynamic"
                    ErrorMessage="You should accept our terms." />
            </div>
            <asp:Button runat="server" ID="ButtonSubmit" CssClass="btn btn-primary btn-lg"
                CommandName="Submit" Text="Submit  All" OnClick="ButtonSubmit_Click" />
        </div>


    </form>
    <script>
        function ClientValidate(source, clientside_arguments) {
            if (clientside_arguments.Value.length < 3) {
                clientside_arguments.IsValid = false;
            }
            else { clientside_arguments.IsValid = true };
        }

        function CheckBoxAccept_ClientValidate(sender, args) {
            args.IsValid = document.getElementById('<%=CheckBoxAccept.ClientID%>').checked;
        }

    </script>
</body>
</html>
