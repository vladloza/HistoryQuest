<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Quests/Tasks.master" CodeBehind="MapTask.aspx.cs" Inherits="HistoryQuest.Quests.MapTask" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div class="question-map">
        <div id="map"></div>
        <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGaJ_hdTjIj5HSIH4qyVrMf379w6k_vtg&libraries=geometry&callback=QuestMap.InitializeTaskMap">
        </script>
    </div>
</asp:Content>
