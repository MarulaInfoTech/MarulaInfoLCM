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

public partial class PayrollForms_APForm_PgReport_C_MonthlyAttendanceReport : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();

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

    protected void btnreport_Click(object sender, EventArgs e)
    {
        DgReportCGenLoad();
    }

    private void DgReportCGenLoad()
    {
        DgReportCGen.DataSource = ObjectBA.SelectMonthlyAttendanceExport(ddlcompanyname.SelectedValue, Convert.ToDateTime(txttodate.Text).ToShortDateString());
        DgReportCGen.DataBind();
    }

    protected void ddlcompanyname_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = ObjectBA.SelectClientDetailID(ddlcompanyname.SelectedValue);
        txtdivisionname.Text = dt.Rows[0]["DIVISION"].ToString();
    }
}