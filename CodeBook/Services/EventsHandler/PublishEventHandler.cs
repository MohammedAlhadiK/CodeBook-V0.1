using Umbraco.Core;
using Umbraco.Core.Composing;
using Umbraco.Core.Events;
using Umbraco.Core.Services;
using Umbraco.Core.Services.Implement;

namespace CodeBook.Services
{

    [RuntimeLevel(MinLevel = RuntimeLevel.Run)]
    public class SubscribeToPublishEventComposer : ComponentComposer<SubscribeToPublishEventComponent>
    { }

    public class SubscribeToPublishEventComponent : IComponent
    {
        public void Initialize()
        {
            ContentService.Publishing += ContentService_Publishing;
        }


        private void ContentService_Publishing(IContentService sender, ContentPublishingEventArgs e)
        {

            #region Commented Code form Documentation

            //var newsArticleTitle = node.GetValue<string>("newsTitle");

            //if (newsArticleTitle.Equals(newsArticleTitle.ToUpper()))
            //{
            //    // Stop putting news article titles in upper case, so cancel publish
            //    e.Cancel = true;

            //    // Explain why the publish event is canceled
            //    e.Messages.Add(new EventMessage("Corporate style guideline infringement", "Don't put the news article title in upper case, no need to shout!",EventMessageType.Error));
            //}
            #endregion
        }
        public void Terminate()
        {
            //unsubscribe during shutdown
            ContentService.Publishing -= ContentService_Publishing;
        }
    }
}