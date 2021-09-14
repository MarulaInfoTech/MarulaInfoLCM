using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;

public partial class PayrollForms_ExpenseEntry : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();

    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";

        if (!IsPostBack)
        {
            DgexpensesentryviewLoad();
            
            TypeId.Text = "0";
            ddlexpense.SelectedValue = "";
        }
    }

    private void ddlexpenseLoad()
    {        
        ddlexpense.DataSource = ObjectBA.SelectClinet();
        ddlexpense.DataTextField = "CLIENTNAME";
        ddlexpense.DataValueField = "CLIENTID";
        ddlexpense.DataBind();
    }

    private void DgexpensesentryviewLoad()
    {
        Dgexpensesentryview.DataSource = ObjectBA.SelectExpensesEntryDetail();
        Dgexpensesentryview.DataBind();
    }

    protected void chkexpense_CheckedChanged(object sender, EventArgs e)
    {
        //pnlexpense.Visible = chkexpense.Checked;
        if (chkexpense.Checked == true)
        {
            ddlexpenseLoad();
            pnlexpense.Visible = true;
            ddlexpense.SelectedValue = "----Select Client----";
        }
        else if (chkexpense.Checked == false)
        {
            pnlexpense.Visible = false;            
        } 
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (ddlexpensesmonth.SelectedValue == "----Select Month----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Expenses Month')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlexpensesmonth.Focus();
        }
        else if (txtavailablelbl.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Available Balance')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtavailablelbl.Focus();
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
            string message = "alert('Enter The Bill Description')";
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
            if (txtcheque.Text=="")
            {
                System.Threading.Thread.Sleep(100);
                string message = "alert('Enter The Cheque and Other.No')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                txtcheque.Focus();
            }
            else if(txtdate.Text=="")
            {
                System.Threading.Thread.Sleep(100);
                string message = "alert('Enter The Cheque.No and Date')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                txtdate.Focus();
            }
        }
        
        else if (TypeId.Text == "0")
        {
            ObjectBA.InsertExpensesEntryDetail(ddlexpense.SelectedValue, ddlexpensesmonth.Text, txtavailablelbl.Text, txtcompanyname.Text, txtaddress1.Text, txtaddress2.Text,
                txtaddress3.Text, txtbillno.Text, txtcontactno.Text, txtbilldescription.Text, txtbillamount.Text, ddlpaymentmode.Text, txtcheque.Text, txtdate.Text);

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            DgexpensesentryviewLoad();
            ClearTotalTxtBox();
        }

        else
        {
            ObjectBA.UpdateExpensesEntryDetail(TypeId.Text, ddlexpense.SelectedValue, ddlexpensesmonth.Text, txtavailablelbl.Text, txtcompanyname.Text, txtaddress1.Text, txtaddress2.Text,
                txtaddress3.Text, txtbillno.Text, txtcontactno.Text, txtbilldescription.Text, txtbillamount.Text, ddlpaymentmode.Text, txtcheque.Text, txtdate.Text);

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            DgexpensesentryviewLoad();
            ClearTotalTxtBox();
        }
    }

    private void ClearTotalTxtBox()
    {
        TypeId.Text = "0";
        ddlexpense.SelectedValue = "";
        ddlexpensesmonth.Text = "----Select Month----";
        txtavailablelbl.Text = "";
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
        chkexpense.Checked = false;
        pnlexpense.Visible = false;
        btnsave.Text = "Save";
    }

    protected void Dgexpensesentryview_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblEXPENSESID = Dgexpensesentryview.SelectedRow.FindControl("lblEXPENSESID") as Label;
        Label lblCLIENTID = Dgexpensesentryview.SelectedRow.FindControl("lblCLIENTID") as Label;
        Label lblCLIENTNAME = Dgexpensesentryview.SelectedRow.FindControl("lblCLIENTNAME") as Label;
        Label lblEXPENSESMONTH = Dgexpensesentryview.SelectedRow.FindControl("lblEXPENSESMONTH") as Label;
        Label lblAVBBALANCE = Dgexpensesentryview.SelectedRow.FindControl("lblAVBBALANCE") as Label;

        Label lblCOMPANYNAME = Dgexpensesentryview.SelectedRow.FindControl("lblCOMPANYNAME") as Label;
        Label lblADDRESS1 = Dgexpensesentryview.SelectedRow.FindControl("lblADDRESS1") as Label;
        Label lblADDRESS2 = Dgexpensesentryview.SelectedRow.FindControl("lblADDRESS2") as Label;
        Label lblADDRESS3 = Dgexpensesentryview.SelectedRow.FindControl("lblADDRESS3") as Label;
        Label lblCONTACT = Dgexpensesentryview.SelectedRow.FindControl("lblCONTACT") as Label;
        Label lblBILLNO = Dgexpensesentryview.SelectedRow.FindControl("lblBILLNO") as Label;

        Label lblBILLDESCRIP = Dgexpensesentryview.SelectedRow.FindControl("lblBILLDESCRIP") as Label;
        Label lblBILLAMOUNT = Dgexpensesentryview.SelectedRow.FindControl("lblBILLAMOUNT") as Label;
        Label lblPAYMENTMODE = Dgexpensesentryview.SelectedRow.FindControl("lblPAYMENTMODE") as Label;
        Label lblCHEQUE = Dgexpensesentryview.SelectedRow.FindControl("lblCHEQUE") as Label;
        Label lblDATE = Dgexpensesentryview.SelectedRow.FindControl("lblDATE") as Label;

        //ddlexpense.SelectedValue, ddlexpensesmonth.Text, txtavailablelbl.Text, txtcompanyname.Text, txtaddress1.Text, txtaddress2.Text,
        //        txtaddress3.Text, txtbillno.Text, txtcontactno.Text, txtbilldescription.Text, txtbillamount.Text, ddlpaymentmode.Text, txtcheque.Text, txtdate.Text);

        TypeId.Text = lblEXPENSESID.Text;
        if(lblCLIENTID.Text != "0")
        {
            chkexpense.Checked = true;
            pnlexpense.Visible = true;
            ddlexpenseLoad();
            ddlexpense.SelectedValue = lblCLIENTID.Text;
        }
        else
        {
            chkexpense.Checked = false;
            pnlexpense.Visible = false;
            ddlexpense.SelectedValue = "";
        }

        ddlexpensesmonth.Text = lblEXPENSESMONTH.Text;
        txtavailablelbl.Text = lblAVBBALANCE.Text;
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
        ClearTotalTxtBox();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";
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

}