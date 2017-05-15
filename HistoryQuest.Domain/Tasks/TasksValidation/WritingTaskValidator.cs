using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HistoryQuest.Domain.Tasks.TasksValidation
{
    public class WritingTaskValidator : BaseTaskValidator
    {
        public WritingTaskValidator(int maxScore) : base(maxScore)
        {
        }

        public override int Validate(string userAnswer, object rightAnswer)
        {
            var rightAnswers = rightAnswer as List<string>;

            string fixedUserAnswer = new string(userAnswer.Where(c => char.IsLetter(c)).ToArray()).Trim().ToLower();
            if (rightAnswers != null)
            {
                for (int i = 0; i < rightAnswers.Count; i++)
                {
                    string fixedRightAnswer = new string(rightAnswers[i].Where(c => char.IsLetter(c)).ToArray()).Trim().ToLower();
                    if (fixedUserAnswer == fixedRightAnswer)
                    {
                        return MaxScore;
                    }
                }
            }
            else
            {
                string fixedRightAnswer = new string(rightAnswer.ToString().Where(c => char.IsLetter(c)).ToArray()).Trim().ToLower();
                if (fixedUserAnswer == fixedRightAnswer)
                {
                    return MaxScore;
                }
            }

            return 0;
        }
    }
}
