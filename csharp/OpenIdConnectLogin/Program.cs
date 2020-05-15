// Copyright SCIEX 2020. All rights reserved.

using System;
using System.Reflection;
using System.Threading.Tasks;
using CommandLine;
using ds.Options;
using Microsoft.Extensions.Configuration;

namespace gt
{
    public class Program
    {
        public static async Task<int> Main(string[] args)
        {
            Console.Title = Assembly.GetExecutingAssembly().GetName().FullName;

            AppDomain.CurrentDomain.UnhandledException += UnhandledException;
            if (args == null || args.Length == 0)
            {
                ShowHelp();
                return 0;
            }

            IConfiguration config = new ConfigurationBuilder()
                .AddJsonFile("appsettings.json", true, true)
                .Build();
            Console.WriteLine(config["Name"]);
            return await ExecuteRequest(args);

        }

        private static void ShowHelp()
        {
            new VersionRequest().Execute();
            Console.WriteLine("");
            Console.WriteLine("Usage: dt OPTIONS");
            Console.WriteLine(" ");

        }

        private static void UnhandledException(object sender,
            UnhandledExceptionEventArgs e)
        {
            Console.WriteLine($"Unhandled Exception: {e.ExceptionObject}");
            Environment.Exit(1);
        }

        private static Task<int> ExecuteRequest(string[] args)
        {
            Console.CancelKeyPress += (sender, e) => { };

            var parser = new Parser(s =>
            {
                s.AutoVersion = false;
                s.AutoHelp = true;
                s.CaseSensitive = true;
                s.MaximumDisplayWidth = 120;
                s.IgnoreUnknownArguments = false;
                s.HelpWriter = Console.Out;
            });

            var res1 = parser
                .ParseArguments<VersionOptions>(args);
            var result = res1.MapResult((VersionOptions options) => new VersionRequest().Execute(),
                errors => { return 1;});


            return Task.FromResult<int>(result);
        }
    }
}