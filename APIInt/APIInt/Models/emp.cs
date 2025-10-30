using System.ComponentModel.DataAnnotations;

namespace APIInt.Models
{
    public class emp
    {
        [Key]
        public int eid { get; set; }
        public string ename { get; set; }
        public string eemail { get; set; }
        public string epass { get; set; }

    }
}
