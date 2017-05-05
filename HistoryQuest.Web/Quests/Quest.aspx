<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Quest.aspx.cs" Inherits="HistoryQuest.Quest" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div class="wrapper map-wrapper">
        <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGaJ_hdTjIj5HSIH4qyVrMf379w6k_vtg&libraries=geometry&callback=QuestMap.InitializeMap">
    </script>
        <div id="map"></div>
        <div class="arrows">
            <button class="arrow" id="menu-toggle" style="display: none"><i class="fa fa-angle-left" aria-hidden="true"></i></button>
        </div>
        <div id="quest-info">
            <div>
                <div id="quest-inner" class="active">
                    <div class="chekpoint-name">
                        <h2 id="CheckPointName">Название чекпоинта</h2>
                    </div>
                    <div class="sidebar">
                        <p>Петро Кононович Конашевич-Сагайдачний народився бл. 1582р. в селі Кульчиці в православній родині (тепер село Самбірського району Львівської області).</p>
                        <hr />
                        <button id="StartCheckPoint" class="btn btn-info">Начать</button>
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

