using iOS_TMS.Core.Domain;

namespace iOS_TMS.Core.Services.Interfaces;

public interface IQuoteService
{
    List<Quote> GetQuotesAsync();
    List<QuoteRate> GetQuoteRatesAsync(int quoteId);
    int GetQuotesCountAsync();
    Quote CreateAsync(Quote quote);
}

