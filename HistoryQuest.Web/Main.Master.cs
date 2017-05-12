using HistoryQuest.Domain;
using HistoryQuest.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HistoryQuest
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void ExitButton_Click(object sender, EventArgs e)
        {
            Repository.CurrentUser = null;
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            using (HtmlGenericControl metaDataScript = new HtmlGenericControl("script"))
            {
                metaDataScript.Attributes.Add("type", "text/javascript");
                metaDataScript.InnerHtml = DataManager.GetData();
                Page.Header.Controls.AddAt(6, metaDataScript);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session != null && Session["CurrentQuestGID"] != null)
            {
                MainMenuHistoricalInfoButton.Attributes["style"] = "";
                QuestInfoButton.Attributes["style"] = "" ;
                QuestButton.Attributes["style"] = "";
            }

            if (Repository.CurrentUser != null && Repository.CurrentUser.UsersInRoles.Any(uir => 
                uir.RoleGID == Constants.AdminRoleGID || uir.RoleGID == Constants.TeacherRoleGID))
            {
                CostructorButton.Attributes["style"] = "";
            }
        }
    }
}