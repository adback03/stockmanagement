﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Common;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    public int UserId { get; set; }
    public string CompanyName { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string UserName { get; set; }
    public string Password { get; set; }
    public string Email { get; set; }
    public string Phone { get; set; }
    public Enums.StockMarketType Type { get; set; }

    public User()
    {

    }
}