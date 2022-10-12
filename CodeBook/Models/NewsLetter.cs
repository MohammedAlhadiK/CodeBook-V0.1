using System.ComponentModel.DataAnnotations;


namespace CodeBook.Models
{
    public class NewsLetterForm
    {
        [Display(ResourceType = typeof(Resources.ContactUs), Name = "Email")]
        [MaxLength(100, ErrorMessageResourceName = "MaxEmail", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        [MinLength(3, ErrorMessageResourceName = "MinEmail", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        [Required(ErrorMessageResourceName = "RequiredEmail", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        [RegularExpression(@"^[\w!#$%&'*+\-/=?\^_`{|}~]+(\.[\w!#$%&'*+\-/=?\^_`{|}~]+)*" + "@" + @"((([\-\w]+\.)+[a-zA-Z]{2,4})|(([0-9]{1,3}\.){3}[0-9]{1,3}))$", ErrorMessageResourceName = "EmailRegex", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        public string Email { get; set; }
    }

}