<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="StudentAccount.aspx.cs" Inherits="HistoryQuest.StudentAccount" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div id="page">

        <div id="primary"><div class="tab-content">
            <div class="main tab-pane fade in active" id="account">
                <div class="card clearfix">
                    <div class="clearfix">
                        <div>
                            <span>Профіль</span>
                        </div>
                    </div>
                </div>
                <div class="card profile-settings">
                    <div>
                        <form>
                            <fieldset class="form-fieldset">
                                <label for="first_name" class="form-label">Ім'я</label>
                                <input type="text" id="first_name" name="first_name" class="form-input" />
                            </fieldset>
                            <fieldset class="form-fieldset">
                                <label for="last_name" class="form-label">Прізвище</label>
                                <input type="text" id="last_name" name="last_name" class="form-input" />
                            </fieldset>
                            <fieldset class="form-fieldset">
                                <label for="user_name" class="form-label">Нікнейм</label>
                                <input type="text" id="user_name" name="user_name" class="form-input" />
                            </fieldset>
                            <fieldset class="form-fieldset">
                                <label for="teacher_name" class="form-label">Вчитель</label>
                                <input type="text" id="teacher_name" name="teacher_name" class="form-input" />
                            </fieldset>
                            <fieldset class="form-fieldset">
                                <label for="description" class="form-label">Про мене</label>
                                <textarea id="description" name="description" class="form-input"></textarea>
                            </fieldset>
                            <button type="submit" class="btn btn-info center">Зберегти</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="main tab-pane fade active" id="statistic">Статистика</div>
            </div>
        </div>
        <div id="secondary">
            <div class="">
                <div class="profile-name">
                    <h2>UserName</h2>
                </div>
                <ul class="sidebar-menu">
                    <li class="active">
                        <a href="#account" data-toggle="pill">
                            <i class="fa fa-user"></i><span>Мій профіль</span>
                        </a>
                    </li>
                    <li>
                        <a href="#statistic" data-toggle="pill">
                            <i class="fa fa-pie-chart"></i><span>Статистика</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
