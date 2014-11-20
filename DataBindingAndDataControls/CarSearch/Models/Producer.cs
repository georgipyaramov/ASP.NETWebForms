namespace CarSearch.Models
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;

    public class Producer
    {
        private string name;

        private IList<string> models;

        public Producer(string name)
        {
            this.name = name;
            this.models = new List<string>();
        }

        public string Name 
        {
            get { return this.name; }
        }
        public IList<string> Models
        {
            get { return this.models; }
        }
    }
}