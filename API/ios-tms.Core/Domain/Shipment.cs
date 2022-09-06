using System;
namespace ios_tms.Core.Domain;

public class Shipment : EntityBase
{
    public string Bol { get; set; }
    public string Origin { get; set; }
    public string Destination { get; set; }
    public string Carrier { get; set; }
    public int Items { get; set; }
    public Decimal Weight { get; set; }
    public Decimal Rate { get; set; }
    //public int OriginId { get; set; }
    //public int DestinationId { get; set; }
    //public int CarrierId { get; set; }
    //public Decimal Rate { get; set; }
    //public Decimal Cost { get; set; }
    //public virtual Address Origin { get; set; }
    //public virtual Address Destination { get; set; }
    //public virtual Carrier Carrier { get; set; }
    //public virtual List<ShipmentItem> Items { get; set; }
}



