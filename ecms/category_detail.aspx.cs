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
    public partial class category_detail : System.Web.UI.Page
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
            var category_id = Session["selected_category"];
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\ecms\ecms\App_Data\db_ecms.mdf;Integrated Security=True");
            conn.Open();
            string query = "select * from tbl_category where category_id=@catId";
            string qquery = "select count(student_id) as total from tbl_joined where category_id=" +category_id+" and status= 'pay'";
                string qqquery = "select count(student_id) as total from tbl_joined where category_id=" + category_id + "";
                SqlCommand cmd = new SqlCommand(query, conn);
            SqlCommand ncmd = new SqlCommand(qquery, conn);
                SqlCommand nncmd = new SqlCommand(qqquery, conn);
                cmd.Parameters.AddWithValue("@catId", category_id);
            SqlDataReader rdr = cmd.ExecuteReader();
                int totaljoined = 0;
                int totalpay = 0;
            while (rdr.Read())
            {
                id.Text = rdr["category_id"].ToString();
                title.Text = rdr["category_title"].ToString();
                type.Text = rdr["category_type"].ToString();
                detail.Text = rdr["category_detail"].ToString();
                amount.Text = rdr["amount"].ToString();
                status.Text = rdr["status"].ToString();
                last_updated.Text = rdr["category_updated_date"].ToString();
                deadline.Text = rdr["category_end_date"].ToString();
            }
                rdr.Close();
            SqlDataReader rdrr = ncmd.ExecuteReader();
                while (rdrr.Read())
                {
                     totalpay = Convert.ToInt32( rdrr["total"].ToString());
                }
                rdrr.Close();
                SqlDataReader rdrrr = nncmd.ExecuteReader();
                while (rdrrr.Read())
                {
                    totaljoined = Convert.ToInt32(rdrrr["total"].ToString());
                }
                rdrrr.Close();
                TotalPay.Text = totalpay.ToString();
                TotalJoined.Text = totaljoined.ToString();
                SqlDataSource1.SelectCommand = "select ts.student_id,ts.roll_no,ts.name,ts.phone_no,tj.status from tbl_student ts join tbl_joined tj on ts.student_id = tj.student_id where category_id ="+ category_id + "";

            conn.Close();
            }
        }

        protected void get_rowCommand(object sender, GridViewCommandEventArgs e)
        {
            var categoryid = Session["selected_category"];
            // If multiple ButtonField column fields are used, use the
            // CommandName property to determine which button was clicked.
            if (e.CommandName == "get")
            {

                // Convert the row index stored in the CommandArgument
                // property to an Integer.
                int index = Convert.ToInt32(e.CommandArgument);

                // Get the last name of the selected author from the appropriate
                // cell in the GridView control.
                GridViewRow selectedRow = GridView1.Rows[index];

                TableCell student_id = selectedRow.Cells[0];
                TableCell getBtn = selectedRow.Cells[5];
                getBtn.ControlStyle.CssClass = "d-none";
                int studentid = Convert.ToInt32(student_id.Text);

                SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\ecms\ecms\App_Data\db_ecms.mdf;Integrated Security=True");
                conn.Open();
                string updatequery = "update tbl_joined set status=@status where student_id =@stuId and category_id =@catId";
                SqlCommand cmd = new SqlCommand(updatequery, conn);
                cmd.Parameters.AddWithValue("@stuId", studentid);
                cmd.Parameters.AddWithValue("@catId", categoryid);
                cmd.Parameters.AddWithValue("@status", "pay");
                
                /*
                string query = "INSERT INTO tbl_joined(student_id,category_id,note,status,created_date,updated_date) VALUES(@stuId, @catId, @note,@status,GETDATE(),GETDATE())";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@stuId", userid);
                cmd.Parameters.AddWithValue("@catId", categoryid);
                cmd.Parameters.AddWithValue("@note", "nothing");
                cmd.Parameters.AddWithValue("@status", "notpay");
                */

                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect(Request.RawUrl);
            }
    }

        protected void Button2_Click(object sender, EventArgs e)
        {

            title.Visible = false;
            type.Visible = false;
            detail.Visible = false;
            amount.Visible = false;
            status.Visible = false;
            deadline.Visible = false;

            titletxt.CssClass = "form-control my-1";
            titletxt.Text = title.Text;
            typetxt.CssClass = "form-control my-1";
            typetxt.Text = type.Text;
            detailtxt.CssClass = "form-control my-1";
            detailtxt.Text = detail.Text;
            amounttxt.CssClass = "form-control my-1";
            amounttxt.Text = amount.Text;
            statustxt.CssClass = "form-control my-1";
            statustxt.Text = status.Text;
            deadlinetxt.CssClass = "form-control my-1";
            DateTime datet = Convert.ToDateTime(deadline.Text);
            deadlinetxt.Text = datet.ToString("yyyy-MM-dd HH:mm:ss"); 
            Update_btn.CssClass = "d-none";
            Delete_btn.CssClass = "d-none";
            Update.CssClass = "btn btn-primary";
            Cancel.CssClass = "btn btn-dark";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          
            //For Delete Btn
            var categoryid = Session["selected_category"];
            string end_date = " ";
            DateTime now = DateTime.Now;
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\ecms\ecms\App_Data\db_ecms.mdf;Integrated Security=True");
            conn.Open();
            string query = "select * from tbl_category where category_id=" + categoryid + "";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                end_date = rdr["category_end_date"].ToString();
            }

            if (Convert.ToDateTime(end_date) < Convert.ToDateTime(now))
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('You Cannot Delete this Category.Because Dead Line was Over')</script>");
                conn.Close();
            }
            else
            {
                rdr.Close();
                String deleteQuery = "delete from tbl_category where category_id="+categoryid+ "";
                SqlCommand ncmd = new SqlCommand(deleteQuery, conn);
                ncmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("~/ec-categories.aspx");
                
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            //For Update Btn
            var categoryid = Session["selected_category"];
            string end_date = " ";
            DateTime now = DateTime.Now;
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\ecms\ecms\App_Data\db_ecms.mdf;Integrated Security=True");
            conn.Open();
            string query = "select * from tbl_category where category_id=" + categoryid + "";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                end_date = rdr["category_end_date"].ToString();
            }
            rdr.Close();
            if (Convert.ToDateTime(end_date) < Convert.ToDateTime(now))
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('You Cannot Update this Category.Because Dead Line was Over')</script>");
                conn.Close();
            }
            else
            {
                string updquery = "update tbl_category set category_title=@title, category_type=@type, category_detail=@detail, amount=@amount, status=@status, category_updated_date=GETDATE(), category_end_date=@enddate where category_id=@catid";
                SqlCommand ncmd = new SqlCommand(updquery, conn);
                ncmd.Parameters.AddWithValue("@title", titletxt.Text);
                ncmd.Parameters.AddWithValue("@type", typetxt.Text);
                ncmd.Parameters.AddWithValue("@detail", detailtxt.Text);
                ncmd.Parameters.AddWithValue("@amount", amounttxt.Text);
                ncmd.Parameters.AddWithValue("@status", statustxt.Text);
                ncmd.Parameters.AddWithValue("@enddate", Convert.ToDateTime(deadlinetxt.Text));
                ncmd.Parameters.AddWithValue("@catid", Convert.ToInt32(categoryid));
                ncmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("~/category_detail.aspx");
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            title.Visible = true;
            type.Visible = true;
            detail.Visible = true;
            amount.Visible = true;
            status.Visible = true;
            deadline.Visible = true;

            titletxt.CssClass = "d-none";
            typetxt.CssClass = "d-none";
            detailtxt.CssClass = "d-none";
            amounttxt.CssClass = "d-none";
            statustxt.CssClass = "d-none";
            deadlinetxt.CssClass = "d-none";
            Update_btn.CssClass = "btn btn-warning";
            Delete_btn.CssClass = "btn btn-dark";
            Update.CssClass = "d-none";
            Cancel.CssClass = "d-none";
        }
    }
}