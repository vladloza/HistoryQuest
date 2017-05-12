<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="CreateQuest.aspx.cs" Inherits="HistoryQuest.Constructor.CreateQuest" %>

<%@ Import Namespace="HistoryQuest.Domain" %>
<%@ Import Namespace="HistoryQuest.WebServices" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div class="wrapper">
        <section id="ConstructorBlock">
            <div class="container">
                <div class="card income">
                    <fieldset class="form-fieldset">
                        <label for="QuestName" class="form-label">Назва квесту</label>
                        <input type="text" id="QuestName" name="QuestName" runat="server" class="form-input" validation="text" />
                    </fieldset>
                    <fieldset class="form-fieldset">
                        <label for="ShortInfo" class="form-label">Короткий опис квесту</label>
                        <textarea id="ShortInfo" name="ShortInfo" runat="server" class="form-input"></textarea>
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
                            <tbody>
                                <tr>
                                    <th>ID</th>
                                    <th>Назва</th>
                                    <th>Кількість завдань</th>
                                    <th>Пороговий бал</th>
                                    <th>Дії</th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card income">
                    <button class="btn btn-info center" id="SaveButton" onclick="WebService.OpenQuestPage('AC62EA9D-536C-4C92-B7B1-E3E3E375FDCF')">Зберегти</button>
                </div>
            </div>
        </section>
    </div>

    <script>
        CreateQuest.Initialize();
        $("#CreateCheckPointButton").click(function (e) {
            e.preventDefault();
            WebService.OpenCreateCheckPointPage(null);
        });
    </script>
</asp:Content>
