using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest.Account
{
    public partial class AdminAccount : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (Repository.CurrentUser.UsersInRoles.FirstOrDefault(uir => uir.RoleGID == new Guid(Constants.AdminRoleGID) && uir.UserGID == Repository.CurrentUser.gid) == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}