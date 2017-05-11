<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Quests/Tasks.master" CodeBehind="WritingTask.aspx.cs" Inherits="HistoryQuest.Quests.WritingTask" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div class=" question-choises">
        <div class="variant">
            <label class="caption">Відповідь</label>
            <input class="input-answer" name="taskName" autocomplete="off" type="text" />
        </div>
    </div>
</asp:Content>
