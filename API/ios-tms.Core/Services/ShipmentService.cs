using System;
using ios_tms.Core.Domain;
using ios_tms.Core.Services.Interfaces;

namespace ios_tms.Core.Services;

public class ShipmentService : IShipmentService
{
    private static List<Shipment> _shipments = new List<Shipment>
    {
        new Shipment
        {
            Id = 1,
            Bol = "601000123",
            Origin = "Memphis, TN",
            Destination = "Little Rock, AR",
            Carrier = "AAA Cooper - AACT",
            Items = 5,
            Weight = 1332,
            Rate = 242
        },
        new Shipment
        {
            Id = 2,
            Bol = "601000155",
            Origin = "Phoenix, AZ",
            Destination = "Salt Lake City, UT",
            Carrier = "PITT Ohio - PITD",
            Items = 10,
            Weight = 2321,
            Rate = 431
        },
        new Shipment
        {
            Id = 3,
            Bol = "601000199",
            Origin = "Kansas City, MO",
            Destination = "New York City, NY",
            Carrier = "AAA Cooper - AACT",
            Items = 2,
            Weight = 5000,
            Rate = 1550
        },
        new Shipment
        {
            Id = 4,
            Bol = "601000240",
            Origin = "Little Rock, AR",
            Destination = "Baltimore, MD",
            Carrier = "R&L Carriers - RLCA",
            Items = 10,
            Weight = 3200,
            Rate = 642
        }
    };


    public ShipmentService()
    {
    }

    public List<Shipment> GetShipmentsAsync()
    {
        return _shipments;
    }
}

