using System;
using Bogus;
using iOS_TMS.Core.Domain;
using iOS_TMS.Core.Helpers;
using iOS_TMS.Core.Services.Interfaces;

namespace iOS_TMS.Core.Services;

public class ShipmentService : IShipmentService
{
    private static List<Shipment> _shipments;

    public ShipmentService()
    {
        if (_shipments == null)
        {
            _shipments = new List<Shipment>();

            var carrierNames = CarrierService.GetCarrierList().Select(c => c.Name).ToList();
            var shipmentFaker = FakerShipmentHelper.GetConfig();

            Enumerable.Range(1, 6).ToList().ForEach(i =>
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
        shipment.Id = FakerShipmentHelper.NextId();
        shipment.Bol = FakerShipmentHelper.NextBOL();
        shipment.Rate = new Faker().Random.Decimal(100.00m, 2000.00m);
        _shipments.Add(shipment);

        return shipment;
    }
}

