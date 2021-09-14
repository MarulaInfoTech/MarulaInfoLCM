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

public partial class PgEmployeeInterviewSchedule : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();

    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    //SqlConnection con = new SqlConnection("Server=WHYNOT;Database=SuryaOnline;user=sa;password=Whynot@94896;");
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";
        if (!IsPostBack)
        {            
            ddlresumeidLoad();
            ddlsendtoLoad();
            DgInterviewLoad();
            ddlupdateresumeidLoad();
            

            txtdate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtfromdate.Text= DateTime.Now.ToString("dd/MM/yyyy");
            txttodate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }
    }

    private void ddlupdateresumeidLoad()
    {
        ddlupdateresumeid.DataSource= ObjectBA.SelectResumeIdDetailView();
        ddlupdateresumeid.DataTextField= "APPLICATIONNO";
        ddlupdateresumeid.DataValueField = "APPLICATIONID";
        ddlupdateresumeid.DataBind();
    }

    private void DgInterviewLoad()
    {
        DgInterview.DataSource = ObjectBA.SelectInterviewDetail();
        DgInterview.DataBind();
    }

    private void ddlsendtoLoad()
    {
        ddlsendto.Items.Clear();
        ddlsendto.Items.Add("----- Sent To ------");

        ddlsendto.DataSource = ObjectBA.SelectClinet();
        ddlsendto.DataTextField = "CLIENTNAME";
        ddlsendto.DataValueField = "CLIENTID";
        //ddlsendto.Text = "--------";
        ddlsendto.DataBind();
    }

    private void ddlresumeidLoad()
    {
        ddlresumeid.Items.Clear();
        ddlresumeid.Items.Add("------- Select Resume ID ----");
      
        ddlresumeid.DataSource = ObjectBA.SelectApplicationNoList();
        ddlresumeid.DataTextField = "APPLICATIONNO";
        ddlresumeid.DataValueField = "APPLICATIONID";
        ddlresumeid.DataBind();

    }

    private void ddljobdesignationLoad()
    {
        ddljobdesignation.Items.Clear();
        ddljobdesignation.Items.Add("------- Select Designation -----");
        ddljobdesignation.DataSource = ObjectBA.SelectDesignationMasterID(ddlsendto.SelectedValue);
        ddljobdesignation.DataTextField = "DESIGNATIONNAME";
        ddljobdesignation.DataValueField = "DESIGNATIONID";
        ddljobdesignation.DataBind();
    }

    protected void ddlsendto_SelectedIndexChanged(object sender, EventArgs e)
    {
        //dt = ObjectBA.SelectClientDetailID(ddlsendto.SelectedValue);
        //txtdivision.Text = dt.Rows[0]["DIVISION"].ToString();
        dt = new DataTable();
        txtdivisionLoad();
        ddljobdesignationLoad();
    }

    private void txtdivisionLoad()
    {
        dt = ObjectBA.SelectClientDetailID(ddlsendto.SelectedValue);
        txtdivision.Text = dt.Rows[0]["DIVISION"].ToString();
    }

    protected void ddlresumeid_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlresumeidLoadasing();
    }

    private void ddlresumeidLoadasing()
    {
        con.Close();
        con.Open();
        
        dt = new DataTable();
        dt = ObjectBA.SelectApplicationIDDetail(ddlresumeid.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            txtname.Text = dt.Rows[0]["APPLICATIONAME"].ToString();
            txtmobilenumber.Text = dt.Rows[0]["MOBILENO1"].ToString();
            txtfathername.Text = dt.Rows[0]["FATHERNAME"].ToString();
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
        else if (ddlresumeid.Text == "------- Select Resume ID ----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Resume Id')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlresumeid.Focus();
        }
        else if (txtname.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtname.Focus();
        }
        else if (txtmobilenumber.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Mobile.No')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtmobilenumber.Focus();
        }

        else if (txtfathername.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Father Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtfathername.Focus();
        }

        else if (ddlsendto.Text == "----- Sent To ------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The SendTo')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlsendto.Focus();
        }
        else if (txtdivision.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Division Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtdivision.Focus();
        }
        else if (ddljobdesignation.Text == "------- Select Designation -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Job Designation')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddljobdesignation.Focus();
        }
        else if (ddlstatus.Text == "---- Select Status -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Status')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlstatus.Focus();
        }
        else if (txtfeedback.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the FeedBack')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtfeedback.Focus();
        }
        else
        {
            if (btnsave.Text == "Save")
            {
                ObjectBA.InsertInterviewDetails( Convert.ToDateTime(txtdate.Text).ToShortDateString(), ddlresumeid.SelectedValue, ddlsendto.SelectedValue, txtdivision.Text,
                    ddljobdesignation.SelectedValue, ddlstatus.SelectedValue, txtfeedback.Text);

                DgInterviewLoad();
                ddlupdateresumeidLoad();
                Clearnew();

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            }
            else 
            {
                ObjectBA.UpdateInterviewDetails(TypeID.Text, Convert.ToDateTime(txtdate.Text).ToShortDateString(), ddlresumeid.SelectedValue, ddlsendto.SelectedValue, txtdivision.Text,
                    ddljobdesignation.SelectedValue, ddlstatus.SelectedValue, txtfeedback.Text);

                DgInterviewLoad();
                ddlupdateresumeidLoad();
                Clearnew();

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);

                //MessageBox.Visible = true;
                //MessageBox.ForeColor = System.Drawing.Color.Green;
                //MessageBox.Text = "Data Save";

            }
        }
    }

    protected void DgInterview_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label intdate = DgInterview.SelectedRow.FindControl("lblintdate") as Label;
        Label intapplicationid = DgInterview.SelectedRow.FindControl("lblintapplicationid") as Label;
        Label intclientid = DgInterview.SelectedRow.FindControl("lblintclientid") as Label;
        Label intdivision = DgInterview.SelectedRow.FindControl("lblintdivision") as Label;
        Label intdesignationid = DgInterview.SelectedRow.FindControl("lblintdesignationid") as Label;
        Label intstatus = DgInterview.SelectedRow.FindControl("lblintstatus") as Label;
        Label intfeedback = DgInterview.SelectedRow.FindControl("lblintfeedback") as Label;
        Label intclientname = DgInterview.SelectedRow.FindControl("lblintclientname") as Label;
        Label intdesignationname = DgInterview.SelectedRow.FindControl("lblintdesignationname") as Label;
        Label intapplicationname = DgInterview.SelectedRow.FindControl("lblintapplicationname") as Label;
        Label intmobileno1 = DgInterview.SelectedRow.FindControl("lblintmobileno1") as Label;

        Label intfathername = DgInterview.SelectedRow.FindControl("lblintfathername") as Label;

        Label intinterviewid = DgInterview.SelectedRow.FindControl("lblintinterviewid") as Label;

        TypeID.Text = intinterviewid.Text;
        txtdate.Text = Convert.ToDateTime(intdate.Text).ToString("dd/MM/yyyy");
        ddlresumeidLoadInt();
        ddlresumeid.SelectedValue = intapplicationid.Text;
        txtname.Text = intapplicationname.Text;
        txtmobilenumber.Text = intmobileno1.Text;
        ddlsendtoLoad();
        ddlsendto.SelectedValue = intclientid.Text;
        txtdivision.Text = intdivision.Text;

        txtfathername.Text = intfathername.Text;

        ddljobdesignationLoad();
        ddljobdesignation.SelectedValue = intdesignationid.Text;
        ddlstatus.SelectedValue = intstatus.Text;
        txtfeedback.Text = intfeedback.Text;

        btnsave.Text = "Update";
    }

    private void ddlresumeidLoadInt()
    {
        ddlresumeid.Items.Clear();
        ddlresumeid.Items.Add("------- Select Resume ID ----");
        ddlresumeid.DataSource = ObjectBA.SelectInterviewApplicationNo();
        ddlresumeid.DataTextField = "APPLICATIONNO";
        ddlresumeid.DataValueField = "APPLICATIONID";
        ddlresumeid.DataBind();
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    public void Clearnew()
    {
        ddljobdesignationLoad();
        ddlresumeidLoad();
        ddlsendtoLoad();
        txtdate.Text = "";       
        txtname.Text = "";
        txtmobilenumber.Text = "";
        txtfathername.Text = "";
        txtdivision.Text = "";
        txtfeedback.Text = "";       
        ddlstatus.SelectedValue="---- Select Status -----";
        btnsave.Text = "Save";
    }

    protected void txtname_TextChanged(object sender, EventArgs e)
    {
        txtname.Text = txtname.Text.ToUpper();
    }

    protected void txtfathername_TextChanged(object sender, EventArgs e)
    {
        txtfathername.Text = txtfathername.Text.ToUpper();
    }

    protected void txtdivision_TextChanged(object sender, EventArgs e)
    {
        txtdivision.Text = txtdivision.Text.ToUpper();
    }

    protected void txtfeedback_TextChanged(object sender, EventArgs e)
    {
        txtfeedback.Text = txtfeedback.Text.ToUpper();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";

        DgInterview.DataSource = ObjectBA.SelectInterviewDetailView(txtfromdate.Text, txttodate.Text, ddlupdateresumeid.SelectedValue);
        DgInterview.DataBind();
    }

}