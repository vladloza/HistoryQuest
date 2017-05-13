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

            List<Dictionary<string, object>> questions = (source["questions"] as IEnumerable<object>).Cast<Dictionary<string, object>>().ToList();

            XElement questionsElement = new XElement("questions");
            foreach (var question in questions)
            {
                questionsElement.Add(new XElement("question", new XAttribute("text", question)));
            }
            result.Add(questionsElement);
            
            List<Dictionary<string, object>> answers = (source["answers"] as IEnumerable<object>).Cast<Dictionary<string, object>>().ToList();

            XElement answersElement = new XElement("answers");
            foreach (var answer in answers)
            {
                answersElement.Add(new XElement("answer", new XAttribute("text", answer)));
            }
            result.Add(answersElement);

            List<Dictionary<string, object>> rightanswers = (source["rightanswers"] as IEnumerable<object>).Cast<Dictionary<string, object>>().ToList();

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
