<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="AdminAccount.aspx.cs" Inherits="HistoryQuest.Account.AdminAccount" EnableEventValidation="false" %>

<%@ Register TagPrefix="rc" TagName="reg" Src="~/Controls/ChangeInfo.ascx" %>
<%@ Register TagPrefix="cpc" TagName="changePass" Src="~/Controls/ChangePassword.ascx" %>
<%@ Import Namespace="HistoryQuest.Domain" %>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div id="page">
        <div id="primary">
            <div class="tab-content">
                <div class="main tab-pane fade in active" id="account">
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
                                        <th>Місто</th>
                                        <th>Школа</th>
                                        <th>Телефон</th>
                                        <th>E-Mail</th>
                                        <th>Дії</th>
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
    <script>
        window.onload = WebService.GetTeacherRequests();
    </script>
    <script>
        function AddTeacher(btn, gid) {
            WebService.AddTeacher(gid);
            var row = btn.parentNode.parentNode;
            row.parentNode.removeChild(row);
        };
        function DeleteTeacher(btn, gid) {
            WebService.DeleteTeacher(gid);
            var row = btn.parentNode.parentNode;
            row.parentNode.removeChild(row);
        };
    </script>
    <script src="../libs/js/background.js"></script>
</asp:Content>
