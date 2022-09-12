using iOS_TMS.Core.Domain;
using iOS_TMS.Core.Services.Interfaces;

namespace iOS_TMS.Core.Services;

public class CarrierService : ICarrierService
{
    private static List<Carrier> _carriers = new List<Carrier>
    {
        new Carrier
        {
            Id = 1,
            Name = "AAA Cooper",
            Scac = "AACT"
        },
        new Carrier
        {
            Id = 2,
            Name = "R&L Carriers",
            Scac = "RLCA"
        },
        new Carrier
        {
            Id = 3,
            Name = "Pitt Ohio",
            Scac = "PITD"
        },
        new Carrier
        {
            Id = 4,
            Name = "FedEx",
            Scac = "FXFE"
        }
    };

    public CarrierService()
    {
        //var carrierIds = 1;
        //var testOrders = new Faker<Carrier>()
        //    .RuleFor(c => c.Id, f => carrierIds++);
            //Pick some fruit from a basket
            //.RuleFor(o => o.Item, f => f.PickRandom(fruit))
            //A random quantity from 1 to 10
            //.RuleFor(o => o.Quantity, f => f.Random.Number(1, 10))
            //A nullable int? with 80% probability of being null.
            //The .OrNull extension is in the Bogus.Extensions namespace.
            //.RuleFor(o => o.LotNumber, f => f.Random.Int(0, 100).OrNull(f, .8f));

    }

    public List<Carrier> GetCarriersAsync()
    {
        return _carriers;
    }

    public static List<Carrier> GetCarrierList()
    {
        return _carriers;
    }
}

