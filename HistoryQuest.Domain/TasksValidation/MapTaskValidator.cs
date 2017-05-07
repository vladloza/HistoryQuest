using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HistoryQuest.Domain.TasksValidation
{
    public class MapTaskValidator : BaseTaskValidator
    {
        public MapTaskValidator(int maxScore)
            : base(maxScore) { }

        public override int Validate(string userAnswer, object rightAnswer)
        {
            int distance, maxDistance;

            if (!int.TryParse(userAnswer, out distance) || !int.TryParse(rightAnswer.ToString(), out maxDistance))
            {
                return 0;
            }

            return distance <= maxDistance ? MaxScore : 0;
        }
    }
}
