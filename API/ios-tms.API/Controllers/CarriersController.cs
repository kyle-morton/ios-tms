using Bogus;
using iOS_TMS.API.ViewModels.Carriers;
using iOS_TMS.Core.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace iOS_TMS.API.Controllers;

[ApiController]
[Route("[controller]")]
public class CarriersController : ControllerBase
{

    private readonly ILogger<CarriersController> _logger;
    private readonly ICarrierService _carrierService;

    public CarriersController(ILogger<CarriersController> logger, ICarrierService carrierService)
    {
        _logger = logger;
        _carrierService = carrierService;
    }

    [HttpGet]
    public IActionResult Get()
    {
        //return Enumerable.Range(1, 5).Select(index => new CarrierViewModel
        //{
        //    Id = Random.Shared.Next(1, 25)
        //    Name = 
        //    Date = DateTime.Now.AddDays(index),
        //    TemperatureC = Random.Shared.Next(-20, 55),
        //    Summary = Summaries[Random.Shared.Next(Summaries.Length)]
        //})
        //.ToArray();

        var carriers = _carrierService.GetCarriersAsync()
            .OrderBy(c => c.Name)
            .ToList();

        return Ok(carriers.Select(CarrierViewModel.From).ToList());
    }
}

