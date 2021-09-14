using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;
using System.Data;

public partial class PayrollForms_PgTaxes_GST : System.Web.UI.Page
{
    ClsBusnssLayer objectBL = new ClsBusnssLayer();
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GSTDetailsGridShowBS();
            CodeNoLoad();

                       

        }
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        if (ddlmonth.Text == "---- Select Month ----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select the Month')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlmonth.Focus();
        }
        else
        {
            DgGSTFront.DataSource = objectBL.SelectGSTTax(ddlmonth.SelectedIndex.ToString());
            DgGSTFront.DataBind();

            CalculateAll();

            FootCalculat();
        }
    }

    public void GSTDetailsDtlGridShow()
    {
        DgGSTFront.DataSource = objectBL.GSTDetailsDtlGridShowBC(TypeId.Text);
        DgGSTFront.DataBind();

    }

    public void GSTDetailsGridShowBS()
    {
        DgGSTBack.DataSource = objectBL.GSTDetailsGridShowBC();
        DgGSTBack.DataBind();
    }

    public void CodeNoLoad()
    {
        dt = new DataTable();
        dt = objectBL.GSTCodeNoBC();
        if(dt.Rows.Count > 0 )
        {
            if (dt.Rows[0][0].ToString() != "")
            {
                decimal Number = Convert.ToDecimal(dt.Rows[0][0]);
                Number = Number + 1;
                txtcodeno.Text = Number.ToString("0###");
            }
            else
            {
                txtcodeno.Text = "0001";
            }
        }
        else
        {
            txtcodeno.Text = "0001";
        } 
    }

    public void calculat()
    {        
      txttotalpayabelgstvalue.Text = (Convert.ToDouble(txttotalgst.Text) - Convert.ToDouble(txtpurchasevalue.Text)).ToString("#####.00");         
    }

    private void CalculateAll()
    {
        double CGST = 0, IGST = 0, CESS = 0, SGST = 0, Total = 0;
        for (int i = 0; i < DgGSTFront.Rows.Count; i++)
        {
            Label lblCgstTax = DgGSTFront.Rows[i].FindControl("lblCgstTax") as Label;
            Label lblSgstTax = DgGSTFront.Rows[i].FindControl("lblSgstTax") as Label;
            Label lblIgstTax = DgGSTFront.Rows[i].FindControl("lblIgstTax") as Label;
            Label lblCessTax = DgGSTFront.Rows[i].FindControl("lblCessTax") as Label;
            Label lblnetamount = DgGSTFront.Rows[i].FindControl("lblnetamount") as Label;

            CGST = Convert.ToDouble(lblCgstTax.Text);
            IGST = Convert.ToDouble(lblIgstTax.Text);
            CESS = Convert.ToDouble(lblCessTax.Text);
            SGST = Convert.ToDouble(lblSgstTax.Text);

            lblnetamount.Text = (Convert.ToDouble(lblCgstTax.Text) + Convert.ToDouble(lblSgstTax.Text) + Convert.ToDouble(lblIgstTax.Text) + Convert.ToDouble(lblCessTax.Text)).ToString("#####.00");

            Total += Convert.ToDouble(lblnetamount.Text);
        }
    }

    protected void btncalculat_Click(object sender, EventArgs e)
    {
        double CGST = 0, IGST = 0, CESS = 0, SGST = 0, Total = 0;
        for (int i = 0; i < DgGSTFront.Rows.Count; i++)
        {
            CheckBox chkgrid = DgGSTFront.Rows[i].FindControl("chkgrid") as CheckBox;
            if (chkgrid.Checked == true)
            {
                Label lblCgstTax = DgGSTFront.Rows[i].FindControl("lblCgstTax") as Label;
                Label lblSgstTax = DgGSTFront.Rows[i].FindControl("lblSgstTax") as Label;
                Label lblIgstTax = DgGSTFront.Rows[i].FindControl("lblIgstTax") as Label;
                Label lblCessTax = DgGSTFront.Rows[i].FindControl("lblCessTax") as Label;
                Label lblnetamount = DgGSTFront.Rows[i].FindControl("lblnetamount") as Label;

                CGST += Convert.ToDouble(lblCgstTax.Text);
                txtcgst.Text = CGST.ToString();

                IGST += Convert.ToDouble(lblIgstTax.Text);
                txtigst.Text = IGST.ToString();

                CESS += Convert.ToDouble(lblCessTax.Text);
                txtcess.Text = CESS.ToString();

                SGST += Convert.ToDouble(lblSgstTax.Text);
                txtsgst.Text = SGST.ToString();

                Total += Convert.ToDouble(lblnetamount.Text);
                txttotalgst.Text = Total.ToString();
            }
        }        
    }

    public void FrontsideGridSave()
    {        
        for (int i = 0; i < DgGSTFront.Rows.Count; i++)
        {
            CheckBox chkgrid = DgGSTFront.Rows[i].FindControl("chkgrid") as CheckBox;
            if (chkgrid.Checked == true)
            {
                Label lblclientid = DgGSTFront.Rows[i].FindControl("lblclientid") as Label;

                Label lblrgbid = DgGSTFront.Rows[i].FindControl("lblrgbid") as Label;
                Label lblinvoiceno = DgGSTFront.Rows[i].FindControl("lblinvoiceno") as Label;
                Label lblinvoicedate = DgGSTFront.Rows[i].FindControl("lblinvoicedate") as Label;
                Label lblclientname = DgGSTFront.Rows[i].FindControl("lblclientname") as Label;               
                Label lblclientgstno = DgGSTFront.Rows[i].FindControl("lblclientgstno") as Label;
                Label lbldivisionname = DgGSTFront.Rows[i].FindControl("lbldivisionname") as Label;
                Label lblgrandtotal = DgGSTFront.Rows[i].FindControl("lblgrandtotal") as Label;
                Label lblCgstTax = DgGSTFront.Rows[i].FindControl("lblCgstTax") as Label;
                Label lblSgstTax = DgGSTFront.Rows[i].FindControl("lblSgstTax") as Label;
                Label lblIgstTax = DgGSTFront.Rows[i].FindControl("lblIgstTax") as Label;
                Label lblCessTax = DgGSTFront.Rows[i].FindControl("lblCessTax") as Label;
                Label lblnetamount = DgGSTFront.Rows[i].FindControl("lblnetamount") as Label;

                objectBL.GSTInvoiceDetailsInsertBC(TypeId.Text, lblclientid.Text, lblrgbid.Text,lblinvoiceno.Text, lblinvoicedate.Text, lblclientname.Text, lblclientgstno.Text,
                        lbldivisionname.Text, lblgrandtotal.Text, lblCgstTax.Text, lblSgstTax.Text, lblIgstTax.Text, lblCessTax.Text, lblnetamount.Text);                
            }
        }
    }

    private void GSTDetailsHdrMaxIDLoad()
    {
        dt = objectBL.GSTDetailsHdrMaxSelect();
        if (dt.Rows[0]["GSTID"].ToString() != "")
        {
            TypeId.Text = dt.Rows[0]["GSTID"].ToString();
            FrontsideGridSave();
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (ddlmonth.Text == "---- Select Month ----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select the Month')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlmonth.Focus();
        }

        else if (txtcgdate.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Challan Generate Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtcgdate.Focus();
        }

        else if (txtcodeno.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the CodeNo')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtcodeno.Focus();
        }

        else if (ddlpaymentmode.Text == "-- Select Mode --")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select the Payment Mode')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlpaymentmode.Focus();
        }

        else if (txtbankname.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Bank Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtbankname.Focus();
        }

        else if (txtbranchname.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Branch Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtbranchname.Focus();
        }

        else if (txtpreparedby.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Prepared By')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtpreparedby.Focus();
        }

        else if (txtpaymentdate.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Payment Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtpaymentdate.Focus();
        }

        else if (ddlpaymentgststatus.Text == "-- Select Payment Status --")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select the Payment Status')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlpaymentgststatus.Focus();
        }

        else if (txtcpinno.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the CPIN No')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtcpinno.Focus();
        }

        else
        {
            if (btnsave.Text == "Save")
            {
                objectBL.GSTDetailsInsertBC(ddlmonth.SelectedIndex.ToString(), ddlmonth.SelectedValue, txtcgdate.Text, txtcodeno.Text, ddlpaymentmode.SelectedValue,
                         txtbankname.Text, txtbranchname.Text, txtpreparedby.Text, txtpaymentdate.Text, txtcgst.Text, txtigst.Text,
                         txtcess.Text, txtsgst.Text, txttotalgst.Text, txtpurchasevalue.Text, txttotalpayabelgstvalue.Text, ddlpaymentgststatus.SelectedValue, txtcpinno.Text);

                GSTDetailsHdrMaxIDLoad();

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);

                Clearnew();
                GSTDetailsGridShowBS();
            }
            else
            {
                objectBL.GSTDetailsUpdateBC(TypeId.Text, ddlmonth.SelectedIndex.ToString(), ddlmonth.SelectedValue, txtcgdate.Text, txtcodeno.Text, ddlpaymentmode.SelectedValue,
                     txtbankname.Text, txtbranchname.Text, txtpreparedby.Text, txtpaymentdate.Text, txtcgst.Text, txtigst.Text,
                     txtcess.Text, txtsgst.Text, txttotalgst.Text, txtpurchasevalue.Text, txttotalpayabelgstvalue.Text, ddlpaymentgststatus.SelectedValue, txtcpinno.Text);


                objectBL.DeleteGStIdBC(TypeId.Text);
                FrontsideGridSave();

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);

                Clearnew();
                GSTDetailsGridShowBS();
            }
        }
    }

    protected void DgGSTBack_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblgstid = DgGSTBack.SelectedRow.FindControl("lblgstid") as Label;
        Label lblgstmonthid = DgGSTBack.SelectedRow.FindControl("lblgstmonthid") as Label;
        Label lblchallandate = DgGSTBack.SelectedRow.FindControl("lblchallandate") as Label;
        Label lblcodeno = DgGSTBack.SelectedRow.FindControl("lblcodeno") as Label;
        Label lblpaymentmode = DgGSTBack.SelectedRow.FindControl("lblpaymentmode") as Label;
        Label lblbankname = DgGSTBack.SelectedRow.FindControl("lblbankname") as Label;
        Label lblbranchname = DgGSTBack.SelectedRow.FindControl("lblbranchname") as Label;
        Label lblpreparedby = DgGSTBack.SelectedRow.FindControl("lblpreparedby") as Label;
        Label lblpaymentdate = DgGSTBack.SelectedRow.FindControl("lblpaymentdate") as Label;
        Label lblcgst = DgGSTBack.SelectedRow.FindControl("lblcgst") as Label;
        Label lbligst = DgGSTBack.SelectedRow.FindControl("lbligst") as Label;
        Label lblcess = DgGSTBack.SelectedRow.FindControl("lblcess") as Label;
        Label lblsgst = DgGSTBack.SelectedRow.FindControl("lblsgst") as Label;
        Label lbltotalgst = DgGSTBack.SelectedRow.FindControl("lbltotalgst") as Label;
        Label lblpurchasevalue = DgGSTBack.SelectedRow.FindControl("lblpurchasevalue") as Label;
        Label lblTotalpayabelgstvalue = DgGSTBack.SelectedRow.FindControl("lblTotalpayabelgstvalue") as Label;
        Label lblgstpaymentstatus = DgGSTBack.SelectedRow.FindControl("lblgstpaymentstatus") as Label;
        Label lblcipnno = DgGSTBack.SelectedRow.FindControl("lblcipnno") as Label;

        TypeId.Text = lblgstid.Text;
        ddlmonth.SelectedIndex = Convert.ToInt16(lblgstmonthid.Text);
        txtcgdate.Text = Convert.ToDateTime(lblchallandate.Text).ToString("dd/MM/yyyy");
        txtcodeno.Text = lblcodeno.Text;
        ddlpaymentmode.Text = lblpaymentmode.Text;
        txtbankname.Text = lblbankname.Text;
        txtbranchname.Text = lblbranchname.Text;
        txtpreparedby.Text = lblpreparedby.Text;
        txtpaymentdate.Text = Convert.ToDateTime(lblpaymentdate.Text).ToString("dd/MM/yyyy");
        txtcgst.Text = lblcgst.Text;
        txtigst.Text = lbligst.Text;
        txtcess.Text = lblcess.Text;
        txtsgst.Text = lblsgst.Text;
        txttotalgst.Text = lbltotalgst.Text;
        txtpurchasevalue.Text = lblpurchasevalue.Text;
        txttotalpayabelgstvalue.Text = lblTotalpayabelgstvalue.Text;
        ddlpaymentgststatus.Text = lblgstpaymentstatus.Text;
        txtcpinno.Text = lblcipnno.Text;

        GSTDetailsDtlGridShow();

        CheckBox chkall = DgGSTFront.HeaderRow.FindControl("chkall") as CheckBox;
        chkall.Checked = true;
        chkall_CheckedChanged(sender, e);
        
        btnsave.Text = "Update";   
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    public void Clearnew()
    {
        ddlmonth.SelectedIndex = 0;

        txtcgdate.Text = "";
        txtcodeno.Text = "";
        ddlpaymentmode.SelectedIndex = 0;
        txtbankname.Text = "";
        txtbranchname.Text = "";
        txtpreparedby.Text = "";
        txtpaymentdate.Text = "";

        txtcgst.Text = "";
        txtigst.Text = "";
        txtcess.Text = "";
        txtsgst.Text = "";
        txttotalgst.Text = "";

        txtpurchasevalue.Text = "";
        txttotalpayabelgstvalue.Text = "";
        ddlpaymentgststatus.SelectedIndex = 0;

        uploadchallangstpayreceipt.TabIndex = 0;
        txtcpinno.Text = "";

        DgGSTFront.DataSource = null;
        DgGSTFront.DataBind();

        btnsave.Text = "Save";

        CodeNoLoad();
    }

    protected void chkall_CheckedChanged(object sender, EventArgs e)
    {
        //bool a = ((CheckBox)DgGSTFront.HeaderRow.FindControl("chkall")).Checked;
        //for(int i=0; i<=DgGSTFront.Rows.Count -1; i++)
        //{
        //    if (a == true)
        //    {
        //        ((CheckBox)DgGSTFront.Rows[i].FindControl("chkgrid")).Checked = true;
        //    }
        //    else if( a == false)
        //    {
        //        ((CheckBox)DgGSTFront.Rows[i].FindControl("chkgrid")).Checked = false;
        //    }
        //}

        CheckBox chkall = DgGSTFront.HeaderRow.FindControl("chkall") as CheckBox;

        for (int i = 0; i <= DgGSTFront.Rows.Count -1; i++)
        {
            if (chkall.Checked == true)
            {
                CheckBox chkgrid = DgGSTFront.Rows[i].FindControl("chkgrid") as CheckBox;
                chkgrid.Checked = true;
            }
            else
            {
                CheckBox chkgrid = DgGSTFront.Rows[i].FindControl("chkgrid") as CheckBox;
                chkgrid.Checked = false;
            }
        }      
    }

    protected void ddlpaymentgststatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlpaymentgststatus.Text == "Paid")
        {
            txtcpinno.ReadOnly = false;
        }
        else
        {
            txtcpinno.ReadOnly = true;
        }
    }

    protected void txttotalpayabelgstvalue_TextChanged(object sender, EventArgs e)
    {
        calculat();
    }

    protected void txttotalgst_TextChanged(object sender, EventArgs e)
    {
        calculat();
    }

    protected void txtpurchasevalue_TextChanged(object sender, EventArgs e)
    {
        calculat();
    }

    public void FootCalculat()
    {
        double Cgst = 0, Sgst = 0, Igst=0, Cess=0, TtGST = 0;

        for (int i=0; i < DgGSTFront.Rows.Count; i++)
        {
            Label lblCgstTax = DgGSTFront.Rows[i].FindControl("lblCgstTax") as Label;
            Label lblSgstTax = DgGSTFront.Rows[i].FindControl("lblSgstTax") as Label;
            Label lblIgstTax = DgGSTFront.Rows[i].FindControl("lblIgstTax") as Label;
            Label lblCessTax = DgGSTFront.Rows[i].FindControl("lblCessTax") as Label;
            Label lblnetamount = DgGSTFront.Rows[i].FindControl("lblnetamount") as Label;

            Cgst += Convert.ToDouble(lblCgstTax.Text);
            Sgst += Convert.ToDouble(lblSgstTax.Text);        
            Igst += Convert.ToDouble(lblIgstTax.Text);
            Cess += Convert.ToDouble(lblCessTax.Text);
            TtGST += Convert.ToDouble(lblnetamount.Text);

            TextBox txtFoottotalcgstvalue = DgGSTFront.FooterRow.FindControl("txtFoottotalcgstvalue") as TextBox;
            TextBox txtFoottotalsgstvalue = DgGSTFront.FooterRow.FindControl("txtFoottotalsgstvalue") as TextBox;
            TextBox txtFoottotaligstvalue = DgGSTFront.FooterRow.FindControl("txtFoottotaligstvalue") as TextBox;
            TextBox txtFoottotalcessvalue = DgGSTFront.FooterRow.FindControl("txtFoottotalcessvalue") as TextBox;
            TextBox txtFoottotalgstamount = DgGSTFront.FooterRow.FindControl("txtFoottotalgstamount") as TextBox;

            txtFoottotalcgstvalue.Text = Cgst.ToString();
            txtFoottotalsgstvalue.Text = Sgst.ToString();
            txtFoottotalcessvalue.Text = Cess.ToString();
            txtFoottotaligstvalue.Text = Igst.ToString();
            txtFoottotalgstamount.Text = TtGST.ToString();
        }
    }


}

