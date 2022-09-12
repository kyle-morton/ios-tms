using ios_tms.Core.Helpers;
using iOS_TMS.Core.Domain;
using iOS_TMS.Core.Services.Interfaces;

namespace iOS_TMS.Core.Services;

public class QuoteService : IQuoteService
{
    private static List<Quote> _quotes;

    public QuoteService()
    {
        if (_quotes == null)
        {
            _quotes = new List<Quote>();

            var quoteFaker = FakerQuoteHelper.GetConfig();

            Enumerable.Range(1, 6).ToList().ForEach(i =>
            {
                _quotes.Add(quoteFaker.Generate());
            });
        }
    }

    public List<Quote> GetQuotesAsync()
    {
        return _quotes;
    }

    public List<QuoteRate> GetQuoteRatesAsync(int quoteId)
    {
        var quote = _quotes.FirstOrDefault(q => q.Id == quoteId);
        if (quote == null)
        {
            return null;
        }

        return quote.QuoteRates;
    }

    public int GetQuotesCountAsync()
    {
        return _quotes.Count;
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

