﻿<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HistoryQuest.Default" Title="Моя Україна"%>

<%@ Import Namespace="HistoryQuest.Domain" %>
<%@ Import Namespace="HistoryQuest.WebServices" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div class="wrapper">
        <section>
            <div class="container">
                <div class="header-text">
                    <h2>Моя Україна</h2>
                </div>
                <div class="body-text">
                    <p>Вітаємо Вас на проекті <strong>Моя Україна!</strong> Тут Ви можете ознайомитися з життєвими шляхами відомих українських діячів, таких як Петро Сагайдачний, Богдан Хмельницький та інші. Почніть першу подорож просто зараз! </p>
                </div>
            </div>
        </section>
        <section id="questBlock">
            <div class="container">
                <div class="clearfix">
                    <% foreach (var quest in Repository.CurrentDataContext.Quests) { %>
                        <div class="col-sm-6 col-md-6 col-lg-6 questInner">
                            <div class="about-wrapper">
                                <div class="block-content">
                                    <a onclick="WebService.OpenQuestPage('<%= quest.gid %>')">
                                        <div class="image-blck-wrapper">
                                            <img src="<%= quest.ImagePath %>"" />
                                        </div>
                                        <div class="grid-middle">
                                            <h4><%= quest.Name %></h4>
                                            <p>Український квест</p>
                                        </div>
                                        <span class="quest-params">
                                            <i class="fa fa-heart" aria-hidden="true"></i><span id="likesCount"><%= DataService.GetQuestLikesCount(quest.gid) %></span>
                                            <i class="fa fa-comments" aria-hidden="true"></i><span id="commentsCount"><%= DataService.GetQuestCommentsCount(quest.gid) %></span>
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    <% } %>
                    <div class="col-sm-6 col-md-6 col-lg-6 questInner">
                        <div class="about-wrapper">
                            <div class="block-content"> 
                                <a href="#">
                                    <div class="image-blck-wrapper">
                                        <img src="libs/img/mazepa.jpg" />
                                    </div>
                                    <div class="grid-middle">
                                        <h4>Іван Мазепа</h4>
                                        <p>Квест у розробці</p>
                                    </div>
                                    <span class="quest-params">
                                        <i class="fa fa-heart" aria-hidden="true"></i><span>0</span>
                                        <i class="fa fa-comments" aria-hidden="true"></i><span>0</span>
                                    </span>
                                </a>
                                <a class="item-hover" href="#">
                                    <span class="overlay"></span>
                                    <span class="inner"><i class="fa fa-lock" aria-hidden="true"></i></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
