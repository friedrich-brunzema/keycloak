// Copyright SCIEX 2020. All rights reserved.

using System;
using System.Collections.Generic;
using System.Linq;
using NETCore.Encrypt;

namespace gt
{
    public class AddUserProfileRequest
    {
        public int Execute()
        {
            if (Data.AppSettings.Profile == null)
                Data.AppSettings.Profile = new List<ProfileInfo>();

            var profileInfo = new ProfileInfo();
            
            while (true)
            {
                Console.WriteLine("Enter User Profile Name (eg. Friedrich-dev)");
                profileInfo.Name = Console.ReadLine();
                if (Data.AppSettings.Profile.All(x => x.Name != profileInfo.Name))
                    break;
                Console.WriteLine("Profile name already exists, choose different one.");
            }

            Console.WriteLine("Enter oneomics username");
            profileInfo.Username = Console.ReadLine();
            
            string password1;
            while (true)
            {
                Console.WriteLine("Enter oneomics password");
                password1 = PasswordHelper.GetPassword();
                Console.WriteLine("Re-Enter oneomics password");
                var password2 = PasswordHelper.GetPassword();
                if (password1 == password2)
                    break;
                Console.WriteLine("Passwords don't match");
            }

            var encrypted = EncryptProvider.AESEncrypt(password1, Data.EncryptionKey);
            profileInfo.Password = encrypted;
            
            Data.AppSettings.Profile.Add(profileInfo);
            Data.Save();
            Console.WriteLine($"Settings file updated: {Data.AppSettingsFileName}");   
            return 0;
        }
    }
}