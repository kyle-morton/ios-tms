using ios_tms.Core.Domain;

namespace ios_tms.Core.Services.Interfaces;

public interface IQuoteService
{
    List<Quote> GetQuotesAsync();
    int GetQuotesCountAsync();
    Quote CreateAsync(Quote quote);
}

