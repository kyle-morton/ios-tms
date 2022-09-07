using ios_tms.API.ViewModels.Shipments;
using ios_tms.Core.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace ios_tms.API.Controllers;

[ApiController]
[Route("[controller]")]
public class ShipmentsController : ControllerBase
{

    private readonly ILogger<ShipmentsController> _logger;
    private readonly IShipmentService _service;

    public ShipmentsController(ILogger<ShipmentsController> logger, IShipmentService service)
    {
        _logger = logger;
        _service = service;
    }

    [HttpGet]
    public IActionResult Get()
    {
        var shipments = _service.GetShipmentsAsync()
            .OrderByDescending(c => c.Bol)
            .ToList();

        var vms = shipments.Select(ShipmentIndexItemViewModel.From).ToList();

        return Ok(vms);
    }

    [HttpPost]
    public IActionResult Create(CreateShipmentViewModel viewModel)
    {
        var newShipment = _service.CreateAsync(viewModel.ToModel());
        return Ok(newShipment);
    }
}

