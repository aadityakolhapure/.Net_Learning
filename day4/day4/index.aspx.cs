using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace day4
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String x;
            x = TextBox1.Text;
            ListBox1.Items.Add(x);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int z;
            z = int.Parse(ListBox1.SelectedItem.Text);
            //prime number
            //if (z % 2 == 0 || z == 0 || z>2)
            //{
            //    Response.Write("Number is not Prime");
            //}
            int count=0;

            for (int i = 2; i<=z/2; i++)
            {
                if (z % i == 0)
                {
                    count = 1;
                    break;
                }
               

            }
            if (count == 0)
            {
                ListBox2.Items.Add(z.ToString());
            }
            //Response.Write("Prime");

        }
    }
}