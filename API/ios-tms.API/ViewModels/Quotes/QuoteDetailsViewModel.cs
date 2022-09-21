using System;
using iOS_TMS.API.ViewModels.Quotes;
using iOS_TMS.Core.Domain;

namespace ios_tms.API.ViewModels.Quotes;

public class QuoteDetailsViewModel
{

    public int Id { get; set; }
    public string Origin { get; set; }
    public string Destination { get; set; }
    public int Items { get; set; }
    public decimal Weight { get; set; }
    public string WeightFormatted => Weight.ToString("0.00");
    public DateTime PickupDate { get; set; }
    public string PickupDateFormatted => PickupDate.ToString("MM/dd/yyyy");
    public List<QuoteRateViewModel> Rates { get; set; }

    public static QuoteDetailsViewModel From(Quote quote)
    {
        return new QuoteDetailsViewModel
        {
            Id = quote.Id,
            Origin = quote.Origin,
            Destination = quote.Destination,
            Items = quote.Items,
            Weight = quote.Weight,
            PickupDate = quote.PickupDate,
            Rates = quote.QuoteRates.Select(QuoteRateViewModel.From).ToList()
        };
    }

}

