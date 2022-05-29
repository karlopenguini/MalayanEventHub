using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MalayanEventHub.Classes
{
    public class College
    {
        internal string name;
        internal string acronym;
        internal List<Degree> degrees;

        public College(string name, string acronym)
        {
            this.name = name;
            this.acronym = acronym;
        }

        public void AddDegree(Degree major)
        {
            degrees.Add(major);
        }
        
    }


   
}