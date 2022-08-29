﻿using System;
namespace ios_tms.Core.Domain;

public class Address : EntityBase
{
    public string AddressLineOne { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string ZipCode { get; set; }
}
