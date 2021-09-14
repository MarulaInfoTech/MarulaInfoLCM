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

public partial class PayrollForms_DumReport : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();
    DataSet ds = new DataSet();
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();
 

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlclientnameLoad();
        }
    }

    private void ddlclientnameLoad()
    {
        ddlclientname.Items.Clear();
        ddlclientname.Items.Add("--- Select Client Name ---");
        ddlclientname.DataSource = ObjectBA.SelectClinet();
        ddlclientname.DataValueField = "CLIENTID";
        ddlclientname.DataTextField = "CLIENTNAME";
        ddlclientname.DataBind();
    }

    protected void ddlclientname_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = ObjectBA.SelectClientDetailID(ddlclientname.SelectedValue);
        txtdivisionname.Text = dt.Rows[0]["DIVISION"].ToString();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        if (ddlselectreport.SelectedValue == "Forms-25")
        {
            ResportForm25();
        }
        else
        {
            ReportForms();
        }
    }

    private void GetEmployeeDetail()
    {
        ds = new DataSet();
        ds = ObjectBA.Attendance12and25ForReportJSelect(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString(),ddlclientname.SelectedValue);
    }

    public void FormB()
    {
        ds = new DataSet();
        ds = ObjectBA.FormBReportSelect(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlclientname.SelectedValue);
    }

    public void AllEmployeeDetails()
    {
        dt = new DataTable();
        dt = ObjectBA.SelectCompanyDetailEditClient(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlclientname.SelectedItem.Text);
    }


    public void ResportForm25()
    {
        GetEmployeeDetail();
        ReportViewer1.ProcessingMode = ProcessingMode.Local;
        ReportViewer1.LocalReport.ReportPath = Server.MapPath("Form-25 Report.rdlc");
        ReportDataSource datasource = new ReportDataSource("Report25DataSet", ds.Tables[0]);
        ReportViewer1.LocalReport.DataSources.Clear();
        ReportViewer1.LocalReport.DataSources.Add(datasource);
        ReportViewer1.LocalReport.Refresh();
    }

    public void ReportForms()
    {
        //AllEmployeeDetails();
        ReportViewer1.ProcessingMode = ProcessingMode.Local;
        ReportDataSource datasource = new ReportDataSource();

        if (ddlselectreport.SelectedValue == "Forms-B")
        {
            FormB();
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("Form-B Report.rdlc");
            datasource = new ReportDataSource("FormBDataset", ds.Tables[0]);

        }

        else if (ddlselectreport.SelectedValue == "Forms-1")
        {
            AllEmployeeDetails();
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("Form-1 Report.rdlc");
            datasource = new ReportDataSource("Form15", dt);
           
        }

        else if (ddlselectreport.SelectedValue == "Forms-12")
        {
            AllEmployeeDetails();
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("Form-12 Report.rdlc");
            datasource = new ReportDataSource("Form12", dt);
        }
        else if (ddlselectreport.SelectedValue == "Forms-25-B")
        {
            AllEmployeeSalaryDetail();
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("Form-25-B Report.rdlc");
            datasource = new ReportDataSource("PayslipDataSet", ds.Tables[0]);
        }
        else if (ddlselectreport.SelectedValue == "Forms-15")
        {
            AllEmployeeSalaryDetail();
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("Form-15 Report.rdlc");
            datasource = new ReportDataSource("FormNo15DataSet", ds.Tables[0]);
        }
        ReportViewer1.LocalReport.DataSources.Clear();
        ReportViewer1.LocalReport.DataSources.Add(datasource);
        ReportViewer1.LocalReport.Refresh();


    }

    private void AllEmployeeSalaryDetail()
    {
        ds = new DataSet();
        ds = ObjectBA.SelectMonthlyPaySlip(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlclientname.SelectedValue);
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        txtfromdate.Text = "";
        txttodate.Text = "";
        txtdivisionname.Text = "";

        ddlclientname.Items.Clear();
        ddlclientname.Items.Add("--- Select Client Name ---");
        ddlclientnameLoad();

        ddlselectreport.SelectedIndex = 0;

        ReportViewer1.LocalReport.DataSources.Clear();
        ReportViewer1.DataBind();

    }
}