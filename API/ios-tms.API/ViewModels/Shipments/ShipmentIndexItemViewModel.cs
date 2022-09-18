using Humanizer;
using iOS_TMS.Core.Domain;

namespace iOS_TMS.API.ViewModels.Shipments;

public class ShipmentIndexItemViewModel
{
    public int Id { get; set; }
    public string BOL {get;set;}
    public string Origin { get; set; }
    public string Destination { get; set; }
    public string Carrier { get; set; }
    public int Items { get; set; }
    public Decimal Weight { get; set; }
    public string WeightFormatted => Weight.ToString("0.00");
    public Decimal Rate { get; set; }
    public string RateFormatted => Rate.ToString("0.00");
    public bool IsPaid { get; set; }
    public ShipmentStatus StatusTypeId { get; set; }
    public string StatusHumanized => StatusTypeId.Humanize();

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
            Rate = shipment.Rate,
            IsPaid = shipment.IsPaid,
            StatusTypeId = shipment.StatusTypeId
        };
    }

}

