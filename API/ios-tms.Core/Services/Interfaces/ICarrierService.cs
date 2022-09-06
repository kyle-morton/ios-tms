using System;
using ios_tms.Core.Domain;

namespace ios_tms.Core.Services.Interfaces;

public interface ICarrierService
{
    public List<Carrier> GetCarriersAsync();
}

