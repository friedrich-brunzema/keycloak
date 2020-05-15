// Copyright SCIEX 2020. All rights reserved.

using System;
using System.Diagnostics;
using System.Reflection;

namespace gt
{
    public class VersionRequest
    {
        public int Execute()
        {
            var assembly = Assembly.GetExecutingAssembly();
            var fvi = FileVersionInfo.GetVersionInfo(assembly.Location);
            var version = fvi.FileVersion;
            var productVersion = fvi.ProductVersion;
            var gitsha = productVersion.TrimStart("1.0.0+".ToCharArray()).Substring(0, 7);
            Console.WriteLine($"dt version {version}, build={gitsha}");
            Console.WriteLine($"Copyright 2020 (c) SCIEX.  All rights reserved.");
            return 0;
        }
    }
}