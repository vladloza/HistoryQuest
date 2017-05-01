using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest.Account
{
    public partial class StudentAccount : BasePage
    {
        protected void AddResponseButton_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(selectedTeacher.Value) && Repository.CurrentUser.Face.TeacherGID == null)
            {
                var request = Repository.CurrentDataContext.PupilsToTeachersRequests.FirstOrDefault(ptr => ptr.PupilsGID == Repository.CurrentUser.FaceGID.Value);

                if (request != null)
                {
                    Repository.CurrentDataContext.PupilsToTeachersRequests.DeleteOnSubmit(request);
                }

                request = new PupilsToTeachersRequest()
                {
                    gid = Guid.NewGuid(),
                    PupilsGID = Repository.CurrentUser.FaceGID.Value,
                    TeacherGID = new Guid(selectedTeacher.Value)
                };

                Repository.CurrentDataContext.PupilsToTeachersRequests.InsertOnSubmit(request);
                Repository.CurrentDataContext.SubmitChanges();
            }
            Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}