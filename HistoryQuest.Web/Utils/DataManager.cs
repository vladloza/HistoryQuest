using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HistoryQuest.Utils
{
    public static class DataManager
    {
        private static string key = "dataItems";
        private static List<string> dataItems
        {
            get
            {
                List<string> result = HttpContext.Current.Items[key] as List<string>;
                if (result == null)
                {
                    result = new List<string>();
                    HttpContext.Current.Items[key] = result;
                }
                return result;
            }
        }

        public static void AddStringVariable(string name, string value)
        {
            dataItems.Add($"var { name } = '{ value }';");
        }

        public static string GetData()
        {
            string result = string.Join("\r\n", dataItems.Distinct().ToList());

            return result;
        }
    }
}