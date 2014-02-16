using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Address
/// </summary>
public class Address
{
    public string Address1 { get; set; }
    public string Address2 { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string Zip { get; set; }
    public string Country { get; set; }

	public Address()
	{
		// empty constructor
	}

    public Address(string sAddress1, string sAddress2, string sCity, 
                   string sState, string sZip, string sCountry)
    {
        Address1 = sAddress1;
        Address2 = sAddress2;
        City = sCity;
        State = sState;
        Zip = sZip;
        Country = sCountry;
    }
}