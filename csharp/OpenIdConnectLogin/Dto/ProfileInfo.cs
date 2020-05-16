// Copyright SCIEX 2020. All rights reserved.

using Newtonsoft.Json;

namespace gt
{
    public class ProfileInfo
    {
        [JsonProperty("name", Required = Required.Always)]
        public string Name { get; set; }

        [JsonProperty("username", Required = Required.Always)]
        public string Username { get; set; }

        [JsonProperty("password", Required = Required.Always)]
        public string Password { get; set; }
    }
}