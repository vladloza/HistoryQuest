using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HistoryQuest.Domain.TasksValidation
{
    public static class TasksValidatorsFactory
    {
        public static BaseTaskValidator GetTaskValidator(Guid taskTypeGID, int maxScore = 1)
        {
            BaseTaskValidator validator = null;
            
            if (taskTypeGID == Constants.TestTaskTypeGID || taskTypeGID == Constants.TestWithImageTaskTypeGID)
            {
                validator = new BaseTaskValidator(maxScore);
            }
            else if (taskTypeGID == Constants.WritingTaskTypeGID)
            {
                validator = new WritingTaskValidator(maxScore);
            }
            else if (taskTypeGID == Constants.MapTaskTypeGID)
            {
                validator = new MapTaskValidator(maxScore);
            }
            else if (taskTypeGID == Constants.ConformityTaskTypeGID)
            {
                validator = new ConformityTaskValidator(maxScore);
            }
            else
            {
                return new BaseTaskValidator(maxScore);
            }

            return validator;
        }
    }
}
