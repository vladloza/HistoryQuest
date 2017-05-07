using HistoryQuest.Domain;
using HistoryQuest.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HistoryQuest.Quests
{
    public partial class Tasks : System.Web.UI.MasterPage
    {
        public HtmlGenericControl TaskHeaderControl
        {
            get
            {
                return TaskHeader;
            }
        }

        public HtmlGenericControl QuestionTextControl
        {
            get
            {
                return QuestionText;
            }
        }

        public HtmlGenericControl TaskDivControl
        {
            get
            {
                return TaskDiv;
            }
        }

        public HtmlGenericControl TaskNumberControl
        {
            get
            {
                return TaskNumber;
            }
        }
        
        public HtmlGenericControl ProgressBarControl
        {
            get
            {
                return ProgressBar;
            }
        }
    }
}