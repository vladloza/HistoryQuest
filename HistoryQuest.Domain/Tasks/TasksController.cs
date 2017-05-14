using HistoryQuest.Domain.Tasks.TasksValidation;
using HistoryQuest.Domain.Tasks.XmlGenerators;
using System;

namespace HistoryQuest.Domain.Tasks
{
    public class TasksController
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

        public static BaseXmlGenerator GetXmlGenerator(Guid taskTypeGID)
        {
            BaseXmlGenerator generator = null;

            if (taskTypeGID == Constants.TestTaskTypeGID || taskTypeGID == Constants.TestWithImageTaskTypeGID)
            {
                generator = new BaseXmlGenerator();
            }
            else if (taskTypeGID == Constants.WritingTaskTypeGID)
            {
                generator = new WritingXmlGenerator();
            }
            else if (taskTypeGID == Constants.MapTaskTypeGID)
            {
                generator = new MapXmlGenerator();
            }
            else if (taskTypeGID == Constants.ConformityTaskTypeGID)
            {
                generator = new ConformityXmlGenerator();
            }
            else
            {
                generator = new BaseXmlGenerator();
            }

            return generator;
        }
    }
}
