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
    public partial class AllStudents : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!IsPostBack)
            {
                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reports/AllStudents.rdlc");
                ReportDataSource datasource = new ReportDataSource("AllStudents", Repository.CurrentDataContext.Faces.Where(f => f.TeacherGID == Repository.CurrentUser.FaceGID));
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(datasource);
            }
        }
    }
}