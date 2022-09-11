using System.ComponentModel.DataAnnotations;

namespace ios_tms.Core.Domain;

public enum QuoteStatus
{
    [Display(Name = "Created")]
    Created = 1,
    [Display(Name = "Awarded")]
    Awarded = 2,
    [Display(Name = "Deleted")]
    Deleted = 3
}