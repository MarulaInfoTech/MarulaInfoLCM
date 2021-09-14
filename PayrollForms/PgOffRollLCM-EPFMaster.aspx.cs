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

public partial class PayrollForms_PgOffRollLCM_EPFMaster : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();
    DataSet ds = new DataSet();

    ClsBusnssLayer objectBL = new ClsBusnssLayer();

    protected void Page_Load(object sender, EventArgs e)
    {
        //hidcurrenttab.Value = "1";

        if (!IsPostBack)
        {
            GgEPFMasterShow();
        }
    }

    public void GgEPFMasterShow()
    {
        GgEPFMaster.DataSource = objectBL.PFMasterGridviewShowBC();
        GgEPFMaster.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {

        if (txtesi.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the PF Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtesi.Focus();
        }

        else if (txtTotalEPFContributionAC1.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Total EPF Contribution A/C 1')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtTotalEPFContributionAC1.Focus();
        }

        else if (txtTotalEPSContributionAC10.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Total EPS Contribution A/C 10')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtTotalEPSContributionAC10.Focus();
        }

        else if (txtTotalDifferenceBetweenEPFEPSAC1.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Total Difference Between EPF & EPS A/C1')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtTotalDifferenceBetweenEPFEPSAC1.Focus();
        }

        else if (txtTotalEDLIContributionERShareAC21.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Total EDLI Contribution Share A/C 21')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtTotalEDLIContributionERShareAC21.Focus();
        }

        else if (txtTotalEPFChargesAdministrationAC2.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Total EPF Charges (Administration) A/C 2')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtTotalEPFChargesAdministrationAC2.Focus();
        }

        else if (txtTotalEDLIChargesAdministrationAC22.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Total EDLI Charges (Administration) A/C 22')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtTotalEDLIChargesAdministrationAC22.Focus();
        }

        else if (txtTotalRefundofAdvanceAC1.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Total Refund of Advance A/C 1')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtTotalRefundofAdvanceAC1.Focus();
        }

        else
        {
            if (btnsave.Text == "Save")
            {
                objectBL.PFMasterInsertBC(txtesi.Text, txtTotalEPFContributionAC1.Text, txtTotalEPSContributionAC10.Text,
                    txtTotalDifferenceBetweenEPFEPSAC1.Text, txtTotalEDLIContributionERShareAC21.Text, txtTotalEPFChargesAdministrationAC2.Text,
                    txtTotalEDLIChargesAdministrationAC22.Text, txtTotalRefundofAdvanceAC1.Text, txtAllTotal.Text);

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);

                GgEPFMasterShow();
                Clearnew();
            }

            else
            {
                objectBL.PFMasterUpdateBC(TypeId.Text, txtesi.Text, txtTotalEPFContributionAC1.Text, txtTotalEPSContributionAC10.Text,
                    txtTotalDifferenceBetweenEPFEPSAC1.Text, txtTotalEDLIContributionERShareAC21.Text, txtTotalEPFChargesAdministrationAC2.Text,
                    txtTotalEDLIChargesAdministrationAC22.Text, txtTotalRefundofAdvanceAC1.Text, txtAllTotal.Text);

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);

                GgEPFMasterShow();
                Clearnew();
            }
        }

    }

    protected void GgEPFMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblPFID = GgEPFMaster.SelectedRow.FindControl("lblPFID") as Label;
        Label lblPFNAME = GgEPFMaster.SelectedRow.FindControl("lblPFNAME") as Label;
        Label lblAC0 = GgEPFMaster.SelectedRow.FindControl("lblAC0") as Label;
        Label lblac10 = GgEPFMaster.SelectedRow.FindControl("lblac10") as Label;
        Label lblAC1 = GgEPFMaster.SelectedRow.FindControl("lblAC1") as Label;
        Label lblAC21 = GgEPFMaster.SelectedRow.FindControl("lblAC21") as Label;
        Label lblAC2 = GgEPFMaster.SelectedRow.FindControl("lblAC2") as Label;
        Label lblAC22 = GgEPFMaster.SelectedRow.FindControl("lblAC22") as Label;
        Label lblRefund = GgEPFMaster.SelectedRow.FindControl("lblRefund") as Label;
        Label lblTotal = GgEPFMaster.SelectedRow.FindControl("lblTotal") as Label;

        TypeId.Text = lblPFID.Text;
        txtesi.Text = lblPFNAME.Text;
        txtTotalEPFContributionAC1.Text = lblAC0.Text;
        txtTotalEPSContributionAC10.Text = lblac10.Text;
        txtTotalDifferenceBetweenEPFEPSAC1.Text = lblAC1.Text;
        txtTotalEDLIContributionERShareAC21.Text = lblAC21.Text;
        txtTotalEDLIChargesAdministrationAC22.Text = lblAC22.Text;
        txtTotalRefundofAdvanceAC1.Text = lblRefund.Text;
        txtAllTotal.Text = lblTotal.Text;
        txtTotalEPFChargesAdministrationAC2.Text = lblAC2.Text;

        btnsave.Text = "Update";
    }

    public void Clearnew()
    {
        txtesi.Text = "";
        txtTotalEPFContributionAC1.Text = "";
        txtTotalEPSContributionAC10.Text = "";
        txtTotalDifferenceBetweenEPFEPSAC1.Text = "";
        txtTotalEDLIChargesAdministrationAC22.Text = "";
        txtTotalEDLIContributionERShareAC21.Text = "";
        txtTotalEPFChargesAdministrationAC2.Text = "";
        txtTotalRefundofAdvanceAC1.Text = "";
        txtAllTotal.Text = "";

        btnsave.Text = "Save";
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    private void calculation()
    {
        txtAllTotal.Text = (Convert.ToDecimal(txtTotalEPFContributionAC1.Text) + Convert.ToDecimal(txtTotalEPSContributionAC10.Text) + Convert.ToDecimal(txtTotalDifferenceBetweenEPFEPSAC1.Text) + Convert.ToDecimal(txtTotalEDLIContributionERShareAC21.Text) + Convert.ToDecimal(txtTotalEPFChargesAdministrationAC2.Text) + Convert.ToDecimal(txtTotalEDLIChargesAdministrationAC22.Text) + Convert.ToDecimal(txtTotalRefundofAdvanceAC1.Text)).ToString("####.0#");
    }

    protected void txtAllTotal_TextChanged(object sender, EventArgs e)
    {
        calculation();
    }

    protected void txtTotalEPFContributionAC1_TextChanged(object sender, EventArgs e)
    {
        calculation();
    }

    protected void txtTotalEPSContributionAC10_TextChanged(object sender, EventArgs e)
    {
        calculation();
    }

    protected void txtTotalDifferenceBetweenEPFEPSAC1_TextChanged(object sender, EventArgs e)
    {
        calculation();
    }

    protected void txtTotalEDLIContributionERShareAC21_TextChanged(object sender, EventArgs e)
    {
        calculation();
    }

    protected void txtTotalEPFChargesAdministrationAC2_TextChanged(object sender, EventArgs e)
    {
        calculation();
    }

    protected void txtTotalEDLIChargesAdministrationAC22_TextChanged(object sender, EventArgs e)
    {
        calculation();
    }

    protected void txtTotalRefundofAdvanceAC1_TextChanged(object sender, EventArgs e)
    {
        calculation();
    }
}