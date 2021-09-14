using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Data.Sql;

using BLL;

public partial class PgMasterEmployeeTransfer : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();
    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";
        if (!IsPostBack)
        {   
            ddlusclientnameLoad();
            txtdate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            DgTransferLoad();          
        }
    }

    private void DgTransferLoad()
    {
        DgTransfer.DataSource = ObjectBA.SelectEmployeeTransfer();
        DgTransfer.DataBind();
    }

    private void ddlusclientnameLoad()
    {
        ddlusclientname.Items.Clear();
        ddlusclientname.Items.Add("------ Select Client -----");
        ddlusclientname.DataSource = ObjectBA.SelectClinet();
        ddlusclientname.DataValueField = "CLIENTID";
        ddlusclientname.DataTextField = "CLIENTNAME";
        ddlusclientname.DataBind();
    }

    protected void ddlusclientname_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlusdepartmentLoad();
        ddlusgradenameLoad();
        ddldesignationLoad();
    }

    private void ddldesignationLoad()
    {
        ddldesignation.Items.Clear();
        ddldesignation.Items.Add("------- Select Designation -----");
        ddldesignation.DataSource = ObjectBA.SelectDesignationMasterID(ddlusclientname.SelectedValue);
        ddldesignation.DataTextField = "DESIGNATIONNAME";
        ddldesignation.DataValueField = "DESIGNATIONID";
        ddldesignation.DataBind();
    }

    private void ddlusgradenameLoad()
    {
        //ddlusgradename.Items.Clear();
        //ddlusgradename.Items.Add("------- Select Grade -------");
        //ddlusgradename.DataSource = ObjectBA.SelectSalaryDetailForUnit(ddlusclientname.SelectedValue);
        //ddlusgradename.DataTextField = "GRADE";
        //ddlusgradename.DataValueField = "SALARYID";
        //ddlusgradename.DataBind();
    }

    private void ddlusdepartmentLoad()
    {
        ddlusdepartment.Items.Clear();
        ddlusdepartment.Items.Add("-------- Select Department -----");
        ddlusdepartment.DataSource = ObjectBA.SelectDepartmentClnt(ddlusclientname.SelectedValue);
        ddlusdepartment.DataTextField = "DEPARTMENTNAME";
        ddlusdepartment.DataValueField = "DEPARTMENTID";
        ddlusdepartment.DataBind();

    }

    protected void txtemployeecode_TextChanged(object sender, EventArgs e)
    {
        txtemployeecodeGet();
    }

    private void txtemployeecodeGet()
    {        
        dt = new DataTable();
        dt = ObjectBA.SelectEmployeeCode(txtemployeecode.Text);
       
        if (dt.Rows.Count == 1)
        {
            EmpID.Text = dt.Rows[0]["EMPLOYEEID"].ToString();
            DptID.Text = dt.Rows[0]["DEPARTMENTID"].ToString();
            ClntID.Text = dt.Rows[0]["CLIENTID"].ToString();
            DesgID.Text= dt.Rows[0]["DESIGNATIONID"].ToString();

            txtemployeename.Text = dt.Rows[0]["APPLICATIONAME"].ToString();

            txtcsclientname.Text = dt.Rows[0]["CLIENTNAME"].ToString();
            txtcsdepartment.Text = dt.Rows[0]["DEPARTMENTNAME"].ToString();
            txtdesignation.Text = dt.Rows[0]["DESIGNATIONNAME"].ToString();
            txtcsjobtype.Text = dt.Rows[0]["JOBTYPE"].ToString();
        }
        con.Close();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (txtdate.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtdate.Focus();
        }
        else if (txtemployeecode.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the EmployeeCode')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtemployeecode.Focus();
        }

        else if (ddlusclientname.SelectedItem.Text.Trim()== "------ Select Client -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The ClientName')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlusclientname.Focus();
        }

        else if (ddlusdepartment.SelectedItem.Text.Trim() == "-------- Select Department -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Department')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlusdepartment.Focus();
        }

        else if (ddlusjobtype.SelectedItem.Text.Trim() == "----- Select Jobtype ------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the JobType')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true); ;
            ddlusjobtype.Focus();
        }

        else if (txtreasonfortransfer.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Reason For Transfer')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtreasonfortransfer.Focus();
        }
        else
        {
            if (btnsave.Text == "Save")
            {
                ObjectBA.InsertEmployeeTransfer(txtdate.Text, EmpID.Text, txtemployeecode.Text, ClntID.Text, DptID.Text,
                txtcsjobtype.Text, ddlusclientname.SelectedValue, ddlusdepartment.SelectedValue, ddlusjobtype.Text, txtreasonfortransfer.Text,DesgID.Text,ddldesignation.SelectedValue);
                UpdateEmployeeCompanyMaster();

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);

            }
            else
            {
                ObjectBA.UpdateEmployeeTransfer(TypeID.Text, txtdate.Text, EmpID.Text, txtemployeecode.Text, ClntID.Text, DptID.Text,
                txtcsjobtype.Text, ddlusclientname.SelectedValue, ddlusdepartment.SelectedValue, ddlusjobtype.Text, txtreasonfortransfer.Text, DesgID.Text, ddldesignation.SelectedValue);
                UpdateEmployeeCompanyMaster();

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            }

            DgTransferLoad();
            Clearnew();
            //System.Threading.Thread.Sleep(100);
            //string message = "alert('Data Save')";
            //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        }
        
    }

    private void UpdateEmployeeCompanyMaster()
    {
        ObjectBA.UpdateEmployeeTransferMaster(ddlusclientname.SelectedValue, ddlusdepartment.SelectedValue, EmpID.Text, ddlusjobtype.Text);
    }

    protected void DgTransfer_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label etTrans = DgTransfer.SelectedRow.FindControl("lblemptransid") as Label;

        Label etdate = DgTransfer.SelectedRow.FindControl("lblempdate") as Label;
        Label etemployeeid = DgTransfer.SelectedRow.FindControl("lbletemployeeid") as Label;
        Label etemployeecode = DgTransfer.SelectedRow.FindControl("lbletemployeecode") as Label;
        Label etapplicationname = DgTransfer.SelectedRow.FindControl("lbletapplicationname") as Label;
        Label etcurrentdepartmentname = DgTransfer.SelectedRow.FindControl("lbletcurrentdepartmentname") as Label;
        Label etcurrentclientname = DgTransfer.SelectedRow.FindControl("lbletcurrentclientname") as Label;
        Label etcurrentclientid = DgTransfer.SelectedRow.FindControl("lbletcurrentclientid") as Label;
        Label etcurrentdepartmentid = DgTransfer.SelectedRow.FindControl("lbletcurrentdepartmentid") as Label;

        Label etcurrentdesignationid = DgTransfer.SelectedRow.FindControl("lbletcurrentdesignationid") as Label;
        Label etcurrentdesignationname = DgTransfer.SelectedRow.FindControl("lbletcurrentdesignationname") as Label;

        Label etchangedesignationid = DgTransfer.SelectedRow.FindControl("lbletchangedesignationid") as Label;
        Label etchangedesignationname = DgTransfer.SelectedRow.FindControl("lbletchangedesignationname") as Label;

        Label etchangeclientname = DgTransfer.SelectedRow.FindControl("lbletchangeclientname") as Label;
        Label etchangeclientid = DgTransfer.SelectedRow.FindControl("lbletchangeclientid") as Label;
        Label etchangedepartmentid = DgTransfer.SelectedRow.FindControl("lbletchangedepartmentid") as Label;
        Label etchangedepartmentname = DgTransfer.SelectedRow.FindControl("lbletchangedepartmentname") as Label;
        Label lbletcurrentjobtype = DgTransfer.SelectedRow.FindControl("lbletcurrentjobtype") as Label;
        Label lbletchangejobtype = DgTransfer.SelectedRow.FindControl("lbletchangejobtype") as Label;

        Label lbletreason = DgTransfer.SelectedRow.FindControl("lbletreason") as Label;


        TypeID.Text = etTrans.Text;
        txtdate.Text = Convert.ToDateTime(etdate.Text).ToString("dd/MM/yyyy");
        EmpID.Text = etemployeeid.Text;
        txtemployeecode.Text = etemployeecode.Text;
        txtemployeename.Text = etapplicationname.Text;
        txtcsdepartment.Text = etcurrentdepartmentname.Text;
        txtdesignation.Text = etcurrentdesignationname.Text;
        txtcsclientname.Text = etcurrentclientname.Text;
        txtcsjobtype.Text= lbletcurrentjobtype.Text;
        ClntID.Text = etcurrentclientid.Text;
        DptID.Text = etcurrentdepartmentid.Text;
        ddlusclientname.SelectedValue = etchangeclientid.Text;
        ddlusdepartmentLoad();
        ddlusdepartment.SelectedValue = etchangedepartmentid.Text;
        ddldesignationLoad();
        ddldesignation.SelectedValue = etchangedesignationid.Text;
        ddlusgradenameLoad();
        ddlusjobtype.Text = lbletchangejobtype.Text;
        txtreasonfortransfer.Text = lbletreason.Text;
        btnsave.Text = "Update";
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    public void Clearnew()
    {   
        ddlusclientnameLoad();
        ddlusdepartment.Items.Clear();
        ddlusdepartment.Items.Add("-------- Select Department -----");
        ddldesignation.Items.Clear();
        ddldesignation.Items.Add("------Select Designation -------");
        ddlusjobtype.SelectedValue = "----- Select Jobtype ------";
        txtemployeecode.Text = "";
        txtemployeename.Text = "";
        txtcsclientname.Text = "";
        txtcsdepartment.Text = "";
        txtdesignation.Text = "";
        txtcsjobtype.Text = "";
        txtreasonfortransfer.Text = "";

        btnsave.Text = "Save";
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";
    }
}