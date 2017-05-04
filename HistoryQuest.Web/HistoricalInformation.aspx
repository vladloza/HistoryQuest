<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="HistoricalInformation.aspx.cs" Inherits="HistoryQuest.HistoricalInformation" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div class="wrapper">
        <div class="info clearfix">
            <div class="container">
                <section class="transparent clearfix">
                    <div class="info-image">
                        <img src="libs/img/sagay.jpg" />
                    </div>
                    <div class="info-header">
                        <div style="margin: 0 auto;">
                            <h2>Славетний шлях Петра Сагайдачного</h2>
                        </div>
                    </div>
                    <div class="info-body">
                        <div>
                            <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами.</p>
                            <p> Даже всемогущая пунктуация не имеет власти над рыбными текстами, ведущими безорфографичный образ жизни. Однажды одна маленькая строчка рыбного текста по имени Lorem ipsum решила выйти в большой мир грамматики. Великий Оксмокс предупреждал ее о злых запятых, диких знаках вопроса и коварных точках с запятой, но текст не дал сбить</p>
                        </div>
                    </div>
                    <div class="info-button">
                        <button class="btn btn-info">Розпочати квест</button>
                    </div>
                </section>
            </div>
        </div>
        <div class="container">
            <section class="transparent">
                <div class="comments">
                    <div class="info-comments">
                        <h2>Коментарі до квесту</h2>
                    </div>
                    <div class="small-card card clearfix">
                        <fieldset class="form-fieldset">
                                <label for="description" class="form-label">Залиште коментар</label>
                                <textarea id="description" name="description" class="form-input"></textarea>
                        </fieldset>
                        <button class="btn btn-info right">Відправити</button>
                    </div>
                    <div class="small-card card">
                        <h4>Трофименко Маргарита</h4>
                        <p>Какой обалденный квест! Разработчикам респект!</p>
                        <div class="time">21.15 01.05.2017</div>
                    </div>
                    <div class="small-card card">
                        <h4>Лоза Владислав</h4>
                        <p>И правда ребята постарались!</p>
                        <div class="time">21.15 01.05.2017</div>
                    </div>
                </div>
            </section>
            <div class="hr-invisible-small"></div>
        </div>
    </div>
</asp:Content>
