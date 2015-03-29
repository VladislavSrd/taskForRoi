using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace taskForROI
{
    public partial class ProjectList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/account/Login.aspx?ReturnUrl=~/ProjectsList.aspx");
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if ((e.CommandName == "Insert") && (Page.IsValid))
            {
                ProjectsSDS.InsertParameters["Name"].DefaultValue =
                    ((TextBox)GridView1.FooterRow.FindControl("addName")).Text;
                ProjectsSDS.InsertParameters["StartDate"].DefaultValue =
                    ((TextBox)GridView1.FooterRow.FindControl("addStartDate")).Text;
                ProjectsSDS.InsertParameters["EndDate"].DefaultValue =
                    ((TextBox)GridView1.FooterRow.FindControl("addEndDate")).Text;
                ProjectsSDS.InsertParameters["EstimatedRevenue"].DefaultValue =
                    ((TextBox)GridView1.FooterRow.FindControl("addEstimatedRevenue")).Text;
                ProjectsSDS.Insert();
            }
            else if (e.CommandName == "Edit")
            {
            }
            
        }

    }
}