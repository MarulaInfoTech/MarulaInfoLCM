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

public partial class PayrollForms_Account_CashOutReport : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        GetStatementDetail();
        ReportViewerCashOut.ProcessingMode = ProcessingMode.Local;
        ReportViewerCashOut.LocalReport.ReportPath = Server.MapPath("CashOutReport.rdlc");
        ReportDataSource datasource = new ReportDataSource("CashOutDataSet", ds.Tables[0]);
        ReportViewerCashOut.LocalReport.DataSources.Clear();
        ReportViewerCashOut.LocalReport.DataSources.Add(datasource);
        ReportViewerCashOut.DataBind();
    }

    private void GetStatementDetail()
    {
        ds = new DataSet();
        ds = ObjectBA.SelectCashOutDetailReport();
    }
}