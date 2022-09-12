using System;
using Bogus;
using iOS_TMS.Core.Domain;
using iOS_TMS.Core.Services;

namespace iOS_TMS.Core.Helpers;

public static class FakerShipmentHelper
{
    private static int _idSeed = 1;
    private static Int32 _bolSeed = 601000123;
    private static List<ShipmentStatus> _statusTypes = new List<ShipmentStatus>
    {
        ShipmentStatus.Pending,
        ShipmentStatus.Dispatched,
        ShipmentStatus.InTransit,
        ShipmentStatus.Delivered,
        ShipmentStatus.Cancelled
    };

    public static Faker<Shipment> GetConfig()
    {
        var carrierNames = CarrierService.GetCarrierList().Select(c => c.Name).ToList();

        return new Faker<Shipment>()
                .RuleFor(s => s.Id, f => NextId())
                .RuleFor(s => s.Bol, f => NextBOL())
                .RuleFor(s => s.Origin, f => $"{f.Address.City()}, {f.Address.StateAbbr()}")
                .RuleFor(s => s.Destination, f => $"{f.Address.City()}, {f.Address.StateAbbr()}")
                .RuleFor(s => s.Carrier, f => f.PickRandom(carrierNames))
                .RuleFor(s => s.Items, f => f.Random.Number(1, 10))
                .RuleFor(s => s.Weight, f => f.Random.Number(500, 10000))
                .RuleFor(s => s.Rate, f => f.Random.Decimal(100.00m, 2000.00m))
                .RuleFor(s => s.IsPaid, f => f.Random.Bool())
                .RuleFor(s => s.StatusTypeId, f => f.PickRandom(_statusTypes));
    }

    public static int NextId() => _idSeed++;

    public static string NextBOL() => _bolSeed++.ToString();
  
}