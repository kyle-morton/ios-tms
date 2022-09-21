using System;
namespace iOS_TMS.Core.Domain;

public class Quote : EntityBase
{
    public string Origin { get; set; }
    public string Destination { get; set; }
    public int Items { get; set; }
    public decimal Weight { get; set; }
    public DateTime PickupDate { get; set; }
    public bool IsDeleted { get; set; }

    public List<QuoteRate> QuoteRates { get; set; }
}

