using iOS_TMS.API.ViewModels.Shipments;
using iOS_TMS.Core.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace iOS_TMS.API.Controllers;

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

    [HttpGet("All")]
    public IActionResult Get()
    {
        var shipments = _service.GetShipmentsAsync()
            .OrderByDescending(c => c.Bol)
            .ToList();

        var vms = shipments.Select(ShipmentIndexItemViewModel.From).ToList();

        return Ok(vms);
    }

    [HttpGet("OpenCount")]
    public IActionResult GetOpenCount()
    {
        var count = _service.GetOpenShipmentCountAsync();

        return Ok(count);
    }

    [HttpPost("Create")]
    public IActionResult Create(CreateShipmentViewModel viewModel)
    {
        var newShipment = _service.CreateAsync(viewModel.ToModel());
        return Ok(newShipment);
    }
}

