using System;
using System.Collections.Generic;
using System.Linq;
using Umbraco.Core.Models;
using Umbraco.Core.Models.PublishedContent;
using Umbraco.Web;
using Umbraco.Web.Models;

namespace CodeBook.Services
{
    public class PropertyExceptionHandler
    {

        // Get Image URL
        /// <summary>
        /// Get the Image URL Or return # Grantee no exception thrown
        /// </summary>
        /// <param name="Element">The Element that has the Image</param>
        /// <param name="Property">The Image Property name</param>
        /// <returns>return The Image URL as string</returns>
        public string GetImageURL(IPublishedElement Element, string Property, string Value = "")
        {

            try
            {
                if (Element.HasValue(Property))
                {
                    Value = Element.Value<MediaWithCrops>(Property).Url();
                }
            }
            catch (Exception) { }
            return Value;
        }

        // Get Link URL
        /// <summary>
        /// Get the Link URL Or return # Grantee no exception thrown
        /// </summary>
        /// <param name="Element">The Element that has the Link</param>
        /// <param name="Property">The Link Property name</param>
        /// <returns>return The Link URL as string</returns>
        public Link GetLink(IPublishedElement Element, string Property, string ItemLinkUrl = "#", string Target = "_self")
        {
            var ItemLink = new Link();
            ItemLink.Url = ItemLinkUrl;
            ItemLink.Target = Target;

            try
            {
                if (Element.HasValue(Property) && Element.Value<Link>(Property) != null)
                {
                    ItemLink = Element.Value<Link>(Property);
                }

            }
            catch (Exception) { }
            return ItemLink;
        }
        // Get Multi URL 
        /// <summary>
        /// Get the Multi URL Or return # Grantee no exception thrown
        /// </summary>
        /// <param name="Element">The Element that has the Links Array</param>
        /// <param name="Property">The Multi URL Property name</param>
        /// <returns>return The Multi URL as Array of Links</returns>
        public Link[] GetLinkArray(IPublishedElement Element, string Property, string ItemLinkUrl = "#", string Target = "_self")
        {
            Link[] Links = { };
            try
            {
                var ItemLink = new Link();
                ItemLink.Url = ItemLinkUrl;
                ItemLink.Target = Target;
                Links = Element.Value<IEnumerable<Link>>(Property).ToArray();
                if (Element.HasValue(Property) && Links != null)
                {
                    for (int i = 0; i < Links.Length; i++)
                    {
                        if (Links[i] == null)
                        {
                            Links[i] = ItemLink;
                        }
                        else
                        {
                            if (Links[i].Url == null)
                            {
                                Links[i].Url = ItemLinkUrl;

                            }
                            if (Links[i].Target == null)
                            {
                                Links[i].Target = Target;

                            }
                        }
                    }
                }
            }
            catch (Exception) { }
            return Links;
        }

        // Get Text Value
        /// <summary>
        /// Get the Value of the string Or return empty string Grantee no exception thrown
        /// </summary>
        /// <param name="Element">The Element that has the Text</param>
        /// <param name="Property">The Text Property name</param>
        /// <returns>return The Text or Empty string</returns>
        public string GetTextValue(IPublishedElement Element, string Property)
        {
            string Value = "";
            try
            {
                if (Element.HasValue(Property))
                {
                    Value = Element.Value<string>(Property);
                }
            }
            catch (Exception) { }
            return Value;
        }

        // Get Date Value
        /// <summary>
        /// Get the Value of the string Or return empty string Grantee no exception thrown
        /// </summary>
        /// <param name="Element">The Element that has the Text</param>
        /// <param name="Property">The Text Property name</param>
        /// <returns>return The Text or Empty string</returns>
        public DateTime GetDateValue(IPublishedElement Element, string Property)
        {

            //string Value = "";
            DateTime Value = new DateTime();
            try
            {
                if (Element.HasValue(Property))
                {
                    Value = Element.Value<DateTime>(Property);
                }
            }
            catch (Exception) { }
            return Value;
        }

        // Get Elements Array
        /// <summary>
        /// Get Array of the IPublishedElement Or return empty one Grantee no exception thrown
        /// </summary>
        /// <param name="Element">The Element that has the Array</param>
        /// <param name="Property">The List/Array Property name</param>
        /// <returns>return The Array of IPublishedElement</returns>
        public IPublishedElement[] GetElementsArray(IPublishedElement Element, string Property)
        {
            IPublishedElement[] Elements = { };
            try
            {
                if (Element.HasValue(Property))
                {
                    Elements = Element.Value<IEnumerable<IPublishedElement>>(Property).ToArray();
                }
            }
            catch (Exception) { }
            return Elements;
        }
        // Get Elements Array
        /// <summary>
        /// Get Array of the IPublishedElement Or return empty one Grantee no exception thrown
        /// </summary>
        /// <param name="Element">The Element that has the Array</param>
        /// <param name="Property">The List/Array Property name</param>
        /// <returns>return The Array of IPublishedElement</returns>
        public IPublishedContent[] GetPublishContentArray(IPublishedContent PublishedContent, string Property)
        {
            IPublishedContent[] ContentArray = { };
            try
            {
                if (PublishedContent.HasValue(Property))
                {
                    ContentArray = PublishedContent.Value<IEnumerable<IPublishedContent>>(Property).ToArray();
                }
            }
            catch (Exception) { }
            return ContentArray;
        }

    }
}