using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Documents;

namespace day4
{
    public partial class ExamPortal : System.Web.UI.Page
    {
        
        

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //reset checkbox
            RadioButton1.Checked = false;
            RadioButton2.Checked = false;
            RadioButton3.Checked = false;
            RadioButton4.Checked = false;

            //reset color
            RadioButton1.ForeColor = System.Drawing.Color.Black;
            RadioButton2.ForeColor = System.Drawing.Color.Black;
            RadioButton3.ForeColor = System.Drawing.Color.Black;
            RadioButton4.ForeColor = System.Drawing.Color.Black;
            Label1.Text = "";

            if (DropDownList1.SelectedItem.Text == "Question1")
            {
                TextBox1.Text = "Who is inventer of C programming?";
                RadioButton1.Text = "Denis Ritch";
                RadioButton2.Text = "Elon Musk";
                RadioButton3.Text = "Mark Zurk";
                RadioButton4.Text = "None of these";
            }
            else if (DropDownList1.SelectedItem.Text == "Question2")
            {
                TextBox1.Text = ".NET Framework mainly supports which programming paradigm?";
                RadioButton1.Text = "Object-Oriented";
                RadioButton2.Text = "Procedural";
                RadioButton3.Text = "Functional";
                RadioButton4.Text = "Logic Programming";
            }
            else if (DropDownList1.SelectedItem.Text == "Question3")
            {
                TextBox1.Text = "What does CLR stand for in .NET?";
                RadioButton1.Text = "Common Language Runtime";
                RadioButton2.Text = "Common Logic Resource";
                RadioButton3.Text = "Central Library Repository";
                RadioButton4.Text = "Computer Logic Routines";
            }
            else if (DropDownList1.SelectedItem.Text == "Question4")
            {
                TextBox1.Text = "Which language was NOT originally supported by .NET?";
                RadioButton1.Text = "VB.NET";
                RadioButton2.Text = "C#";
                RadioButton3.Text = "Java";
                RadioButton4.Text = "F#";
            }
            else if (DropDownList1.SelectedItem.Text == "Question5")
            {
                TextBox1.Text = "What component manages memory in .NET?";
                RadioButton1.Text = "CPU";
                RadioButton2.Text = "Garbage Collector";
                RadioButton3.Text = "RAM";
                RadioButton4.Text = "Compiler";
            }
            else if (DropDownList1.SelectedItem.Text == "Question6")
            {
                TextBox1.Text = "Who is the principal inventor of C#?";
                RadioButton1.Text = "Anders Hejlsberg";
                RadioButton2.Text = "Bjarne Stroustrup";
                RadioButton3.Text = "James Gosling";
                RadioButton4.Text = "Guido van Rossum";
            }
            else if (DropDownList1.SelectedItem.Text == "Question7")
            {
                TextBox1.Text = "What is the extension of compiled .NET assemblies?";
                RadioButton1.Text = ".exe or .dll";
                RadioButton2.Text = ".bin";
                RadioButton3.Text = ".cs";
                RadioButton4.Text = ".net";
            }
            else if (DropDownList1.SelectedItem.Text == "Question8")
            {
                TextBox1.Text = "Which .NET version introduced LINQ?";
                RadioButton1.Text = ".NET 1.0";
                RadioButton2.Text = ".NET 2.0";
                RadioButton3.Text = ".NET 3.5";
                RadioButton4.Text = ".NET 5.0";
            }
            else if (DropDownList1.SelectedItem.Text == "Question9")
            {
                TextBox1.Text = "Which assembly stores metadata and code in .NET?";
                RadioButton1.Text = "Manifest";
                RadioButton2.Text = "Module";
                RadioButton3.Text = "Namespace";
                RadioButton4.Text = "Class Library";
            }
            else if (DropDownList1.SelectedItem.Text == "Question10")
            {
                TextBox1.Text = "What is the primary advantage of .NET Core over .NET Framework?";
                RadioButton1.Text = "Cross-platform support";
                RadioButton2.Text = "Higher cost";
                RadioButton3.Text = "Limited library";
                RadioButton4.Text = "Windows only";
            }
            else if (DropDownList1.SelectedItem.Text == "Question11")
            {
                TextBox1.Text = "Which language is NOT commonly used with .NET?";
                RadioButton1.Text = "C#";
                RadioButton2.Text = "VB.NET";
                RadioButton3.Text = "Python";
                RadioButton4.Text = "F#";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["Score"] == null) Session["Score"] = 0;
            if (Session["visited"] == null) Session["visited"] = 0;
            int Score = (int)Session["Score"];
            int visited = (int)Session["visited"];
            bool isCorrect = false;


            if (DropDownList1.SelectedItem.Text == "Question1")
            {
                if (RadioButton1.Checked == true)
                {
                    Label1.Text = "Answer is Correct!";
                    Score++;
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "Answer is Incorrect!";
                    RadioButton1.ForeColor = System.Drawing.Color.Green;
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                visited++;
                Session["score"] = Score;
                Session["visited"] = visited;
            }
            else if (DropDownList1.SelectedItem.Text == "Question2")
            {
                if (RadioButton1.Checked)
                {
                    Label1.Text = "Answer is Correct!";
                    Score++;
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "Answer is Incorrect!";
                    RadioButton1.ForeColor = System.Drawing.Color.Green;
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                visited++;
                Session["score"] = Score;
                Session["visited"] = visited;
            }
            else if (DropDownList1.SelectedItem.Text == "Question3")
            {
                if (RadioButton1.Checked) // Common Language Runtime
                {
                    Label1.Text = "Answer is Correct!";
                    Score++;
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "Answer is Incorrect!";
                    RadioButton1.ForeColor = System.Drawing.Color.Green;
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                visited++;
                Session["score"] = Score;
                Session["visited"] = visited;
            }
            else if (DropDownList1.SelectedItem.Text == "Question4")
            {
                if (RadioButton3.Checked) // Java
                {
                    Label1.Text = "Answer is Correct!";
                    Score++;
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "Answer is Incorrect!";
                    RadioButton3.ForeColor = System.Drawing.Color.Green;
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                visited++;
                Session["score"] = Score;
                Session["visited"] = visited;
            }
            else if (DropDownList1.SelectedItem.Text == "Question5")
            {
                if (RadioButton2.Checked) // Garbage Collector
                {
                    Label1.Text = "Answer is Correct!";
                    Score++;
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "Answer is Incorrect!";
                    RadioButton2.ForeColor = System.Drawing.Color.Green;
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                visited++;
                Session["score"] = Score;
                Session["visited"] = visited;
            }
            else if (DropDownList1.SelectedItem.Text == "Question6")
            {
                if (RadioButton1.Checked) // Anders Hejlsberg
                {
                    Label1.Text = "Answer is Correct!";
                    Score++;
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "Answer is Incorrect!";
                    RadioButton1.ForeColor = System.Drawing.Color.Green;
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                visited++;
                Session["score"] = Score;
                Session["visited"] = visited;
            }
            else if (DropDownList1.SelectedItem.Text == "Question7")
            {
                if (RadioButton1.Checked) // .exe or .dll
                {
                    Label1.Text = "Answer is Correct!";
                    Score++;
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "Answer is Incorrect!";
                    RadioButton1.ForeColor = System.Drawing.Color.Green;
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                visited++;
                Session["score"] = Score;
                Session["visited"] = visited;
            }
            else if (DropDownList1.SelectedItem.Text == "Question8")
            {
                if (RadioButton3.Checked) // .NET 3.5
                {
                    Label1.Text = "Answer is Correct!";
                    Score++;
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "Answer is Incorrect!";
                    RadioButton3.ForeColor = System.Drawing.Color.Green;
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                visited++;
                Session["score"] = Score;
                Session["visited"] = visited;
            }
            else if (DropDownList1.SelectedItem.Text == "Question9")
            {
                if (RadioButton1.Checked) // Manifest
                {
                    Label1.Text = "Answer is Correct!";
                    Score++;
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "Answer is Incorrect!";
                    RadioButton1.ForeColor = System.Drawing.Color.Green;
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                visited++;
                Session["score"] = Score;
                Session["visited"] = visited;
            }
            else if (DropDownList1.SelectedItem.Text == "Question10")
            {
                if (RadioButton1.Checked) // Cross-platform support
                {
                    Label1.Text = "Answer is Correct!";
                    Score++;
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "Answer is Incorrect!";
                    RadioButton1.ForeColor = System.Drawing.Color.Green;
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                visited++;
                Session["score"] = Score;
                Session["visited"] = visited;
            }
            else if (DropDownList1.SelectedItem.Text == "Question11")
            {
                if (RadioButton3.Checked) // Python
                {
                    Label1.Text = "Answer is Correct!";
                    Score++;
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "Answer is Incorrect!";
                    RadioButton3.ForeColor = System.Drawing.Color.Green;
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                visited++;
                Session["score"] = Score;
                Session["visited"] = visited;
            }
            Session["Score"] = Score;


            if (visited == 11)
            {
                Label3.Text = "You have Completed your Exam Successfully";
                Label2.Text = "Your Exam Score is " + Score;
                Session["score"] = null;
                Session["visted"] = null;
               
            }
            else
            {
                Label3.Text = "Please solve all question";

            }

            Label4.Text = visited.ToString();


        }
    }
}
