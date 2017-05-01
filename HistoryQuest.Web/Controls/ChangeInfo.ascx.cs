using HistoryQuest.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistoryQuest.Controls
{
    public partial class Register : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                first_name.Value = Repository.CurrentUser.Face.FirstName;
                last_name.Value = Repository.CurrentUser.Face.LastName;
                father_name.Value = Repository.CurrentUser.Face.MiddleName;
                description.Value = Repository.CurrentUser.Face.Info;
            }
        }

        protected void ChangeInfoButton_Click(object sender, EventArgs e)
        {
            Face face = Repository.CurrentDataContext.Faces.Single(f => f.gid == Repository.CurrentUser.FaceGID);
            face.FirstName = first_name.Value;
            face.LastName = last_name.Value;
            face.MiddleName = father_name.Value;
            face.Info = description.Value;
            Repository.CurrentDataContext.SubmitChanges();
            Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}