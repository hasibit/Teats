
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogintoHMS.aspx.cs" Inherits="BRBERP.LogintoHMS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!--META-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login To BRB HMS</title>

    <!--STYLESHEETS-->

    <link href="formaster/login/css/css2.css" rel="stylesheet" />

    <link href="formaster/login/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>

    <!--WRAPPER-->
    <div id="wrapper">

        <!--SLIDE-IN ICONS-->
        <div class="user-icon"></div>
        <div class="pass-icon"></div>
        <!--END SLIDE-IN ICONS-->

        <!--LOGIN FORM-->
        <form name="login-form" class="login-form" runat="server">

            <!--HEADER-->
            <div class="header">
                <!--TITLE-->
                <h1>Login To BRB HMS</h1>
                <!--END TITLE-->
                <!--DESCRIPTION-->
                <span>Fill out the form below to login.</span><!--END DESCRIPTION--><br />

                <asp:Label runat="server" ID="lblMsg"></asp:Label>

            </div>
            <!--END HEADER-->

            <!--CONTENT-->
            <div class="content">
                <!--USERNAME-->
                <asp:TextBox ID="txtUserName" name="username" type="text" CssClass="input username" value="Username" onfocus="this.value=''" runat="server" /><!--END USERNAME-->
                <!--USERNAME<input name="username" type="text" class="input username" value="Username" onfocus="this.value=''" /><!--END USERNAME-->
                <!--PASSWORD-->
                <asp:TextBox ID="txtPassword" name="password" type="password" CssClass="input password" value="Password" onfocus="this.value=''" runat="server" /><!--END PASSWORD-->
                <!--PASSWORD<input name="password" type="password" class="input password" value="Password" onfocus="this.value=''" /><!--END PASSWORD-->
            </div>
            <!--END CONTENT-->

            <!--FOOTER-->
            <div class="footer">
                <!--LOGIN BUTTON-->
                <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" CssClass="button" /><%--<input type="submit" name="submit" value="Login" class="button" />--%><!--END LOGIN BUTTON-->
                <!--REGISTER BUTTON<input type="submit" name="submit" value="Register" class="register" /><!--END REGISTER BUTTON-->
            </div>
            <!--END FOOTER-->

        </form>
        <!--END LOGIN FORM-->

    </div>
    <!--END WRAPPER-->

    <!--GRADIENT-->
    <div class="gradient"></div>
    <!--END GRADIENT-->
    
    


    <!--SCRIPTS-->
    <script type="text/javascript" src="Scripts/jquery.min.js"></script>
    <!--Slider-in icons-->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".username").focus(function () {
                $(".user-icon").css("left", "-48px");
            });
            $(".username").blur(function () {
                $(".user-icon").css("left", "0px");
            });

            $(".password").focus(function () {
                $(".pass-icon").css("left", "-48px");
            });
            $(".password").blur(function () {
                $(".pass-icon").css("left", "0px");
            });
        });
    </script>

</body>
</html>

