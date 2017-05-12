using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HistoryQuest.Domain
{
    public partial class HistoryQuestDataContext
    {
        public User GetUserByUserName(string userName)
        {
            return Users.SingleOrDefault(u => u.UserName == userName && (u.SocialName == null || u.SocialName == ""));
        }
    }
}
