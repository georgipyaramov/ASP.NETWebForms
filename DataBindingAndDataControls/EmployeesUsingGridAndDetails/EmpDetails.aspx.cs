using Northwind.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeesUsingGridAndDetails
{
    public partial class EmpDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = int.Parse(Request.QueryString["id"]);
            var data = new NorthwindEntities();

            var employee = data.Employees.Where(emp => emp.EmployeeID == id).ToList();

            this.detailsViewEmployee.DataSource = employee;
            this.DataBind();
        }
    }
}