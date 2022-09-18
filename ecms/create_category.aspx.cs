using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace ecms
{
    public partial class create_category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login_user"] == null)
            {
                Response.Redirect("~/login.aspx");
                return;
            }
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\db_ecms.mdf;Integrated Security=True");
            conn.Open();
            string query = "INSERT INTO tbl_category(category_title,category_type,category_detail,amount,status,category_created_date,category_updated_date,category_end_date) VALUES(@title, @type, @detail,@amount,@status,GETDATE(),GETDATE(),@end)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@title", TitleTxt.Text);
            cmd.Parameters.AddWithValue("@type", Type.Text);
            cmd.Parameters.AddWithValue("@detail", DetailTxt.Text);
            cmd.Parameters.AddWithValue("@amount", AmountTxt.Text);
            cmd.Parameters.AddWithValue("@status", StatusTxt.Text);
            cmd.Parameters.AddWithValue("@end", Convert.ToDateTime(DateTxt.Text));
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("~/ec-categories.aspx");
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            TitleTxt.Text = "";
            Type.Text = "";
            DetailTxt.Text = "";
            AmountTxt.Text = "";
            StatusTxt.Text = "";
            DateTxt.Text = "";
            
        }
    }
}