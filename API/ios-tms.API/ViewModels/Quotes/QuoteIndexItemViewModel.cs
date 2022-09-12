using Humanizer;
using iOS_TMS.Core.Domain;

namespace iOS_TMS.API.ViewModels.Quotes;

public class QuoteIndexItemViewModel
{
    public int Id { get; set; }
    public string Origin { get; set; }
    public string Destination { get; set; }
    public int Items { get; set; }
    public decimal Weight { get; set; }
    public decimal LowestRate { get; set; }
    public string LowestRateFormatted => LowestRate.ToString("0.00");
    public decimal HighestRate { get; set; }
    public string HighestRateFormatted => HighestRate.ToString("0.00");
    public int RateCount { get; set; }

    public static QuoteIndexItemViewModel From(Quote quote)
    {
        return new QuoteIndexItemViewModel
        {
            Id  = quote.Id,
            Origin = quote.Origin,
            Destination = quote.Destination,
            Items = quote.Items,
            Weight = quote.Weight,
            LowestRate = quote.QuoteRates.Select(r => r.Rate).Min(),
            HighestRate = quote.QuoteRates.Select(r => r.Rate).Max(),
            RateCount = quote.QuoteRates.Count
        };
    }
}

