using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest.Account
{
    public partial class TeacherAccount : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (Repository.CurrentUser.UsersInRoles.FirstOrDefault(uir => uir.RoleGID == Constants.TeacherRoleGID) == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}