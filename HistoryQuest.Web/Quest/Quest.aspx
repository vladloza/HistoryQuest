<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Quest.aspx.cs" Inherits="HistoryQuest.Quest" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <div id="map"></div>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGaJ_hdTjIj5HSIH4qyVrMf379w6k_vtg&callback=QuestMap.InitializeMap">
    </script>
</asp:Content>
