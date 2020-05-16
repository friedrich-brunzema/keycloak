// Copyright SCIEX 2020. All rights reserved.

using Newtonsoft.Json;

namespace gt
{
    public class EnvironmentInfo
    {
        [JsonProperty("name", Required = Required.Always)]
        public string Name { get; set; }

        [JsonProperty("authUrl", Required = Required.Always)]
        public string AuthUrl { get; set; }

        [JsonProperty("callbackUrl", Required = Required.Always)]
        public string CallbackUrl { get; set; }

        [JsonProperty("tokenUrl", Required = Required.Always)]
        public string TokenUrl { get; set; }

        [JsonProperty("clientId", Required = Required.Always)]
        public string ClientId { get; set; } = "oneomics";

        [JsonProperty("scope", Required = Required.Always)]
        public string Scope { get; set; } = "openid profile";
    }
}