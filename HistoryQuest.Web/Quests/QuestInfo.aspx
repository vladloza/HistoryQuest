﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="QuestInfo.aspx.cs" Inherits="HistoryQuest.Quests.QuestInfo" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div class="wrapper">
        <div class="info clearfix">
            <div class="container">
                <section class="transparent clearfix">
                    <div class="info-image">
                        <img id="QuestImage" runat="server" src="/libs/img/sagay.jpg" />
                    </div>
                    <div class="info-header">
                        <div style="margin: 0 auto;">
                            <h2 id="QuestTitle" runat="server">Славетний шлях Петра Сагайдачного</h2>
                        </div>
                    </div>
                    <div class="info-body">
                        <div>
                            <p id="QuestShortInfo" runat="server">Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами.</p>
                        </div>
                    </div>
                    <div class="info-button">
                        <button class="btn btn-info" onclick="WebService.OpenQuestPage('<%= QuestGID %>')">Розпочати квест</button>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="noForm">
        <div class="container">
            <section>
                <div class="comments">
                    <%--<div class="info-comments clearfix">
                        <h2>Коментарі до квесту</h2>
                    </div>--%>
                    <div class="small-card card clearfix" >
                        <fieldset class="form-fieldset">
                            <label for="description" class="form-label">Залиште коментар</label>
                            <textarea id="description" name="description" class="form-input"></textarea>
                        </fieldset>
                        <button class="btn btn-info right" onclick="AddComment('<%=Session["CurrentQuestGID"]%>')" >Відправити</button>
                    </div>
                    <div id="comments"></div>
                    <button  class="btn btn-light" onclick="WebService.GetComments('<%=Session["CurrentQuestGID"]%>')">Побачити більше</button>
                </div>
            </section>
            <div class="hr-invisible-small"></div>
        </div>
        <script>
            window.onload = WebService.GetComments('<%= QuestGID %>');

            function AddComment(guid) {
                var textarea = document.getElementById('description');
                var text = textarea.value;
                textarea.value = "";
                WebService.AddComment(guid, text);
            }
    </script>
</asp:Content>
