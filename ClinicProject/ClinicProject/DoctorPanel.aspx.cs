using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace ClinicProject
{
    public partial class DoctorPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["userId"] = null;
            Session["email"] = null;
            Session["roleId"] = null;
            Session["name"] = null;
            Session["specilization"] = null;
        }
    }
}