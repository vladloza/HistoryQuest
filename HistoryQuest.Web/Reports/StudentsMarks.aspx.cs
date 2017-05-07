using HistoryQuest.Domain;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest.Reports
{
    public partial class StudentsMarks : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!IsPostBack)
            {
                var request = (from u in Repository.CurrentDataContext.Users
                               join s in Repository.CurrentDataContext.Faces on u.FaceGID equals s.gid
                               join t in Repository.CurrentDataContext.Tries on u.gid equals t.UserGID
                               join cpt in Repository.CurrentDataContext.CheckPointsToTries on t.gid equals cpt.TryGID
                               join tt in Repository.CurrentDataContext.TasksToTries on cpt.gid equals tt.CheckPointToTryGID
                               where s.TeacherGID == Repository.CurrentUser.FaceGID
                               group tt.EarnedScore by new { s.FirstName, s.LastName, s.MiddleName, s.id } into res
                               select new { id = res.Key.id, StudentName = res.Key.LastName +" "+ res.Key.FirstName[0]+". "+ res.Key.MiddleName[0]+".", TotalScore = res.Sum(r=>r) }).ToList();
                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reports/StudentsMarks.rdlc");
                ReportDataSource datasource = new ReportDataSource("StudentsMarks", request);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(datasource);
            }
        }
    }
}