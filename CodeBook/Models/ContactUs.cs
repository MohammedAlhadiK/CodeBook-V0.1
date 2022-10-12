using System.ComponentModel.DataAnnotations;

namespace CodeBook.Models
{
    public class ContactUs
    {
        [Display(ResourceType = typeof(Resources.ContactUs), Name = "Name")]
        [MaxLength(100, ErrorMessageResourceName = "MaxName", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        [MinLength(3, ErrorMessageResourceName = "MinName", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        [Required(ErrorMessageResourceName = "RequiredName", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        [RegularExpression(@"^[a-zA-Z ]+$", ErrorMessageResourceName = "CharactersOnly", ErrorMessageResourceType = typeof(Resources.ContactUs))]

        public string Name { get; set; }

        [Display(ResourceType = typeof(Resources.ContactUs), Name = "Email")]
        [MaxLength(100, ErrorMessageResourceName = "MaxEmail", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        [MinLength(3, ErrorMessageResourceName = "MinEmail", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        [Required(ErrorMessageResourceName = "RequiredEmail", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        [RegularExpression(@"^[\w!#$%&'*+\-/=?\^_`{|}~]+(\.[\w!#$%&'*+\-/=?\^_`{|}~]+)*" + "@" + @"((([\-\w]+\.)+[a-zA-Z]{2,4})|(([0-9]{1,3}\.){3}[0-9]{1,3}))$", ErrorMessageResourceName = "EmailRegex", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        public string Email { get; set; }

        [Display(ResourceType = typeof(Resources.ContactUs), Name = "Subject")]
        [MaxLength(100, ErrorMessageResourceName = "MaxSubject", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        [MinLength(3, ErrorMessageResourceName = "MinSubject", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        [Required(ErrorMessageResourceName = "RequiredSubject", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        //[RegularExpression(@"^[a-zA-Z ]+$", ErrorMessageResourceName = "CharactersOnly", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        public string Subject { get; set; }

        [Display(ResourceType = typeof(Resources.ContactUs), Name = "Message")]
        [MaxLength(500, ErrorMessageResourceName = "MaxMessage", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        [MinLength(3, ErrorMessageResourceName = "MinMessage", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        [Required(ErrorMessageResourceName = "RequiredMessage", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        //[RegularExpression(@"^[a-zA-Z ]+$", ErrorMessageResourceName = "CharactersOnly", ErrorMessageResourceType = typeof(Resources.ContactUs))]
        public string Message { get; set; }

    }
}