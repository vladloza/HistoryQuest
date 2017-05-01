<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChangeInfo.ascx.cs" Inherits="HistoryQuest.Controls.Register" %>
<%@ Import Namespace="HistoryQuest.Domain" %>
<div class="card profile-settings">
    <form>
        <div>
            <fieldset class="form-fieldset">
                <label for="first_name" class="form-label">Ім'я</label>
                <input type="text" id="first_name" name="first_name" runat="server" class="form-input"/>
            </fieldset>
            <fieldset class="form-fieldset">
                <label for="last_name" class="form-label">Прізвище</label>
                <input type="text" id="last_name" name="last_name" runat="server" class="form-input"/>
            </fieldset>
            <fieldset class="form-fieldset">
                <label for="father_name" class="form-label">По батькові</label>
                <input type="text" id="father_name" name="father_name" runat="server" class="form-input"/>
            </fieldset>
            <fieldset class="form-fieldset">
                <label for="description" class="form-label">Про мене</label>
                <textarea id="description" name="description" runat="server" class="form-input"></textarea>
            </fieldset>
            <asp:Button runat="server" class="btn btn-info center" OnClick="ChangeInfoButton_Click" Text="Зберегти"></asp:Button>
        </div>
    </form>
</div>
