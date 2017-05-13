using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace HistoryQuest.Domain.Tasks.XmlGenerators
{
    public class MapXmlGenerator : BaseXmlGenerator
    {
        public override XElement Generate(Dictionary<string, object> source)
        {
            XElement result = new XElement("Task");

            result.Add(new XElement("rightanswer", new XAttribute("value", source["rightanswer"]), new XAttribute("maxError", source["maxError"])));

            return result;
        }
    }
}
