// Copyright SCIEX 2020. All rights reserved.

using System;
using System.Reflection;
using System.Threading.Tasks;
using CommandLine;
using gt.Options;

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

            // initialize the one global instance
            var instance = Data.Instance;
            var ass = Data.AppSettings;
            // Data.AppSettings.Environment = new List<EnvironmentInfo>();
            // Data.AppSettings.Profile = new List<ProfileInfo>();
            // var e = new EnvironmentInfo();
            // e.AuthUrl = "A";
            // e.CallbackUrl = "b";
            // e.ClientId = "c";
            // e.Name = "name";
            // e.TokenUrl = "T";
            // Data.AppSettings.Environment.Add(e);
            // var u = new ProfileInfo();
            // u.Name = "name2";
            // u.Username = "un";
            // u.Password = "p";
            // Data.AppSettings.Profile.Add(u);
            // Data.Save();
            return await ExecuteRequest(args);
        }

        private static void ShowHelp()
        {
            new VersionRequest().Execute();
            Console.WriteLine("");
            Console.WriteLine("Usage: gt OPTIONS");
            Console.WriteLine(" ");
            Console.WriteLine("Commands:");
            Console.WriteLine("  add-environment    Adds a new keycloak environment");
            Console.WriteLine("  add-user-profile   Adds a new user profile");
            Console.WriteLine("  get-token          Gets a login token to stdout and clipboard");
            Console.WriteLine("  list-environments  Lists environments");
            Console.WriteLine("  list-users         List user profiles");
            Console.WriteLine("  version            Shows program version");
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

            var res1 = parser.ParseArguments<VersionOptions,
                                            AddUserProfileOptions,
                                            AddEnvironmentOptions,
                                            ListUsersOptions,
                                            ListEnvironmentsOptions>(args);
                            
            var result = res1.MapResult(
                (VersionOptions options) => new VersionRequest().Execute(),
                (AddUserProfileOptions options) => new AddUserProfileRequest().Execute(),
                (AddEnvironmentOptions options) => new AddEnvironmentRequest().Execute(),
                (ListUsersOptions options) => new ListUsersRequest().Execute(),
                (ListEnvironmentsOptions options) => new ListEnvironmentsRequest().Execute(),
                errors => 1);


            return Task.FromResult(result);
        }
    }
}