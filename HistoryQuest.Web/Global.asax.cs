﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using HistoryQuest.Domain;

namespace HistoryQuest
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Repository.InitializeNewDataContext();
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            try
            {
                Exception LastError = Server.GetLastError();

                Repository.CurrentDataContext.Errors.InsertOnSubmit(new Domain.Error() {
                    ErrorText = LastError.Message,
                    InnerErrorText = LastError.InnerException?.Message,
                    StackTrace = LastError.StackTrace + "----next----" + LastError.InnerException?.StackTrace,
                    DateTime = DateTime.Now
                });

                Repository.CurrentDataContext.SubmitChanges();

                Response.Redirect("~/Error.aspx", false);
            }
            finally
            {
                Server.ClearError();
            }
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}