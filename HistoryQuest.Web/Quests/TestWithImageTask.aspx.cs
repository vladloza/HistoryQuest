using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace HistoryQuest.Quests
{
    public partial class TestWithImageTask : BaseTaskPage
    {
        public List<string> Answers { get; set; }
        public string ImagePath { get; set; }

        protected int rightAnswerId;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            Answers = new List<string>();
            using (XmlReader reader = XmlReader.Create(HttpRuntime.AppDomainAppPath + task.SourceFilePath))
            {
                reader.ReadToFollowing("answers");
                if (reader.ReadToDescendant("answer"))
                {
                    do
                    {
                        reader.MoveToFirstAttribute();
                        Answers.Add(reader.Value);
                    } while (reader.ReadToNextSibling("answer"));
                }
                reader.ReadToFollowing("rightanswer");
                reader.MoveToFirstAttribute();
                rightAnswerId = int.Parse(reader.Value);
                reader.ReadToFollowing("image");
                reader.MoveToFirstAttribute();
                ImagePath = reader.Value;
            }

            if (Session != null)
            {
                Session["RightAnswer"] = Answers[rightAnswerId];
            }
        }
    }
}