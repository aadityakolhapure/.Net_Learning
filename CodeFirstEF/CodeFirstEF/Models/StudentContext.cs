using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace CodeFirstEF.Models
{
    public class StudentContext:DbContext
    // DbContext has DbSet property which is used to create table in database
    //StudentContext class inherits DbContext class
    {

        public DbSet<Student> Stud { get; set; }
    }
}