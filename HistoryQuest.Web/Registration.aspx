<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="HistoryQuest.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="libs/css/main.css" />
    <script src="libs/js/jquery-3.1.1.min.js"></script>
    <title></title>
</head>
<body class="admin-body">
    <div class="login-page">
        <div class="admin-form">
            <div id="chooseButtons">
                <div class="logo-body">
                    <h2>Зареєструватися як</h2>
                </div>
                <div class="login-form">
                    <button onclick="showControl('teacher')">Вчитель</button>
                    <button onclick="showControl('pupil')">Учень</button>
                </div>
            </div>
            <form runat="server" class="views">
                <div id="pupil-view" style="display: none">
                    <input type="text" placeholder="Прізвище" />
                    <input type="text" placeholder="Ім'я" />
                    <input type="text" placeholder="По батькові" />
                    <input type="text" placeholder="ID вчителя" />
                    <div class="login-form">
                        <button>Надіслати запит</button>
                    </div>
                </div>
                <div id="teacher-view" style="display: none">
                    <input type="text" placeholder="Ваш email" />
                    <div class="login-form">
                        <button>Надіслати запит</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
        function showControl(who) {
            var chooseButtons = document.getElementById('chooseButtons');
            chooseButtons.style.display = 'none';

            switch (who) {
                case 'pupil':
                    var pupilView = document.getElementById('pupil-view');
                    pupilView.style.display = 'block';
                    break;
                case 'teacher':
                    var teacherView = document.getElementById('teacher-view');
                    teacherView.style.display = 'block';
                    break;
            }
        }
    </script>
</body>
</html>
