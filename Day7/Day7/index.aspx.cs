using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Day7
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int number = int.Parse( args.Value);
            int original = number;
            int reverse=0;

            while(number != 0)
            {
                int digit = number % 10;
                reverse = reverse * 10 + digit;
                number = number / 10;
            }if (reverse == original)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid=false;
            }

        }
    }
}