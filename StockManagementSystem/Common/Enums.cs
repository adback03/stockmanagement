using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public static class Enums
    {
        public enum StockMarketType
        {
            Company = 1,
            Admin = 2
        }

        public enum Status
        {
            Pending = 1,
            Approved = 2,
            Denied = 3,
            OnHold = 4
        }
    }
}
