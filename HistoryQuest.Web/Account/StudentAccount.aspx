﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="StudentAccount.aspx.cs" Inherits="HistoryQuest.Account.StudentAccount" EnableEventValidation="false" Title="Кабінет"%>

<%@ Register TagPrefix="rc" TagName="reg" Src="~/Controls/ChangeInfo.ascx" %>
<%@ Register TagPrefix="cpc" TagName="changePass" Src="~/Controls/ChangePassword.ascx" %>
<%@ Import Namespace="HistoryQuest.Domain" %>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.0.min.js" type="text/javascript"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/themes/blitzer/jquery-ui.css" rel="Stylesheet" type="text/css" />
    <script src="../libs/js/bindTeachers.js" type="text/javascript"></script>
            <script src="../libs/js/background.js"></script>
    <div id="page">
        <div id="primary">
            <div class="tab-content">
                <div class="main tab-pane fade in active" id="account">
                    <div class="card card header-settings clearfix">
                        <div class="about-block">
                            <h4>ПІБ:</h4>
                            <h4><%= Repository.CurrentUser.Face?.LastName + " " + Repository.CurrentUser.Face?.FirstName + " " + Repository.CurrentUser.Face?.MiddleName%></h4>
                        </div>
                        <div class="about-block">
                            <h4>Вчитель: </h4>
                            <h4><%= Repository.CurrentUser.Face?.TeacherGID != null ? 
                                    Repository.CurrentDataContext.Faces.FirstOrDefault(f=>f.gid==Repository.CurrentUser.Face.TeacherGID)?.FullName : 
                                    Repository.CurrentDataContext.PupilsToTeachersRequests.FirstOrDefault(ptr => ptr.PupilGID == Repository.CurrentUser.FaceGID) != null ? 
                                    "заявку відправлено" : "відсутній"%></h4>
                            <a class="small-control" id="choose" style=<%= Repository.CurrentUser.Face?.TeacherGID != null ? "display:none": "display:inline-block" %> onclick="showControl('chooseTeacher', ['choose'])">Обрати</a>
                        </div>
                    </div>
                    <div class="card" id="chooseTeacher" style="display: none">
                        <div class="about-block">
                            <asp:TextBox ID="teachersBox" placeholder="Вчитель (почніть вводити)" runat="server" CssClass="form-input-small" />
                            <asp:HiddenField ID="selectedTeacher" runat="server" />
                            <asp:Button runat="server" Text="Надіслати запит" OnClick="AddResponseButton_Click" CssClass="btn btn-info right"></asp:Button>
                        </div>
                    </div>
                    <div class="card statistics">
                        <div class="small-header clearfix">
                            <h2>Досягнення</h2>
                        </div>
                        <div class="launching">
                            <i class="fa fa-cog" aria-hidden="true"></i>
                            <h4>We're working on it.</h4>
                        </div>
                    </div>
                </div>
                <div class="main tab-pane fade" id="edit">
                    <div class="card header-settings clearfix">
                        <div>
                            <span>Профіль</span>
                        </div>
                    </div>
                    <rc:reg id="register" runat="server" />
                    <cpc:changePass ID="passChange" runat="server"/>
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
                    <li style='<%= !string.IsNullOrEmpty(Repository.CurrentUser.SocialName) ? "display:none": "display:block"%>'>
                        <a href="#edit" data-toggle="pill">
                            <i class="fa fa-cog" aria-hidden="true"></i><span>Редагувати профіль</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
