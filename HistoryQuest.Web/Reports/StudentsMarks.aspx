<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="StudentsMarks.aspx.cs" Inherits="HistoryQuest.Reports.StudentsMarks" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <rsweb:ReportViewer ID="ReportViewer1" Width="100%" CssClass="wrapper" runat="server"></rsweb:ReportViewer>
</asp:Content>
