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
    public partial class profile : System.Web.UI.Page
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
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\ecms\ecms\App_Data\db_ecms.mdf;Integrated Security=True");
            conn.Open();
            string query = "select * from tbl_student where student_id=@stuid";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@stuid", userid);
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                RollNo.Text = rdr["roll_no"].ToString();
                Name.Text = rdr["name"].ToString();
                Major.Text = rdr["major"].ToString();
                Year.Text = rdr["year"].ToString();
                Class.Text = rdr["class"].ToString();
                Phone.Text = rdr["phone_no"].ToString();
                Email.Text = rdr["email"].ToString();
                string img = rdr["image_url"].ToString();
                if (img == null)
                    {
                        defaultImg.CssClass = "profileImg";
                        profileImg.CssClass = "d-none";
                    }
                    else
                    {
                        profileImg.ImageUrl = img;
                        defaultImg.CssClass = "d-none";
                        profileImg.CssClass = "profileImg";
                    }
            }

            SqlDataSource1.SelectCommand = "select distinct tc.category_id,tc.category_title,tc.category_type,tc.amount, tj.status, tc.category_end_date from tbl_joined tj join tbl_category tc on tj.category_id = tc.category_id where tj.student_id = "+userid+"";

            conn.Close();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void rowCommand(object sender, GridViewCommandEventArgs e)
        {
            var userid = Session["login_user"];
            string category_status = " ";
            string end_date = " ";
            DateTime now = DateTime.Now;
            // If multiple ButtonField column fields are used, use the
            // CommandName property to determine which button was clicked.
            if (e.CommandName == "unjoin")
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
                string query = "select tc.category_end_date as end_date, tj.status as status from tbl_joined tj join tbl_category tc on tj.category_id = tc.category_id where tc.category_id = " + categoryid + " and tj.student_id = "+userid+"";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    category_status = rdr["status"].ToString();
                    end_date = rdr["end_date"].ToString();
                }
                if(category_status.ToString()=="pay" )
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('You Cannot UnJoin this Category. You Can Join your EC')</script>");
                    conn.Close();
                }else if (Convert.ToDateTime(end_date) <= Convert.ToDateTime(now))
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('You Cannot UnJoin this Category. You Can Join your EC')</script>");
                    conn.Close();
                }
                else
                {
                    rdr.Close();
                    string deleteQuery = "delete from tbl_joined where category_id="+categoryid+" and student_id="+userid+"";
                    SqlCommand deleteCmd = new SqlCommand(deleteQuery, conn);
                    deleteCmd.ExecuteNonQuery();
                    Response.Redirect(Request.RawUrl);
                }
                conn.Close();
                
            }
        }

        protected void Open_Form_Click(object sender, EventArgs e)
        {
            Name.Visible = false;
            Phone.Visible = false;
            Email.Visible = false;
            NameTxt.CssClass = "d-block";
            NameTxt.Text = Name.Text;
            PhoneTxt.CssClass = "d-block";
            PhoneTxt.Text = Phone.Text;
            EmailTxt.CssClass = "d-block";
            EmailTxt.Text = Email.Text;
            Open_Form.CssClass = "d-none";
            profileLabel.CssClass = "d-inline";
            FileUpload1.CssClass = "form-control w-50";
            Logout.CssClass = "d-none";
            Update.CssClass = "btn btn-primary";
            Cancel.CssClass = "btn btn-dark";
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            string student_email = Email.Text;
            string update_name = NameTxt.Text;
            string update_phone = PhoneTxt.Text;
            string update_email = EmailTxt.Text;
            string filename = FileUpload1.FileName.ToString();
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\ecms\ecms\App_Data\db_ecms.mdf;Integrated Security=True");
            conn.Open();
            SqlCommand check_User_ID = new SqlCommand("select student_id from tbl_student where ([email] = '" + update_email + "') ", conn);
            SqlDataAdapter da = new SqlDataAdapter(check_User_ID);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0 && student_email != update_email)
            {
                error_email.Text = "Email Already Exist";
                error_email.CssClass = "text-white m-2";
                conn.Close();
            }
            else
            {
                error_email.CssClass = "d-none";
                if (filename == "")
                {
                    string updatequery = "update tbl_student set name=@name,phone_no=@phone,email=@UpdateEmail where email =@oldEmail";
                    SqlCommand cmd = new SqlCommand(updatequery, conn);
                    cmd.Parameters.AddWithValue("@name", update_name);
                    cmd.Parameters.AddWithValue("@phone", update_phone);
                    cmd.Parameters.AddWithValue("@UpdateEmail", update_email);
                    cmd.Parameters.AddWithValue("@oldEmail", student_email);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect(Request.RawUrl);
                }
                else
                {
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/asset/img/") + filename);
                    string updatequery = "update tbl_student set name=@name,phone_no=@phone,email=@UpdateEmail,image_url=@image where email =@oldEmail";
                    SqlCommand cmd = new SqlCommand(updatequery, conn);
                    cmd.Parameters.AddWithValue("@name", update_name);
                    cmd.Parameters.AddWithValue("@phone", update_phone);
                    cmd.Parameters.AddWithValue("@UpdateEmail", update_email);
                    cmd.Parameters.AddWithValue("@oldEmail", student_email);
                    cmd.Parameters.AddWithValue("@image", "~/asset/img/" + filename);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect(Request.RawUrl);
                }
            }
           
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Name.Visible = true;
            Phone.Visible = true;
            Email.Visible = true;
            NameTxt.CssClass = "d-none";
            PhoneTxt.CssClass = "d-none";
            EmailTxt.CssClass = "d-none";
            profileLabel.CssClass = "d-none";
            FileUpload1.CssClass = "d-none";
            Open_Form.CssClass = "btn btn-primary";
            Logout.CssClass = "btn btn-dark";
            Update.CssClass = "d-none";
            Cancel.CssClass = "d-none";
            error_email.CssClass = "d-none";
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["login_user"] = "";
            Response.Redirect("~/login.aspx");
        }
    }
}