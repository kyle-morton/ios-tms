using ios_tms.Core.Domain;

namespace ios_tms.Core.Services.Interfaces;

public interface IShipmentService
{
    List<Shipment> GetShipmentsAsync();
    int GetOpenShipmentCountAsync();
    Shipment CreateAsync(Shipment shipment);
}

