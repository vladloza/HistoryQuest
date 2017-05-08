<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Quests/Tasks.master" CodeBehind="TestWithImageTask.aspx.cs" Inherits="HistoryQuest.Quests.TestWithImageTask" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <% var page = (HttpContext.Current.Handler as HistoryQuest.Quests.TestWithImageTask); %>
    <div class="question-img">
        <img src="<%= page.ImagePath %>" />
    </div>
    <div class="question-choises">
        <% foreach (var answer in page.Answers)
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
