using System;
namespace iOS_TMS.Core.Domain;

public class Carrier : EntityBase
{
    public string Name { get; set; }
    public string Scac { get; set; }
}

