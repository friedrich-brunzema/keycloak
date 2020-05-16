// Copyright SCIEX 2020. All rights reserved.

using System;

namespace gt
{
    public class ListEnvironmentsRequest
    {
        public int Execute()
        {
            if (Data.AppSettings.Environment == null || Data.AppSettings.Environment.Count == 0)
            {
                Console.WriteLine("No entries for environment!");
                return 0;
            }

            foreach (var e in Data.AppSettings.Environment)
            {
                Console.WriteLine($"Env profile: {e.Name}");
                Console.WriteLine($"  Auth Url:     {e.AuthUrl}");
                Console.WriteLine($"  Callback Url: {e.CallbackUrl}");
                Console.WriteLine($"  Token Url:    {e.TokenUrl}");
                Console.WriteLine($"  Client Id:    {e.ClientId}");
                Console.WriteLine($"  Scope:        {e.Scope}");
                Console.WriteLine("");
            }

            Console.WriteLine($"Settings file located: {Data.AppSettingsFileName}");
            return 0;
        }
    }
}