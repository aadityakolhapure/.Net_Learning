using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjStudent
{
    public partial class Student : System.Web.UI.Page
    {

        public class StudentInfo
        {
            public string Name { get; set; }
            public string Email { get; set; }
            public string Department { get; set; }

            public int Age { get; set; }

            public string Gender { get; set; }

            public string Phone { get; set; }

            public int Result { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Students"] = new List<StudentInfo>();
            }

           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var students = (List<StudentInfo>)Session["Students"];


            StudentInfo s = new StudentInfo()
            {

                Name = TextBox1.Text,
                Email = TextBox2.Text,
                Department = DropDownList1.SelectedValue,
                Age = int.Parse(TextBox3.Text),
                Gender = DropDownList2.SelectedValue,
                Phone = TextBox4.Text,
                Result = int.Parse(TextBox5.Text),
            };

            students.Add(s);

            Session["Students"] = students;

            GridView1.DataSource = students;
            GridView1.DataBind();

            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            DropDownList1.SelectedIndex = 0;


            DropDownList2.SelectedIndex = 0;

            //Response.Redirect(Request.RawUrl);
        }

    }
}