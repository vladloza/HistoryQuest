using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace HistoryQuest.Quests
{
    public partial class WritingTask : BaseTaskPage
    { 
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            List<string> rightAnswers = new List<string>();
            using (XmlReader reader = task.SourceFile.CreateReader())
            {
                reader.ReadToFollowing("rightanswers");
                if (reader.ReadToDescendant("rightanswer"))
                {
                    do
                    {
                        reader.MoveToFirstAttribute();
                        rightAnswers.Add(reader.Value);
                    } while (reader.ReadToNextSibling("rightanswer"));
                }
            }

            if (Session != null)
            {
                Session["RightAnswera"] = rightAnswers;
            }
        }
    }
}