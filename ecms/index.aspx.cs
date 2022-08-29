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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login_user"] == null)
            {
                Response.Redirect("~/login.aspx");
                return;
            }
            else
            {
                var userid = Session["login_user"];
                SqlDataSource1.SelectCommand = "select category_id,category_title,category_type,amount,category_end_date from tbl_category where category_id IN (select distinct category_id from tbl_category where category_id NOT IN(select distinct category_id from tbl_joined where student_id ='" + userid + "'))";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

            protected void rowCommand(object sender, GridViewCommandEventArgs e)
            {
                var userid = Session["login_user"];
                // If multiple ButtonField column fields are used, use the
                // CommandName property to determine which button was clicked.
                if (e.CommandName == "select")
                {
                    
                    // Convert the row index stored in the CommandArgument
                    // property to an Integer.
                    int index = Convert.ToInt32(e.CommandArgument);

                    // Get the last name of the selected author from the appropriate
                    // cell in the GridView control.
                    GridViewRow selectedRow = GridView1.Rows[index];
            
                    TableCell category_id = selectedRow.Cells[0];
                    int categoryid = Convert.ToInt32(category_id.Text);

                    SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\ecms\ecms\App_Data\db_ecms.mdf;Integrated Security=True");
                    conn.Open();
                    string query = "INSERT INTO tbl_joined(student_id,category_id,note,status,created_date,updated_date) VALUES(@stuId, @catId, @note,@status,GETDATE(),GETDATE())";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@stuId", userid);
                    cmd.Parameters.AddWithValue("@catId", categoryid);
                    cmd.Parameters.AddWithValue("@note", "nothing");
                    cmd.Parameters.AddWithValue("@status", "notpay");
               
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect(Request.RawUrl);
                }
            }
    }
}