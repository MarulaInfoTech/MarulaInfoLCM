using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;

public partial class PayrollForms_IncomeEntry : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";

        if (!IsPostBack)
        {
            DgincomentryviewLoad();
            
            TypeId.Text = "0";
            ddlincome.SelectedValue = "";

        }
    }

    private void ddlincomeLoad()
    {
        ddlincome.DataSource = ObjectBA.SelectClinet();
        ddlincome.DataTextField = "CLIENTNAME";
        ddlincome.DataValueField = "CLIENTID";
        ddlincome.DataBind();
    }

    private void DgincomentryviewLoad()
    {
        Dgincomentryview.DataSource = ObjectBA.SelectIncomeEntryDetail();
        Dgincomentryview.DataBind();
    }

    protected void chkincome_CheckedChanged(object sender, EventArgs e)
    {
        if (chkincome.Checked == true)
        {
            ddlincomeLoad();
            pnlincome.Visible = true;
            ddlincome.SelectedValue = "----Select Client----";
        }
        else if(chkincome.Checked==false)
        {
            pnlincome.Visible = false;
            ddlincome.SelectedValue = "";            
        }        
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
               
        if (ddlincomemonth.SelectedValue == "----Select Month----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter Income Month')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlincomemonth.Focus();
        }
        else if (txtcompanyname.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Company Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtcompanyname.Focus();
        }
        else if (txtaddress1.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Address1')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtaddress1.Focus();
        }
        else if (txtaddress2.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Address2')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtaddress2.Focus();
        }
        else if (txtaddress3.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Address3')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtaddress3.Focus();
        }
        else if (txtbillno.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Bill.No')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtbillno.Focus();
        }
        else if (txtcontactno.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Contact.No')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtcontactno.Focus();
        }
        else if (txtbilldescription.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Bill.Description')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtbilldescription.Focus();
        }
        else if (txtbillamount.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Bill Amount')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtbillamount.Focus();
        }
        else if (ddlpaymentmode.SelectedValue == "----Payment Mode----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Payment Mode')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlpaymentmode.Focus();
        }
        else if (ddlpaymentmode.SelectedValue == "Cheque")
        {
            if (txtcheque.Text == "")
            {
                System.Threading.Thread.Sleep(100);
                string message = "alert('Enter The Cheque and Other.No')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                txtcheque.Focus();
            }
            else if (txtdate.Text == "")
            {
                System.Threading.Thread.Sleep(100);
                string message = "alert('Enter the Cheque Date')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                txtdate.Focus();
            }
        }
        else if (TypeId.Text == "0")
        {
            ObjectBA.InsertIncomeEntryDetail(ddlincome.SelectedValue, ddlincomemonth.Text, txtcompanyname.Text, txtaddress1.Text, txtaddress2.Text, txtaddress3.Text,
                txtbillno.Text, txtcontactno.Text, txtbilldescription.Text, txtbillamount.Text, ddlpaymentmode.Text, txtcheque.Text, txtdate.Text);
            clearTotalTxtBox();
            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            DgincomentryviewLoad();
        }
        else
        {
            ObjectBA.UpdateIncomeEntryDetail(TypeId.Text, ddlincome.SelectedValue, ddlincomemonth.Text, txtcompanyname.Text, txtaddress1.Text, txtaddress2.Text, txtaddress3.Text,
                txtbillno.Text, txtcontactno.Text, txtbilldescription.Text, txtbillamount.Text, ddlpaymentmode.Text, txtcheque.Text, txtdate.Text);
            clearTotalTxtBox();
            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            DgincomentryviewLoad();
        } 
    }
    protected void Dgincomentryview_SelectedIndexChanged(object sender, EventArgs e)
    {

        Label lblINCOMEID = Dgincomentryview.SelectedRow.FindControl("lblINCOMEID") as Label;
        Label lblCLIENTID = Dgincomentryview.SelectedRow.FindControl("lblCLIENTID") as Label;
        Label lblCLIENTNAME = Dgincomentryview.SelectedRow.FindControl("lblCLIENTNAME") as Label;
        Label lblINCOMEMONTH = Dgincomentryview.SelectedRow.FindControl("lblINCOMEMONTH") as Label;
        Label lblCOMPANYNAME = Dgincomentryview.SelectedRow.FindControl("lblCOMPANYNAME") as Label;

        Label lblADDRESS1 = Dgincomentryview.SelectedRow.FindControl("lblADDRESS1") as Label;
        Label lblADDRESS2 = Dgincomentryview.SelectedRow.FindControl("lblADDRESS2") as Label;
        Label lblADDRESS3 = Dgincomentryview.SelectedRow.FindControl("lblADDRESS3") as Label;
        Label lblCONTACT = Dgincomentryview.SelectedRow.FindControl("lblCONTACT") as Label;
        Label lblBILLNO = Dgincomentryview.SelectedRow.FindControl("lblBILLNO") as Label;

        Label lblBILLDESCRIP = Dgincomentryview.SelectedRow.FindControl("lblBILLDESCRIP") as Label;
        Label lblBILLAMOUNT = Dgincomentryview.SelectedRow.FindControl("lblBILLAMOUNT") as Label;
        Label lblPAYMENTMODE = Dgincomentryview.SelectedRow.FindControl("lblPAYMENTMODE") as Label;
        Label lblCHEQUE = Dgincomentryview.SelectedRow.FindControl("lblCHEQUE") as Label;
        Label lblDATE = Dgincomentryview.SelectedRow.FindControl("lblDATE") as Label;

        TypeId.Text = lblINCOMEID.Text;
        if (lblCLIENTID.Text !="0")
        {
            chkincome.Checked = true;
            pnlincome.Visible = true;
            ddlincomeLoad();
            ddlincome.SelectedValue = lblCLIENTID.Text;
        }
        else
        {
            chkincome.Checked = false;
            pnlincome.Visible = false;
            ddlincome.SelectedValue = "";
        }

        ddlincomemonth.Text = lblINCOMEMONTH.Text;
        txtcompanyname.Text = lblCOMPANYNAME.Text;
        txtaddress1.Text = lblADDRESS1.Text;
        txtaddress2.Text = lblADDRESS2.Text;
        txtaddress3.Text = lblADDRESS3.Text;
        txtcontactno.Text = lblCONTACT.Text;
        txtbillno.Text = lblBILLNO.Text;
        txtbilldescription.Text = lblBILLDESCRIP.Text;
        txtbillamount.Text = lblBILLAMOUNT.Text;
        ddlpaymentmode.SelectedValue = lblPAYMENTMODE.Text;
        txtcheque.Text = lblCHEQUE.Text;
        txtdate.Text = Convert.ToDateTime(lblDATE.Text).ToString("dd/MM/yyyy");
        btnsave.Text = "Update";

    }
    protected void btnnew_Click(object sender, EventArgs e)
    {
        clearTotalTxtBox();
    }
    private void clearTotalTxtBox()
    {
        TypeId.Text = "0";
        ddlincome.SelectedValue = "----Select Client----";
        ddlincomemonth.Text = "----Select Month----";
        txtcompanyname.Text = "";
        txtaddress1.Text = "";
        txtaddress2.Text = "";
        txtaddress3.Text = "";
        txtcontactno.Text = "";
        txtbillno.Text = "";
        txtbilldescription.Text = "";
        txtbillamount.Text = "";
        ddlpaymentmode.SelectedValue = "----Payment Mode----";
        txtcheque.Text = "";
        txtdate.Text = "";
        chkincome.Checked = false;
        pnlincome.Visible = false;
        btnsave.Text = "Save";
    }

    protected void ddlincome_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlincome.Text = ddlincome.Text.ToUpper();
    }

    protected void txtcompanyname_TextChanged(object sender, EventArgs e)
    {
        txtcompanyname.Text = txtcompanyname.Text.ToUpper();
    }

    protected void txtaddress1_TextChanged(object sender, EventArgs e)
    {
        txtaddress1.Text = txtaddress1.Text.ToUpper();
    }

    protected void txtaddress2_TextChanged(object sender, EventArgs e)
    {
        txtaddress2.Text = txtaddress2.Text.ToUpper();
    }

    protected void txtaddress3_TextChanged(object sender, EventArgs e)
    {
        txtaddress3.Text = txtaddress3.Text.ToUpper();
    }

    protected void txtbilldescription_TextChanged(object sender, EventArgs e)
    {
        txtbilldescription.Text = txtbilldescription.Text.ToUpper();
    }

    protected void ddlincomemonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlincomemonth.Text = ddlincomemonth.Text.ToUpper();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";

    }
}