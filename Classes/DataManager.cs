using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MalayanEventHub.Classes
{
    public class DataManager
    {
        static private int offSetEncryption = 127;
        static Dictionary<string, College> collegeList = GetCollegeList();

       
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

        public static Dictionary<string, College> GetCollegeList()
        {
            //ccis
            College ccis = new College("College of Computer Science", "CCIS");
            Degree bscs = new Degree("B.S. in Computer Science", "BSCS");
            Degree bsit = new Degree("B.S. in Information Technology", "BSIT");

            ccis.AddDegree(bscs);
            ccis.AddDegree(bsit);

            //cas
            College cas = new College("College of Arts and Science", "CAS");
            Degree ba_com = new Degree("BA in Communication", "BACOM");
            Degree bspsy = new Degree("BA in Psychology", "BSPSY");
            cas.AddDegree(ba_com);
            cas.AddDegree(bspsy);

            College shs = new College("Senior High School", "SHS");
            Degree stem = new Degree("Science, Technology, and Engineering Program", "STEM");
            Degree ict = new Degree("Information, Communication and Technology", "ICT");
            shs.AddDegree(stem);
            shs.AddDegree(ict);

            Dictionary<string, College> collegeList = new Dictionary<string, College>();
            collegeList.Add(ccis.acronym, ccis);
            collegeList.Add(cas.acronym, cas);
            collegeList.Add(shs.acronym, shs);

            return collegeList;
        }
    }
}