﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Quest.aspx.cs" Inherits="HistoryQuest.Quest" %>

<asp:Content runat="server" ContentPlaceHolderID="noForm">
    <div class="wrapper map-wrapper">
        <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGaJ_hdTjIj5HSIH4qyVrMf379w6k_vtg&libraries=geometry&callback=QuestMap.InitializeMap">
        </script>
        <div id="map"></div>
        <div class="arrows">
            <button class="arrow" id="menu-toggle" style="display:none"><i class="fa fa-angle-left" aria-hidden="true"></i></button>
        </div>
        <div id="quest-info">
            <div>
                <div id="quest-inner">
                    <div class="chekpoint-name">
                        <h2 id="CheckPointName">Петро Сагайдачний</h2>
                    </div>
                    <div class="sidebar">
                        <p id="CheckPointShortInfo">Петро Кононович Конашевич-Сагайдачний народився бл. 1582р. в селі Кульчиці в православній родині (тепер село Самбірського району Львівської області).</p>
                        <hr />
                        <div class="sidebar-buttons">
                            <div class="checkWrapper">
                                <button id="StartCheckPoint" class="btn btn-info">Розпочати</button>
                            </div>
                            <div class="like-wrapper">
                                <button class="like" id="Like">
                                    <i class="fa fa-heart" aria-hidden="true" id="i-like"></i>
                                    <span id="likes-count"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#quest-info").toggleClass("active");
        });
        $("#StartCheckPoint").click(function (e) {
            e.preventDefault();
            WebService.StartCheckPoint($("#StartCheckPoint")[0].attributes.checkPointGID.value);
        });
        $("#Like").click(function (e) {
            e.preventDefault();
            WebService.UpdateCheckPointLikesCount(document.currentCheckPointGid);
        });
    </script>
    <script type="text/javascript" language="javascript">
        Sys.Application.add_init(function () {
            $create(QuestMap,
                {
                    "id": "QuestMap"
                });
        });
    </script>
</asp:Content>

