<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Quests/Tasks.master" CodeBehind="ConformityTask.aspx.cs" Inherits="HistoryQuest.Quests.ConformityTask" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div class="question-choises-50">
        <% foreach (var question in (HttpContext.Current.Handler as HistoryQuest.Quests.ConformityTask).Questions) { %>
        <div class="variant">
            <label class="question-form">
                <input name="question" value="taskId" type="radio" />
                <span class="icon"><%= question.Key %></span>
                <span class="caption"><%= question.Value %></span>
            </label>
        </div>
        <% } %>
    </div>
    <div class="question-choises-50">
        <% foreach (var answer in (HttpContext.Current.Handler as HistoryQuest.Quests.ConformityTask).Answers) { %>
        <div class="variant">
            <label class="question-form">
                <input name="answer" value="taskId" type="radio" />
                <span class="icon"><%= answer.Key %></span>
                <span class="caption"><%= answer.Value %></span>
            </label>
        </div>
        <% } %>
    </div>
    <table class="question-matching">
        <tbody>
            <tr>
                <th></th>
                <% foreach (var answer in (HttpContext.Current.Handler as HistoryQuest.Quests.ConformityTask).Answers) { %>
                <th><%= answer.Key %></th>
                <% } %>
            </tr>
            <% foreach (var question in (HttpContext.Current.Handler as HistoryQuest.Quests.ConformityTask).Questions) { %>
            <tr>
                <th class="v"><%= question.Key %></th>
                <% foreach (var answer in (HttpContext.Current.Handler as HistoryQuest.Quests.ConformityTask).Answers) { %>
                <td>
                    <label class="question-form matching">
                        <input name="<%= question.Key %>" value="<%= answer.Key %>" type="radio" />
                        <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                    </label>
                </td>
                <% } %>
            </tr>
            <% } %>
        </tbody>
    </table>
</asp:Content>
