using System;
namespace ios_tms.Core.Domain;

public class Quote : EntityBase
{
    public string Origin { get; set; }
    public string Destination { get; set; }
    public int Items { get; set; }
    public decimal Weight { get; set; }
    public QuoteStatus StatusTypeId { get; set; }

    public List<QuoteRate> QuoteRates { get; set; }
}

