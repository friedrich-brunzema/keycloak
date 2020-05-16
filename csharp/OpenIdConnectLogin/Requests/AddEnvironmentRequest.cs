// Copyright SCIEX 2020. All rights reserved.

using System;
using System.Collections.Generic;
using System.Linq;

namespace gt
{
    public class AddEnvironmentRequest
    {
        public int Execute()
        {
            if (Data.AppSettings.Environment == null)
                Data.AppSettings.Environment = new List<EnvironmentInfo>();

            var environmentInfo = new EnvironmentInfo();

            while (true)
            {
                Console.WriteLine(
                    "Enter environment name (e.g. dev, qa, research, beta, prod");
                environmentInfo.Name = Console.ReadLine();
                if (Data.AppSettings.Environment.All(x => x.Name != environmentInfo.Name))
                    break;
                Console.WriteLine(
                    "Environment name already exists, choose different one.");
            }

            Console.WriteLine("Enter auth URL:");
            environmentInfo.AuthUrl = Console.ReadLine();
            Console.WriteLine("Enter callback URL:");
            environmentInfo.CallbackUrl = Console.ReadLine();
            Console.WriteLine("Enter token URL:");
            environmentInfo.TokenUrl = Console.ReadLine();

            Data.AppSettings.Environment.Add(environmentInfo);
            Data.Save();
            Console.WriteLine($"Settings file updated: {Data.AppSettingsFileName}");

            return 0;
        }
    }
}