using iOS_TMS.API.ViewModels.Quotes;
using iOS_TMS.Core.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace iOS_TMS.API.Controllers;

[ApiController]
[Route("[controller]")]
public class QuotesController : ControllerBase
{

    private readonly ILogger<QuotesController> _logger;
    private readonly IQuoteService _service;

    public QuotesController(ILogger<QuotesController> logger, IQuoteService service)
    {
        _logger = logger;
        _service = service;
    }

    [HttpGet("All")]
    public IActionResult Get()
    {
        var quotes = _service.GetQuotesAsync()
            .OrderByDescending(c => c.Id)
            .ToList();

        var vms = quotes.Select(QuoteIndexItemViewModel.From).ToList();

        return Ok(vms);
    }

    [HttpGet("Count")]
    public IActionResult GetOpenCount()
    {
        var count = _service.GetQuotesCountAsync();

        return Ok(count);
    }

    [HttpGet("Rates")]
    public IActionResult GetRates(int quoteId)
    {
        var rates = _service.GetQuoteRatesAsync(quoteId)
            .OrderByDescending(c => c.Id)
            .ToList();

        var vms = rates.Select(QuoteRateViewModel.From).ToList();

        return Ok(vms);
    }

    //[HttpGet("OpenCount")]
    //public IActionResult GetOpenCount()
    //{
    //    var count = _service.GetOpenShipmentCountAsync();

    //    return Ok(count);
    //}

    //[HttpPost("Create")]
    //public IActionResult Create(CreateShipmentViewModel viewModel)
    //{
    //    var newShipment = _service.CreateAsync(viewModel.ToModel());
    //    return Ok(newShipment);
    //}
}

