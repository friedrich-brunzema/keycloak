// Copyright SCIEX 2019. All rights reserved.

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using HtmlAgilityPack;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;

namespace OpenIdConnectLogin
{
	public class Program
	{
		public static async Task Main(string[] args)
		{
			var app = new Application();
			var result = await app.Run();
			Console.WriteLine(Environment.NewLine + result);
		}
	}

	class Application
	{
		private const string KeyCloakUrlStaging = "https://keycloak.dev.oneomics.net/auth/";
		private const string KeyCloakUrlVerification = "https://keycloak.qa.oneomics.net/auth/";

		private const string TokenEndPointSubUrl =
			"realms/oneomics/protocol/openid-connect/token";
		private const string AuthEndPointSubUrl =
            "realms/oneomics/protocol/openid-connect/auth";
		private const string AuthenticateEndPointSubUrl =
			"realms/oneomics/login-actions/authenticate";
		private const string RedirectUrl = "http://localhost";
		private const string ClientSecretStaging = "82112d7e-6c3c-4533-ad12-0d1884c40254";
        private const string ClientSecretVerification ="8d366b2a-8cc1-4af0-bd70-aa44006b0977";

        private const string ClientId = "automation";
		private const string UserAgent =
			"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko)"
			+ " Postman/7.2.2 Chrome/59.0.3071.115 Electron/1.8.8 Safari/537.36";
		private const string Scope = "openid profile";

		private string _authorizationCode;
		private string _authSessionIdCookieValue;
		private string _kcRestartCookieValue;
		private string _redirectUri;
		private RestClient _restClient;
		private string _username;
		private string _password;
		private string _refreshToken;

		public async Task<string> Run()
		{
			Console.WriteLine("OpenIdConnect JWT-Token getter hack, v1.0  (c) SCIEX 2019" + Environment.NewLine);
			Console.WriteLine($"Signing into; {KeyCloakUrlStaging}");
			_restClient = new RestClient(KeyCloakUrlStaging)
			{ CookieContainer = new CookieContainer() };
			Console.Write("Enter your username: ");
            _username = Console.ReadLine();
			Console.Write("Enter your password: ");
            _password = PasswordHelper.GetPassword();
            var accessToken = string.Empty;
			var formattedTokensAsJson = string.Empty;
			try
			{
				var html = InitialAuthRequest();
				await PostLoginRequest(html, _username, _password);
				var tokensJson = await GetTokensFromTokenEndpoint();
				formattedTokensAsJson = JToken.Parse(tokensJson).ToString(Formatting.Indented);
				_refreshToken = JObject.Parse(formattedTokensAsJson)["refresh_token"].ToString();
                accessToken = JObject.Parse(formattedTokensAsJson)["access_token"].ToString();
            }
			catch
			{
				Console.WriteLine("Could not log you in, sorry!");
			}

            // note access token valid for 5 minutes!
            // refresh token valid for 30 minutes!!
			var refresh = await GetRefreshTokenFromTokenEndpoint();
			var refreshAsJson = JToken.Parse(refresh).ToString(Formatting.Indented);
            return formattedTokensAsJson + Environment.NewLine
                                         + "New Refresh Token:"
                                         + Environment.NewLine + refreshAsJson;

        }

		private string InitialAuthRequest()
		{
			var request = new RestRequest(AuthEndPointSubUrl, Method.GET);
			request.Parameters.Add(new Parameter("User-Agent", UserAgent, ParameterType.HttpHeader));
			request.Parameters.Add(new Parameter("Accept",
				"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
				ParameterType.HttpHeader));
			request.Parameters.Add(new Parameter("client_id", ClientId,
				ParameterType.GetOrPost));
			request.Parameters.Add(new Parameter("scope", Scope,
				ParameterType.GetOrPost));
			request.Parameters.Add(new Parameter("response_type", "code",
				ParameterType.GetOrPost));
			request.Parameters.Add(new Parameter("redirect_uri", RedirectUrl,
				ParameterType.GetOrPost));

			var response = _restClient.Get(request);
			if (!response.IsSuccessful)
				throw new ApplicationException("Initial Login Failed");
			Debug.Assert(response.Cookies != null, "response.Cookies != null");
			_authSessionIdCookieValue = response.Cookies
				.FirstOrDefault(x => x.Name == "AUTH_SESSION_ID")?.Value;
			_kcRestartCookieValue = response.Cookies
				.FirstOrDefault(x => x.Name == "KC_RESTART")?.Value;
			return response.Content;
		}

		private async Task PostLoginRequest(string html, string username, string password)
		{
			// Cannot use RestSharp here because RestSharp does not put non-json
			// correctly into the body of the post
			var request = new RestRequest(AuthenticateEndPointSubUrl, Method.POST);
			// disable the auto-redirect so that we don't lose the info
			// coming back from the initial request.
			var httpClientHandler = new HttpClientHandler { AllowAutoRedirect = false };
			var client = new HttpClient(httpClientHandler);
			client.DefaultRequestHeaders.Clear();
			client.DefaultRequestHeaders.Accept.Add(
				new MediaTypeWithQualityHeaderValue("text/html"));
			client.DefaultRequestHeaders.Accept.Add(
				new MediaTypeWithQualityHeaderValue("application/xhtml+xml"));
			client.DefaultRequestHeaders.Accept.Add(
				new MediaTypeWithQualityHeaderValue("application/xml", 0.9));
			client.DefaultRequestHeaders.Accept.Add(
				new MediaTypeWithQualityHeaderValue("image/webp"));
			client.DefaultRequestHeaders.Accept.Add(
				new MediaTypeWithQualityHeaderValue("image/apng"));
			client.DefaultRequestHeaders.Accept.Add(
				new MediaTypeWithQualityHeaderValue("*/*", 0.8));
			client.DefaultRequestHeaders.AcceptEncoding.Add(
				new StringWithQualityHeaderValue("gzip"));
			client.DefaultRequestHeaders.AcceptEncoding.Add(
				new StringWithQualityHeaderValue("deflate"));
			client.DefaultRequestHeaders.AcceptEncoding.Add(
				new StringWithQualityHeaderValue("br"));
			client.DefaultRequestHeaders.AcceptLanguage.Add(
				new StringWithQualityHeaderValue("en-US"));

			var url = AddRedirectParametersToRequestFromHtml(html, request.Parameters);
			var nvc = new List<KeyValuePair<string, string>>
			{
				new KeyValuePair<string, string>("username", $"{username}"),
				new KeyValuePair<string, string>("password", $"{password}")
			};
			var httpRequestMessage = new HttpRequestMessage(HttpMethod.Post, url);
			// Cookies come on the response of the first request
			// we have to add them manually because we don't have an 
			// active browser doing this for us and are not using RestSharp here
			httpRequestMessage.Headers.Add("Cookie", $"AUTH_SESSION_ID={_authSessionIdCookieValue}; KC_RESTART={_kcRestartCookieValue}");
			httpRequestMessage.Content = new FormUrlEncodedContent(nvc);
			httpRequestMessage.Headers.Add("User-Agent", UserAgent);
			httpRequestMessage.Headers.Add("prompt", "login"); // force re-login -- openid spec section 3.1.2.3

			using (var result = await client.SendAsync(httpRequestMessage))
			{
				if (!result.IsSuccessStatusCode && result.StatusCode != HttpStatusCode.Found)
					throw new ApplicationException(
						"Posting the login request has failed!");

				// this results in a 301 redirect, but with the secrets in the redirect URI location.
				var locationHeader = result.Headers.FirstOrDefault(x => x.Key == "Location");
				_redirectUri = locationHeader.Value.FirstOrDefault();
				var uri = new Uri(_redirectUri);
				_authorizationCode = HttpUtility.ParseQueryString(uri.Query).Get("code");
			}
		}

		private async Task<string> GetTokensFromTokenEndpoint()
		{
			var request = new RestRequest(TokenEndPointSubUrl, Method.POST);
			var httpClientHandler = new HttpClientHandler { AllowAutoRedirect = false,
                AutomaticDecompression = DecompressionMethods.GZip | DecompressionMethods.Deflate };
			var client = new HttpClient(httpClientHandler);
			client.DefaultRequestHeaders.Clear();
			client.DefaultRequestHeaders.Accept.Add(
				new MediaTypeWithQualityHeaderValue("*/*"));
			client.DefaultRequestHeaders.AcceptEncoding.Add(
				new StringWithQualityHeaderValue("gzip"));
			client.DefaultRequestHeaders.AcceptEncoding.Add(
				new StringWithQualityHeaderValue("deflate"));
			client.DefaultRequestHeaders.AcceptLanguage.Add(
				new StringWithQualityHeaderValue("en-US"));

			var nvc = new List<KeyValuePair<string, string>>
			{
				new KeyValuePair<string, string>("grant_type", "authorization_code"),
				new KeyValuePair<string, string>("code", $"{_authorizationCode}"),
				new KeyValuePair<string, string>("redirect_uri", RedirectUrl),
				new KeyValuePair<string, string>("client_id", ClientId),
				new KeyValuePair<string, string>("client_secret", ClientSecretStaging)
			};
			const string tokenUrl = KeyCloakUrlStaging + TokenEndPointSubUrl;
			var rq = new HttpRequestMessage(HttpMethod.Post, new Uri(tokenUrl));
			rq.Content = new FormUrlEncodedContent(nvc);
			rq.Headers.Add("User-Agent", UserAgent);
			rq.Headers.Add("Connection", "keep-alive");
			rq.Headers.Add("Cache-control", "no-cache");
			rq.Headers.Add("Cookie",
				$"AUTH_SESSION_ID={_authSessionIdCookieValue}; KC_RESTART={_kcRestartCookieValue}");
			using (var response = await client.SendAsync(rq))
			{
				if (!response.IsSuccessStatusCode)
					throw new ApplicationException(
						"Error getting token from the token endpoint");
				using (var content = response.Content)
				{
					var res = await content.ReadAsStringAsync();
					return res;
				}
			}
		}

		private async Task<string> GetRefreshTokenFromTokenEndpoint()
		{
			var request = new RestRequest(TokenEndPointSubUrl, Method.POST);
            var httpClientHandler = new HttpClientHandler
            {
                AllowAutoRedirect = false,
                AutomaticDecompression = DecompressionMethods.GZip | DecompressionMethods.Deflate
            };
            var client = new HttpClient(httpClientHandler);
			client.DefaultRequestHeaders.Clear();
			client.DefaultRequestHeaders.Accept.Add(
				new MediaTypeWithQualityHeaderValue("application/json"));
			client.DefaultRequestHeaders.AcceptLanguage.Add(
				new StringWithQualityHeaderValue("en-US"));

			var nvc = new List<KeyValuePair<string, string>>
			{
				new KeyValuePair<string, string>("grant_type", "refresh_token"),
				new KeyValuePair<string, string>("refresh_token", $"{_refreshToken}"),
				new KeyValuePair<string, string>("client_id", ClientId),
                new KeyValuePair<string, string>("client_secret", ClientSecretStaging),
                new KeyValuePair<string, string>("scope", Scope)
			};
			const string tokenUrl = KeyCloakUrlStaging + TokenEndPointSubUrl;
			var rq = new HttpRequestMessage(HttpMethod.Post, new Uri(tokenUrl));
			rq.Content = new FormUrlEncodedContent(nvc);
			rq.Headers.Add("User-Agent", UserAgent);
			rq.Headers.Add("Connection", "keep-alive");
			rq.Headers.Add("Cache-control", "no-cache");
			using (var response = await client.SendAsync(rq))
			{
				if (!response.IsSuccessStatusCode)
					throw new ApplicationException(
						"Error getting token from the token endpoint");
				using (var content = response.Content)
				{
					var res = await content.ReadAsStringAsync();
					return res;
				}
			}
		}

		private string AddRedirectParametersToRequestFromHtml(string html, List<Parameter> parameters)
		{
			// the first request to the auth point returns an HTML page that the user
			// needs to use to authenticate.  This page, in addition to the posting logic
			// has some secrets that are needed if we do the post manually.  We use
			// the HtmlAgility library to parse the form tag on the returned html.  This is 
			// very Keycloak specific, and may change in a future version.
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