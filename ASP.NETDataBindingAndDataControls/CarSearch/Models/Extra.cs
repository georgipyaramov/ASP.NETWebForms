using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CarSearch.Models
{
    public class Extra
    {
        private string name;

        public Extra(string name)
        {
            this.name = name;
        }

        public string Name 
        {
            get { return this.name; } 
        }
    }
}
