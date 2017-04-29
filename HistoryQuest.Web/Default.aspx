<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HistoryQuest.Default" %>
<%@Import Namespace="HistoryQuest.Domain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <input type="text" name="Name" value="<%= Repository.CurrentUser?.Face.FirstName %>" />
</asp:Content>
