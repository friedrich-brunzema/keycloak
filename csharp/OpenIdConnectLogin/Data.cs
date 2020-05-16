// Copyright SCIEX 2020. All rights reserved.

using System;
using System.IO;
using System.Reflection;
using Newtonsoft.Json;

namespace gt
{
    public sealed class Data
    {
        private static readonly Lazy<Data>
            Lazy = new Lazy<Data>(() => new Data());

        public static AppSettingsFile AppSettings { get; set; }

        public static string EncryptionKey { get; } = "cu2Kj15CPCVEh9LY934ADw9wS0vhqP9P";

        public static string AppSettingsFileName
        {
            get
            {
                var codeBase = Assembly.GetExecutingAssembly().CodeBase;
                var uri = new UriBuilder(codeBase);
                var path = Uri.UnescapeDataString(uri.Path);
                return Path.Combine(Path.GetDirectoryName(path), "appSettings.json");
            }
        }

        public static void Load()
        {
            if (File.Exists(AppSettingsFileName))
            {
                var contents = File.ReadAllText(AppSettingsFileName);
                AppSettings = JsonConvert.DeserializeObject<AppSettingsFile>(contents);
            }
            else
            {
                AppSettings = new AppSettingsFile();
            }
        }

        public static void Save()
        {
            var serialized = JsonConvert.SerializeObject(AppSettings, Formatting.Indented);
            File.WriteAllText(AppSettingsFileName, serialized);
        }

        private Data()
        {
           Load();   
        }

        public static Data Instance => Lazy.Value;
    }
}