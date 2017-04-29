<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HistoryQuest.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="libs/css/main.css" />
    <title>Моя Україна</title>
</head>
<body class="admin-body">
    <div class="login-page">
        <div class="admin-form">
            <div class="logo-body">
                <h2>Вітаємо на проекті <br />"Моя Україна"!</h2>
            </div>
            <form class="login-form" runat="server" onsubmit="return formValidation();">
                <input type="text" placeholder="Пошта" runat="server" id="log_box"/>
                <input type="password" placeholder="Пароль" runat="server" id="pass_box" />
                <asp:Button runat="server" class="button" onclick="LoginButton_Click" Text="Увійти"></asp:Button>
            </form>
            <asp:Label runat="server" id="error_text"/>
            <div class="login-icons">
                <div class="icons-inside">
                       <a href="#"><img src="libs/img/gmail-icon.png" /></a>
                </div>
                <div class="icons-inside">
                    <a href="#"><img src="libs/img/vk-icon.png" /></a>
                </div>
            </div>
            <div class="register-href">
                <a href="Registration.aspx">Зареєструватися</a>
            </div>
        </div>
    </div>
</body>
    <script type="text/javascript">
        function formValidation() {
            var valid = true;
            if (document.getElementById('pass_box').value == '') {
                valid = false;
                document.getElementById('pass_box').style.border = '1px solid red';
            }
            else { document.getElementById('pass_box').style.border = ''; }
            if (document.getElementById('log_box').value == '') {
                valid = false;
                document.getElementById('log_box').style.border = '1px solid red';
            }
            else { document.getElementById('log_box').style.border = ''; }

            return valid;
        };
    </script>
</html>
