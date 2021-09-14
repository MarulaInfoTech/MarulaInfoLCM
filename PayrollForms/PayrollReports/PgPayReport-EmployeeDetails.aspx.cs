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


public partial class PayrollForms_PayrollReports_PgPayReport_EmployeeDetails : System.Web.UI.Page
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
            //EmployeeCompanyDetailReport();
            ddlclientnameLoad();
            ddldesignationLoad();
        }
    }

    private void ddldesignationLoad()
    {
        ddldesignation.Items.Clear();
        ddldesignation.Items.Add("------ Select Designation -------");
        ddldesignation.DataSource = ObjectBA.SelectDesignation();
        ddldesignation.DataTextField = "DESIGNATIONNAME";
        ddldesignation.DataValueField = "DESIGNATIONID";
        ddldesignation.DataBind();
    }

    private void ddlclientnameLoad()
    {
        ddlclientname.Items.Clear();
        ddlclientname.Items.Add("------ Select Client Name -------");
        ddlclientname.DataSource = ObjectBA.SelectClinet();
        ddlclientname.DataValueField = "CLIENTID";
        ddlclientname.DataTextField = "CLIENTNAME";
        ddlclientname.DataBind();
    }

    private void EmployeeCompanyDetailReport()
    {
        GetEmployeeDetail();
        ReportDataSource datasource = new ReportDataSource("EmployeeDetailDataset", ds.Tables[0]);
        EmployeeDetailReport.LocalReport.DataSources.Clear();
        EmployeeDetailReport.LocalReport.DataSources.Add(datasource);
        EmployeeDetailReport.LocalReport.Refresh();

    }

    private void GetEmployeeDetail()
    {
        //        con.Close();
        //        con.Open();
        //        string Empcode = @"SELECT         dbo.EmployeeCompanyDetail.EMPLOYEECODE, dbo.EmployeeApplication.APPLICATIONAME, dbo.EmployeeApplication.GENDER, dbo.EmployeeApplication.DOB, 
        //                         dbo.EmployeeApplication.FATHERNAME, dbo.EmployeeApplication.MOTHERNAME, dbo.EmployeeApplication.MARTIALSTATUS, dbo.EmployeeApplication.SPOUSENAME, 
        //                         dbo.EmployeeApplication.GUARDIANNAME, dbo.EmployeeApplication.PERMANENTNOANDSTREET, dbo.EmployeeApplication.PERMANENTTOWN, dbo.CityMaster.CITYNAME AS PERMANENTCITYNAME, 
        //                         dbo.StateMaster.STATENAME AS PERMANENTSTATENAME, dbo.EmployeeApplication.PERMANENTPINCODE, dbo.EmployeeApplication.PRESENTNOANDSTREET, dbo.EmployeeApplication.PRESENTTOWN, 
        //                         CityMaster_1.CITYNAME AS PRESENTCITYNAME, StateMaster_1.STATENAME AS PRESENTSTATENAME, dbo.EmployeeApplication.PRESENTPINCODE, dbo.EmployeeApplication.EDUCATIONCAT, 
        //                         dbo.EmployeeApplication.QUALIFICATION, dbo.EmployeeApplication.COURSE, dbo.EmployeeApplication.BLOODGROUP, dbo.EmployeeApplication.MOBILENO1, dbo.EmployeeApplication.MOBILENO2, 
        //                         dbo.EmployeeApplication.ADHARNO, dbo.EmployeeApplication.PANNO, dbo.EmployeeApplication.EMAIL, dbo.EmployeeCompanyDetail.DATEOFJOIN, dbo.EmployeeCompanyDetail.JOBTYPE, 
        //                         dbo.EmployeeCompanyDetail.JOBCATEGORY, dbo.ClientDetail.CLIENTNAME, dbo.DepartmentMaster.DEPARTMENTNAME, dbo.DesignationMaster.DESIGNATIONNAME, dbo.SalaryMaster.GRADE, 
        //                         dbo.EmployeeCompanyDetail.WAGEPERDAY, dbo.EmployeeCompanyDetail.BASICDA, dbo.EmployeeCompanyDetail.HRA, dbo.EmployeeCompanyDetail.CONVEYANCE, dbo.EmployeeCompanyDetail.WASHING, 
        //                         dbo.EmployeeCompanyDetail.OTHER, dbo.EmployeeCompanyDetail.TOTALPERHOUR, dbo.EmployeeCompanyDetail.OTAMOUNT, dbo.EmployeeCompanyDetail.CONTRACTORS, dbo.PFMASTER.PFNAME, 
        //                         dbo.ESIMASTER.ESINAME, dbo.EmployeeCompanyDetail.SALARYTYPE, dbo.EmployeeCompanyDetail.UANNO, dbo.EmployeeCompanyDetail.PFNO, dbo.EmployeeCompanyDetail.ESINO, 
        //                         dbo.EmployeeCompanyDetail.SALARYISSUETYPE, dbo.EmployeeCompanyDetail.BANKNAME, dbo.EmployeeCompanyDetail.BRANCH, dbo.EmployeeCompanyDetail.IFSCCODE, 
        //                         dbo.EmployeeCompanyDetail.ACCOUNTNO
        //FROM            dbo.StateMaster INNER JOIN
        //                         dbo.CityMaster ON dbo.StateMaster.STATEID = dbo.CityMaster.STATEID INNER JOIN
        //                         dbo.EmployeeApplication INNER JOIN
        //                         dbo.EmployeeCompanyDetail ON dbo.EmployeeApplication.APPLICATIONID = dbo.EmployeeCompanyDetail.APPLICATIONID ON dbo.CityMaster.CITYID = dbo.EmployeeApplication.PERMANENTCITY INNER JOIN
        //                         dbo.CityMaster AS CityMaster_1 ON dbo.EmployeeApplication.PRESENTCITY = CityMaster_1.CITYID INNER JOIN
        //                         dbo.StateMaster AS StateMaster_1 ON CityMaster_1.STATEID = StateMaster_1.STATEID INNER JOIN
        //                         dbo.ClientDetail ON dbo.EmployeeCompanyDetail.CLIENTID = dbo.ClientDetail.CLIENTID INNER JOIN
        //                         dbo.DepartmentMaster ON dbo.EmployeeCompanyDetail.DEPARTMENTID = dbo.DepartmentMaster.DEPARTMENTID INNER JOIN
        //                         dbo.DesignationMaster ON dbo.EmployeeCompanyDetail.DESIGNATIONID = dbo.DesignationMaster.DESIGNATIONID INNER JOIN
        //                         dbo.SalaryMaster ON dbo.EmployeeCompanyDetail.SALARYGRADE = dbo.SalaryMaster.SALARYID INNER JOIN
        //                         dbo.PFMASTER ON dbo.EmployeeCompanyDetail.PFID = dbo.PFMASTER.PFID INNER JOIN
        //                         dbo.ESIMASTER ON dbo.EmployeeCompanyDetail.ESIID = dbo.ESIMASTER.ESIID";
        //        da = new SqlDataAdapter(Empcode, con);
        string Dept, desg = "";
        if (ddldepartment.SelectedValue == "------ Select Department -------")
        { Dept = ""; }
        else
        { Dept = ddldepartment.Text; }
        if (ddldesignation.SelectedValue == "------ Select Designation -------")
        { desg = ""; }
        else
        { desg = ddldesignation.Text; }
        ds = new DataSet();
        ds = ObjectBA.SelectEmployeeReport(txtfromdate.Text, txttodate.Text, ddlclientname.SelectedValue, Dept, desg);
        //da.Fill(ds);
        //if (dt.Rows.Count > 0)
        //{

        //}
        con.Close();
    }



    protected void ddlclientname_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddldepartment.Items.Clear();
        ddldepartment.Items.Add("------ Select Department -------");
        ddldepartment.DataSource = ObjectBA.SelectDepartmentClnt(ddlclientname.SelectedValue);
        ddldepartment.DataTextField = "DEPARTMENTNAME";
        ddldepartment.DataValueField = "DEPARTMENTID";
        ddldepartment.DataBind();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        EmployeeCompanyDetailReport();
    }
}