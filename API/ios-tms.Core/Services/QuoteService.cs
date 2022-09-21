using Bogus;
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
            
            Enumerable.Range(1, 10).ToList().ForEach(i =>
            {
                var newQuote = quoteFaker.Generate();
                var rateFaker = FakerQuoteHelper.GetRateConfig(newQuote.Id, newQuote.PickupDate);
                newQuote.QuoteRates = rateFaker.Generate(new Faker().Random.Int(1, 8));

                _quotes.Add(newQuote);
            });
        }
    }

    public List<Quote> GetQuotesAsync()
    {
        return _quotes;
    }

    public Quote GetDetailsAsync(int quoteId)
    {
        return _quotes.FirstOrDefault(q => q.Id == quoteId);
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
        quote.Id = FakerQuoteHelper.NextId();
        quote.QuoteRates = new List<QuoteRate>();

        var rateFaker = FakerQuoteHelper.GetRateConfig(quote.Id, quote.PickupDate);
       
        Enumerable.Range(1, new Faker().Random.Int(1, 6)).ToList().ForEach(i =>
        {
            quote.QuoteRates.Add(rateFaker.Generate());
        });

        _quotes.Add(quote);

        return quote;
    }
}

