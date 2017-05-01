<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="TeacherAccount.aspx.cs" Inherits="HistoryQuest.Account.TeacherAccount" %>

<%@ Register TagPrefix="rc" TagName="reg" Src="~/Controls/ChangeInfo.ascx" %>
<%@ Register TagPrefix="cpc" TagName="changePass" Src="~/Controls/ChangePassword.ascx" %>
<%@ Import Namespace="HistoryQuest.Domain" %>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div id="page">
        <div id="primary">
            <div class="tab-content">
                <div class="main tab-pane fade in active" id="account">
                    <div class="card card header-settings clearfix">
                        <div class="about-block">
                            <h4>ПІБ:</h4>
                            <h4>Прізвище Імя По батькові</h4>
                        </div>
                    </div>
                    <div class="card income">
                        <div class="small-header clearfix">
                            <i class="fa fa-bell" aria-hidden="true"></i>
                            <h2>Запити</h2>
                        </div>
                        <div class="card-table">
                            <table>
                                <tbody>
                                    <tr>
                                        <th>ID</th>
                                        <th>Прізвище</th>
                                        <th>Імя</th>
                                        <th>По батькові</th>
                                        <th>Дії</th>
                                    </tr>
                                    <tr>
                                        <td>105</td>
                                        <td>Трофименко</td>
                                        <td>Маргарита</td>
                                        <td>Юріївна</td>
                                        <td>
                                            <a><i class="fa fa-check" aria-hidden="true"></i></a>
                                            <a><i class="fa fa-times" aria-hidden="true"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>105</td>
                                        <td>Трофименко</td>
                                        <td>Маргарита</td>
                                        <td>Юріївна</td>
                                        <td>
                                            <a><i class="fa fa-check" aria-hidden="true"></i></a>
                                            <a><i class="fa fa-times" aria-hidden="true"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>105</td>
                                        <td>Трофименко</td>
                                        <td>Маргарита</td>
                                        <td>Юріївна</td>
                                        <td>
                                            <a><i class="fa fa-check" aria-hidden="true"></i></a>
                                            <a><i class="fa fa-times" aria-hidden="true"></i></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card statistic">
                        <div class="small-header clearfix">
                            <i class="fa fa-pie-chart"></i>
                            <h2>Статистика</h2>
                        </div>
                    </div>
                </div>
                <div class="main tab-pane fade" id="edit">
                    <div class="card header-settings clearfix">
                        <div>
                            <span>Профіль</span>
                        </div>
                    </div>
                    <rc:reg ID="register" runat="server" />
                    <cpc:changePass ID="passChange" runat="server" />
                </div>
            </div>
        </div>
        <div id="secondary">
            <div class="">
                <div class="profile-name">
                    <h2><%= Repository.CurrentUser?.Face.FirstName %></h2>
                </div>
                <ul class="sidebar-menu">
                    <li class="active">
                        <a href="#account" data-toggle="pill">
                            <i class="fa fa-user"></i><span>Мій профіль</span>
                        </a>
                    </li>
                    <li>
                        <a href="#edit" data-toggle="pill">
                            <i class="fa fa-cog" aria-hidden="true"></i><span>Редагувати профіль</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
