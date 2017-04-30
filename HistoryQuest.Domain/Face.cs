using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HistoryQuest.Domain
{
    partial class Face
    {
        public string FullName
        {
            get {
                string fullName = LastName + " " + FirstName[0];
                fullName += string.IsNullOrEmpty(MiddleName) ? "." : ". " + MiddleName[0] + ".";
                return fullName;
            }
        }
    }
}
