using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest.Constructor
{
    public partial class CreateCheckPoint : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (Session != null && Session["CreatedCheckPointGID"] != null)
            {
                Guid checkPointGID = new Guid(Session["CreatedCheckPointGID"].ToString());
                HistoryQuest.Domain.CheckPoint checkPoint = Repository.CurrentDataContext.CheckPoints.SingleOrDefault(q => q.gid == checkPointGID);

                if (checkPoint != null)
                {
                    if (checkPoint.GeoCoordinates != "0;0")
                    {
                        map.Attributes["startCoords"] = checkPoint.GeoCoordinates;
                    }

                    CheckPointName.Value = checkPoint.Name;
                    Info.InnerText = checkPoint.Info;
                    TasksCount.Value = checkPoint.TasksCount.ToString();
                    ThresholdScore.Value = checkPoint.ThresholdScore.HasValue ? checkPoint.ThresholdScore.Value.ToString() : "";
                }
                else
                {
                    Response.Redirect("/Default.aspx");
                }
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}