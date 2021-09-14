using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;

public partial class PayrollForms_Cashout : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DgcashoutviewLoad();
            CashReason();
            TypeId.Text = "0";
            ValueZeroTxtBox();           
        }
    }

    private void CashReason()
    {
        ddlcashoutreason.Items.Clear();
        ddlcashoutreason.Items.Add("----SELECT REASON----");
        ddlcashoutreason.DataSource = ObjectBA.PettyCashReasonSelect();
        ddlcashoutreason.DataValueField = "DESID";
        ddlcashoutreason.DataTextField = "CASHREASON";
        ddlcashoutreason.DataBind();
    }


    private void ValueZeroTxtBox()
    {
        txth2000s.Text = "0";  
        txth500s.Text = "0";
        txth200s.Text = "0";
        txth100s.Text = "0";
        txth50s.Text = "0";
        txth20s.Text = "0";
        txth10s.Text = "0";
        txth5s.Text = "0";
        txth2s.Text = "0";
        txth1s.Text = "0";
        txthtotalamount.Text = "0";
        txtd2000s.Text = "0";
        txtd500s.Text = "0";
        txtd200s.Text = "0";
        txtd100s.Text = "0";
        txtd50s.Text = "0";
        txtd20s.Text = "0";
        txtd10s.Text = "0";
        txtd5s.Text = "0";
        txtd2s.Text = "0";
        txtd1s.Text = "0";
        txtdtotalamount.Text = "0";
    }

    private void DgcashoutviewLoad()
    {
        Dgcashoutview.DataSource = ObjectBA.SelectCashOutDetail();
        Dgcashoutview.DataBind();
    }

    protected void chkgetfrom_CheckedChanged(object sender, EventArgs e)
    {
        pnlgetfrom.Visible = chkgetfrom.Checked;
    }

    protected void chktoemployee_CheckedChanged(object sender, EventArgs e)
    {
        pnltoemp.Visible = chktoemp.Checked;
    }

    protected void chktick_CheckedChanged(object sender, EventArgs e)
    {
        pnltick.Visible = chktick.Checked;
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (txttransactionid.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Transaction Id')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txttransactionid.Focus();
        }

        else if (txtcashoutdate.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Cash Out Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtcashoutdate.Focus();
        }

        else if (txtcashto.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Cash To')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtcashto.Focus();
        }

        else if (txtclientname.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Client Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtclientname.Focus();
        }

        else if (txtdepartment.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Department')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtdepartment.Focus();
        }

        else if (txtremarks.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Remark')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtremarks.Focus();
        }

        else if (txtdivisionname.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Division Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtdivisionname.Focus();
        }

        else if (txtempcode.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Emp Code')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtempcode.Focus();
        }

        else if (txtamount.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Amount')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtamount.Focus();
        }

        else if (TypeId.Text == "0")
        {
            ObjectBA.InsertCashOutDetail(txttransactionid.Text, txtcashoutdate.Text, txtcashto.Text, txtclientname.Text, txtdepartment.Text, ddlcashoutreason.Text, txtremarks.Text,
                txtselfadvancecode.Text, txtempname.Text, txtdivisionname.Text, txtempcode.Text, txtbillno.Text, txtamount.Text, txth2000s.Text, txth500s.Text,
                txth200s.Text, txth100s.Text, txth50s.Text, txth20s.Text, txth10s.Text, txth5s.Text, txth2s.Text, txth1s.Text, txthtotalamount.Text, txtd2000s.Text, txtd500s.Text,
                txtd200s.Text, txtd100s.Text, txtd50s.Text, txtd20s.Text, txtd10s.Text, txtd5s.Text, txtd2s.Text, txtd1s.Text, txtdtotalamount.Text);

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            clearTotalTxtBox();
            DgcashoutviewLoad();
            checkBoxConditionChecktovisible();
        }

        else
        {
            ObjectBA.UpdateCashOutDetail(TypeId.Text, txttransactionid.Text, txtcashoutdate.Text, txtcashto.Text, txtclientname.Text, txtdepartment.Text, ddlcashoutreason.Text, txtremarks.Text,
                txtselfadvancecode.Text, txtempname.Text, txtdivisionname.Text, txtempcode.Text, txtbillno.Text, txtamount.Text, txth2000s.Text, txth500s.Text,
                txth200s.Text, txth100s.Text, txth50s.Text, txth20s.Text, txth10s.Text, txth5s.Text, txth2s.Text, txth1s.Text, txthtotalamount.Text, txtd2000s.Text, txtd500s.Text,
                txtd200s.Text, txtd100s.Text, txtd50s.Text, txtd20s.Text, txtd10s.Text, txtd5s.Text, txtd2s.Text, txtd1s.Text, txtdtotalamount.Text);

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            clearTotalTxtBox();
            DgcashoutviewLoad();
            checkBoxConditionChecktovisible();
        }
    }

    private void clearTotalTxtBox()
    {
        TypeId.Text = "0";
        txttransactionid.Text = "";
        txtcashoutdate.Text = "";
        txtcashto.Text = "";
        txtclientname.Text = "";
        txtdepartment.Text = "";

        ddlcashoutreason.Items.Clear();
        ddlcashoutreason.Items.Add("----SELECT REASON----");
        CashReason();

        txtremarks.Text = "";
        txtselfadvancecode.Text = "";
        txtempname.Text = "";
        txtdivisionname.Text = "";
        txtempcode.Text = "";
        txtbillno.Text = "";
        txtamount.Text = "";
        txth2000s.Text = "";
        txth500s.Text = "";
        txth200s.Text = "";
        txth100s.Text = "";
        txth50s.Text = "";
        txth20s.Text = "";
        txth10s.Text = "";
        txth5s.Text = "";
        txth2s.Text = "";
        txth1s.Text = "";
        txthtotalamount.Text = "";
        txtd2000s.Text = "";
        txtd500s.Text = "";
        txtd200s.Text = "";
        txtd100s.Text = "";
        txtd50s.Text = "";
        txtd20s.Text = "";
        txtd10s.Text = "";
        txtd5s.Text = "";
        txtd2s.Text = "";
        txtd1s.Text = "";
        txtdtotalamount.Text = "";
        btnsave.Text = "Save";
        ValueZeroTxtBox();
    }

    protected void Dgcashoutview_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblCashOutId = Dgcashoutview.SelectedRow.FindControl("lblCashOutId") as Label;
        Label lblTransactionId = Dgcashoutview.SelectedRow.FindControl("lblTransactionId") as Label;
        Label lblCashDate = Dgcashoutview.SelectedRow.FindControl("lblCashDate") as Label;
        Label lblCashTo = Dgcashoutview.SelectedRow.FindControl("lblCashTo") as Label;
        Label lblClientname = Dgcashoutview.SelectedRow.FindControl("lblClientname") as Label;

        Label lblDepartment = Dgcashoutview.SelectedRow.FindControl("lblDepartment") as Label;
        Label lblCashOutReasion = Dgcashoutview.SelectedRow.FindControl("lblCashOutReasion") as Label;
        Label lblRemark = Dgcashoutview.SelectedRow.FindControl("lblRemark") as Label;
        Label lblAdvanceCode = Dgcashoutview.SelectedRow.FindControl("lblAdvanceCode") as Label;
        Label lblEmployeeName = Dgcashoutview.SelectedRow.FindControl("lblEmployeeName") as Label;

        Label lblDivisionName = Dgcashoutview.SelectedRow.FindControl("lblDivisionName") as Label;
        Label lblEmployeeCode = Dgcashoutview.SelectedRow.FindControl("lblEmployeeCode") as Label;
        Label lblBillNo = Dgcashoutview.SelectedRow.FindControl("lblBillNo") as Label;
        Label lblAmount = Dgcashoutview.SelectedRow.FindControl("lblAmount") as Label;
        Label lblHAND2000 = Dgcashoutview.SelectedRow.FindControl("lblHAND2000") as Label;

        Label lblHAND500 = Dgcashoutview.SelectedRow.FindControl("lblHAND500") as Label;
        Label lblHAND200 = Dgcashoutview.SelectedRow.FindControl("lblHAND200") as Label;
        Label lblHAND100 = Dgcashoutview.SelectedRow.FindControl("lblHAND100") as Label;
        Label lblHAND50 = Dgcashoutview.SelectedRow.FindControl("lblHAND50") as Label;
        Label lblHAND20 = Dgcashoutview.SelectedRow.FindControl("lblHAND20") as Label;
        Label lblHAND10 = Dgcashoutview.SelectedRow.FindControl("lblHAND10") as Label;
        Label lblHAND5 = Dgcashoutview.SelectedRow.FindControl("lblHAND5") as Label;
        Label lblHAND2 = Dgcashoutview.SelectedRow.FindControl("lblHAND2") as Label;
        Label lblHAND1 = Dgcashoutview.SelectedRow.FindControl("lblHAND1") as Label; 
        Label lblHANDTOTAL = Dgcashoutview.SelectedRow.FindControl("lblHANDTOTAL") as Label;

        Label lblDINO2000 = Dgcashoutview.SelectedRow.FindControl("lblDINO2000") as Label;
        Label lblDINO500 = Dgcashoutview.SelectedRow.FindControl("lblDINO500") as Label;
        Label lblDINO200 = Dgcashoutview.SelectedRow.FindControl("lblDINO200") as Label;
        Label lblDINO100 = Dgcashoutview.SelectedRow.FindControl("lblDINO100") as Label;
        Label lblDINO50 = Dgcashoutview.SelectedRow.FindControl("lblDINO50") as Label;
        Label lblDINO20 = Dgcashoutview.SelectedRow.FindControl("lblDINO20") as Label;
        Label lblDINO10 = Dgcashoutview.SelectedRow.FindControl("lblDINO10") as Label;
        Label lblDINO5 = Dgcashoutview.SelectedRow.FindControl("lblDINO5") as Label;
        Label lblDINO2 = Dgcashoutview.SelectedRow.FindControl("lblDINO2") as Label;
        Label lblDINO1 = Dgcashoutview.SelectedRow.FindControl("lblDINO1") as Label;
        Label lblDINOTOTAL = Dgcashoutview.SelectedRow.FindControl("lblDINOTOTAL") as Label;

        TypeId.Text = lblCashOutId.Text;
        txttransactionid.Text = lblTransactionId.Text;
        txtcashoutdate.Text = Convert.ToDateTime(lblCashDate.Text).ToString("dd/MM/yyyy");
        txtcashto.Text = lblCashTo.Text;
        txtclientname.Text = lblClientname.Text;
        txtdepartment.Text = lblDepartment.Text;
        ddlcashoutreason.SelectedValue = lblCashOutReasion.Text;
        txtremarks.Text = lblRemark.Text;

        txtselfadvancecode.Text = lblAdvanceCode.Text;
        txtempname.Text = lblEmployeeName.Text;
        txtdivisionname.Text = lblDivisionName.Text;
        txtempcode.Text = lblEmployeeCode.Text;
        txtbillno.Text = lblBillNo.Text;
        txtamount.Text = lblAmount.Text;

        txth2000s.Text = lblHAND2000.Text;
        txth500s.Text = lblHAND500.Text;
        txth200s.Text = lblHAND200.Text;
        txth100s.Text = lblHAND100.Text;
        txth50s.Text = lblHAND50.Text;
        txth20s.Text = lblHAND20.Text;
        txth10s.Text = lblHAND10.Text;
        txth5s.Text = lblHAND5.Text;
        txth2s.Text = lblHAND2.Text;
        txth1s.Text = lblHAND1.Text;
        txthtotalamount.Text = lblHANDTOTAL.Text;

        txtd2000s.Text = lblDINO2000.Text;
        txtd500s.Text = lblDINO500.Text;
        txtd200s.Text = lblDINO200.Text;
        txtd100s.Text = lblDINO100.Text;
        txtd50s.Text = lblDINO50.Text;
        txtd20s.Text = lblDINO20.Text;
        txtd10s.Text = lblDINO10.Text;
        txtd5s.Text = lblDINO5.Text;
        txtd2s.Text = lblDINO2.Text;
        txtd1s.Text = lblDINO1.Text;
        txtdtotalamount.Text = lblDINOTOTAL.Text;
        btnsave.Text = "Update";
        checkBoxConditionChecktovisible();
    }

    protected void btnneww_Click(object sender, EventArgs e)
    {
        clearTotalTxtBox();
        checkBoxConditionChecktovisible();
    }

    private void checkBoxConditionChecktovisible()
    {
        if (txtselfadvancecode.Text.Trim() != "")
        {
            chkgetfrom.Checked = true;
            pnlgetfrom.Visible = true;
        }

        else
        {
            chkgetfrom.Checked = false;
            pnlgetfrom.Visible = false;
        }

        if (txtempname.Text.Trim() != "")
        {
            chktoemp.Checked = true;
            pnltoemp.Visible = true;
        }

        else
        {
            chktoemp.Checked = false;
            pnltoemp.Visible = false;
        }

        if (txtbillno.Text.Trim() != "")
        {
            chktick.Checked = true;
            pnltick.Visible = true;
        }

        else
        {
            chktick.Checked = false;
            pnltick.Visible = false;
        }
    }

    protected void txttransactionid_TextChanged(object sender, EventArgs e)
    {
        txttransactionid.Text = txttransactionid.Text.ToUpper();
    }

    protected void txtcashto_TextChanged(object sender, EventArgs e)
    {
        txtcashto.Text = txtcashto.Text.ToUpper();
    }

    protected void txtclientname_TextChanged(object sender, EventArgs e)
    {
        txtclientname.Text = txtclientname.Text.ToUpper();
    }

    protected void txtdepartment_TextChanged(object sender, EventArgs e)
    {
        txtdepartment.Text = txtdepartment.Text.ToUpper();
    }

    protected void txtremarks_TextChanged(object sender, EventArgs e)
    {
        txtremarks.Text = txtremarks.Text.ToUpper();
    }

    protected void txtselfadvancecode_TextChanged(object sender, EventArgs e)
    {
        txtselfadvancecode.Text = txtselfadvancecode.Text.ToUpper();
    }

    protected void txtempname_TextChanged(object sender, EventArgs e)
    {
        txtempname.Text = txtempname.Text.ToUpper();
    }

    protected void txtdivisionname_TextChanged(object sender, EventArgs e)
    {
        txtdivisionname.Text = txtdivisionname.Text.ToUpper();
    }

    protected void txtempcode_TextChanged(object sender, EventArgs e)
    {
        txtempcode.Text = txtempcode.Text.ToUpper();
    }

    protected void txtbillno_TextChanged(object sender, EventArgs e)
    {
        txtbillno.Text = txtbillno.Text.ToUpper();
    }

    protected void txtnameview_TextChanged(object sender, EventArgs e)
    {
        txtnameview.Text = txtnameview.Text.ToUpper();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
    }

    protected void txth2000s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    private void CalculationCheck()
    {
        decimal Twothusand = 0, FiveHunred = 0, TwoHunred = 0, OneHunrad = 0, Fifty = 0, Twenty = 0, Ten = 0, Five = 0, Two = 0, One = 0, Total = 0;
        if (txth2000s.Text.Trim() != "")
        {
            Twothusand = Convert.ToDecimal(txth2000s.Text) * 2000;
        }
        if (txth500s.Text.Trim() != "")
        {
            FiveHunred = Convert.ToDecimal(txth500s.Text) * 500;
        }
        if (txth200s.Text.Trim() != "")
        {
            TwoHunred = Convert.ToDecimal(txth200s.Text) * 200;
        }
        if (txth100s.Text.Trim() != "")
        {
            OneHunrad = Convert.ToDecimal(txth100s.Text) * 100;
        }
        if (txth50s.Text.Trim() != "")
        {
            Fifty = Convert.ToDecimal(txth50s.Text) * 50;
        }
        if (txth20s.Text.Trim() != "")
        {
            Twenty = Convert.ToDecimal(txth20s.Text) * 20;
        }
        if (txth10s.Text.Trim() != "")
        {
            Ten = Convert.ToDecimal(txth10s.Text) * 10;
        }
        if (txth5s.Text.Trim() != "")
        {
            Five = Convert.ToDecimal(txth5s.Text) * 5;
        }
        if (txth2s.Text.Trim() != "")
        {
            Two = Convert.ToDecimal(txth2s.Text) * 2;
        }
        if (txth1s.Text.Trim() != "")
        {
            One = Convert.ToDecimal(txth1s.Text) * 1;
        }
        Total = Twothusand + FiveHunred + TwoHunred + OneHunrad + Fifty + Twenty + Ten + Five + Two + One;
        txthtotalamount.Text = Total.ToString("####.##");
    }

    protected void txth20s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txth500s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txth10s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txth200s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txth5s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txth100s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txth2s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txth50s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txth1s_TextChanged(object sender, EventArgs e)
    {
        CalculationCheck();
    }

    protected void txtd2000s_TextChanged(object sender, EventArgs e)
    {
        DinominationCheck();
    }

    private void DinominationCheck()
    {
        decimal Twothusand = 0, FiveHunred = 0, TwoHunred = 0, OneHunrad = 0, Fifty = 0, Twenty = 0, Ten = 0, Five = 0, Two = 0, One = 0, Total = 0;
        if (txtd2000s.Text.Trim() != "")
        {
            Twothusand = Convert.ToDecimal(txtd2000s.Text) * 2000;
        }
        if (txtd500s.Text.Trim() != "")
        {
            FiveHunred = Convert.ToDecimal(txtd500s.Text) * 500;
        }
        if (txtd200s.Text.Trim() != "")
        {
            TwoHunred = Convert.ToDecimal(txtd200s.Text) * 200;
        }
        if (txtd100s.Text.Trim() != "")
        {
            OneHunrad = Convert.ToDecimal(txtd100s.Text) * 100;
        }
        if (txtd50s.Text.Trim() != "")
        {
            Fifty = Convert.ToDecimal(txtd50s.Text) * 50;
        }
        if (txtd20s.Text.Trim() != "")
        {
            Twenty = Convert.ToDecimal(txtd20s.Text) * 20;
        }
        if (txtd10s.Text.Trim() != "")
        {
            Ten = Convert.ToDecimal(txtd10s.Text) * 10;
        }
        if (txtd5s.Text.Trim() != "")
        {
            Five = Convert.ToDecimal(txtd5s.Text) * 5;
        }
        if (txtd2s.Text.Trim() != "")
        {
            Two = Convert.ToDecimal(txtd2s.Text) * 2;
        }
        if (txtd1s.Text.Trim() != "")
        {
            One = Convert.ToDecimal(txtd1s.Text) * 1;
        }
        Total = Twothusand + FiveHunred + TwoHunred + OneHunrad + Fifty + Twenty + Ten + Five + Two + One;
        txtdtotalamount.Text = Total.ToString("####.##");
    }

    protected void txtd20s_TextChanged(object sender, EventArgs e)
    {
        DinominationCheck();
    }

    protected void txtd500s_TextChanged(object sender, EventArgs e)
    {
        DinominationCheck();
    }

    protected void txtd10s_TextChanged(object sender, EventArgs e)
    {
        DinominationCheck();
    }

    protected void txtd200s_TextChanged(object sender, EventArgs e)
    {
        DinominationCheck();
    }

    protected void txtd5s_TextChanged(object sender, EventArgs e)
    {
        DinominationCheck();
    }

    protected void txtd100s_TextChanged(object sender, EventArgs e)
    {
        DinominationCheck();
    }

    protected void txtd2s_TextChanged(object sender, EventArgs e)
    {
        DinominationCheck();
    }

    protected void txtd50s_TextChanged(object sender, EventArgs e)
    {
        DinominationCheck();
    }

    protected void txtd1s_TextChanged(object sender, EventArgs e)
    {
        DinominationCheck();
    }
}
