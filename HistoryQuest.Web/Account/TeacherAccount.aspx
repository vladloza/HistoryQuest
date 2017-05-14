<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="TeacherAccount.aspx.cs" Inherits="HistoryQuest.Account.TeacherAccount" EnableEventValidation="false" %>

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
                            <h4><%= Repository.CurrentUser.Face?.LastName + " " + Repository.CurrentUser.Face?.FirstName + " " + Repository.CurrentUser.Face?.MiddleName%></h4>
                        </div>
                    </div>
                    <div class="card income">
                        <div class="small-header clearfix">
                            <i class="fa fa-bell" aria-hidden="true"></i>
                            <h2>Запити</h2>
                        </div>
                        <div class="card-table">
                            <table id="requestsTable">
                                <tbody>
                                    <tr>
                                        <th>ID</th>
                                        <th>Прізвище</th>
                                        <th>Імя</th>
                                        <th>По батькові</th>
                                        <th>Дії</th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card statistic">
                        <div class="small-header clearfix">
                            <i class="fa fa-clipboard" aria-hidden="true"></i>
                            <h2>Звіти</h2>
                        </div>

                        <div class="card-table">
                            <table id="reportTable">
                                <tbody>
                                    <tr>
                                        <th>Назва</th>
                                        <th>Дія</th>
                                    </tr>
                                    <tr>
                                        <td>Всі студенти</td>
                                        <td><a href="../Reports/AllStudents.aspx">Перейти</a></td>
                                    </tr>
                                     <tr>
                                        <td>Успішніть студентів</td>
                                        <td><a href="../Reports/StudentsMarks.aspx">Перейти</a></td>
                                    </tr>
                                </tbody>
                            </table>
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
                    <h2><%= Repository.CurrentUser?.Face.FullName %></h2>
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
    <script>
        window.onload = WebService.GetPupilsToTeacherRequests();
    </script>
        <script src="../libs/js/background.js"></script>
    <script>
        function AddStudent(btn, gid) {
            WebService.AddStudent(gid);
            var row = btn.parentNode.parentNode;
            row.parentNode.removeChild(row);
        };
        function DeleteStudent(btn, gid) {
            WebService.DeleteStudent(gid);
            var row = btn.parentNode.parentNode;
            row.parentNode.removeChild(row);
        };
    </script>
</asp:Content>
