﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HistoryQuest.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="libs/css/main.css" />
    <script src="libs/js/jquery-1.9.1.min.js"></script>
    <script src="libs/js/validation.js"></script>
    <script src="libs/js/preLoader.js"></script>
    <title>Моя Україна</title>
</head>
<body class="admin-body">
    <div class="login-page">
        <div class="admin-form">
            <div class="logo-body">
                <h2>Вітаємо на проекті
                    <br />
                    "Моя Україна"!</h2>
            </div>
            <form id="login_view" class="login-form" runat="server" onsubmit="return formValidation(['login_view']);">
                <input type="text" placeholder="Пошта" runat="server" id="log_box" validation="text" />
                <input type="password" placeholder="Пароль" runat="server" id="pass_box" validation="text" />
                <asp:Button runat="server" class="button" OnClick="LoginButton_Click" Text="Увійти"></asp:Button>
            </form>
            <asp:Label runat="server" ID="error_text" />
            <div class="login-icons">
                <div class="icons-inside">
                    <a href="<%= HistoryQuest.Domain.Socials.fbUrl %>">
                        <img src="libs/img/facebook-icon.png" /></a>
                </div>
                <div class="icons-inside">
                    <a href="<%= HistoryQuest.Domain.Socials.vkUrl %>">
                        <img src="libs/img/vk-icon.png" />
                    </a>
                </div>
            </div>
            <div class="register-href">
                <a href="Registration.aspx">Зареєструватися</a>
            </div>
        </div>
    </div>
</body>
<div class="se-pre-con"></div>
</html>
