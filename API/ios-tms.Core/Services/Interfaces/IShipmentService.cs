using iOS_TMS.Core.Domain;

namespace iOS_TMS.Core.Services.Interfaces;

public interface IShipmentService
{
    List<Shipment> GetShipmentsAsync();
    int GetOpenShipmentCountAsync();
    Shipment CreateAsync(Shipment shipment);
}

