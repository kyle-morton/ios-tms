using System;
using ios_tms.Core.Domain;

namespace ios_tms.API.ViewModels.Carriers;

public class CarrierViewModel
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Scac { get; set; }

    public static CarrierViewModel From(Carrier carrier)
    {
        return new CarrierViewModel
        {
            Id = carrier.Id,
            Name = carrier.Name,
            Scac = carrier.Scac
        };
    }
}

