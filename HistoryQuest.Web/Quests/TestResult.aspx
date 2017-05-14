<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestResult.aspx.cs" Inherits="HistoryQuest.Quests.TestResult" MasterPageFile="~/Main.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div class="wrapper taskBody">
        <div class="container">
            <div class="card result-info">
                <div>
                    <h2>Результати</h2>
                </div>
                <div class="result-progress">
                    <canvas id="RadialPercent" runat="server" class="radialBar" data-maxvalue="100" data-value="23" percent="true"></canvas>
                    <canvas id="RedialCount" runat="server" class="radialBar" data-maxvalue="70" data-value="50" percent="false"></canvas>
                </div>
                <div class="result-term">
                    <h4 id="ResultTitle" runat="server">Тест (не) пройден!</h4>
                </div>
                <div class="result-share">
                    <div class="login-icons">
                        <div class="icons-inside facebook">
                            <a onclick="comeLater()">
                                <i class="fa fa-facebook" aria-hidden="true"></i>
                            </a>
                        </div>
                        <div class="icons-inside google-plus">
                            <a onclick="comeLater()">
                                <i class="fa fa-google-plus" aria-hidden="true"></i>
                            </a>
                        </div>
                        <div class="icons-inside twitter">
                            <a onclick="comeLater()">
                                <i class="fa fa-twitter" aria-hidden="true"></i>
                            </a>
                        </div>
                        <div class="icons-inside vk">
                            <a onclick="comeLater()">
                                <i class="fa fa-vk" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="register-href">
                    <a href="../Quests/Quest.aspx">Повернутися до Квесту</a>
                </div>
                <div class="right-answers"></div>
            </div>
            <div class="hr-invisible-small"></div>
        </div>
    </div>
    <script type="text/javascript" src="Scripts/RadialBarScript.js"></script>
    <script>
        function comeLater() {
            alert("З'явиться пізніше!   ");
        }
    </script>
</asp:Content>
