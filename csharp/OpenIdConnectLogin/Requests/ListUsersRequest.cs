// Copyright SCIEX 2020. All rights reserved.

using System;

namespace gt
{
    public class ListUsersRequest
    {
        public int Execute()
        {
            if (Data.AppSettings.Profile == null || Data.AppSettings.Profile.Count == 0)
            {
                Console.WriteLine("No entries!");
                return 0;
            }

            foreach (var d in Data.AppSettings.Profile)
            {
                Console.WriteLine($"User profile: {d.Name} has username {d.Username}");
            }

            Console.WriteLine($"Settings file located: {Data.AppSettingsFileName}");
            return 0;
        }
    }
}