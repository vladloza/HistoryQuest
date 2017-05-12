using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace HistoryQuest.Quests
{
    public partial class MapTask : BaseTaskPage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            using (XmlReader reader = task.SourceFile.CreateReader())
            {
                reader.ReadToFollowing("rightanswer");
                reader.MoveToFirstAttribute();
                string coords = reader.Value;
                reader.MoveToNextAttribute();
                string maxDistance = reader.Value;
                if (Session != null)
                {
                    Session["RightAnswer"] = string.Format("{0},{1}", coords, maxDistance);
                }
            }
        }
    }
}