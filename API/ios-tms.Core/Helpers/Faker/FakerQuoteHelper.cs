using Bogus;
using iOS_TMS.Core.Domain;
using iOS_TMS.Core.Services;

namespace ios_tms.Core.Helpers;

public class FakerQuoteHelper
{
    private static int _idSeed = 1;
    private static int _rateIdSeed = 1;

    public static int NextId() => _idSeed++;
    public static int NextRateId() => _rateIdSeed++;

    public static Faker<Quote> GetConfig()
    {
        return new Faker<Quote>()
                .RuleFor(s => s.Id, f => NextId())
                .RuleFor(s => s.Origin, f => $"{f.Address.City()}, {f.Address.StateAbbr()}")
                .RuleFor(s => s.Destination, f => $"{f.Address.City()}, {f.Address.StateAbbr()}")
                .RuleFor(s => s.Items, f => f.Random.Number(1, 10))
                .RuleFor(s => s.Weight, f => f.Random.Number(500, 10000))
                .RuleFor(s => s.IsDeleted, f => f.Random.Bool())
                .RuleFor(s => s.QuoteRates, f => GetRateConfig().Generate(f.Random.Int(1, 5)));
    }

    public static Faker<QuoteRate> GetRateConfig(int quoteId = 0)
    {
        var carrierNames = CarrierService.GetCarrierList().Select(c => c.Name).ToList();

        return new Faker<QuoteRate>()
            .RuleFor(s => s.Id, f => NextRateId())
            .RuleFor(s => s.QuoteId, f => quoteId > 0 ? quoteId : 0)
            .RuleFor(s => s.Carrier, f => f.PickRandom(carrierNames))
            .RuleFor(s => s.Rate, f => f.Random.Decimal(100.00m, 2000.00m))
            .RuleFor(s => s.Cost, f => f.Random.Decimal(50.00m, 99.99m));
    }
}

