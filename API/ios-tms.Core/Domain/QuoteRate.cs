using System;
namespace ios_tms.Core.Domain;

public class QuoteRate : EntityBase
{
    public int QuoteId { get; set; }
    public int CarrierId { get; set; }
    public Decimal Rate { get; set; }
    public Decimal Cost { get; set; }
}

