using ios_tms.Core.Domain;

namespace ios_tms.API.ViewModels.Shipments;

public class ShipmentIndexItemViewModel
{
    public int Id { get; set; }
    public string BOL {get;set;}
    public string Origin { get; set; }
    public string Destination { get; set; }
    public string Carrier { get; set; }
    public int Items { get; set; }
    public Decimal Weight { get; set; }
    public Decimal Rate { get; set; }

    public static ShipmentIndexItemViewModel From(Shipment shipment)
    {
        return new ShipmentIndexItemViewModel
        {
            Id = shipment.Id,
            BOL = shipment.Bol,
            Origin = shipment.Origin,
            Destination = shipment.Destination,
            Carrier = shipment.Carrier,
            Items = shipment.Items,
            Weight = shipment.Weight,
            Rate = shipment.Rate
        };
    }

}

