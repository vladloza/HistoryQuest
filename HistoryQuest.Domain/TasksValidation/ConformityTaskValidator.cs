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
            

            return base.Validate(userAnswer, rightAnswer);
        }
    }
}
