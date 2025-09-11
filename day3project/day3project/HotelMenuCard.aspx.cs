using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace day3project
{
    public partial class HotelMenuCard : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            int a = 0, b = 0, c = 0, d = 0, k = 0, f = 0;

            if(CheckBox1.Checked == true)
            {
                a = 80;
            }
            if (CheckBox2.Checked == true)
            {
                b = 180;
            }
            if (CheckBox3.Checked == true)
            {
                c = 120;
            }
            if (CheckBox4.Checked == true)
            {
                d = 20;
            }
            if (CheckBox5.Checked == true)
            {
                k = 30;
            }
            if (CheckBox6.Checked == true)
            {
                f = 20;
            }
            // bill calculation
            double sum = a + b + c + d + k + f;

            if (sum == 0)
            {
                Response.Write("Please select any item from the menu");
            }
            else
            {
                //discount logic
                
                if (sum >= 400)
                {

                    double discount = sum * 0.25;
                    sum = sum - discount;
                }

                //Response.Write("Your bill is " + sum);
                Label1.Text = "Your Bill is " + sum;
            }
        }
    }
}