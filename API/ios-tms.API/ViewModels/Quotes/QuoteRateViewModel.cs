using iOS_TMS.Core.Domain;

namespace iOS_TMS.API.ViewModels.Quotes;

public class QuoteRateViewModel
{
    public int Id { get; set; }
    public int QuoteId { get; set; }
    public string Carrier { get; set; }
    public decimal Rate { get; set; }
    public string RateFormatted => Rate.ToString("0.00");
    public decimal Cost { get; set; }
    public string CostFormatted => Cost.ToString("0.00");
    public DateTime PickupDate { get; set; }
    public string PickupDateFormatted => PickupDate.ToString("MM/dd/yyyy");
    public DateTime EstDeliveryDate { get; set; }
    public string EstDeliveryDateFormatted => EstDeliveryDate.ToString("MM/dd/yyyy");

    public static QuoteRateViewModel From(QuoteRate quoteRate)
    {
        return new QuoteRateViewModel
        {
            Id = quoteRate.Id,
            QuoteId = quoteRate.QuoteId,
            Carrier = quoteRate.Carrier,
            Rate = quoteRate.Rate,
            Cost = quoteRate.Cost,
            PickupDate = quoteRate.PickupDate,
            EstDeliveryDate = quoteRate.EstDeliveryDate
        };
    }
}

