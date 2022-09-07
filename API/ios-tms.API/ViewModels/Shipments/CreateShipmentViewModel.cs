using System.ComponentModel.DataAnnotations;
using ios_tms.Core.Domain;

namespace ios_tms.API.ViewModels.Shipments;

public class CreateShipmentViewModel
{
    [Required]
    public string Origin { get; set; }
    [Required]
    public string Destination { get; set; }
    [Required]
    public string Carrier { get; set; }
    public int Items { get; set; }
    public Decimal Weight { get; set; }

    public Shipment ToModel()
    {
        return new Shipment
        {
            Origin = Origin,
            Destination = Destination,
            Carrier = Carrier,
            Items = Items,
            Weight = Weight
        };
    }
}

