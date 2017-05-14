using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace HistoryQuest.Domain.Tasks.XmlGenerators
{
    public class BaseXmlGenerator
    {
        public virtual XElement Generate(Dictionary<string, object> source)
        {
            XElement result =  new XElement("Task");

            List<Dictionary<string, object>> answers = (source["answers"] as IEnumerable<object>).Cast<Dictionary<string, object>>().ToList();

            XElement answersElement = new XElement("answers");
            foreach (var answer in answers)
            {
                answersElement.Add(new XElement("answer", new XAttribute("text", answer)));
            }
            result.Add(answersElement);
            result.Add(new XElement("rightanswer", new XAttribute("value", source["rightanswer"])));

            if (source.ContainsKey("image"))
            {
                result.Add(new XElement("image", new XAttribute("src", source["image"])));
            }

            return result;
        }
    }
}
