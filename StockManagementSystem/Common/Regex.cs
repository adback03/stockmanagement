using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public static class Regex
    {
        /// <summary>
        /// A name must be at least one character, and can have letters, apostrophes, or dashes.
        /// </summary>
        public static string Name = @"^[a-zA-Z '-]{1,}$";

        /// <summary>
        /// Validates a 9 digit social security number in the format ###-##-####
        /// </summary>
        public static string SSN = @"^\d{3}-\d{2}-\d{4}$";

        /// <summary>
        /// No standard format for an address. Have at least a letter or number
        /// </summary>
        public static string Address = @"[a-zA-Z0-9]+";

        /// <summary>
        /// Validates an email address.
        /// </summary>
        public static string Email = @"^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$";

        /// <summary>
        /// Validates multiple types of phone numbers in the US
        /// </summary>
        public static string Phone = @"^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$";

        /// <summary>
        /// There is no standard format for cities. It must have at least a letter or number.
        /// </summary>
        public static string City = @"[a-zA-Z0-9]+";

        /// <summary>
        /// Standard US Zip code.
        /// Ex. 54601 or 54601-4432
        /// </summary>
        public static string Zip = @"(^\d{5}$)|(^\d{5}-\d{4}$)";

        /// <summary>
        /// This regex conforms to the US routing number format.
        /// Ensures number is nine digits long and has first two digits that comply with American Bankers Association rules
        /// </summary>
        public static string RoutingNumber = @"^((0[0-9])|(1[0-2])|(2[1-9])|(3[0-2])|(6[1-9])|(7[0-2])|80)([0-9]{7})$";

        /// <summary>
        /// There is no standard for US account numbers. Therefore, simply restrict to digits.
        /// </summary>
        public static string AccountNumber = @"^\d+$";
    }
}
