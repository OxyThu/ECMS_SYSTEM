using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ecms
{
    public partial class update_category : System.Web.UI.Page
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
                var categoryid = Session["selected_category"];
                SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\db_ecms.mdf;Integrated Security=True");
                conn.Open();
                string query = "select * from tbl_category where category_id="+categoryid+"";
                SqlCommand ncmd = new SqlCommand(query, conn);
                SqlDataReader rdr = ncmd.ExecuteReader();
                while (rdr.Read())
                {
                    TitleLabel.Text = rdr["category_title"].ToString();
                    TypeLabel.Text = rdr["category_type"].ToString();
                    DetailLabel.Text = rdr["category_detail"].ToString();
                    AmountLabel.Text = rdr["amount"].ToString();
                    StatusLabel.Text = rdr["status"].ToString();
                    DateLabel.Text = rdr["category_end_date"].ToString();
                }
                conn.Close();
            }
           
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            

            var categoryid = Session["selected_category"];
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\db_ecms.mdf;Integrated Security=True");
            conn.Open();
            string updquery = "update tbl_category set category_title=@title, category_type=@type, category_detail=@detail, amount=@amount, status=@status, category_updated_date=GETDATE(), category_end_date=@enddate where category_id=@catid";
            SqlCommand ncmd = new SqlCommand(updquery, conn);
            ncmd.Parameters.AddWithValue("@title", TitleTxt.Text);
            ncmd.Parameters.AddWithValue("@type", Type.Text);
            ncmd.Parameters.AddWithValue("@detail", DetailTxt.Text);
            ncmd.Parameters.AddWithValue("@amount", AmountTxt.Text);
            ncmd.Parameters.AddWithValue("@status", StatusTxt.Text);
            ncmd.Parameters.AddWithValue("@enddate", Convert.ToDateTime(DateTxt.Text));
            ncmd.Parameters.AddWithValue("@catid", Convert.ToInt32(categoryid));
            ncmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("~/category_detail.aspx");
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

        public void BackBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/category_detail.aspx");
        }

        public void open_form_Click(object sender, EventArgs e)
        {
            TitleTxt.CssClass = "form-control";
            Type.CssClass = "form-control";
            DetailTxt.CssClass = "form-control";
            AmountTxt.CssClass = "form-control";
            StatusTxt.CssClass = "form-control";
            DateTxt.CssClass = "form-control";
            TitleLabel.CssClass = "d-none";
            TypeLabel.CssClass = "d-none";
            DetailLabel.CssClass = "d-none";
            AmountLabel.CssClass = "d-none";
            StatusLabel.CssClass = "d-none";
            DateLabel.CssClass = "d-none";
        }

        protected void open_btn_Click(object sender, EventArgs e)
        {
            Response.Write("hi");
        }
    }
}