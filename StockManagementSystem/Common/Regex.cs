using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public static class Regex
    {
        public static string Name = @"^[a-zA-Z '-]{1,}$";
        public static string SSN = @"^\d{3}-\d{2}-\d{4}$";
        public static string Address = @"[a-zA-Z0-9]+";
        public static string Email = @"^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$";
        public static string Phone = @"^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$";
        public static string City = @"[a-zA-Z0-9]+";
        public static string Zip = @"(^\d{5}$)|(^\d{5}-\d{4}$)";
    }
}
