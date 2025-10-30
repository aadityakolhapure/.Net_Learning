using Microsoft.EntityFrameworkCore;

namespace APIInt.Models
{
    public class EmployeeContext :DbContext
    {
        public EmployeeContext(DbContextOptions<EmployeeContext> options) : base(options)
        {
        }
        public DbSet<emp> Employees { get; set; }
    }
}
