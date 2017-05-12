<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="HistoricalInformation.aspx.cs" Inherits="HistoryQuest.HistoricalInformation" %>
<%@ Import Namespace="HistoryQuest.Domain" %>

<asp:Content runat="server" ContentPlaceHolderID="noForm">
    <div class="wrapper">
        <div class="container">
            <section class="orange-section clearfix">
                <h2>Історична довідка</h2>
                <hr style="width:40%"/>
                <div class="info-body historical" runat="server" id="questFullInfo"></div>
            </section>
        </div>
    </div>
</asp:Content>
