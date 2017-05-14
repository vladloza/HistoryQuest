using HistoryQuest.Domain;
using HistoryQuest.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest.Constructor
{
    public partial class CreateCheckPoint : ConstructorBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (Session != null && Session["CreatedQuest"] != null && Session["CreatedCheckPoint"] != null)
            {
                HistoryQuest.Domain.Quest quest = (HistoryQuest.Domain.Quest)Session["CreatedQuest"];
                HistoryQuest.Domain.CheckPoint checkPoint = (HistoryQuest.Domain.CheckPoint)Session["CreatedCheckPoint"];

                var existingCheckPoint = Repository.CurrentDataContext.CheckPoints.SingleOrDefault(cp => cp.gid == checkPoint.gid);
                if (existingCheckPoint != null)
                {
                    ContructorTitle.InnerText = string.Format("{0}. Редагування чекпоінту \"{1}\"", quest.Name, existingCheckPoint.Name);
                }
                else
                {
                    ContructorTitle.InnerText = string.Format("{0}. Створення нового чекпоінту", quest.Name);
                }

                if (checkPoint.GeoCoordinates != "0;0")
                {
                    map.Attributes["startCoords"] = checkPoint.GeoCoordinates;
                }

                CheckPointDiv.Attributes["checkPointGID"] = checkPoint.gid.ToString();
                CheckPointName.Value = HttpUtility.HtmlEncode(checkPoint.Name);
                Info.InnerText = HttpUtility.HtmlEncode(checkPoint.Info);
                TasksCount.Value = checkPoint.TasksCount.ToString();
                ThresholdScore.Value = checkPoint.ThresholdScore.HasValue ? checkPoint.ThresholdScore.Value.ToString() : "";

                var parents = quest.CheckPoints.Where(cp => cp.gid != checkPoint.gid).OrderBy(cp => cp.Name).ToList();
                DropDownParent.DataSource = parents;
                DropDownParent.DataTextField = "Name";
                DropDownParent.DataValueField = "gid";
                DropDownParent.DataBind();
                DropDownParent.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                if (checkPoint.ParentGID.HasValue)
                {
                    DropDownParent.SelectedValue = checkPoint.ParentGID.Value.ToString();
                }
                else
                {
                    DropDownParent.SelectedIndex = 0;
                }

                if (checkPoint.Tasks.Count > 0)
                {
                    var tasksList = checkPoint.Tasks.Select(t => new
                    {
                        id = t.id,
                        t.gid,
                        Text = HttpUtility.HtmlEncode(t.Text),
                        t.MaxScore,
                        t.TaskTypeGID
                    }).OrderBy(t => t.id).ToList();

                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    DataManager.AddVariable("CreatedTasks", serializer.Serialize(tasksList));

                    var taskTypesList = Repository.CurrentDataContext.TaskTypes.Select(cp => new
                    {
                        cp.id,
                        cp.gid,
                        cp.Name,
                        cp.Caption
                    }).Where(tt => tt.gid != new Guid("9044BC32-30A7-49A5-8DC2-BA24BECE5E39")).OrderBy(cp => cp.id).ToList();
                    
                    DataManager.AddVariable("TaskTypes", serializer.Serialize(taskTypesList));
                }
            }
            else
            {
                Response.Redirect("/Constructor/QuestsList.aspx");
            }
        }
    }
}