<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestResult.aspx.cs" Inherits="HistoryQuest.Quests.TestResult" MasterPageFile="~/Main.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div class="wrapper taskBody">
        <div class="container">
            <div class="card result-info">
                <div>
                    <h2>Результати</h2>
                </div>
                <div class="result-progress">
                    <canvas id="RadialPercent" runat="server" class="radialBar" data-maxvalue="100" data-value="23" percent=true></canvas> <%--1--%>
                    <canvas id="RedialCount" runat="server" class="radialBar" data-maxvalue="70" data-value="50" percent=false></canvas> <%--2--%>
                </div>
                <div class="result-term">
                    <h4 id="ResultTitle" runat="server">Тест (не) пройден!</h4>
                </div>
                <div class="result-share">
                    <div class="login-icons">
                        <div class="icons-inside facebook">
                            <a href="<%= HistoryQuest.Domain.Socials.fbUrl %>">
                                <i class="fa fa-facebook" aria-hidden="true"></i>
                            </a>
                        </div>
                        <div class="icons-inside google-plus">
                            <a href="<%= HistoryQuest.Domain.Socials.fbUrl %>">
                                <i class="fa fa-google-plus" aria-hidden="true"></i>
                            </a>
                        </div>
                        <div class="icons-inside twitter">
                            <a href="<%= HistoryQuest.Domain.Socials.fbUrl %>">
                                <i class="fa fa-twitter" aria-hidden="true"></i>
                            </a>
                        </div>
                        <div class="icons-inside vk">
                            <a href="<%= HistoryQuest.Domain.Socials.vkUrl %>">
                                <i class="fa fa-vk" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="right-answers"></div>
                <%--3 --%>
            </div>
            <div class="hr-invisible-small"></div>
        </div>
    </div>
    <script type="text/javascript" src="Scripts/RadialBarScript.js"></script>
</asp:Content>
<%--
                                                    Сережа:

                                                    Не могу унаследоваться от Task.Master, поскольку там виднеются кнопки.
                                                На данный момент есть два бара: 
                                                - первый (1) - значение в процентах
                                                - второй (2) - к-во правильных из общего к-ва
                                                в атрибуты data-maxvalue и data-value нужно вставить соответсвующие значения.
                                                в блоке right-answers (3) должны быть все предыдущие вопросы с выделеным правильным ответом
                                                    
                                                    Влад:
                                                    
                                                    Если нужно изменить иконку соц-сети, просто залей ее в папку img и поменяй путь (4)--%>
