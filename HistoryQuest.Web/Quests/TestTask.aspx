<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Quests/Tasks.master" CodeBehind="TestTask.aspx.cs" Inherits="HistoryQuest.Quests.TestTask" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div class="question-choises">
        <% foreach (var answer in (HttpContext.Current.Handler as HistoryQuest.Quests.TestTask).answers)
            { %>
        <div class="variant">
            <label class="question-form">
                <input name="answer" value="taskId" type="radio" />
                <span class="icon"><i class="fa fa-check" aria-hidden="true"></i></span>
                <span class="caption"><%= answer %></span>
            </label>
        </div>
        <% } %>
    </div>
</asp:Content>
