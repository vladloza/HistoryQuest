<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="QuestsList.aspx.cs" Inherits="HistoryQuest.Constructor.QuestsList" %>

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
                    <p>Вітаємо Вас у конструкторі квестів!</p>
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
                                    <a onclick="WebService.OpenCreateQuestPage('<%= quest.gid %>')">
                                        <div class="image-blck-wrapper">
                                            <img src="<%= quest.ImagePath %>"" />
                                        </div>
                                        <div class="grid-middle">
                                            <h4><%= quest.Name %></h4>
                                            <p>Український квест</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    <% } %>
                    <div class="col-sm-6 col-md-6 col-lg-6 questInner">
                        <div class="about-wrapper">
                            <div class="block-content"> 
                                <a onclick="WebService.OpenCreateQuestPage(null)">
                                    <div class="image-blck-wrapper">
                                        <img src="/libs/img/new_quest.png" />
                                    </div>
                                    <div class="grid-middle">
                                        <h4>Створити новий квест</h4>
                                        <p></p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
