using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using HtmlAgilityPack;
using RestSharp;

namespace OpenIdConnectLogin
{
    public class Program
    {
        public static async Task Main(string[] args)
        {
            Console.WriteLine("OpenIdConnectSpike");
            var app = new Application();
            await app.Run();
        }
    }

    class Application
    {
        private RestClient _restClient;
        public async Task<string> Run()
        {
            _restClient = new RestClient("http://localhost/auth/") {CookieContainer = new CookieContainer()};
            var proxy = new WebProxy("127.0.0.1", 8866);
            proxy.BypassProxyOnLocal = false;
            proxy.UseDefaultCredentials = false;
            //_restClient.Proxy = proxy;
            var html = InitialAuthRequest();
            var response = await PostLoginRequest(html, "demo", "Xaris,,404");
            return "";
        }

        private string InitialAuthRequest()
        {
            var request = new RestRequest("realms/oneomics/protocol/openid-connect/auth", Method.GET);
            request.Parameters.Add(new Parameter("User-Agent","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Postman/7.2.2 Chrome/59.0.3071.115 Electron/1.8.8 Safari/537.36",ParameterType.HttpHeader));
            request.Parameters.Add(new Parameter("Accept","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",ParameterType.HttpHeader));
            
            //request.Parameters.Add(new Parameter("state","",ParameterType.GetOrPost));
            request.Parameters.Add(new Parameter("client_id","api",ParameterType.GetOrPost));
            request.Parameters.Add(new Parameter("scope","openid",ParameterType.GetOrPost));
            request.Parameters.Add(new Parameter("response_type","code",ParameterType.GetOrPost));
            request.Parameters.Add(new Parameter("redirect_uri","http://localhost",ParameterType.GetOrPost));
            request.Parameters.Add(new Parameter("","",ParameterType.GetOrPost));

            var response = _restClient.Get(request);
            return response.IsSuccessful ? response.Content : string.Empty;
        }

        private async Task<string> PostLoginRequest(string html, string username, string password)
        {
            var httpClientHandler = new HttpClientHandler
            {
                Proxy = new WebProxy("http://localhost:8866", false),
                UseProxy = true
            };
            var request = new RestRequest("realms/oneomics/login-actions/authenticate", Method.POST);
            var client = new HttpClient(httpClientHandler);
            client.DefaultRequestHeaders.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("*/*"));
            var url = AddRedirectParametersToRequestFromHtml(html, request.Parameters);
            var nvc = new List<KeyValuePair<string, string>>();
            nvc.Add(new KeyValuePair<string, string>("username",$"{username}"));
            nvc.Add(new KeyValuePair<string, string>("password", $"{password}"));
            var rq = new HttpRequestMessage(HttpMethod.Post, url);
            rq.Content = new FormUrlEncodedContent(nvc);
            rq.Headers.Add("User-Agent","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Postman/7.2.2 Chrome/59.0.3071.115 Electron/1.8.8 Safari/537.36");
            rq.Headers.Add("Referer","http://localhost/auth/realms/oneomics/protocol/openid-connect/auth?response_type=code&state=12345&client_id=api&scope=openid&redirect_uri=http%3A%2F%2Flocalhost");
            using (var result = await client.SendAsync(rq))
            {
                var content = await result.Content.ReadAsStringAsync();
                return content;
            }
           
            
            
            
            //request.AddHeader("Content-Type", "application/x-www-form-urlencoded");
            //request.AddHeader("User-Agent","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Postman/7.2.2 Chrome/59.0.3071.115 Electron/1.8.8 Safari/537.36");
            //request.AddHeader("Accept","text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8");
            //request.AddHeader("Accept-Encoding", "gzip, deflate");
            //request.AddHeader("Referer", "http://localhost/auth/realms/oneomics/protocol/openid-connect/auth?response_type=code&state=12345&client_id=api&scope=openid&redirect_uri=http%3A%2F%2Flocalhost");
            
            
            //AddRedirectParametersToRequestFromHtml(html, request.Parameters);
            //request.AddParameter("Referer", "http://localhost/auth/realms/oneomics/protocol/openid-connect/auth?response_type=code&state=12345&client_id=api&scope=openid&redirect_uri=http%3A%2F%2Flocalhost",
            //    ParameterType.HttpHeader);
            //request.Parameters.Add(new Parameter("redirect_uri","http://localhost",ParameterType.GetOrPost));
            //request.AddParameter("username", $"{username}", ParameterType.RequestBody);
            //request.AddParameter("password", $"{password}", ParameterType.RequestBody);
            //request.RequestFormat = DataFormat.None;
            
            //var response = _restClient.Execute(request);
            //return response.IsSuccessful ? response.Content : string.Empty;
        }
        
        private string AddRedirectParametersToRequestFromHtml(string html, List<Parameter> parameters)
        {
            var doc = new HtmlDocument();
            doc.LoadHtml(html);

            var nd = doc.DocumentNode.SelectSingleNode("//form[@id='kc-form-login']");
            var actionUri = nd.Attributes["action"].Value;
            var fixedUri = actionUri.Replace("&amp;", "&");
            var uri = new Uri(fixedUri);
            parameters.Add(
                new Parameter("session_code", 
                    HttpUtility.ParseQueryString(uri.Query).Get("session_code"),
                    ParameterType.UrlSegment));
            parameters.Add(
                new Parameter("execution", 
                    HttpUtility.ParseQueryString(uri.Query).Get("execution"),
                    ParameterType.UrlSegment));
            parameters.Add(
                new Parameter("client_id", 
                    HttpUtility.ParseQueryString(uri.Query).Get("client_id"),
                    ParameterType.UrlSegment));
            parameters.Add(
                new Parameter("tab_id", 
                    HttpUtility.ParseQueryString(uri.Query).Get("tab_id"),
                    ParameterType.UrlSegment));
            return fixedUri;
        }
    }
}