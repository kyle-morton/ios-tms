using System;
namespace iOS_TMS.Core.Domain;

public class Address : EntityBase
{
    public string AddressLineOne { get; set; }
    public string AddressLineTwo { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string ZipCode { get; set; }
}

