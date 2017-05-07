using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HistoryQuest.WebServices
{
    public class DataService
    {
        public static int GetQuestLikesCount(Guid questGID)
        {
            var count = (from l in Repository.CurrentDataContext.Likes
                         join ch in Repository.CurrentDataContext.CheckPoints on l.CheckPointGID equals ch.gid
                         where ch.QuestGID == questGID
                         select l).Count();
            return count;
        }

        public static int GetQuestCommentsCount(Guid questGID)
        {
            var count = (from c in Repository.CurrentDataContext.Comments 
                         where c.QuestGID == questGID
                         select c).Count();
            return count;
        }
    }
}