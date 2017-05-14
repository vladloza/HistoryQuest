using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace HistoryQuest.Domain.Tasks.XmlGenerators
{
    public class ConformityXmlGenerator : BaseXmlGenerator
    {
        public override XElement Generate(Dictionary<string, object> source)
        {
            XElement result = new XElement("Task");

            var questions = (source["questions"] as IEnumerable<object>).Cast<string>();

            XElement questionsElement = new XElement("questions");
            foreach (var question in questions)
            {
                questionsElement.Add(new XElement("question", new XAttribute("text", question)));
            }
            result.Add(questionsElement);

            var answers = (source["answers"] as IEnumerable<object>).Cast<string>();

            XElement answersElement = new XElement("answers");
            foreach (var answer in answers)
            {
                answersElement.Add(new XElement("answer", new XAttribute("text", answer)));
            }
            result.Add(answersElement);
            
            var rightanswers = source["rightanswer"].ToString().Split(';');

            XElement rightanswersElement = new XElement("rightanswers");
            foreach (var rightanswer in rightanswers)
            {
                rightanswersElement.Add(new XElement("rightanswer", new XAttribute("text", rightanswer)));
            }
            result.Add(rightanswersElement);

            return result;
        }
    }
}
