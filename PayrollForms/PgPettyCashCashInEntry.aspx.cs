using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;
using System.Data.SqlClient;
using System.Data;

public partial class PayrollForms_CashIn : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();

    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";
        if (!IsPostBack)
        {
            ddlclientnameLoad();
            DgcashinviewLoad();
            CashReason();
            TypeId.Text = "0";
            TxtLoadzero();
        }
    }

    private void DgcashinviewLoad()
    {
        Dgcashinview.DataSource = ObjectBA.SelectCashInDetail();
        Dgcashinview.DataBind();
    }

    private void ddlclientnameLoad()
    {
        ddlclientname.Items.Clear();
        ddlclientname.Items.Add("----Select Client Name----");
        ddlclientname.DataSource = ObjectBA.SelectClinet();
        ddlclientname.DataValueField = "CLIENTID";
        ddlclientname.DataTextField = "CLIENTNAME";
        ddlclientname.DataBind();
    }

    private void CashReason()
    {
        ddlcashinreason.Items.Clear();
        ddlcashinreason.Items.Add("----SELECT REASON----");
        ddlcashinreason.DataSource = ObjectBA.PettyCashReasonSelect();
        ddlcashinreason.DataValueField = "DESID";
        ddlcashinreason.DataTextField = "CASHREASON";
        ddlcashinreason.DataBind();
    }


    protected void chkfromemployee_CheckedChanged(object sender, EventArgs e)
    {
        pnlfromemp.Visible = chkfromemp.Checked;
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (txtcashindatedate.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Cash In Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtcashindatedate.Focus();
        }
        else if (txtcashfrom.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Cash From')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtcashfrom.Focus();
        }

        else if (ddlcashinreason.SelectedValue == "----SELECT REASON----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Reason')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlcashinreason.Focus();
        }

        //else if (ddlcashinreason.SelectedValue == "----Reason----")
        //{
        //    MessageBox.Visible = true;
        //    MessageBox.Text = "Enter Invoice Number ";
        //    ddlcashinreason.Focus();
        //}
        //else if (txtempcode.Text.Trim() == "")
        //{
        //    MessageBox.Visible = true;
        //    MessageBox.Text = "Enter Invoice Number ";
        //    txtempcode.Focus();
        //}

        else if (TypeId.Text == "0")
        {
            ObjectBA.InsertCashInDetail(txtcashindatedate.Text, txtcashfrom.Text, ddlclientname.Text, txtdivisionname.Text, ddlcashinreason.SelectedValue, txtempcode.Text,
                txtdepartment.Text, txtremarks.Text, txt2000s.Text, txt500s.Text, txt200s.Text, txt100s.Text, txt50s.Text, txt20s.Text, txt10s.Text, txt5s.Text, txt2s.Text, 
                txt1s.Text, txttotalamount.Text);

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            clearTotalTxtBox();
            DgcashinviewLoad();
        }
        else
        {
            ObjectBA.UpdateCashInDetail(TypeId.Text, txtcashindatedate.Text, txtcashfrom.Text, ddlclientname.Text, txtdivisionname.Text, ddlcashinreason.SelectedValue, txtempcode.Text,
                txtdepartment.Text, txtremarks.Text, txt2000s.Text, txt500s.Text, txt200s.Text, txt100s.Text, txt50s.Text, txt20s.Text, txt10s.Text, txt5s.Text, txt2s.Text,
                txt1s.Text, txttotalamount.Text);

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            clearTotalTxtBox();
            DgcashinviewLoad();
        }
    }

    private void clearTotalTxtBox()  /*ddlclientname*/
    {
        TypeId.Text = "";
        txtcashindatedate.Text = "";
        txtcashfrom.Text = "";

        ddlclientname.Items.Clear();
        ddlclientname.Items.Add("---Select Client Name---");
        ddlclientnameLoad();

        //txtdivisionname.Text = "";
        //ddlcashinreason.SelectedValue = "----Reason----";

        ddlcashinreason.Items.Clear();
        ddlcashinreason.Items.Add("----SELECT REASON----");
        CashReason();

        txtempcode.Text = "";
        txtempname.Text = "";
        txtdepartment.Text = "";
        txtremarks.Text = "";
        txt2000s.Text = "0";
        txt500s.Text = "0";
        txt200s.Text = "0";
        txt100s.Text = "0";
        txt50s.Text = "0";
        txt20s.Text = "0";
        txt10s.Text = "0";
        txt5s.Text = "0";
        txt2s.Text = "0";
        txt1s.Text = "0";
        txttotalamount.Text = "0";
        btnsave.Text = "Save";
       
    }

    private void TxtLoadzero()
    {
        
    }

    protected void Dgcashinview_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblCashId = Dgcashinview.SelectedRow.FindControl("lblCashId") as Label;
        Label lblCashDate = Dgcashinview.SelectedRow.FindControl("lblCashDate") as Label;
        Label lblCashForm = Dgcashinview.SelectedRow.FindControl("lblCashForm") as Label;
        Label lblCashName = Dgcashinview.SelectedRow.FindControl("lblCashName") as Label;
        Label lblDivisionName = Dgcashinview.SelectedRow.FindControl("lblDivisionName") as Label;

        Label lblReason = Dgcashinview.SelectedRow.FindControl("lblReason") as Label;
        Label lblEmployeeCode = Dgcashinview.SelectedRow.FindControl("lblEmployeeCode") as Label;
        Label lblDepartment = Dgcashinview.SelectedRow.FindControl("lblDepartment") as Label;
        Label lblRemark = Dgcashinview.SelectedRow.FindControl("lblRemark") as Label;
        Label lblRs2000 = Dgcashinview.SelectedRow.FindControl("lblRs2000") as Label;

        Label lblRs500 = Dgcashinview.SelectedRow.FindControl("lblRs500") as Label;
        Label lblRs200 = Dgcashinview.SelectedRow.FindControl("lblRs200") as Label;
        Label lblRs100 = Dgcashinview.SelectedRow.FindControl("lblRs100") as Label;
        Label lblRs50 = Dgcashinview.SelectedRow.FindControl("lblRs50") as Label;
        Label lblRs20 = Dgcashinview.SelectedRow.FindControl("lblRs20") as Label;

        Label lblRs10 = Dgcashinview.SelectedRow.FindControl("lblRs10") as Label;
        Label lblRs5 = Dgcashinview.SelectedRow.FindControl("lblRs5") as Label;
        Label lblRs2 = Dgcashinview.SelectedRow.FindControl("lblRs2") as Label;
        Label lblRs1 = Dgcashinview.SelectedRow.FindControl("lblRs1") as Label;
        Label lblTotal = Dgcashinview.SelectedRow.FindControl("lblTotal") as Label;



        TypeId.Text = lblCashId.Text;
        txtcashindatedate.Text = Convert.ToDateTime(lblCashDate.Text).ToString("dd/MM/yyyy");
        txtcashfrom.Text = lblCashForm.Text;
        ddlclientname.Text = lblCashName.Text;
        txtdivisionname.Text = lblDivisionName.Text;
        ddlcashinreason.SelectedValue = lblReason.Text;
        txtempcode.Text = lblEmployeeCode.Text;
        txtdepartment.Text = lblDepartment.Text;
        txtremarks.Text = lblRemark.Text;
        txt2000s.Text = lblRs2000.Text;

        txt500s.Text = lblRs500.Text;
        txt200s.Text = lblRs200.Text;
        txt100s.Text = lblRs100.Text;
        txt50s.Text = lblRs50.Text;
        txt20s.Text = lblRs20.Text;
        txt10s.Text = lblRs10.Text;
        txt5s.Text = lblRs5.Text;
        txt2s.Text = lblRs2.Text;
        txt1s.Text = lblRs1.Text;
        txttotalamount.Text = lblTotal.Text;
        btnsave.Text = "Update";
    }
    protected void btnneww_Click(object sender, EventArgs e)
    {
        clearTotalTxtBox();
        TxtLoadzero();
    }

    protected void txtcashfrom_TextChanged(object sender, EventArgs e)
    {
        txtcashfrom.Text = txtcashfrom.Text.ToUpper();
    }

    protected void txtclientname_TextChanged(object sender, EventArgs e)
    {
       
    }

    protected void txtdivisionname_TextChanged(object sender, EventArgs e)
    {
        txtdivisionname.Text = txtdivisionname.Text.ToUpper();
    }

    protected void txtempname_TextChanged(object sender, EventArgs e)
    {
        txtempname.Text = txtempname.Text.ToUpper();
    }

    protected void txtempcode_TextChanged(object sender, EventArgs e)
    {
        txtempcode.Text = txtempcode.Text.ToUpper();
    }

    protected void txtdepartment_TextChanged(object sender, EventArgs e)
    {
        txtdepartment.Text = txtdepartment.Text.ToUpper();
    }

    protected void txtremarks_TextChanged(object sender, EventArgs e)
    {
        txtremarks.Text = txtremarks.Text.ToUpper();
    }

    protected void txtcashfromview_TextChanged(object sender, EventArgs e)
    {
        txtcashfromview.Text = txtcashfromview.Text.ToUpper();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";
    }

    protected void ddlclientname_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = ObjectBA.SelectClientDetailID(ddlclientname.SelectedValue);
        txtdivisionname.Text = dt.Rows[0]["DIVISION"].ToString();     

    }

    protected void txt2000s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();        
    }

    private void CalculationCheck()
    {
        decimal Twothusand = 0, FiveHunred = 0, TwoHunred = 0, OneHunrad = 0, Fifty = 0, Twenty = 0, Ten = 0, Five = 0, Two = 0, One = 0, Total = 0;
        if (txt2000s.Text.Trim() != "")
        {
            Twothusand = Convert.ToDecimal(txt2000s.Text) * 2000;
        }
        if (txt500s.Text.Trim() != "")
        {
            FiveHunred = Convert.ToDecimal(txt500s.Text) * 500;
        }
        if (txt200s.Text.Trim() != "")
        {
            TwoHunred = Convert.ToDecimal(txt200s.Text) * 200;
        }
        if (txt100s.Text.Trim() != "")
        {
            OneHunrad = Convert.ToDecimal(txt100s.Text) * 100;
        }
        if (txt50s.Text.Trim() != "")
        {
            Fifty = Convert.ToDecimal(txt50s.Text) * 50;
        }
        if (txt20s.Text.Trim() != "")
        {
            Twenty = Convert.ToDecimal(txt20s.Text) * 20;
        }
        if (txt10s.Text.Trim() != "")
        {
            Ten = Convert.ToDecimal(txt10s.Text) * 10;
        }
        if (txt5s.Text.Trim() != "")
        {
            Five = Convert.ToDecimal(txt5s.Text) * 5;
        }
        if (txt2s.Text.Trim() != "")
        {
            Two = Convert.ToDecimal(txt2s.Text) * 2;
        }
        if (txt1s.Text.Trim() != "")
        {
            One = Convert.ToDecimal(txt1s.Text) * 1;
        }
        Total = Twothusand + FiveHunred + TwoHunred + OneHunrad + Fifty + Twenty + Ten + Five + Two + One;
        txttotalamount.Text = Total.ToString("####.##");
    }

    protected void txt20s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txt500s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txt10s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txt200s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txt5s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txt100s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txt2s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txt50s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txt1s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }
}