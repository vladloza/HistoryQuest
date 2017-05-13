using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest.Constructor
{
    public partial class CreateCheckPoint : ConstructorBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (Session != null && Session["CreatedQuest"] != null &&Session["CreatedCheckPoint"] != null)
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
                CheckPointName.Value = checkPoint.Name;
                Info.InnerText = checkPoint.Info;
                TasksCount.Value = checkPoint.TasksCount.ToString();
                ThresholdScore.Value = checkPoint.ThresholdScore.HasValue ? checkPoint.ThresholdScore.Value.ToString() : "";

                var parents = quest.CheckPoints.Where(cp => cp.gid != checkPoint.gid).OrderBy(cp => cp.Name).ToList();
                DropDownParent.DataSource = parents;
                DropDownParent.DataTextField = "Name";
                DropDownParent.DataValueField = "gid";
                if (checkPoint.ParentGID.HasValue)
                {
                    DropDownParent.SelectedValue = checkPoint.ParentGID.Value.ToString();
                }
                else
                {
                    DropDownParent.SelectedIndex = 0;
                }
                DropDownParent.DataBind();
                DropDownParent.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            }
            else
            {
                Response.Redirect("/Constructor/QuestsList.aspx");
            }
        }
    }
}