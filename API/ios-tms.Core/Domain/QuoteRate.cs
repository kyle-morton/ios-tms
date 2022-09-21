namespace iOS_TMS.Core.Domain;

public class QuoteRate : EntityBase
{
    public int QuoteId { get; set; }
    public string Carrier { get; set; }
    public DateTime PickupDate { get; set; }
    public DateTime EstDeliveryDate { get; set; }
    public decimal Rate { get; set; }
    public decimal Cost { get; set; }
}
