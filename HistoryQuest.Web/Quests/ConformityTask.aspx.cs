using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace HistoryQuest.Quests
{
    public partial class ConformityTask : BaseTaskPage
    {
        public Dictionary<string, string> Questions { get; set; }
        public Dictionary<string, string> Answers { get; set; }
        
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            Answers = new Dictionary<string, string>();
            Questions = new Dictionary<string, string>();
            List<string> rightAnswers = new List<string>();
            
            using (XmlReader reader = task.SourceFile.CreateReader())
            {
                reader.ReadToFollowing("questions");
                if (reader.ReadToDescendant("question"))
                {
                    do
                    {
                        reader.MoveToFirstAttribute();
                        string code = reader.Value;
                        reader.MoveToNextAttribute();
                        string text = reader.Value;
                        Questions.Add(code, text);
                    } while (reader.ReadToNextSibling("question"));
                }
                reader.ReadToFollowing("answers");
                if (reader.ReadToDescendant("answer"))
                {
                    do
                    {
                        reader.MoveToFirstAttribute();
                        string code = reader.Value;
                        reader.MoveToNextAttribute();
                        string text = reader.Value;
                        Answers.Add(code, text);
                    } while (reader.ReadToNextSibling("answer"));
                }
                reader.ReadToFollowing("rightanswers");
                if (reader.ReadToDescendant("rightanswer"))
                {
                    do
                    {
                        reader.MoveToFirstAttribute();
                        rightAnswers.Add(reader.Value);
                    } while (reader.ReadToNextSibling("rightanswer"));
                }
                
                if (Session != null)
                {
                    Session["RightAnswer"] = rightAnswers;
                }
            }
        }
    }
}