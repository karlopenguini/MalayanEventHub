using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MCLEventHub.Classes
{
    public class DataManager
    {
        static private int offSetEncryption = 127;


        protected internal static string EncryptData(string data)
        {
            if (data == null)
            {
                throw new Exception("Error Request");
            }
            List<string> letters = new List<string>();

            for (int i = 0; i < data.Length; i++)
            {
                int currLet = data[i] + offSetEncryption;
                string s = (char)(currLet) + "";
                letters.Add(s);
            }

            return String.Join("", letters);
        }

        protected internal static string DecryptData(string data)
        {

            if (data == null)
            {
                throw new Exception("Error Request");
            }

            List<string> letters = new List<string>();
            for (int i = 0; i < data.Length; i++)
            {
                int currLet = data[i] - offSetEncryption;
                string s = (char)(currLet) + "";
                letters.Add(s);
            }

            return String.Join("", letters);
        }
    }
}