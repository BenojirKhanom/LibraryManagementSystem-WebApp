using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication_pro.Working
{
  
    public partial class BookEntry : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source =.\\SQLEXPRESS;Initial Catalog = AspProject; Integrated Security = True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            FileUpload1.SaveAs(Server.MapPath("~/Images/" + FileUpload1.FileName));
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
          
            cmd.CommandText = @"insert into Book  ([BookName]
           ,[AuthorName]
           ,[CoverPage]
           ,[CoverPicName]
           ,[CategoryId]) values('" + txtBookName.Text + "','" + txtAuthorName.Text + "','"+"~/Images/"+FileUpload1.FileName+"','"+ FileUpload1.FileName + "', '" + DropDownList1.SelectedValue + "')";
            cmd.ExecuteNonQuery();
            con.Close();

            DetailsView1.DataBind();





  
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {

        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {

            //fuUpdate

           FileUpload fu =   (FileUpload) DetailsView1.FindControl("fuUpdate");

            fu.SaveAs(Server.MapPath("~/Images/" + fu.FileName));

            SqlDataSource2.UpdateParameters["CoverPage"].DefaultValue = "~/Images/" + fu.FileName;
            SqlDataSource2.UpdateParameters["CoverPicName"].DefaultValue = fu.FileName;

        }

        
    }
}