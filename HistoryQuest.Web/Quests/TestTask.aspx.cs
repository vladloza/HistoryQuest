using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace HistoryQuest.Quests
{
    public partial class TestTask : BaseTaskPage
    {
        public List<string> answers;
        protected int rightAnswerId;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            
            answers = new List<string>();
            using (XmlReader reader = XmlReader.Create(HttpRuntime.AppDomainAppPath + "/Content/Tasks/task1.xml"))//task.SourceFilePath))
            {
                reader.ReadToFollowing("answers");
                if (reader.ReadToDescendant("answer"))
                {
                    do
                    {
                        reader.MoveToFirstAttribute();
                        answers.Add(reader.Value);
                    } while (reader.ReadToNextSibling("answer"));
                }
                reader.ReadToFollowing("rightanswer");
                reader.MoveToFirstAttribute();
                rightAnswerId = int.Parse(reader.Value);
            }

            if (Session != null)
            {
                Session["RightAnswer"] = answers[rightAnswerId];
            }
        }
    }
}