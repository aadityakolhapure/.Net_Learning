using APIInt.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace APIInt.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EMPController : ControllerBase
    {
        EmployeeContext _context;
        public EMPController(EmployeeContext context)
        {
            _context = context;
        }
        [HttpGet]
        public ActionResult<List<emp>> GetEmployees()
        {
            var employees = _context.Employees.ToList();
            return Ok(employees);
        }
        [HttpPost]
        public String CreateEmployee([FromBody] emp employee)
        {
            _context.Employees.Add(employee);
            _context.SaveChanges();
            return ("Added Successsfully");
        }

        [HttpGet("{id}")]
        public ActionResult<emp> GetById(int id)
        {
            var e1 = _context.Employees.Find(id);
            if (e1 == null)
            {
                return NotFound();
            }
            return Ok(e1);
        }

        [HttpPost("{id}")]
        public ActionResult<emp> Update(int id, [FromBody] emp updatedEmployee)
        {
            if (id != updatedEmployee.eid)
            {
                return Ok("ID in URL and request body do not match");
            }
            var existingEmployee = _context.Employees.Find(id);

            if(existingEmployee == null)
            {
                return Ok("Employee not found");
            }
            existingEmployee.ename = updatedEmployee.ename;
            existingEmployee.eemail = updatedEmployee.eemail;
            existingEmployee.epass = updatedEmployee.epass;
            _context.SaveChanges();

            return Ok();
        }
    }
}
