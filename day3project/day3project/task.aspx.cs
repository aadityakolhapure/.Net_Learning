using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace day3project
{
    public partial class task : System.Web.UI.Page
    {
        private bool red;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string a;
            if (RadioButton1.Checked == true)
            {

                TextBox1.ForeColor = Color.Red;
            }
            if (RadioButton2.Checked == true)
            {
                TextBox1.ForeColor = Color.Green;
            }
            if (RadioButton3.Checked == true)
            {
                TextBox1.ForeColor = Color.Yellow;
            }
            if (RadioButton4.Checked == true)
            {
                TextBox1.ForeColor = Color.Blue;
            }
        }
    }
}