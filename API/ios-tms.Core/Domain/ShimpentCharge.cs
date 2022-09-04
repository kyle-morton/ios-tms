using System;
namespace ios_tms.Core.Domain;

public class ShimpentCharge : EntityBase
{
    public string Description { get; set; }
    public Decimal Amount { get; set; }
}