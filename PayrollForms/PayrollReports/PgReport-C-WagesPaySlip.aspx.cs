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


public partial class PayrollForms_APForm_PgReport_C_WagesPaySlip : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();

    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    //SqlConnection con = new SqlConnection("Server=WHYNOT;Database=SuryaOnline;user=sa;password=Whynot@94896;");
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddldepartment.Enabled = false;
            ddlemployeecode.Enabled = false;
            ddlcompanynameLoad();
        }
    }

    private void ddlcompanynameLoad()
    {
        ddlcompanyname.Items.Clear();
        ddlcompanyname.Items.Add("------ Select Client Name -------");
        ddlcompanyname.DataSource = ObjectBA.SelectClinet();
        ddlcompanyname.DataValueField = "CLIENTID";
        ddlcompanyname.DataTextField = "CLIENTNAME";
        ddlcompanyname.DataBind();
    }

    protected void btnreport_Click(object sender, EventArgs e)
    {
        PaySlipReport();
    } 

    private void PaySlipReport()
    {
        GetEmployeeDetail();
        ReportDataSource datasource = new ReportDataSource("DataSet1", ds.Tables[0]);
        PaySlipReportViewer.LocalReport.DataSources.Clear();
        PaySlipReportViewer.LocalReport.DataSources.Add(datasource);
        PaySlipReportViewer.LocalReport.Refresh();
    }

    private void GetEmployeeDetail()
    {
        //ds = new DataSet();
        //ds = ObjectBA.SelectMonthlyPaySlip(ddlcompanyname.SelectedValue, Convert.ToDateTime(txtfromdate.Text).ToShortDateString(),
        //    Convert.ToDateTime(txttodate.Text).ToShortDateString(), txtemployeename.Text, ddldepartment.SelectedValue);
    }

    protected void Chbx1_CheckedChanged(object sender, EventArgs e)
    {
        if (ChkDept.Checked == true)
        {
            ddldepartment.Enabled = true;
            ddldepartmentLoad();
        }
        else
        {
            ddldepartment.Enabled = false;
            ddldepartment.Items.Clear();
            ddldepartment.Items.Add("---Department---");
        }
    }

    private void ddldepartmentLoad()
    {
        ddldepartment.Items.Clear();
        ddldepartment.Items.Add("---Department---");
        ddldepartment.DataSource = ObjectBA.SelectDepartmentClnt(ddlcompanyname.SelectedValue);
        ddldepartment.DataTextField = "DEPARTMENTNAME";
        ddldepartment.DataValueField = "DEPARTMENTID";
        ddldepartment.DataBind();
    }

    protected void chkEmpCode_CheckedChanged(object sender, EventArgs e)
    {
        if (chkEmpCode.Checked == true)
        {
            ddlemployeecode.Enabled = true;
            ddlemployeecodeLoad();
        }
        else
        {
            ddlemployeecode.Enabled = false;
            ddlemployeecode.Items.Clear();
            ddlemployeecode.Items.Add("--Employee Code--");
        }
    }

    private void ddlemployeecodeLoad()
    {
        ddlemployeecode.Items.Clear();
        ddlemployeecode.Items.Add("--Employee Code--");
        ddlemployeecode.DataSource = ObjectBA.SelectEmployeeCodeOnUnit(ddlcompanyname.SelectedValue);
        ddlemployeecode.DataTextField = "EMPLOYEECODE";
        ddlemployeecode.DataValueField = "EMPLOYEEID";
        ddlemployeecode.DataBind();
    }
}