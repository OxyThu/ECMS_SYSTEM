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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PasswordTxt.Attributes["type"] = "password";
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            string student_email = EmailTxt.Text;
            string password= PasswordTxt.Text;
            string user_id = "";
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\ecms\ecms\App_Data\db_ecms.mdf;Integrated Security=True");
            conn.Open();
            string query = "select student_id from tbl_student where email=@email and password=@password";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@email", student_email);
            cmd.Parameters.AddWithValue("@password", password);

            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                user_id = rdr["student_id"].ToString();
            }

            if(user_id == "")
            {
                errorMessage.Text = "Incorrect Email or Password";
                errorMessage.CssClass = "d-inline p-2";
            }
            else
            {
                errorMessage.CssClass = "d-none";
                Session["login_user"] = user_id;
                Session["switch"] = "normal";
                Response.Redirect("~/index.aspx");
            }

            conn.Close();
            
        }

        protected void EmailTxt_TextChanged(object sender, EventArgs e)
        {
            errorMessage.CssClass = "d-none";
        }

        protected void PasswordTxt_TextChanged(object sender, EventArgs e)
        {
            errorMessage.CssClass = "d-none";
        }
    }
}