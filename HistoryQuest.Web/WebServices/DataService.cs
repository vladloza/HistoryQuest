using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace HistoryQuest.WebServices
{
    public class DataService
    {
        public static int GetQuestLikesCount(Guid questGID)
        {
            var count = (from l in Repository.CurrentDataContext.Likes
                         join ch in Repository.CurrentDataContext.CheckPoints on l.CheckPointGID equals ch.gid
                         where ch.QuestGID == questGID
                         select l).Count();
            return count;
        }

        public static int GetQuestCommentsCount(Guid questGID)
        {
            var count = (from c in Repository.CurrentDataContext.Comments 
                         where c.QuestGID == questGID
                         select c).Count();
            return count;
        }

        public static void SendResponceToTeacher(string email, string password)
        {
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

            smtpClient.Credentials = new System.Net.NetworkCredential("historyquest2017@gmail.com", "fit2017top");
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            MailMessage mail = new MailMessage();

            mail.From = new MailAddress("historyquest2017@gmail.com", "HistoryQuest");
            mail.To.Add(new MailAddress(email));
            mail.Body = "Вашу кандидатуру було прийнято. Ви можете залогінитись використовуючи вашу пошту і цей пароль: "+password;
            mail.Subject = "Реєстрація у сервісі HistoryQuest";
            smtpClient.Send(mail);
        }
    }
}