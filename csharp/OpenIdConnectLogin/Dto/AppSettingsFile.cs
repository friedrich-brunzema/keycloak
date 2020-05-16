// Copyright SCIEX 2020. All rights reserved.

using System.Collections.Generic;
using Newtonsoft.Json;

namespace gt
{
    public class AppSettingsFile
    {
        [JsonProperty("profile", Required = Required.Always)]
        public List<ProfileInfo> Profile { get; set; }

        [JsonProperty("env", Required = Required.Always)]
        public List<EnvironmentInfo> Environment { get; set; }
    }
}