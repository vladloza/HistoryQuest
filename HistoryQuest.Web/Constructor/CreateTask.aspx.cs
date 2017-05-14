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

            if (Session != null && Session["CreatedQuest"] != null)
            {
                var taskTypesList = Repository.CurrentDataContext.TaskTypes.Select(cp => new
                {
                    cp.id,
                    cp.gid,
                    cp.Name,
                    cp.Caption
                }).OrderBy(cp => cp.id).ToList();

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