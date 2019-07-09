using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Xml;
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
        private string _authSessionIdCookieValue;
        private string _kcRestartCookieValue;
        private string _sessionState;
        private string _authorizationCode;
        private string _redirectUri;

        public async Task<string> Run()
        {
            _restClient = new RestClient("http://localhost/auth/") {CookieContainer = new CookieContainer()};
           
            var html = InitialAuthRequest();
            var response = await PostLoginRequest(html, "demo", "Xaris,,404");
			// do a get on _redirectURI
            var token = await GetTokens();
            return "";
        }

        private async Task<string> GetTokens()
        {
			var request = new RestRequest("realms/oneomics/protocol/openid-connect/token", Method.POST);
			var httpClientHandler = new HttpClientHandler { AllowAutoRedirect = false };
			var client = new HttpClient(httpClientHandler);
			client.DefaultRequestHeaders.Clear();
			
			client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("*/*"));
			client.DefaultRequestHeaders.AcceptEncoding.Add(new StringWithQualityHeaderValue("gzip"));
			client.DefaultRequestHeaders.AcceptEncoding.Add(new StringWithQualityHeaderValue("deflate"));
			client.DefaultRequestHeaders.AcceptLanguage.Add(new StringWithQualityHeaderValue("en-US"));

			var nvc = new List<KeyValuePair<string, string>>
			{
				new KeyValuePair<string, string>("grant_type", "authorization_code"),
				new KeyValuePair<string, string>("code", $"{_authorizationCode}"),
				new KeyValuePair<string, string>("redirect_uri", "http://localhost"),
				new KeyValuePair<string, string>("client_id", $"api"),
				new KeyValuePair<string, string>("client_secret", "cba440fe-f15b-41c2-b5c9-a8d306556172")
			};
			var rq = new HttpRequestMessage(HttpMethod.Post, new Uri("http://localhost/auth/realms/oneomics/protocol/openid-connect/token"));
			rq.Content = new FormUrlEncodedContent(nvc);
			rq.Headers.Add("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Postman/7.2.2 Chrome/59.0.3071.115 Electron/1.8.8 Safari/537.36");
			rq.Headers.Add("Connection", "keep-alive");
			rq.Headers.Add("Cache-control", "no-cache");
			rq.Headers.Add("Cookie", $"AUTH_SESSION_ID={_authSessionIdCookieValue}; KC_RESTART={_kcRestartCookieValue}");
			using (var result = await client.SendAsync(rq))
			{
				using (var content = result.Content)
				{
					var res = await content.ReadAsStringAsync();
					return res;
				}
			}
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
            Debug.Assert(response.Cookies != null, "response.Cookies != null");
            _authSessionIdCookieValue = response.Cookies.FirstOrDefault(x => x.Name == "AUTH_SESSION_ID")?.Value;
            _kcRestartCookieValue = response.Cookies.FirstOrDefault(x => x.Name == "KC_RESTART")?.Value;

			return response.IsSuccessful ? response.Content : string.Empty;
        }

        private async Task<string> PostLoginRequest(string html, string username, string password)
        {
			var request = new RestRequest("realms/oneomics/login-actions/authenticate", Method.POST);
			var httpClientHandler = new HttpClientHandler {AllowAutoRedirect = false};

			var client = new HttpClient(httpClientHandler);
			client.DefaultRequestHeaders.Clear();
			client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("text/html"));
			client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/xhtml+xml"));
			client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/xml",0.9));
			client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("image/webp"));
			client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("image/apng"));
			client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("*/*", 0.8));
			client.DefaultRequestHeaders.AcceptEncoding.Add(new StringWithQualityHeaderValue("gzip"));
			client.DefaultRequestHeaders.AcceptEncoding.Add(new StringWithQualityHeaderValue("deflate"));
			client.DefaultRequestHeaders.AcceptEncoding.Add(new StringWithQualityHeaderValue("br"));
			client.DefaultRequestHeaders.AcceptLanguage.Add(new StringWithQualityHeaderValue("en-US"));
			
			var url = AddRedirectParametersToRequestFromHtml(html, request.Parameters);
			var nvc = new List<KeyValuePair<string, string>>
			{
				new KeyValuePair<string, string>("username", $"{username}"),
				new KeyValuePair<string, string>("password", $"{password}")
			};
			var rq = new HttpRequestMessage(HttpMethod.Post, url);
			rq.Headers.Add("Cookie", $"AUTH_SESSION_ID={_authSessionIdCookieValue}; KC_RESTART={_kcRestartCookieValue}");
			rq.Content = new FormUrlEncodedContent(nvc);
			rq.Headers.Add("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Postman/7.2.2 Chrome/59.0.3071.115 Electron/1.8.8 Safari/537.36");
			
			rq.Headers.Add("Referer", "http://localhost/auth/realms/oneomics/protocol/openid-connect/auth?response_type=code&state=12345&client_id=api&scope=openid&redirect_uri=http%3A%2F%2Flocalhost");
			using (var result = await client.SendAsync(rq))
			{
				// this results in a 301 redirect, but with the secrets in the redirect URI location.
				var hdr = result.Headers.FirstOrDefault(x => x.Key == "Location");
				_redirectUri = hdr.Value.FirstOrDefault();
				var uri = new Uri(_redirectUri);
				_sessionState = HttpUtility.ParseQueryString(uri.Query).Get("session_state");
				_authorizationCode = HttpUtility.ParseQueryString(uri.Query).Get("code");
				return "";
			}
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