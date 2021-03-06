﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Device.Location;
using System.Globalization;

namespace HistoryQuest.Domain.Tasks.TasksValidation
{
    public class MapTaskValidator : BaseTaskValidator
    {
        public MapTaskValidator(int maxScore)
            : base(maxScore) { }

        public override int Validate(string userAnswer, object rightAnswer)
        {
            int result = 0;
            try
            {
                string[] userAnswerParts = userAnswer.Split(';');
                double userLat = double.Parse(userAnswerParts[0], CultureInfo.InvariantCulture);
                double userLng = double.Parse(userAnswerParts[1], CultureInfo.InvariantCulture);

                string[] rightAnswerParts = rightAnswer.ToString().Replace("(", "").Replace(")", "").Replace(" ", "").Split(',');
                double rightLat = double.Parse(rightAnswerParts[0], CultureInfo.InvariantCulture);
                double rightLng = double.Parse(rightAnswerParts[1], CultureInfo.InvariantCulture);
                double maxDistance = double.Parse(rightAnswerParts[2], CultureInfo.InvariantCulture);

                var userCoord = new GeoCoordinate(userLat, userLng);
                var rightCoord = new GeoCoordinate(rightLat, rightLng);

                result = userCoord.GetDistanceTo(rightCoord) / 1000d <= maxDistance ? MaxScore : 0;
            }
            catch
            {
                result = 0;
            }

            return result;
        }
    }
}
