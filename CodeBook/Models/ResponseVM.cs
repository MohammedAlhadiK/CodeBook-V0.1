using CodeBook.Models.Enums;
using System.Collections.Generic;

namespace CodeBook.Models
{
    public class ResponseVM
    {
        public Status Status { get; set; }
        public List<string> Messages { get; set; } = new List<string>();
        public int Datalength { get; set; }
        public string CurrentLanguage { get; set; }
        public string ISValidCaptcha { get; set; }
        public string ParentID { get; set; }

    }
}