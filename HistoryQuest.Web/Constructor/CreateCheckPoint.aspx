<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="CreateCheckPoint.aspx.cs" Inherits="HistoryQuest.Constructor.CreateCheckPoint" %>

<%@ Import Namespace="HistoryQuest.Domain" %>
<%@ Import Namespace="HistoryQuest.WebServices" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div class="wrapper">
        <section id="checkPointBlock">
            <div class="container">
                <div class="card income">
                    <div class="question-map">
                        <div id="map" runat="server" ClientIDMode="Static" startCoords="49.0;32.0"></div>
                        <script async defer
                            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGaJ_hdTjIj5HSIH4qyVrMf379w6k_vtg&libraries=geometry&callback=QuestMap.InitializeTaskMap">
                        </script>
                    </div>
                </div>
                <div class="card income">
                    <fieldset class="form-fieldset">
                        <label for="CheckPointName" class="form-label">Назва чекпоінту</label>
                        <input type="text" id="CheckPointName" name="CheckPointName" runat="server" class="form-input" validation="text" />
                    </fieldset>
                    <fieldset class="form-fieldset">
                        <label for="TasksCount" class="form-label">Кількість завдань</label>
                        <input type="number" id="TasksCount" name="TasksCount" runat="server" class="form-input" validation="text" />
                    </fieldset>
                    <fieldset class="form-fieldset">
                        <label for="ThresholdScore" class="form-label">Пороговий бал</label>
                        <input type="number" id="ThresholdScore" name="ThresholdScore" runat="server" class="form-input" validation="text" />
                    </fieldset>
                    <fieldset class="form-fieldset">
                        <label for="Info" class="form-label">Інформація чекпоінту</label>
                        <textarea id="Info" name="Info" runat="server" class="form-input"></textarea>
                    </fieldset>
                    <button class="btn btn-info center" id="SaveButton">Зберегти</button>
                </div>
            </div>
        </section>
    </div>

    <script>
        $("#SaveButton").click(function (e) {
            e.preventDefault();
            WebService.OpenCreateCheckPointPage(null);
        });
    </script>
</asp:Content>
