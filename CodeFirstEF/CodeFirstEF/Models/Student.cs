using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace CodeFirstEF.Models
{
    public class Student
    {
        [Key]  //System.ComponentModel.DataAnnotations namespace is used for Key attribute
        public int SId { get; set; }

        public String SName { get; set; }

        public int Age { get; set; }

        public String Address { get; set; }


    }
}