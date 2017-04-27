using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HistoryQuest.Domain
{
    partial class User
    {
        public bool Validate(string password)
        {
            return ((PasswordFormat == 0 && Password == password) ||
                    (PasswordFormat == 1 && Password == Defender.ComputeHash(password, PasswordSalt)));
        }
    }
}
