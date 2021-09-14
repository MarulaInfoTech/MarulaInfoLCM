using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Data.Sql;
using Microsoft.Reporting.WebForms;

public partial class PayrollForms_PayrollReports_PgPayReport_Form_26 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();
    DataSet ds = new DataSet();
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();

    public string Errors = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //TypeId.Text = "0";
            ddlcompanynameLoad();            
        }
    }

    private void ddlcompanynameLoad()
    {
        ddlcompanyname.Items.Clear();
        ddlcompanyname.Items.Add("---Select Client Name---");
        ddlcompanyname.DataSource = ObjectBA.SelectClinet();
        ddlcompanyname.DataValueField = "CLIENTID";
        ddlcompanyname.DataTextField = "CLIENTNAME";
        ddlcompanyname.DataBind();
    }

    protected void ddlcompanyname_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = ObjectBA.SelectClientDetailID(ddlcompanyname.SelectedValue);
        txtdivisionname.Text = dt.Rows[0]["DIVISION"].ToString();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        if (ddlType.SelectedValue == "Report-26")
        {
            ReportFor26Form();
        }
        else
        {
            ReportForWage27Form();
        }
        
    }

    private void ReportForWage27Form()
    {
        GetEmployeeWageDetail();
        ReportViewer1.ProcessingMode = ProcessingMode.Local;
        ReportDataSource datasource = new ReportDataSource();
        if (ddlType.SelectedValue == "Report-27")
        {
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("Form-27 Report.rdlc");
            datasource = new ReportDataSource("Form27WageDataset", ds.Tables[0]);
        }
        else if (ddlType.SelectedValue == "Report-29")
        {
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("Form-29 Report.rdlc");
            datasource = new ReportDataSource("From29DataSet", ds.Tables[0]);
        }
        else if (ddlType.SelectedValue == "Report-28")
        {
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("Form-28 Report.rdlc");
            datasource = new ReportDataSource("PayslipDataSet", ds.Tables[0]);
        }
        else
        {
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("Form-23 Report.rdlc");
            datasource = new ReportDataSource("Form23DataSet", ds.Tables[0]);
        }
            
        
        ReportViewer1.LocalReport.DataSources.Clear();
        ReportViewer1.LocalReport.DataSources.Add(datasource);
        ReportViewer1.LocalReport.Refresh();
    }

    private void GetEmployeeWageDetail()
    {
        ds = new DataSet();
        ds = ObjectBA.SelectMonthlyPayrollForReportJ(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlcompanyname.SelectedValue);
    }

    private void ReportFor26Form()
    {
        GetEmployeeDetail();
        ReportViewer1.ProcessingMode = ProcessingMode.Local;
        ReportViewer1.LocalReport.ReportPath = Server.MapPath("Form-26 Report.rdlc");
        ReportDataSource datasource = new ReportDataSource("Report26DataSet", ds.Tables[0]);
        ReportViewer1.LocalReport.DataSources.Clear();
        ReportViewer1.LocalReport.DataSources.Add(datasource);
        ReportViewer1.LocalReport.Refresh();
    }

    private void GetEmployeeDetail()
    {
        ds = new DataSet();
        ds = ObjectBA.SelectReport26For(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlcompanyname.SelectedValue);
    }
}     