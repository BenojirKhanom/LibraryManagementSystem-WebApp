using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_pro.Report
{
    public partial class Report : System.Web.UI.Page
    {
     

        protected void Page_Load(object sender, EventArgs e)
        {
            
            DataSet ds = getData();
            //ds.WriteXml(@"D:\New folder\WebApplication-pro\WebApplication-pro\Report\Report.xsd", XmlWriteMode.WriteSchema);

            ReportDocument rd = new ReportDocument();
            rd.Load(Server.MapPath("~/Report/CrystalReport1.rpt"));
            rd.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = rd;
        }

        private DataSet getData()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AspProjectConnectionString"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter())
                {
                    string sql = @"  select * from Book ";


                            da.SelectCommand = new SqlCommand(sql, conn);
                             da.SelectCommand.CommandType = CommandType.Text;


                    DataSet ds = new DataSet();
                    da.Fill(ds, "BookWithCategory");

                   

                    return ds;

                }
            }
        }
    }
}