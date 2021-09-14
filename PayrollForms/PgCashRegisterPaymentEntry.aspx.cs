using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;

public partial class PayrollForms_PaymentEntry : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();

    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";

        if (!IsPostBack)
        {
            Dgpaymententryviewload();
            TypeId.Text = "0";
            valuezeroLoadTxtBox();
        }
    }

    private void valuezeroLoadTxtBox()
    {
        txtgrandtotal.Text = "0";
        txtservicetax.Text = "0";
        txtnetamount.Text = "0";
        txttds.Text = "0";
        txtinsurancce.Text = "0";
        txtcanteen.Text = "0";
        txtbillcover.Text = "0";
        txtpaid.Text = "0";
        txtbalance.Text = "0";
    }

    private void Dgpaymententryviewload()
    {
        Dgpaymententryview.DataSource = ObjectBA.SelectPaymentDetail();
        Dgpaymententryview.DataBind();
    }

    protected void chkPassport_CheckedChanged(object sender, EventArgs e)
    {        
    }

    protected void txtcheque_TextChanged(object sender, EventArgs e)
    {
    }
    protected void chkcheque_CheckedChanged(object sender, EventArgs e)
    {
       pnlcheque.Visible = chkcheque.Checked;
        
    }

    //protected void btnsave_Click(object sender, EventArgs e)
    //{
    //    if (TypeId.Text == "0")
    //    {
    //        ObjectBA.InsertPaymentDetail(txtinvoiceno.Text, txtinvoicedate.Text, txtclientname.Text, txtdivisioname.Text, txtgrandtotal.Text, txtservicetax.Text, txtnetamount.Text,
    //            txttds.Text,txtinsurancce.Text, txtcanteen.Text, txtbillcover.Text, txtpaid.Text, txtbalance.Text, txtstatus.Text, txtcheque.Text, txtamount.Text, txtchequedate.Text, txtclearedondate.Text);
    //        MessageBox.ForeColor = System.Drawing.Color.Green;
    //        MessageBox.Visible = true;
    //        MessageBox.Text = "Data Save";
    //    }
    //    else
    //    {
    //        ObjectBA.UpdatePaymentDetail(TypeId.Text,txtinvoiceno.Text, txtinvoicedate.Text, txtclientname.Text, txtdivisioname.Text, txtgrandtotal.Text, txtservicetax.Text, txtnetamount.Text,
    //             txttds.Text, txtinsurancce.Text, txtcanteen.Text, txtbillcover.Text, txtpaid.Text, txtbalance.Text, txtstatus.Text, txtcheque.Text, txtamount.Text, txtchequedate.Text, txtclearedondate.Text);
    //    }
    //}

    protected void Dgpaymententryview_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblPaymentID = Dgpaymententryview.SelectedRow.FindControl("lblPaymentID") as Label;
        Label lblInvoiceNo = Dgpaymententryview.SelectedRow.FindControl("lblInvoiceNo") as Label;
        Label lblInvoiceDate = Dgpaymententryview.SelectedRow.FindControl("lblInvoiceDate") as Label;
        Label lblClientName = Dgpaymententryview.SelectedRow.FindControl("lblClientName") as Label;
        Label lblDivision = Dgpaymententryview.SelectedRow.FindControl("lblDivision") as Label;

        Label lblGrandTotal = Dgpaymententryview.SelectedRow.FindControl("lblGrandTotal") as Label;
        Label lblServiceTax = Dgpaymententryview.SelectedRow.FindControl("lblServiceTax") as Label;
        Label lblNetAmount = Dgpaymententryview.SelectedRow.FindControl("lblNetAmount") as Label;
        Label lblTDS = Dgpaymententryview.SelectedRow.FindControl("lblTDS") as Label;
        Label lblInsurance = Dgpaymententryview.SelectedRow.FindControl("lblInsurance") as Label;

        Label lblCanteen = Dgpaymententryview.SelectedRow.FindControl("lblCanteen") as Label;
        Label lblBillRecover = Dgpaymententryview.SelectedRow.FindControl("lblBillRecover") as Label;
        Label lblPaid = Dgpaymententryview.SelectedRow.FindControl("lblPaid") as Label;
        Label lblBalance = Dgpaymententryview.SelectedRow.FindControl("lblBalance") as Label;
        Label lblStatus = Dgpaymententryview.SelectedRow.FindControl("lblStatus") as Label;

        Label lblChequeNo = Dgpaymententryview.SelectedRow.FindControl("lblChequeNo") as Label;
        Label lblAmount = Dgpaymententryview.SelectedRow.FindControl("lblAmount") as Label;
        Label lblChequeDate = Dgpaymententryview.SelectedRow.FindControl("lblChequeDate") as Label;
        Label lblClearDate = Dgpaymententryview.SelectedRow.FindControl("lblClearDate") as Label;


        TypeId.Text = lblPaymentID.Text;
        txtinvoiceno.Text = lblInvoiceNo.Text;
        txtinvoicedate.Text = Convert.ToDateTime(lblInvoiceDate.Text).ToString("dd/MM/yyyy");
        txtclientname.Text = lblClientName.Text;
        txtdivisioname.Text = lblDivision.Text;
        txtgrandtotal.Text = lblGrandTotal.Text;
        txtservicetax.Text = lblServiceTax.Text;
        txtnetamount.Text = lblNetAmount.Text;
        txttds.Text = lblTDS.Text;
        txtinsurancce.Text = lblInsurance.Text;
        txtcanteen.Text = lblCanteen.Text;
        txtbillcover.Text = lblBillRecover.Text;
        txtpaid.Text = lblPaid.Text;
        txtbalance.Text = lblBalance.Text;
        txtstatus.Text = lblStatus.Text;
        txtcheque.Text = lblChequeNo.Text;
        txtamount.Text = lblAmount.Text;
        txtchequedate.Text = Convert.ToDateTime(lblChequeDate.Text).ToString("dd/MM/yyyy");
        txtclearedondate.Text = Convert.ToDateTime(lblClearDate.Text).ToString("dd/MM/yyyy");
       
        btnsave.Text = "Update";
    }

    protected void btnsave_Click1(object sender, EventArgs e)
    {
        if (txtinvoiceno.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Invoice.No')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtinvoiceno.Focus();
        }
        else if (txtinvoicedate.Text.Trim()=="")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Invoice.Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtinvoicedate.Focus();
        }
        else if (txtclientname.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The ClientName')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtclientname.Focus();
        }
        else if (txtdivisioname.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Division Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtdivisioname.Focus();
        }
        else if (txtgrandtotal.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Grand Total')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtgrandtotal.Focus();
        }
        else if (txtservicetax.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Service Tax')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtservicetax.Focus();
        }
        else if (txtnetamount.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Net Amount')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtnetamount.Focus();
        }
        else if (txttds.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Tds')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txttds.Focus();
        }
        else if (txtinsurancce.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Insurance')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtinsurancce.Focus();
        }
        else if (txtcanteen.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Canteen')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtcanteen.Focus();
        }
        else if (txtbillcover.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The BillCover')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtbillcover.Focus();
        }
        else if (txtpaid.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Paid')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtpaid.Focus();
        }
        else if (txtbalance.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Balance')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtbalance.Focus();
        }
        else if (txtstatus.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Status')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtstatus.Focus();
        }
        else if (txtchequedate.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Cheque Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtchequedate.Focus();
        }
        else if (txtclearedondate.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Clear Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtclearedondate.Focus();
        }
        else if (TypeId.Text == "0")
        {
            ObjectBA.InsertPaymentDetail(txtinvoiceno.Text, txtinvoicedate.Text, txtclientname.Text, txtdivisioname.Text, txtgrandtotal.Text, txtservicetax.Text, txtnetamount.Text,
            txttds.Text, txtinsurancce.Text, txtcanteen.Text, txtbillcover.Text, txtpaid.Text, txtbalance.Text, txtstatus.Text, txtcheque.Text, txtamount.Text, txtchequedate.Text, txtclearedondate.Text);           
            Dgpaymententryviewload();
            clearTotalTxtBox();
            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        }
        else
        {
            ObjectBA.UpdatePaymentDetail(TypeId.Text, txtinvoiceno.Text, txtinvoicedate.Text, txtclientname.Text, txtdivisioname.Text, txtgrandtotal.Text, txtservicetax.Text, txtnetamount.Text,
            txttds.Text, txtinsurancce.Text, txtcanteen.Text, txtbillcover.Text, txtpaid.Text, txtbalance.Text, txtstatus.Text, txtcheque.Text, txtamount.Text, txtchequedate.Text, txtclearedondate.Text);
            MessageBox.ForeColor = System.Drawing.Color.Green;
            MessageBox.Visible = true;
            MessageBox.Text = "Data Update";

            Dgpaymententryviewload();
            clearTotalTxtBox();
           
        }
    }
    private void clearTotalTxtBox()
    {
        TypeId.Text = "";
        txtinvoiceno.Text = "";
        txtinvoicedate.Text = "";
        txtclientname.Text = "";
        txtdivisioname.Text = "";
        txtgrandtotal.Text = "";
        txtservicetax.Text = "";
        txtnetamount.Text = "";
        txttds.Text = "";
        txtinsurancce.Text = "";
        txtcanteen.Text = "";
        txtbillcover.Text = "";
        txtpaid.Text = "";
        txtbalance.Text = "";
        txtstatus.Text = "";
        txtcheque.Text = "";
        txtamount.Text = "";
        txtchequedate.Text = "";
        txtclearedondate.Text = "";
        btnsave.Text = "Save ";
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        clearTotalTxtBox();
    }

    protected void txtclientname_TextChanged(object sender, EventArgs e)
    {
        txtclientname.Text = txtclientname.Text.ToUpper();
    }
    protected void txtdivisioname_TextChanged(object sender, EventArgs e)
    {
        txtdivisioname.Text = txtdivisioname.Text.ToUpper();
    }
    protected void txtstatus_TextChanged(object sender, EventArgs e)
    {
        txtstatus.Text = txtstatus.Text.ToUpper();
    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";
    }
}