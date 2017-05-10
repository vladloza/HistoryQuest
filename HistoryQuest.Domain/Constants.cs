using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HistoryQuest.Domain
{
    public static class Constants
    {
        public const string TeacherRoleGID = "4492ed1d-052a-491a-8897-9bbc8d8633ff";
        public const string StudentRoleGID = "024900db-2a68-4959-a0e9-10069608d923";
        public const string AdminRoleGID = "40f816d3-3bb4-4864-97c1-67803413389a";

        public static readonly Guid TestTaskTypeGID = new Guid("6D1E2691-3EAB-41A7-90C4-8BD9EC7B1FD8");
        public static readonly Guid MapTaskTypeGID = new Guid("09DAFF50-996E-4077-9BE0-3C0BF516E56C");
        public static readonly Guid ConformityTaskTypeGID = new Guid("9F3A9B8B-6B56-473E-B88A-DDD33C337396");
        public static readonly Guid TestWithImageTaskTypeGID = new Guid("9044BC32-30A7-49A5-8DC2-BA24BECE5E39");
        public static readonly Guid WritingTaskTypeGID = new Guid("979F14EB-265C-4080-A375-9C10CD49B544");

        public static readonly Dictionary<Guid, string> TaskTypesPages = new Dictionary<Guid, string>
        {
            { TestTaskTypeGID, "/Quests/TestTask.aspx" },
            { MapTaskTypeGID, "/Quests/MapTask.aspx" },
            { ConformityTaskTypeGID, "/Quests/ConformityTask.aspx" },
            { TestWithImageTaskTypeGID, "/Quests/TestWithImageTask.aspx" },
            { WritingTaskTypeGID, "/Quests/WritingTask.aspx" }
        };
    }
}
