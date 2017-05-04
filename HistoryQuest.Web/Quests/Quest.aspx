<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Quest.aspx.cs" Inherits="HistoryQuest.Quest" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGaJ_hdTjIj5HSIH4qyVrMf379w6k_vtg&libraries=geometry&callback=QuestMap.InitializeMap">
    </script>
    <div id="map"></div>
    <script type="text/javascript" language="javascript">
        Sys.Application.add_init(function () {
            $create(QuestMap,
            {
                "id": "QuestMap"
            });
        });
</script>
</asp:Content>
