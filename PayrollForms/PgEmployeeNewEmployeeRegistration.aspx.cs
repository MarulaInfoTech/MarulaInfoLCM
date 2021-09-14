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

public partial class PgEmployeeNewEmployeeRegistration : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();
    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    //SqlConnection con = new SqlConnection("Server=WHYNOT;Database=SuryaOnline;user=sa;password=Whynot@94896;");
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        //hidcurrenttab.Value = "1";
        
        if (!IsPostBack)
        {
            ddlepdjobunitLoad();
            ddlpfstateLoad();
            ddlesistateLoad();
            ddlapplicationnoLoad();
            
            ddlepdpfeligibleLoad();
            ddlepdesieligibleLoad();
            txtpfemployeestatus.Text = "Working";
            txtpfemployeestatus.ReadOnly = true;
            txtemployeeno.Text = "Dont Entry";
            txtemployeeno.ReadOnly = true;
        }
    }
    private void ddlepdesieligibleLoad()
    {
        ddlepdesieligible.Items.Clear();
        ddlepdesieligible.Items.Add("-------- Select ESI ------");
        ddlepdesieligible.DataSource = ObjectBA.SelectESIDetail();
        ddlepdesieligible.DataTextField = "ESINAME";
        ddlepdesieligible.DataValueField = "ESIID";
        ddlepdesieligible.DataBind();
    }

    private void ddlepdpfeligibleLoad()
    {
        ddlepdpfeligible.Items.Clear();
        ddlepdpfeligible.Items.Add("------ Select PF --------");
        ddlepdpfeligible.DataSource = ObjectBA.SelectPFDetail();
        ddlepdpfeligible.DataTextField = "PFNAME";
        ddlepdpfeligible.DataValueField = "PFID";
        ddlepdpfeligible.DataBind();
    }

    private void ddlepddesignationLoad()
    {
        ddlepddesignation.Items.Clear();
        ddlepddesignation.Items.Add("------- Select Designation ------");
        ddlepddesignation.DataSource = ObjectBA.SelectDesignationMasterID(ddlepdjobunit.SelectedValue);
        ddlepddesignation.DataTextField = "DESIGNATIONNAME";
        ddlepddesignation.DataValueField = "DESIGNATIONID";
        ddlepddesignation.DataBind();
    }

    private void ddlapplicationnoLoad()
    {
        ddlapplicationno.Items.Clear();
        ddlapplicationno.Items.Add("---Select Application---");
        ddlapplicationno.DataSource = ObjectBA.SelectApplicationNoDetail();
        ddlapplicationno.DataTextField = "APPLICATIONNO";
        ddlapplicationno.DataValueField = "APPLICATIONID";
        ddlapplicationno.DataBind();
    }

    private void ddlesistateLoad()
    {
        ddlesistate.Items.Clear();
        ddlesistate.Items.Add("--------- Select State ----");
        ddlesistate.DataSource = ObjectBA.SelectStateMaster();
        ddlesistate.DataTextField = "STATENAME";
        ddlesistate.DataValueField = "STATEID";
        ddlesistate.DataBind();
    }

    private void ddlpfstateLoad()
    {
        ddlpfstate.Items.Clear();
        ddlpfstate.Items.Add("------- Select State --------");
        ddlpfstate.DataSource = ObjectBA.SelectStateMaster();
        ddlpfstate.DataTextField = "STATENAME";
        ddlpfstate.DataValueField = "STATEID";
        ddlpfstate.DataBind();
    }

    private void ddlepddepartmentLoad()
    {
        ddlepddepartment.Items.Clear();
        ddlepddepartment.Items.Add("-------- Select Department -----");
        ddlepddepartment.DataSource = ObjectBA.SelectDepartmentClnt(ddlepdjobunit.SelectedValue);
        ddlepddepartment.DataTextField = "DEPARTMENTNAME";
        ddlepddepartment.DataValueField = "DEPARTMENTID";
        ddlepddepartment.DataBind();
    }

    private void ddlepdjobunitLoad()
    {
        ddlepdjobunit.Items.Clear();
        ddlepdjobunit.Items.Add("------ Select Job Unit -----");
        ddlepdjobunit.DataSource = ObjectBA.SelectClinet();
        ddlepdjobunit.DataValueField = "CLIENTID";
        ddlepdjobunit.DataTextField = "CLIENTNAME";
        ddlepdjobunit.DataBind();
    }

    protected void ddlepdjobunit_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlepdjobunit.Text == "------ Select Job Unit -----")
        {
            ddlGrade.Items.Clear();
            ddlGrade.Items.Add("------- Select Grade -------");

            ddlepddepartment.Items.Clear();
            ddlepddepartment.Items.Add("-------- Select Department -----");

            ddlepddesignation.Items.Clear();
            ddlepddesignation.Items.Add("------- Select Designation ------");
        }
        else
        {
            ddlepddepartmentLoad();
            ddlGradeLoad();
            ddlepddesignationLoad();
        }
    }
    private void ddlGradeLoad()
    {
        ddlGrade.Items.Clear();
        ddlGrade.Items.Add("------- Select Grade -------");
        ddlGrade.DataSource = ObjectBA.SelectSalaryDetailForUnit(ddlepdjobunit.SelectedValue);
        ddlGrade.DataTextField = "GRADE";
        ddlGrade.DataValueField = "SALARYID";
        ddlGrade.DataBind();
    }
    protected void ddlpfstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        //hidcurrenttab.Value = "2";

        if (ddlpfstate.SelectedValue == "--------- Select State ----")
        {
        }
        else
        {
            ddlpfcityLoad();
        }
    }

    private void ddlpfcityLoad()
    {
        ddlpfcity.Items.Clear();
        ddlpfcity.Items.Add("--------- Select City -------");
        ddlpfcity.DataSource = ObjectBA.SelectCityOnStateData(ddlpfstate.SelectedValue);
        ddlpfcity.DataTextField = "CITYNAME";
        ddlpfcity.DataValueField = "CITYID";
        ddlpfcity.DataBind();
    }
    protected void ddlesistate_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if (ddlapplicationno.Text == "---Select Application---")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Application')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlapplicationno.Focus();
        }

        else if (txtepddate.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Date Of Join')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtepddate.Focus();
        }

        else if (ddlepdjobtype.Text == "----- Select Jobtype ------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Job Type')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlepdjobtype.Focus();
        }

        else if (ddlepdjobcategory.Text == "------- Select Job Category -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Job Category')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlepdjobcategory.Focus();
        }

        else if (ddlepdjobunit.Text == "------ Select Job Unit -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Job Unit')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlepdjobunit.Focus();
        }

        else if (ddlepddepartment.Text == "-------- Select Department -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Department')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlepddepartment.Focus();
        }

        else if (ddlepddesignation.Text == "------- Select Designation ------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Designation')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlepddesignation.Focus();
        }

        else if (ddlepdsalarytype.Text == "------- Select Salary Type ------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Salary Type')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlepdsalarytype.Focus();
        }

        else if (txtepdwageday.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Wage/Day')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtepdwageday.Focus();
        }

        else if (ddlGrade.Text == "------- Select Grade -------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Grade')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlGrade.Focus();
        }

        else if (txtepdbasicda.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Basic + DA')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtepdbasicda.Focus();
        }

        else if (ddlepdpfeligible.Text == "------ Select PF --------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select PF')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlepdpfeligible.Focus();
        }

        else if (ddlepdesieligible.Text == "-------- Select ESI ------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select ESI')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlepdesieligible.Focus();
        }

        else if (ddlepdsalaryissuetype.Text == "------ Select  Salary Issuetype -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Salary Issue Type')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlepdsalaryissuetype.Focus();
        }      

        else if (txtepdpersonname.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the person Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtepdpersonname.Focus();
        }

        else if (txtepdrelationship.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Relationship')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtepdrelationship.Focus();
        }

        else if (txtepdmobile.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Mobile No')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtepdmobile.Focus();
        }       

        if (ddlepdsalaryissuetype.Text.Trim() == "Bank")
        {
            if (txtepdbankname.Text == "")
            {
                System.Threading.Thread.Sleep(100);
                string message = "alert('Enter the Bank Name')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                txtepdbankname.Focus();
            }

            else if (txtbranch.Text.Trim() == "")
            {
                System.Threading.Thread.Sleep(100);
                string message = "alert('Enter the Branch Name')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                txtbranch.Focus();
            }

            else if (txtepdifsc.Text.Trim() == "")
            {
                System.Threading.Thread.Sleep(100);
                string message = "alert('Enter the IFSC Code')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                txtepdifsc.Focus();
            }

            else if (txtepdaccountno.Text.Trim() == "")
            {
                System.Threading.Thread.Sleep(100);
                string message = "alert('Enter the Account No')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                txtepdaccountno.Focus();
            }

            else if (txtpanno.Text.Trim() == "")
            {
                System.Threading.Thread.Sleep(100);
                string message = "alert('Enter the PAN No')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                txtpanno.Focus();
            }

            else
            {
                txtemployeenoLoad();
                ObjectBA.InsertEmployeeCompanyDetail(ddlapplicationno.SelectedValue, txtemployeeno.Text,
                    Convert.ToDateTime(txtepddate.Text).ToShortDateString(), ddlepdjobtype.Text, ddlepdjobcategory.Text,
                    ddlepdjobunit.Text, ddlepddepartment.Text, ddlepddesignation.Text, ddlGrade.Text, txtepdwageday.Text,
                    txtepdbasicda.Text, txtepdhra.Text, txtconvey.Text, txtWashing.Text, txtOther.Text, txtepdwagehour.Text,
                    txtotperhour2.Text, ddlepdcontractors.Text, ddlepdpfeligible.SelectedValue,
                    txtepduanno.Text, txtpfno.Text, ddlepdesieligible.SelectedValue, txtepdesino.Text, txtepdtaday.Text,
                    txtepdadharno.Text, ddlepdsalarytype.Text, ddlepdsalaryissuetype.Text, txtepdifsc.Text,
                    txtepdbankname.Text, txtepdifsc.Text, txtepdaccountno.Text, txtpanno.Text, txtepdpersonname.Text, txtepdrelationship.Text,
                    txtepdmobile.Text, txtepdhomenumber.Text,
                    txtidentitymarks.Text, txtpfnomineename.Text, Convert.ToDateTime(txtpfdateofbirthage.Text).ToShortDateString(),
                    txtpfrelationship.Text, txtpfnoandstreet.Text, txtpftownarea.Text, ddlpfcity.SelectedValue, ddlpfstate.SelectedValue,
                    txtpfpincode.Text, txtpfmobile.Text, txtpfhomenumber.Text, txtesinomineename.Text,
                    Convert.ToDateTime(txtesidate.Text).ToShortDateString(), txtesirelationship.Text, txtesinoandstreet.Text, txtesitownarea.Text,
                    ddlesicity.Text, ddlesistate.Text, txtesipincode.Text, txtesimobile.Text, txtesihomenumber.Text,
                    txtRefName1.Text, txtdesgRelation1.Text, txtCntNumber1.Text,
                    txtRefName2.Text, txtdesgRelation1.Text, txtCntNumber2.Text, txtpfemployeestatus.Text);
                InsertFlagInAppoinment();
                ddlapplicationnoLoad();

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                
            }
        }
        else
        {
            txtemployeenoLoad();
            ObjectBA.InsertEmployeeCompanyDetail(ddlapplicationno.SelectedValue, txtemployeeno.Text,
                Convert.ToDateTime(txtepddate.Text).ToShortDateString(), ddlepdjobtype.Text, ddlepdjobcategory.Text,
                ddlepdjobunit.Text, ddlepddepartment.Text, ddlepddesignation.Text, ddlGrade.Text, txtepdwageday.Text,
                txtepdbasicda.Text, txtepdhra.Text, txtconvey.Text, txtWashing.Text, txtOther.Text, txtepdwagehour.Text,
                txtotperhour2.Text, ddlepdcontractors.Text, ddlepdpfeligible.SelectedValue,
                txtepduanno.Text, txtpfno.Text, ddlepdesieligible.SelectedValue, txtepdesino.Text, txtepdtaday.Text,
                txtepdadharno.Text, ddlepdsalarytype.Text, ddlepdsalaryissuetype.Text, txtepdifsc.Text,
                txtepdbankname.Text, txtepdifsc.Text, txtepdaccountno.Text, txtpanno.Text, txtepdpersonname.Text, txtepdrelationship.Text,
                txtepdmobile.Text, txtepdhomenumber.Text,
                txtidentitymarks.Text, txtpfnomineename.Text, Convert.ToDateTime(txtpfdateofbirthage.Text).ToShortDateString(),
                txtpfrelationship.Text, txtpfnoandstreet.Text, txtpftownarea.Text, ddlpfcity.SelectedValue, ddlpfstate.SelectedValue,
                txtpfpincode.Text, txtpfmobile.Text, txtpfhomenumber.Text, txtesinomineename.Text,
                Convert.ToDateTime(txtesidate.Text).ToShortDateString(), txtesirelationship.Text, txtesinoandstreet.Text, txtesitownarea.Text,
                ddlesicity.Text, ddlesistate.Text, txtesipincode.Text, txtesimobile.Text, txtesihomenumber.Text,
                txtRefName1.Text, txtdesgRelation1.Text, txtCntNumber1.Text,
                txtRefName2.Text, txtdesgRelation1.Text, txtCntNumber2.Text, txtpfemployeestatus.Text);
            InsertFlagInAppoinment();
            ddlapplicationnoLoad();

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);            
        }
        Clearnew();
    }

    private void InsertFlagInAppoinment()
    {
        ObjectBA.UpdateEmployeeApplicationFlagID(ddlapplicationno.SelectedValue);
    }

    private void txtemployeenoLoad()
    {
        dt = new DataTable();
        dt = ObjectBA.SelectEmployeeCompanyDetailCode();
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["EMPLOYEECODE"].ToString() != "")
            {
                decimal Code = Convert.ToDecimal(dt.Rows[0]["EMPLOYEECODE"]);
                Code = Code + 1;
                txtemployeeno.Text = Code.ToString("0####");
            }
            else
            {
                txtemployeeno.Text = "00001";
            }
        }
        con.Close();
    }

    protected void ddlGrade_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlGrade.Text == "------- Select Grade -------")
        {
            txtepdbasicda.Text = "0";
            txtepdhra.Text = "0";
            txtconvey.Text = "0";
            txtWashing.Text = "0";
            txtOther.Text = "0";
            txtepdwagehour.Text = "0";
            txtotperhour2.Text = "0";
        }
        else
        {
            CalculationForSalary();
        }
    }

    private void CalculationForSalary()
    {
        decimal basic = 0, basicda = 0, hra = 0, Conv = 0, Washing = 0, other = 0, WageHour = 0, OT = 0;

        DataTable dt = new DataTable();
        dt = ObjectBA.SelectSalaryMasterGrade(ddlGrade.Text);
        if (dt.Rows.Count > 0)
        {
            basic = Convert.ToDecimal(dt.Rows[0]["BASIC"]);
            basicda = Convert.ToDecimal(dt.Rows[0]["DA"]);
            hra = Convert.ToDecimal(dt.Rows[0]["HRA"]);
            Conv = Convert.ToDecimal(dt.Rows[0]["CONVEYANCE"]);
            Washing = Convert.ToDecimal(dt.Rows[0]["WASHING"]);
            other = Convert.ToDecimal(dt.Rows[0]["OTHER"]);
            OT = Convert.ToDecimal(dt.Rows[0]["OTAMOUNT"]);
        }

        basic = basic + basicda;

        basic = Convert.ToDecimal(txtepdwageday.Text) / 100 * basic;
        hra = Convert.ToDecimal(txtepdwageday.Text) / 100 * hra;
        Conv = Convert.ToDecimal(txtepdwageday.Text) / 100 * Conv;
        Washing = Convert.ToDecimal(txtepdwageday.Text) / 100 * Washing;
        other = Convert.ToDecimal(txtepdwageday.Text) / 100 * other;
        if (ddlepdsalarytype.Text == "Monthly")
        {
            WageHour = Convert.ToDecimal(txtepdwageday.Text) * OT / 100;
            WageHour = WageHour / 30;
            OT = WageHour / 8;
        }
        else
        {
            WageHour = Convert.ToDecimal(txtepdwageday.Text) * OT / 100;
            OT = WageHour / 8;
        }

        txtepdbasicda.Text = basic.ToString("###0.##");
        txtepdhra.Text = hra.ToString("###0.##");
        txtconvey.Text = Conv.ToString("###0.##");
        txtWashing.Text = Washing.ToString("###0.##");
        txtOther.Text = other.ToString("###0.##");
        txtotperhour2.Text = OT.ToString("###0.##");
        txtepdwagehour.Text = WageHour.ToString("###0.##");

        con.Close();
    }

    protected void ddlesistate_SelectedIndexChanged1(object sender, EventArgs e)
    {
        //hidcurrenttab.Value = "2";

        if (ddlesistate.SelectedValue == "--------- Select State ----")
        {

        }
        else
        {
            ddlesicityLoad();
        }
    }

    private void ddlesicityLoad()
    {
        ddlesicity.Items.Clear();
        ddlesicity.Items.Add("------ Select City ----");
        ddlesicity.DataSource = ObjectBA.SelectCityOnStateData(ddlesistate.SelectedValue);
        ddlesicity.DataValueField = "CITYID";
        ddlesicity.DataTextField = "CITYNAME";
        ddlesicity.DataBind();
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }
    public void Clearnew()
    {
        ddlpfstateLoad();
        ddlesistateLoad();
        ddlapplicationnoLoad();
        ddlepddesignationLoad();
        ddlepdpfeligibleLoad();
        ddlepdesieligibleLoad();
        ddlepddepartmentLoad();

        txtepddate.Text = "";
        ddlepdjobtype.Items.Clear();
        ddlepdjobtype.SelectedValue = "----- Select Jobtype ------";
        ddlepdjobcategory.Items.Clear();
        ddlepdjobcategory.SelectedValue = "------- Select Job Category -----";
        ddlepdjobunitLoad();
        ddlepddepartment.Items.Clear();
        ddlepddepartment.SelectedValue = "-------- Select Department -----";

        ddlepddesignation.Items.Clear();
        ddlepddesignation.SelectedValue = "------- Select Designation ------";

        txtemployeename.Text = "";
        txtemployeeno.Text = "";
        txtepdwageday.Text = "";
        txtepdbasicda.Text = "";
        txtepdhra.Text = "";
        txtconvey.Text = "";
        txtWashing.Text = "";
        txtOther.Text = "";
        txtepdwagehour.Text = "";
        txtotperhour2.Text = "";

        ddlepdcontractors.Items.Clear();
        ddlepdcontractors.Items.Add("---Contractorts---");

        ddlepdpfeligibleLoad();
        ddlepdesieligibleLoad();

        ddlepdsalarytype.SelectedValue = "------- Select Salary Type ------";
        ddlGrade.SelectedValue = "------- Select Grade -------";
        txtepdtaday.Text = "";
        txtepdadharno.Text = "";
        txtepduanno.Text = "";
        txtpfno.Text = "";
        txtepdesino.Text = "";

        ddlepdsalaryissuetype.SelectedValue = "------ Select  Salary Issuetype -----";

        txtepdbankname.Text = "";
        txtbranch.Text = "";
        txtepdifsc.Text = "";
        txtepdaccountno.Text = "";
        txtepdpersonname.Text = "";
        txtepdrelationship.Text = "";
        txtepdmobile.Text = "";
        txtepdhomenumber.Text = "";
        txtidentitymarks.Text = "";

        txtpfnomineename.Text = "";
        txtpfdateofbirthage.Text = "";
        txtpfrelationship.Text = "";
        txtpfnoandstreet.Text = "";
        txtpftownarea.Text = "";
        ddlpfcity.Items.Clear();
        ddlpfcity.Items.Add("--------- Select City -------");
        ddlpfstate.Items.Clear();
        ddlpfstate.Items.Add("------- Select State --------");

        txtpfpincode.Text = "";
        txtpfmobile.Text = "";
        txtpfhomenumber.Text = "";

        txtesinomineename.Text = "";
        txtesidate.Text = "";
        txtesirelationship.Text = "";
        txtesinoandstreet.Text = "";
        txtesitownarea.Text = "";
        ddlesicity.Items.Clear();
        ddlesicity.Items.Add("------ Select City ----");
        ddlesistate.Items.Clear();
        ddlesistate.Items.Add("--------- Select State ----");

        txtesipincode.Text = "";
        txtesimobile.Text = "";
        txtesihomenumber.Text = "";

        txtRefName1.Text = "";
        txtdesgRelation1.Text = "";
        txtCntNumber1.Text = "";
        txtRefName2.Text = "";
        txtdesgRelation2.Text = "";
        txtCntNumber2.Text = "";
    }

    protected void CheckBox1esi_CheckedChanged(object sender, EventArgs e)
    {
        //hidcurrenttab.Value = "2";

        if (CheckBox1esi.Checked == true)
        {
            txtesinomineename.Text = txtpfnomineename.Text;
            txtesidate.Text = txtpfdateofbirthage.Text;
            txtesirelationship.Text = txtpfrelationship.Text;
            txtesinoandstreet.Text = txtpfnoandstreet.Text;
            txtesitownarea.Text = txtpftownarea.Text;
            ddlesistate.SelectedValue = ddlpfstate.SelectedValue;
            ddlesicityLoad();
            ddlesicity.SelectedValue = ddlpfcity.SelectedValue;
            txtesipincode.Text = txtpfpincode.Text;
            txtesimobile.Text = txtpfmobile.Text;
            txtesihomenumber.Text = txtpfhomenumber.Text;
        }
        else
        {
            txtesinomineename.Text = "";
            txtesidate.Text = "";
            txtesirelationship.Text = "";
            txtpfnoandstreet.Text = "";
            txtesitownarea.Text = "";
            ddlesistateLoad();
            ddlesicity.Items.Clear();
            txtesipincode.Text = "";
            txtesimobile.Text = "";
            txtesihomenumber.Text = "";
        }
    }

    protected void txtepdbankname_TextChanged(object sender, EventArgs e)
    {
        txtepdbankname.Text = txtepdbankname.Text.ToUpper();
    }

    protected void txtbranch_TextChanged(object sender, EventArgs e)
    {
        txtbranch.Text = txtbranch.Text.ToUpper();
    }

    protected void txtepdifsc_TextChanged(object sender, EventArgs e)
    {
        txtepdifsc.Text = txtepdifsc.Text.ToUpper();
    }

    protected void txtepdaccountno_TextChanged(object sender, EventArgs e)
    {
        txtepdaccountno.Text = txtepdaccountno.Text.ToUpper();
    }

    protected void txtpanno_TextChanged(object sender, EventArgs e)
    {
        txtpanno.Text = txtpanno.Text.ToUpper();
    }

    protected void txtesinoandstreet_TextChanged(object sender, EventArgs e)
    {
        txtesinoandstreet.Text = txtesinoandstreet.Text.ToUpper();
    }

    protected void txtesitownarea_TextChanged(object sender, EventArgs e)
    {
        txtesitownarea.Text = txtesitownarea.Text.ToUpper();
    }

    protected void txtpfnoandstreet_TextChanged(object sender, EventArgs e)
    {
        txtpfnoandstreet.Text = txtpfnoandstreet.Text.ToUpper();
    }

    protected void txtpftownarea_TextChanged(object sender, EventArgs e)
    {
        txtpftownarea.Text = txtpftownarea.Text.ToUpper();
    }

    protected void txtepdpersonname_TextChanged(object sender, EventArgs e)
    {
        txtepdpersonname.Text = txtepdpersonname.Text.ToUpper();
    }

    protected void txtepdtaday_TextChanged(object sender, EventArgs e)
    {
        txtepdtaday.Text = txtepdtaday.Text.ToUpper();
    }

    protected void txtidentitymarks_TextChanged(object sender, EventArgs e)
    {
        txtidentitymarks.Text = txtidentitymarks.Text.ToUpper();
    }

    protected void txtpfnomineename_TextChanged(object sender, EventArgs e)
    {
        txtpfnomineename.Text = txtpfnomineename.Text.ToUpper();
    }

    protected void txtpfrelationship_TextChanged(object sender, EventArgs e)
    {
        txtpfrelationship.Text = txtpfrelationship.Text.ToUpper();
    }

    protected void txtesinomineename_TextChanged(object sender, EventArgs e)
    {
        txtesinomineename.Text = txtesinomineename.Text.ToUpper();
    }

    protected void txtesirelationship_TextChanged(object sender, EventArgs e)
    {
        txtesirelationship.Text = txtesirelationship.Text.ToUpper();
    }

    protected void txtRefName1_TextChanged(object sender, EventArgs e)
    {
        txtRefName1.Text = txtRefName1.Text.ToUpper();
    }

    protected void txtdesgRelation1_TextChanged(object sender, EventArgs e)
    {
        txtdesgRelation1.Text = txtdesgRelation1.Text.ToUpper();
    }

    protected void txtRefName2_TextChanged(object sender, EventArgs e)
    {
        txtRefName2.Text = txtRefName2.Text.ToUpper();
    }

    protected void txtdesgRelation2_TextChanged(object sender, EventArgs e)
    {
        txtdesgRelation2.Text = txtdesgRelation2.Text.ToUpper();
    }

    protected void txtpfemployeestatus_TextChanged(object sender, EventArgs e)
    {
    }

    protected void txtepddate_TextChanged(object sender, EventArgs e)
    {
    }

    protected void ddlepdsalarytype_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void ddlepdsalaryissuetype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlepdsalaryissuetype.Text == "Cash")
        {
            txtepdbankname.ReadOnly = true;
            txtbranch.ReadOnly = true;
            txtepdaccountno.ReadOnly = true;
            txtepdifsc.ReadOnly = true;
        }
        else if (ddlepdsalaryissuetype.Text == "------ Select  Salary Issuetype -----")
        {
            txtepdbankname.ReadOnly = true;          
            txtbranch.ReadOnly = true;
            txtepdaccountno.ReadOnly = true;
            txtepdifsc.ReadOnly = true;              
        }
        else
        {
            txtepdbankname.ReadOnly = false;
            txtbranch.ReadOnly = false;
            txtepdaccountno.ReadOnly = false;
            txtepdifsc.ReadOnly = false;
        }
    }

    protected void ddlpfcity_SelectedIndexChanged(object sender, EventArgs e)
    {
        //hidcurrenttab.Value = "2";
    }

    protected void ddlesicity_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void ddlapplicationno_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = new DataTable();
        dt = ObjectBA.SelectApplicationIDDetail(ddlapplicationno.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            txtemployeename.Text = dt.Rows[0]["APPLICATIONAME"].ToString();
        }
        con.Close();
    }


}