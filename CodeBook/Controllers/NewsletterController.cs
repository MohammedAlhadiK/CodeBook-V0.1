using CodeBook.Models;
using CodeBook.Models.Enums;
using CodeBook.Models.ViewModels;
using CodeBook.Resources;
using CodeBook.Services;
using System;
using System.Globalization;
using System.Web.Mvc;
using Umbraco.Web.Mvc;

namespace CodeBook.Controllers
{
    public class NewsletterController : SurfaceController
    {


        [HttpPost]
        public ActionResult SendSubscriptionForm(GenericVM<NewsLetterForm> SubscriberData)
        {
            NewsletterSubscription.Culture = new CultureInfo(SubscriberData.CurrentLanguage);
            string SuccessMessage = NewsletterSubscription.Message;

            try
            {
                if (ModelState.IsValid)
                {
                    CreateForm(SubscriberData);
                    SendEmail(SubscriberData);
                    SubscriberData.Status = Status.OK;
                    SubscriberData.Messages.Add(SuccessMessage);

                }
                else
                {
                    foreach (var value in ModelState.Values)
                    {
                        foreach (var item in value.Errors)
                        {
                            SubscriberData.Messages.Add(item.ErrorMessage);
                        }
                    }
                    SubscriberData.Status = Status.Fail;

                }

            }
            catch (Exception)
            {
                string Errormessage = Resources.ContactUs.ErrorMessage;
                SubscriberData.Status = Status.Fail;
                SubscriberData.Messages.Add(Errormessage);
            }

            return PartialView("~/Views/Partials/ServerResponse/_ServerResponse.cshtml", SubscriberData);
        }

        private void CreateForm(GenericVM<NewsLetterForm> genericVM)
        {
            //Creating Form
            var ContentService = Services.ContentService;
            Guid ParentID = Guid.Parse(genericVM.ParentID);
            var _Form = ContentService.Create(genericVM.Data.Email, ParentID, "eMail");

            _Form.SetValue("emailAddress", genericVM.Data.Email, genericVM.CurrentLanguage);
            _Form.SetCultureName(genericVM.Data.Email, genericVM.CurrentLanguage);
            ContentService.SaveAndPublish(_Form, genericVM.CurrentLanguage);

        }


        private void SendEmail(GenericVM<NewsLetterForm> genericVM)
        {
            //Sending Mail 
            var CodeBookMail = System.Web
                                     .Configuration
                                     .WebConfigurationManager
                                     .AppSettings["CodeBookMail"];
            EmailHandler emailHandler = new EmailHandler();

            NewsletterSubscription.Culture = new CultureInfo(genericVM.CurrentLanguage);
            string Subject = Resources.NewsletterSubscription.Subject;
            string Body = Resources.NewsletterSubscription.Message;

            emailHandler.Sender = CodeBookMail;
            emailHandler.Receiver = genericVM.Data.Email;
            emailHandler.Subject = Subject;
            emailHandler.Body = Body;
            emailHandler.SendEmail();

        }

    }
}
