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
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (Repository.CurrentUser.UsersInRoles.FirstOrDefault(uir => uir.RoleGID == Constants.StudentRoleGID) == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void AddResponseButton_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(selectedTeacher.Value) && Repository.CurrentUser.Face.TeacherGID == null)
            {
                var request = Repository.CurrentDataContext.PupilsToTeachersRequests.FirstOrDefault(ptr => ptr.PupilGID == Repository.CurrentUser.FaceGID.Value);

                if (request != null)
                {
                    Repository.CurrentDataContext.PupilsToTeachersRequests.DeleteOnSubmit(request);
                }

                request = new PupilsToTeachersRequest()
                {
                    gid = Guid.NewGuid(),
                    PupilGID = Repository.CurrentUser.FaceGID.Value,
                    TeacherGID = new Guid(selectedTeacher.Value)
                };

                Repository.CurrentDataContext.PupilsToTeachersRequests.InsertOnSubmit(request);
                Repository.CurrentDataContext.SubmitChanges();
            }
            Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}