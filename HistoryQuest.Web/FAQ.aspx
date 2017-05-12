<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" MasterPageFile="~/Main.master" Inherits="HistoryQuest.FAQ" %>
<%@ Import Namespace="HistoryQuest.Domain" %>

<asp:Content runat="server" ContentPlaceHolderID="noForm">
    <div class="wrapper">
        <div>
            <div class="container">
                <section class="clearfix orange-section">
                    <h2>FAQ</h2>
                    <div class="panel-group" id="accordion">
                        <% foreach (var faq in Repository.CurrentDataContext.FAQs.OrderBy(c=> c.id)) { %>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse_<%= faq.id %>">Q: <%= faq.Question %></a>
                                </h4>
                            </div>
                            <div id="collapse_<%= faq.id %>" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <%= faq.Answer %>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
