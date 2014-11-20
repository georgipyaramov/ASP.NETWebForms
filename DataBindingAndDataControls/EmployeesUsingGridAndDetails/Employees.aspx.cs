using Northwind.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeesUsingGridAndDetails
{
    public partial class Employees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                NorthwindEntities data = new NorthwindEntities();

                List<Employee> emps = data.Employees.ToList();

                this.gridViewEmployees.DataSource = emps;
                this.DataBind();
            }
        }
    }
}