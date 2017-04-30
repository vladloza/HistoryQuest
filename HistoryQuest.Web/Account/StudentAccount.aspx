﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="StudentAccount.aspx.cs" Inherits="HistoryQuest.Account.StudentAccount" %>
<%@Import Namespace="HistoryQuest.Domain" %>
<%@Import Namespace="System.Data.Linq" %>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div id="page">
        <div id="primary"><div class="tab-content">
            <div class="main tab-pane fade in active" id="account">
                <div class="card card header-settings clearfix">
                    <div class="about-block">
                        <h4>ПІБ:</h4>
                        <h4><%= Repository.CurrentUser.Face?.LastName + " " + Repository.CurrentUser.Face?.FirstName + " " + Repository.CurrentUser.Face?.MiddleName%></h4>
                    </div>
                    <div class="about-block">
                        <h4>Вчитель: </h4>
                        <h4><%= Repository.CurrentUser.Face?.TeacherGID != null ? 
                                             Repository.CurrentDataContext.Faces.Where(f=>f.gid==Repository.CurrentUser.Face.TeacherGID).FirstOrDefault()?.FullName : "відсутній"%></h4>
                    </div>
                </div>
                <div class="card statistics">
                    <div class="small-header clearfix">
                        <h2>Досягнення</h2>
                    </div>
                </div>
            </div>
            <div class="main tab-pane fade" id="edit">
                <div class="card header-settings clearfix">
                        <div>
                            <span>Профіль</span>
                        </div>
                </div>
                <div class="card profile-settings">
                    <div>
                            <fieldset class="form-fieldset">
                                <label for="first_name" class="form-label">Ім'я</label>
                                <input type="text" id="first_name" name="first_name" class="form-input" value="<%=Repository.CurrentUser.Face?.FirstName %>" />
                            </fieldset>
                            <fieldset class="form-fieldset">
                                <label for="last_name" class="form-label">Прізвище</label>
                                <input type="text" id="last_name" name="last_name" class="form-input" value="<%=Repository.CurrentUser.Face?.LastName %>" />
                            </fieldset>
                            <fieldset class="form-fieldset">
                                <label for="father_name" class="form-label">По батькові</label>
                                <input type="text" id="father_name" name="father_name" class="form-input" value="<%=Repository.CurrentUser.Face?.MiddleName %>" />
                            </fieldset>
                            <fieldset class="form-fieldset">
                                <label for="teacher_name" class="form-label">Вчитель</label>
                                <input type="text" id="teacher_name" name="teacher_name" class="form-input" />
                            </fieldset>
                            <fieldset class="form-fieldset">
                                <label for="description" class="form-label">Про мене</label>
                                <textarea id="description" name="description" class="form-input"><%=Repository.CurrentUser.Face?.Info %></textarea>
                            </fieldset>
                            <button type="submit" class="btn btn-info center">Зберегти</button>
                    </div>
                </div>
                <div class="card password-settings">
                    <fieldset class="form-fieldset">
                                <label for="password" class="form-label">Новий пароль</label>
                                <input type="password" id="password" name="password" class="form-input" />
                            </fieldset>
                            <fieldset class="form-fieldset">
                                <label for="commit_password" class="form-label">Повторіть пароль</label>
                                <input type="password" id="commit_password" name="commit_password" class="form-input" />
                            </fieldset>
                    <button type="submit" class="btn btn-info center">Змінити пароль</button>
                </div>
            </div>
            </div>
        </div>
        <div id="secondary">
            <div class="">
                <div class="profile-name">
                    <h2><%= Repository.CurrentUser?.Face.FullName %></h2>
                </div>
                <ul class="sidebar-menu">
                    <li class="active">
                        <a href="#account" data-toggle="pill">
                            <i class="fa fa-user"></i><span>Мій профіль</span>
                        </a>
                    </li>
                    <li style=<%= Repository.CurrentUser.IsSocial ? "display:none" : "display:block"%>>
                        <a href="#edit" data-toggle="pill">
                            <i class="fa fa-cog" aria-hidden="true"></i><span>Редагувати профіль</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>