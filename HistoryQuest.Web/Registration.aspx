<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="HistoryQuest.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="libs/css/main.css" />
    <script src="libs/js/jquery-3.1.1.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.0.min.js" type="text/javascript"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/themes/blitzer/jquery-ui.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $("[id$=teachersBox]").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: '<%=ResolveUrl("~/WebServices/WebService.asmx/GetTeachersByPrefix") %>',
                    dataType: "json",
                    data: "{ 'prefix': '" + request.term + "'}",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.LastName + ' ' + item.FirstName[0] + '.' + item.MiddleName[0] + '. (' + item.id + ')',
                                val: item.gid
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            select: function (e, i) {
                $("[id$=selectedTeacher]").val(i.item.val);
            },
            minLength: 1
        });
        });
    </script>
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
            <form runat="server" class="views" onsubmit="return formValidation();">
                <div id="pupil-view" style="display: none">
                    <input type="text" placeholder="Прізвище" runat="server" id="sur_box" name="sur_box" />
                    <input type="text" placeholder="Ім'я" runat="server" id="name_box" />
                    <input type="text" placeholder="По батькові" runat="server" id="mid_box" />
                    <input type="text" placeholder="Пошта" runat="server" id="login_box" />
                    <input type="text" placeholder="Пароль" runat="server" id="pass_box" />
                    <asp:TextBox ID="teachersBox" placeholder="Вчитель (почніть вводити)" runat="server" />
                    <asp:HiddenField ID="selectedTeacher" runat="server" />
                    <div class="login-form">
                        <asp:Button runat="server" OnClick="RegisterButton_Click" Text="Зареєструватися"></asp:Button>
                    </div>
                    <asp:Label runat="server" ID="error_box" />
                </div>
                <div id="teacher-view" style="display: none">
                    <input type="text" placeholder="Ваш email" />
                    <div class="login-form">
                        <button>Надіслати запит</button>
                    </div>
                </div>
            </form>
            <div class="href-back">
                <a href="Login.aspx" id="href-back">Назад</a>
            </div>
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
            document.getElementById('href-back').setAttribute('href', 'Registration.aspx');
        };
        function formValidation() {
            var valid = true;
            if (document.getElementById('sur_box').value == '') {
                valid = false;
                document.getElementById('sur_box').style.border = '1px solid red';
            }
            else { document.getElementById('sur_box').style.border = ''; }
            if (document.getElementById('name_box').value == '') {
                valid = false;
                document.getElementById('name_box').style.border = '1px solid red';
            }
            else { document.getElementById('name_box').style.border = ''; }
            if (document.getElementById('mid_box').value == '') {
                valid = false;
                document.getElementById('mid_box').style.border = '1px solid red';
            }
            else { document.getElementById('mid_box').style.border = ''; }
            if (document.getElementById('pass_box').value == '') {
                valid = false;
                document.getElementById('pass_box').style.border = '1px solid red';
            }
            else { document.getElementById('pass_box').style.border = ''; }
            if (!valid) {
                document.getElementById('error_box').innerHTML = 'Заповніть обязкові поля!';
                document.getElementById('error_box').style.color = "red";
            }
            if (!validateEmail(document.getElementById('login_box').value)) {
                valid = false;
                document.getElementById('login_box').style.border = '1px solid red';
            }
            else { document.getElementById('login_box').style.border = ''; }

            return valid;
        };
        function validateEmail(email) {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
        };
    </script>
</body>
</html>
