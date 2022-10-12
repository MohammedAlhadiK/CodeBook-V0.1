using CodeBook.Models;
using CodeBook.Models.Enums;
using CodeBook.Models.ViewModels;
using CodeBook.Services;
using System;
using System.Globalization;
using System.Web.Mvc;
using Umbraco.Web.Mvc;


namespace CodeBook.Controllers
{
    public class ContactUSController : SurfaceController
    {


        [HttpPost]
        public ActionResult SendContactUsForm(GenericVM<ContactUs> VisitorData)
        {


            try
            {
                Resources.ContactUs.Culture = new CultureInfo(VisitorData.CurrentLanguage);
                string SuccessMessage = Resources.ContactUs.SuccessMessage;
                if (ModelState.IsValid)
                {
                    CreateForm(VisitorData);
                    SendEmail(VisitorData);
                    VisitorData.Status = Status.OK;
                    VisitorData.Messages.Add(SuccessMessage);

                }
                else
                {
                    foreach (var value in ModelState.Values)
                    {
                        foreach (var item in value.Errors)
                        {
                            VisitorData.Messages.Add(item.ErrorMessage);
                        }
                    }
                    VisitorData.Status = Status.Fail;

                }

            }
            catch (Exception)
            {
                string Errormessage = Resources.ContactUs.ErrorMessage;
                VisitorData.Status = Status.Fail;
                VisitorData.Messages.Add(Errormessage);
            }

            return PartialView("~/Views/Partials/ServerResponse/_ServerResponse.cshtml", VisitorData);
        }

        private void CreateForm(GenericVM<ContactUs> genericVM)
        {
            //Creating Form
            var ContentService = Services.ContentService;
            Guid ParentID = Guid.Parse(genericVM.ParentID);
            var _Form = ContentService.Create(genericVM.Data.Name, ParentID, "visitorForm");
            _Form.SetValue("visitorname", genericVM.Data.Name, genericVM.CurrentLanguage);
            _Form.SetValue("email", genericVM.Data.Email, genericVM.CurrentLanguage);
            _Form.SetValue("subject", genericVM.Data.Subject, genericVM.CurrentLanguage);
            _Form.SetValue("message", genericVM.Data.Message, genericVM.CurrentLanguage);
            _Form.SetCultureName(genericVM.Data.Name, genericVM.CurrentLanguage);
            ContentService.SaveAndPublish(_Form, genericVM.CurrentLanguage);

        }


        private void SendEmail(GenericVM<ContactUs> genericVM)
        {
            //Sending Mail 
            var CodeBookMail = System.Web
                                     .Configuration
                                     .WebConfigurationManager
                                     .AppSettings["CodeBookMail"];
            EmailHandler emailHandler = new EmailHandler();

            emailHandler.Sender = CodeBookMail;
            emailHandler.Receiver = CodeBookMail;
            emailHandler.Subject = genericVM.Data.Subject;
            emailHandler.Body = genericVM.Data.Message;
            emailHandler.SendEmail();

        }

    }
}
