using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.IO;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

//namespace Net.YSolution.Medical.Security
namespace CodeBook.Services
{
    public partial class ApiClient
    {

        private readonly HttpClient httpClient;
        private Uri BaseEndpoint { get; set; }

        public ApiClient(Uri baseEndpoint)
        {
            if (baseEndpoint == null)
            {
                throw new ArgumentNullException("baseEndpoint");
            }
            BaseEndpoint = baseEndpoint;
            httpClient = new HttpClient();
        }

        /// <summary>  
        /// Common method for making GET calls  
        /// </summary>  
        public async Task<T> GetAsync<T>(string relativePath = "", string queryString = "")
        {

            var response = await httpClient.GetAsync(CreateRequestUri(relativePath, queryString), HttpCompletionOption.ResponseHeadersRead);
            response.EnsureSuccessStatusCode();
            var data = await response.Content.ReadAsStringAsync();
            return JsonConvert.DeserializeObject<T>(data);
        }

        /// <summary>  
        /// Common method for making POST calls  
        /// </summary>  
        public async Task<string> PostAsync<T>(T content)
        {

            var response = await httpClient.PostAsync(BaseEndpoint.ToString(), CreateHttpContent<T>(content));
            response.EnsureSuccessStatusCode();
            var data = await response.Content.ReadAsStringAsync();
            return data;
        }


        private Uri CreateRequestUri(string relativePath = "", string queryString = "")
        {
            var endpoint = new Uri(BaseEndpoint, relativePath);
            var uriBuilder = new UriBuilder(endpoint);
            uriBuilder.Query = queryString;
            return uriBuilder.Uri;
        }
        DefaultContractResolver contractResolver = new DefaultContractResolver
        {
            NamingStrategy = new CamelCaseNamingStrategy()
        };
        private HttpContent CreateHttpContent<T>(T content)
        {
            var json = JsonConvert.SerializeObject(content, new JsonSerializerSettings
            {
                ContractResolver = contractResolver,
                Formatting = Formatting.Indented
            });
            return new StringContent(json, Encoding.UTF8, "application/json");
        }

        private static JsonSerializerSettings MicrosoftDateFormatSettings
        {
            get
            {
                return new JsonSerializerSettings
                {
                    DateFormatHandling = DateFormatHandling.MicrosoftDateFormat
                };
            }
        }

        public void addHeaders(string key, string value)
        {
            httpClient.DefaultRequestHeaders.Remove(key);
            httpClient.DefaultRequestHeaders.Add(key, value);
        }

        public async Task<Stream> GetStreamAsync<T>(string relativePath = "", string queryString = "")
        {

            var response = await httpClient.GetAsync(CreateRequestUri(relativePath, queryString), HttpCompletionOption.ResponseHeadersRead);
            response.EnsureSuccessStatusCode();
            var data = await response.Content.ReadAsStreamAsync();
            return data;
        }
    }
}
