using System;
using iOS_TMS.Core.Domain;

namespace iOS_TMS.Core.Services.Interfaces;

public interface ICarrierService
{
    public List<Carrier> GetCarriersAsync();
}

