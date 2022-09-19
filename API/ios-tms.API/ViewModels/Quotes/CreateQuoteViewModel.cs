using iOS_TMS.Core.Domain;

namespace ios_tms.API.ViewModels.Quotes;

public class CreateQuoteViewModel
{
    public string Origin { get; set; }
    public string Destination { get; set; }
    public int Items { get; set; }
    public decimal Weight { get; set; }

    public Quote ToModel()
    {
        return new Quote
        {
            Origin = Origin,
            Destination = Destination,
            Items = Items,
            Weight = Weight
        };
    }

}

