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
            <form class="login-form" runat="server">
                <input type="text" placeholder="Логін" />
                <input type="password" placeholder="Пароль" />
                <asp:Button runat="server" onclick="LoginButton_Click" Text="Увійти"></asp:Button>
            </form>
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
</html>
