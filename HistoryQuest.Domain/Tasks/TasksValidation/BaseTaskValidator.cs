using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HistoryQuest.Domain.Tasks.TasksValidation
{
    public class BaseTaskValidator
    {
        public int MaxScore { get; set; }

        public BaseTaskValidator(int maxScore)
        {
            MaxScore = maxScore;
        }

        public virtual int Validate(string userAnswer, object rightAnswer)
        {
            if (string.IsNullOrEmpty(userAnswer) || string.IsNullOrEmpty(rightAnswer.ToString()))
            {
                return 0;
            }

            return userAnswer == rightAnswer.ToString() ? MaxScore : 0;
        }
    }
}
