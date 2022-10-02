using iOS_TMS.Core.Domain;

namespace ios_tms.API.ViewModels.Quotes;

public class CreateQuoteViewModel
{
    public string Origin { get; set; }
    public string Destination { get; set; }
    public int Items { get; set; }
    public decimal Weight { get; set; }
    public string PickupDate { get; set; }

    public Quote ToModel()
    {
        var pickupDateFound = DateTime.TryParse(PickupDate, out var parsedDate);

        return new Quote
        {
            Origin = Origin,
            Destination = Destination,
            Items = Items,
            Weight = Weight,
            PickupDate = pickupDateFound ? parsedDate : DateTime.Now.Date
        };
    }

}

