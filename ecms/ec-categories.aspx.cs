using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ecms
{
    public partial class ec_categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login_user"] == null)
            {
                Response.Redirect("~/login.aspx");
                return;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void detail_rowCommand(object sender, GridViewCommandEventArgs e)
        {
            var userid = Session["login_user"];
            // If multiple ButtonField column fields are used, use the
            // CommandName property to determine which button was clicked.
            if (e.CommandName == "detail")
            {

                // Convert the row index stored in the CommandArgument
                // property to an Integer.
                int index = Convert.ToInt32(e.CommandArgument);

                // Get the last name of the selected author from the appropriate
                // cell in the GridView control.
                GridViewRow selectedRow = GridView1.Rows[index];

                TableCell category_id = selectedRow.Cells[0];

                int categoryid = Convert.ToInt32(category_id.Text);
                Session["selected_category"] = categoryid;      
                Response.Redirect("~/category_detail.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void CreateBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/create_category.aspx");
        }
    }
}