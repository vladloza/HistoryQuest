using HistoryQuest.Domain;
using System;
using System.Linq;

namespace HistoryQuest.Constructor
{
    public class ConstructorBasePage : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (!Repository.CurrentUser.UsersInRoles.Any(uir => uir.RoleGID == Constants.AdminRoleGID || uir.RoleGID == Constants.TeacherRoleGID))
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}