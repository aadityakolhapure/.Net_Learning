using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TaskMang.Models;

namespace TaskMang.Controllers
{
    public class TaskController : ApiController
    {
        TaskContext db = new TaskContext();

        [HttpGet]
        public IEnumerable<TaskModel> GetAllTasks()
        {
            return db.Tasks.ToList();
        }

        [HttpGet]
        [Route("api/Task/GetTask/{id}")]
        public IHttpActionResult GetTask(int id)
        {
            var task = db.Tasks.Find(id);
            if (task == null)
                return NotFound();

            return Ok(task);
        }

        [HttpPost]
        public IHttpActionResult AddTask(TaskModel task)
        {
            
            if (task == null)
            {
                return BadRequest("Task data cannot be null.");
            }

            task.CreatedAt = DateTime.Now;

            db.Tasks.Add(task);
            db.SaveChanges();

            return Ok("Task added successfully!");
        }

        [HttpPut]
        [Route("api/Task/UpdateTask/{id}")]
        public IHttpActionResult UpdateTask(int id, TaskModel updatedTask)
        {
            if (updatedTask == null)
                return BadRequest("Invalid task data.");

            var existingTask = db.Tasks.FirstOrDefault(t => t.TaskId == id);
            if (existingTask == null)
                return NotFound();

            existingTask.Title = updatedTask.Title;
            existingTask.Description = updatedTask.Description;
            existingTask.IsCompleted = updatedTask.IsCompleted;

            db.SaveChanges();

            return Ok("Task updated successfully!");
        }

        [HttpDelete]
        [Route("api/Task/DeleteTask/{id}")]
        public IHttpActionResult DeleteTask(int id)
        {
            var task = db.Tasks.Find(id);
            if (task == null)
                return NotFound();
            db.Tasks.Remove(task);
            db.SaveChanges();
            return Ok("Task deleted successfully!");
        }
    }
}