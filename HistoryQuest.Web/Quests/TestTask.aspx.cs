using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest.Quests
{
    public partial class TestTask : BaseTaskPage
    {
        public List<string> answers;
        protected int rightAnswerId;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            
            //Load Xml file with task sources
            answers = new List<string>() { "Answer1", "Answer2", "Answer3", "Answer4" };
            rightAnswerId = 2;

            if (Session != null)
            {
                Session["RightAnswer"] = answers[rightAnswerId];
            }
        }
    }
}