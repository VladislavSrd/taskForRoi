using System;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using taskForROI.Models;

namespace taskForROI
{
    public partial class UserList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated){
                Response.Redirect("~/account/Login.aspx");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if ((e.CommandName == "Insert") && (Page.IsValid))
            {
                SqlDataSource1.InsertParameters["FirstName"].DefaultValue =
                    ((TextBox) GridView1.FooterRow.FindControl("addFirstName")).Text;
                SqlDataSource1.InsertParameters["LastName"].DefaultValue =
                    ((TextBox) GridView1.FooterRow.FindControl("addLastName")).Text;
                SqlDataSource1.Insert();
            }
        }
    }
}