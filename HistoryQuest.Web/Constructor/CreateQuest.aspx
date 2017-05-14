<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="CreateQuest.aspx.cs" Inherits="HistoryQuest.Constructor.CreateQuest" %>

<%@ Import Namespace="HistoryQuest.Domain" %>
<%@ Import Namespace="HistoryQuest.WebServices" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div class="wrapper">
        <section>
            <div class="container">
                <div class="header-text">
                    <h2 id="ContructorTitle" runat="server">Створення нового квесту</h2>
                </div>
            </div>
        </section>
        <section id="ConstructorBlock">
            <div class="container">
                <div class="card income">
                    <fieldset class="form-fieldset">
                        <label for="QuestName" class="form-label">Назва квесту</label>
                        <input type="text" id="QuestName" name="QuestName" runat="server" ClientIDMode="Static" class="form-input" validation="text" />
                    </fieldset>
                    <fieldset class="form-fieldset">
                        <label for="ShortInfo" class="form-label">Короткий опис квесту</label>
                        <textarea id="ShortInfo" name="ShortInfo" runat="server" ClientIDMode="Static" class="form-input"></textarea>
                    </fieldset>
                    <fieldset class="form-fieldset">
                        <label for="FullInfo" class="form-label">Історична довідка квесту</label>
                        <textarea id="FullInfo" name="FullInfo" runat="server" ClientIDMode="Static" class="form-input"></textarea>
                    </fieldset>
                </div>
                <div class="card income">
                    <div class="small-header clearfix">
                        <i class="fa fa-flag" aria-hidden="true"></i>
                        <h2>Чекпоінти</h2>
                        <div class="table-bottom-button">
                            <a href="#" id="CreateCheckPointButton"><i class="fa fa-plus" aria-hidden="true"></i>Створити новий чекпоінт</a>
                        </div>
                    </div>
                    <div class="card-table">
                        <table id="checkpointsTable">
                            <thead>
                                <tr>
                                    <th>Назва</th>
                                    <th>Кількість завдань</th>
                                    <th>Пороговий бал</th>
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
        CreateQuest.InitializeCheckPointsTable();

        $("#CreateCheckPointButton").click(function (e) {
            e.preventDefault();
            WebService.SaveQuest(CreateQuest.GetQuest(), false, function () { WebService.OpenCreateCheckPointPage(null); });
        });
        $('#SaveButton').click(function (e) { 
            e.preventDefault();
            WebService.SaveQuest(CreateQuest.GetQuest(), true);
        });
    </script>
</asp:Content>
