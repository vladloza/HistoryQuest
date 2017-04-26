<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HistoricalInformation.aspx.cs" Inherits="HistoryQuest.HistoricalInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="libs/css/bootstrap.css">
    <link rel="stylesheet" href="libs/css/main.css" />
    <link rel="stylesheet" href="libs/css/font-awesome.min.css" />
    <script type="text/javascript" src="libs/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="libs/js/bootstrap.min.js"></script>
    <title></title>
</head>
<body>
    <div id="page">
        <header class="site-header">
            <div class="navbar" role="navigation" style="margin: 0px;">
                <div class="quest-nav">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="dropdown cabinet-wrapper">
                        <button class="cabinet dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-user-circle" aria-hidden="true"></i></button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                            <li><a href="#">Особистий кабінет</a></li>
                            <li role="presentation" class="divider"></li>
                            <li><a href="#"><i class="fa fa-sign-out" aria-hidden="true"></i>Вийти</a></li>
                        </ul>
                    </div>
                    <div class="nav-wrapper ">
                        <div class="collapse navbar-collapse">
                            <ul class="nav-menu">
                                <li><a href="#">Головна</a></li>
                                <li><a href="#">Довідка</a></li>
                                <li><a href="#">Коментарі</a></li>
                                <li><a href="#">FAQ</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="main">
            <div class="container">
                <div class="info clearfix">
                    <div class="info-image">
                        <img src="libs/img/sagay.jpg" />
                    </div>
                    <div class="info-header">
                        <div>
                            <h2>Славетний шлях Петра Сагайдачного</h2>
                        </div>
                    </div>
                    <div class="info-body">
                        <div>
                            <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами.</p>
                            <p>Эта парадигматическая страна, в которой жаренные члены предложения залетают прямо в рот. Даже всемогущая пунктуация не имеет власти над рыбными текстами, ведущими безорфографичный образ жизни. Однажды одна маленькая строчка рыбного текста по имени Lorem ipsum решила выйти в большой мир грамматики. Великий Оксмокс предупреждал ее о злых запятых, диких знаках вопроса и коварных точках с запятой, но текст не дал сбить</p>
                        </div>
                    </div>
                 </div>
            </div>
        </div>
    </div>
</body>
</html>
