<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="HistoryQuest.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="libs/css/main.css" />
    <script src="libs/js/jquery-3.1.1.min.js"></script>
    <script src="libs/js/validation.js"></script>
    <script src="libs/js/Helper.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.0.min.js" type="text/javascript"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/themes/blitzer/jquery-ui.css" rel="Stylesheet" type="text/css" />
    <script src="libs/js/bindTeachers.js"></script>
    <title></title>
</head>
<body class="admin-body">
    <div class="login-page">
        <div class="admin-form">
            <form runat="server" class="views" onsubmit="return formValidation(['pupil-view', 'teacher-view']);">
                <div id="pupil-view">
                    <input type="text" placeholder="Прізвище" runat="server" id="sur_box" name="sur_box" validation="text" />
                    <input type="text" placeholder="Ім'я" runat="server" id="name_box" validation="text" />
                    <input type="text" placeholder="По батькові" runat="server" id="mid_box" validation="text" />
                    <input type="text" placeholder="Пошта" runat="server" id="login_box" validation="email" />
                    <input type="password" placeholder="Пароль" runat="server" id="pass_box" validation="password" />
                    <input type="password" placeholder="Повторіть пароль" runat="server" id="pass_commit" validation="password-commit" />
                    <asp:TextBox ID="teachersBox" placeholder="Вчитель (почніть вводити)" runat="server" />
                    <asp:HiddenField ID="selectedTeacher" runat="server" />
                    <div class="login-form">
                        <asp:Button runat="server" OnClick="RegisterButton_Click" Text="Зареєструватися"></asp:Button>
                    </div>
                    <asp:Label runat="server" ID="error_box" />
                </div>
                <div id="teacher-view" style="display: none">
                    <input type="text" placeholder="Ваш email" runat="server" validation="email" />
                    <div class="login-form ">
                        <button>Надіслати запит</button>
                    </div>
                </div>
            </form>
            <div class="href-back" id="href-back">
                <a onclick="showControl('teacher-view', ['href-back', 'pupil-view'])" >Ви вчитель?</a>
            </div>
        </div>
    </div>
</body>
</html>
