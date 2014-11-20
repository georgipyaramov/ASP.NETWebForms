<%@ Page 
    Language="C#" 
    AutoEventWireup="true" 
    CodeBehind="RandomNumberGenerator.aspx.cs" 
    Inherits="RandomNumberGenerator.RandomNumberGenerator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Random Number Generator</title>
    <link href="Styles/bootstrap.min.css" rel="stylesheet"/>
    <link href="Styles/Site.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h2 class="text-center">Generate Random Number</h2>
        <hr />
        <div class="row">
            <div class="col-sm-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputRangeMin" class="control-label">Min</label>
                        <input id="inputRangeMin" type="text" value="" class="form-control" runat="server"/>
                    </div>
                    <div class="form-group">
                        <label for="inputRangeMax" class="control-label">Max</label>
                        <input id="inputRangeMax" type="text" value="" class="form-control" runat="server"/>
                    </div>
                </div>
            </div>
            <div class="col-sm-5 col-sm-offset-1">
                <label class="control-label">Generated Number</label>
                <p class="form-control" runat="server" id="generatedNumber"></p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-offset-5 col-sm-2">
                <input class="btn-default btn" type="submit" value="Generate" id="generateNumberBtn" runat="server"
                    onServerClick="generateNumberBtn_Click"/>
            </div>
        </div>
    </div>
    </form>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
