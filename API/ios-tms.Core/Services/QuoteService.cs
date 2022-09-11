using System;
using Bogus;
using ios_tms.Core.Domain;
using ios_tms.Core.Helpers;
using ios_tms.Core.Services.Interfaces;

namespace ios_tms.Core.Services;

public class QuoteService : IQuoteService
{
    private static List<Quote> _quotes;

    public QuoteService()
    {
        if (_quotes == null)
        {
            _quotes = new List<Quote>();

            var carrierNames = CarrierService.GetCarrierList().Select(c => c.Name).ToList();
            var shipmentFaker = BogusHelper.GetShipmentConfig();

            //Enumerable.Range(1, 3).ToList().ForEach(i =>
            //{
            //    _quotes.Add(shipmentFaker.Generate());
            //});
        }
    }

    public List<Quote> GetQuotesAsync()
    {
        return _quotes;
    }

    public int GetQuotesCountAsync()
    {
        var allowedStatuses = new List<QuoteStatus>
        {
            QuoteStatus.Created,
            QuoteStatus.Awarded
        };

        return _quotes
            .Count(q => allowedStatuses.Contains(q.StatusTypeId));
    }

    public Quote CreateAsync(Quote quote)
    {
        //shipment.Id = BogusHelper.NextShipmentId();
        //shipment.Bol = BogusHelper.NextBOL();
        //shipment.Rate = new Faker().Random.Decimal(100.00m, 2000.00m);
        _quotes.Add(quote);

        return quote;
    }
}

