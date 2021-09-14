using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using BLL;
using System.Data;
using System.Configuration;

public partial class PayrollForms_PgOffRollLCM_ESIMaster : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();
    DataSet ds = new DataSet();

    ClsBusnssLayer objectBL = new ClsBusnssLayer();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GgESIMasterShow();
        }
    }

    public void GgESIMasterShow()
    {
        GgESIMaster.DataSource = objectBL.ESIMasterGridviewShowBC();
        GgESIMaster.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {

        if (txtesiname.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the ESI Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtesiname.Focus();
        }

        else if (txtemployeecontribution.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Employee Contribution')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtemployeecontribution.Focus();
        }

        else if (txtemployercontribution.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Employer Contribution')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtemployercontribution.Focus();
        }

        else
        {            
                objectBL.ESIMasterUpdateBC(TypeId.Text, txtesiname.Text, txtemployeecontribution.Text, txtemployercontribution.Text);

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);

                GgESIMasterShow();
                Clearnew();           
        }
    }

    public void Clearnew()
    {
        txtesiname.Text = "";
        txtemployeecontribution.Text = "";
        txtemployercontribution.Text = "";
          
        btnsave.Text = "Save";
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    protected void GgESIMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblESIID = GgESIMaster.SelectedRow.FindControl("lblESIID") as Label;
        Label lblesiname = GgESIMaster.SelectedRow.FindControl("lblesiname") as Label;
        Label lblEmployeeContribution = GgESIMaster.SelectedRow.FindControl("lblEmployeeContribution") as Label;
        Label lblEmployerContribution = GgESIMaster.SelectedRow.FindControl("lblEmployerContribution") as Label;

        TypeId.Text = lblESIID.Text;
        txtesiname.Text = lblesiname.Text;
        txtemployeecontribution.Text = lblEmployeeContribution.Text;
        txtemployercontribution.Text = lblEmployerContribution.Text;

        btnsave.Text = "Update";
    }



}