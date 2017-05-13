using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace HistoryQuest.Domain.Tasks.XmlGenerators
{
    public class WritingXmlGenerator : BaseXmlGenerator
    {
        public override XElement Generate(Dictionary<string, object> source)
        {
            XElement result = new XElement("Task");

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
