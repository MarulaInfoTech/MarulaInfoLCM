using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.Reporting.WebForms;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Data.Sql;
using BLL;
using System.IO;

public partial class PayrollForms_Account_CashInReport : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();

    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    //SqlConnection con = new SqlConnection("Server=WHYNOT;Database=SuryaOnline;user=sa;password=Whynot@94896;");
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        GetStatementDetail();
        ReportViewerCashInReport.ProcessingMode = ProcessingMode.Local;
        ReportViewerCashInReport.LocalReport.ReportPath = Server.MapPath("CashInRoport.rdlc");
        ReportDataSource datasource = new ReportDataSource("CashInDataSet", ds.Tables[0]);
        ReportViewerCashInReport.LocalReport.DataSources.Clear();
        ReportViewerCashInReport.LocalReport.DataSources.Add(datasource);
        ReportViewerCashInReport.DataBind();
    }

    private void GetStatementDetail()
    {
        ds = new DataSet();
        ds = ObjectBA.SelectCashInDetailReport();
    }
}