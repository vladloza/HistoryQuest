<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.ascx.cs" Inherits="HistoryQuest.Controls.ChangePassword" %>
<div class="card password-settings">
    <fieldset class="form-fieldset">
        <label for="password" class="form-label">Новий пароль</label>
        <input type="password" id="password" name="password" runat="server" class="form-input" />
    </fieldset>
    <fieldset class="form-fieldset">
        <label for="commit_password" class="form-label">Повторіть пароль</label>
        <input type="password" id="commit_password" runat="server" name="commit_password" class="form-input" />
    </fieldset>
    <asp:Button CssClass="btn btn-info center" runat="server" OnClick="ChangePasswordButton_Click" Text="Змінити пароль"></asp:Button>
</div>
