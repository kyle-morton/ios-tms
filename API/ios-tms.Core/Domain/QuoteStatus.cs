using System.ComponentModel.DataAnnotations;

namespace iOS_TMS.Core.Domain;

public enum QuoteStatus
{
    [Display(Name = "Created")]
    Created = 1,
    [Display(Name = "Awarded")]
    Awarded = 2,
    [Display(Name = "Deleted")]
    Deleted = 3
}