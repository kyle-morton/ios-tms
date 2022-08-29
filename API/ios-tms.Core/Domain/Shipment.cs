using System;
namespace ios_tms.Core.Domain;

public class Shipment : EntityBase
{
    public int OriginId { get; set; }
    public int DestinationId { get; set; }
    public virtual Address Origin { get; set; }
    public virtual Address Destination { get; set; }
    public virtual List<ShipmentItem> Items { get; set; }
}



