<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="CreateCheckPoint.aspx.cs" Inherits="HistoryQuest.Constructor.CreateCheckPoint" %>

<%@ Import Namespace="HistoryQuest.Domain" %>
<%@ Import Namespace="HistoryQuest.WebServices" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div class="wrapper">
        <section>
            <div class="container">
                <div class="header-text">
                    <h2 id="ContructorTitle" runat="server">Створення нового чекпоінту</h2>
                </div>
            </div>
        </section>
        <section id="CheckPointBlock">
            <div id="CheckPointDiv" runat="server" ClientIDMode="Static" class="container">
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
                        <input type="text" id="CheckPointName" name="CheckPointName" runat="server" ClientIDMode="Static" class="form-input" validation="text" />
                    </fieldset>
                    <fieldset class="form-fieldset">
                        <label for="TasksCount" class="form-label">Кількість завдань</label>
                        <input type="number" id="TasksCount" name="TasksCount" runat="server" ClientIDMode="Static" class="form-input" validation="text" />
                    </fieldset>
                    <fieldset class="form-fieldset">
                        <label for="ThresholdScore" class="form-label">Пороговий бал</label>
                        <input type="number" id="ThresholdScore" name="ThresholdScore" runat="server" ClientIDMode="Static" class="form-input" validation="text" />
                    </fieldset>
                    <fieldset class="form-fieldset">
                        <label for="Info" class="form-label">Інформація чекпоінту</label>
                        <textarea id="Info" name="Info" runat="server" ClientIDMode="Static" class="form-input"></textarea>
                    </fieldset>
                    <fieldset class="form-fieldset">
                        <label for="DropDownParent" class="form-label">Попередній чекпоінт</label>
                        <asp:DropDownList ID="DropDownParent" runat="server" ClientIDMode="Static" class="form-input">
                        </asp:DropDownList>
                    </fieldset>
                 </div>
                <div class="card income">
                    <div class="small-header clearfix">
                        <i class="fa fa-task" aria-hidden="true"></i>
                        <h2>Завдання</h2>
                        <div class="table-bottom-button">
                            <a href="#" id="CreateTasksButton"><i class="fa fa-plus" aria-hidden="true"></i>Створити нове завдання</a>
                        </div>
                    </div>
                    <div class="card-table">
                        <table id="tasksTable">
                            <thead>
                                <tr>
                                    <th>Текст завдання</th>
                                    <th>Максимальний бал</th>
                                    <th>Тип</th>
                                    <th>Дії</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card income">
                    <button class="btn btn-info center" id="SaveButton">Зберегти</button>
                </div>
            </div>
        </section>
    </div>

    <script>
        CreateQuest.InitializeTasksTable();

        $("#SaveButton").click(function (e) {
            e.preventDefault();
            WebService.SaveCheckPoint(CreateQuest.GetCheckPoint(), true);
        });
        $("#CreateTasksButton").click(function (e) {
            e.preventDefault();
            WebService.SaveCheckPoint(CreateQuest.GetCheckPoint(), false, function () { WebService.OpenCreateTaskPage(null) });
        });
    </script>
</asp:Content>
