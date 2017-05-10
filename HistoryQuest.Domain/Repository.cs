using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HistoryQuest.Domain
{
    public static class Repository
    {
        [ThreadStatic]
        private static HistoryQuestDataContext _DataContext;

        public static HistoryQuestDataContext CurrentDataContext
        {
            get
            {
                if (_DataContext == null)
                {
                    _DataContext = CreateNewDataContext();
                }
                return _DataContext;
            }
        }

        public static void InitializeNewDataContext()
        {
            _DataContext = CreateNewDataContext();
        }

        public static HistoryQuestDataContext CreateNewDataContext()
        {
            return new HistoryQuestDataContext();
        }

        public static User CurrentUser { get; set; }

        internal static void ResetDataContext()
        {
            _DataContext = null;
            _DataContext = CreateNewDataContext();
        }

        public static string GetAccountHtml(Guid roleGID)
        {
            switch (roleGID.ToString())
            {
                case Constants.TeacherRoleGID:
                    return "/Account/TeacherAccount.aspx";

                case Constants.StudentRoleGID:
                    return "/Account/StudentAccount.aspx";

                case Constants.AdminRoleGID:
                    return "/Account/AdminAccount.aspx";

                default:
                    return "/";
            }
        }
    }
}
