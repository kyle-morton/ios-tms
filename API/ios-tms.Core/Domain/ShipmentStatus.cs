using System;
using System.ComponentModel.DataAnnotations;

namespace ios_tms.Core.Domain;

public enum ShipmentStatus
{
    [Display(Name="Pending")]
    Pending = 1,
    [Display(Name = "Dispatched")]
    Dispatched = 2,
    [Display(Name = "In-Transit")]
    InTransit = 3,
    [Display(Name = "Delivered")]
    Delivered = 4,
    [Display(Name = "Cancelled")]
    Cancelled = 5
}

