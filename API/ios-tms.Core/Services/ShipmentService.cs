using System;
using Bogus;
using ios_tms.Core.Domain;
using ios_tms.Core.Helpers;
using ios_tms.Core.Services.Interfaces;

namespace ios_tms.Core.Services;

public class ShipmentService : IShipmentService
{
    private static List<Shipment> _shipments;

    public ShipmentService()
    {
        if (_shipments == null)
        {
            _shipments = new List<Shipment>();

            var carrierNames = CarrierService.GetCarrierList().Select(c => c.Name).ToList();
            var shipmentFaker = BogusHelper.GetShipmentConfig();

            Enumerable.Range(1, 3).ToList().ForEach(i =>
            {
                _shipments.Add(shipmentFaker.Generate());
            });
        }
    }

    public List<Shipment> GetShipmentsAsync()
    {
        return _shipments;
    }

    public int GetOpenShipmentCountAsync()
    {
        var allowedShipments = new List<ShipmentStatus>
        {
            ShipmentStatus.Pending,
            ShipmentStatus.Dispatched,
            ShipmentStatus.InTransit
        };

        return _shipments
            .Count(s => allowedShipments.Contains(s.StatusTypeId));
    }

    public Shipment CreateAsync(Shipment shipment)
    {
        shipment.Id = BogusHelper.NextShipmentId();
        shipment.Bol = BogusHelper.NextBOL();
        shipment.Rate = new Faker().Random.Decimal(100.00m, 2000.00m);
        _shipments.Add(shipment);

        return shipment;
    }
}

