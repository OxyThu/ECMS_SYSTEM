using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ecms
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime now = DateTime.Now;
            datetime.Text = now.ToString();
            var userid = Session["login_user"];
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\ecms\ecms\App_Data\db_ecms.mdf;Integrated Security=True");
            conn.Open();
            string query = "select * from tbl_student where student_id=@stuid";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@stuid", userid);
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                ProfileLink.Text = rdr["name"].ToString();
                Session["stu_type"]= rdr["student_type"].ToString();                       
            }
  
            if (Session["stu_type"].ToString() == "normal")
            {
                ToEC.CssClass = "d-none";
                ToNormal.CssClass = "d-none";
                Categories_link.NavigateUrl = "~/index.aspx";
            }
            else if (Session["stu_type"].ToString()  == "ec")
            {
                if (Session["switch"].ToString() == "normal")
                {
                    ToEC.CssClass = "nav_link d-block";
                    ToNormal.CssClass = "d-none";
                    Categories_link.NavigateUrl = "~/index.aspx";
                }
                else
                {
                    ToEC.CssClass = "d-none";
                    ToNormal.CssClass = "nav_link d-block";
                    Categories_link.NavigateUrl = "~/ec-categories.aspx";
               }
            }
            conn.Close();
        }

        protected void ToEC_Click(object sender, EventArgs e)
        {
            Session["switch"] = "ec";
            ToEC.CssClass = "d-none";
            Categories_link.NavigateUrl = "~/ec-categories.aspx";
            Response.Redirect("ec-categories.aspx");
        }

        protected void ToNormal_Click(object sender, EventArgs e)
        {
            Session["switch"] = "normal";
            ToNormal.CssClass = "d-none";
            Categories_link.NavigateUrl = "~/index.aspx";
            Response.Redirect("index.aspx");
        }
    }
}