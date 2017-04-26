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
        <header id="masthead" class="site-header" role="banner">
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
                                <li class="active"><a href="#">Головна</a></li>
                                <li><a href="#about">Довідка</a></li>
                                <li><a href="abiturient.php">Коментарі</a></li>
                                <li><a href="#contact">Співробітники</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </div>
</body>
</html>
