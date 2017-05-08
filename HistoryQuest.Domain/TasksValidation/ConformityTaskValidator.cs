using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HistoryQuest.Domain.TasksValidation
{
    public class ConformityTaskValidator : BaseTaskValidator
    {
        public ConformityTaskValidator(int maxScore)
            : base(maxScore) { }

        public override int Validate(string userAnswer, object rightAnswer)
        {
            List<string> rightAnswers = rightAnswer as List<string>;
            string[] userAnswers = userAnswer.Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries);
            double scorePerQuestion = MaxScore / (double)rightAnswers.Count;
            double totalScore = 0;

            for (int i = 0; i < userAnswers.Length; i++)
            {
                if (rightAnswers.Contains(userAnswers[i]))
                {
                    totalScore += scorePerQuestion;
                }
            }

            return (int)totalScore;
        }
    }
}
