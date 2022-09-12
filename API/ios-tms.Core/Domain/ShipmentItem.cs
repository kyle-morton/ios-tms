using System;
namespace iOS_TMS.Core.Domain;

public class ShipmentItem : EntityBase
{
    public int ShipmentId { get; set; }
    public int Units { get; set; }
    public decimal Weight { get; set; }
    public string Description { get; set; }
    public virtual Shipment Shipment { get; set; }
}

