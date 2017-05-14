using HistoryQuest.Utils;
using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest.Constructor
{
    public partial class CreateTask : ConstructorBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (Session != null && Session["CreatedQuest"] != null && Session["CreatedTask"] != null)
            {
                HistoryQuest.Domain.Task task = (HistoryQuest.Domain.Task)Session["CreatedTask"];

                TaskContainer.Attributes["taskgid"] = task.gid.ToString();

                QuestionText.InnerText = HttpUtility.HtmlEncode(task.Text);
                MaxScore.Value = task.MaxScore.ToString();

                var taskTypesList = Repository.CurrentDataContext.TaskTypes.Select(cp => new
                {
                    cp.id,
                    cp.gid,
                    cp.Name,
                    cp.Caption
                }).Where(tt => tt.gid != new Guid("9044BC32-30A7-49A5-8DC2-BA24BECE5E39")).OrderBy(cp => cp.id).ToList();

                DropDownTaskType.DataSource = taskTypesList;
                DropDownTaskType.DataTextField = "Caption";
                DropDownTaskType.DataValueField = "gid";
                DropDownTaskType.DataBind();
                DropDownTaskType.Items.Insert(0, new ListItem(String.Empty, String.Empty));

                DropDownTaskType.SelectedValue = task.TaskTypeGID.ToString();

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                DataManager.AddVariable("TaskTypes", serializer.Serialize(taskTypesList));
            }
            else
            {
                Response.Redirect("/Constructor/QuestsList.aspx");
            }
        }
    }
}