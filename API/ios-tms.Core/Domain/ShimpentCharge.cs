using System;
namespace iOS_TMS.Core.Domain;

public class ShimpentCharge : EntityBase
{
    public string Description { get; set; }
    public Decimal Amount { get; set; }
}