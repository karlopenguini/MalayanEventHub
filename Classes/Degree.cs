using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MalayanEventHub.Classes
{
    public class Degree
    {
        internal string fullName;
        internal string acronym;
        internal int startYear;
        internal int endYear;

        public Degree(string fullName, string acronym, int startYear=1, int endYear=4)
        {
            this.fullName = fullName;
            this.acronym = acronym;
            this.startYear = startYear;
            this.endYear = endYear;
        }

    }
}