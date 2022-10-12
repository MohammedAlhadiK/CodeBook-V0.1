using System.Net.Mail;

namespace CodeBook.Services
{
    public class EmailHandler
    {
        public string Sender { get; set; }
        public string Receiver { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }


        public void SendEmail()
        {
            MailMessage _message = new MailMessage();
            SmtpClient _client = new SmtpClient();

            _message.From = new MailAddress(Sender);
            _message.To.Add(new MailAddress(Receiver));
            _message.Subject = Subject;
            _message.Body = Body;
            _client.Send(_message);

        }


    }
}