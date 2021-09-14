using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BLL;

public partial class PayrollForms_InvoiceFormat : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";

        if (!IsPostBack)
        {
            ddlclientnameLoad();
            Dginvoiceview3Load();
            invoiceTxtBox();
            TypeId.Text = "0";
        }
    }

    private void Dginvoiceview3Load()
    {
        Dginvoiceview3.DataSource = ObjectBA.SelectInvoiceValueMaster();
        Dginvoiceview3.DataBind();
    }

    private void ddlclientnameLoad()
    {
        ddlclientname.DataSource = ObjectBA.SelectClinet();
        ddlclientname.DataTextField = "CLIENTNAME"; 
        ddlclientname.DataValueField = "CLIENTID";
        ddlclientname.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {

        if (ddlclientname.SelectedValue == "---Select Client---")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Client Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlclientname.Focus();
        }

        else if (txtpfwages.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter PF wages')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtpfwages.Focus();
        }

        else if (txtesitotalwages.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter Esi Total Wages')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtesitotalwages.Focus();
        }

        else if (txtbonusonwages.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter Bonus On Wages')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtbonusonwages.Focus();
        }

        else if (txtgratuityonwages.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter Gratuity On Wages')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtgratuityonwages.Focus();
        }

        else if (txtleavewithwages.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter Leave With Wages')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtleavewithwages.Focus();
        }

        else if (txtlwf.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter LWF')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtlwf.Focus();
        }

        else if (txtservicechargewithwages.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter Service Charge With Wages')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtservicechargewithwages.Focus();
        }

        else if (txtcgst.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter CGST')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtcgst.Focus();
        }

        else if (txtigst.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter IGST')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtigst.Focus();
        }

        else if (txtsgst.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter SGT')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtsgst.Focus();
        }

        else if (txtcess.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter CESS')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtcess.Focus();
        }

        else if (txttotcharg.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter Total Service Charge')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txttotcharg.Focus();
        }

        else if (TypeId.Text == "0")
        {
            ObjectBA.InsertInvoiceValueMaster(ddlclientname.SelectedValue,txtpfwages.Text,txtesitotalwages.Text,txtbonusonwages.Text,txtgratuityonwages.Text,txtleavewithwages.Text,txtlwf.Text,
                txtservicechargewithwages.Text,txtcgst.Text,txtigst.Text,txtsgst.Text,txtcess.Text, txttotcharg.Text);
            Dginvoiceview3Load();
            ClearTotalTxtBox();
            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        }

        else
        {
            ObjectBA.UpdateInvoiceValueMaster(TypeId.Text, ddlclientname.SelectedValue, txtpfwages.Text, txtesitotalwages.Text, txtbonusonwages.Text, txtgratuityonwages.Text, txtleavewithwages.Text,txtlwf.Text,
                txtservicechargewithwages.Text, txtcgst.Text, txtigst.Text, txtsgst.Text, txtcess.Text, txttotcharg.Text);
            Dginvoiceview3Load();
            ClearTotalTxtBox();
            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        }
    }

    protected void Dginvoiceview3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblINVOICEDTID = Dginvoiceview3.SelectedRow.FindControl("lblINVOICEDTID") as Label;
        Label lblCLIENTID = Dginvoiceview3.SelectedRow.FindControl("lblCLIENTID") as Label;
        Label lblCLIENTNAME = Dginvoiceview3.SelectedRow.FindControl("lblCLIENTNAME") as Label;
        Label lblPFWAGES = Dginvoiceview3.SelectedRow.FindControl("lblPFWAGES") as Label;
        Label lblESIWAGES = Dginvoiceview3.SelectedRow.FindControl("lblESIWAGES") as Label;

        Label lblBONUSWAGE = Dginvoiceview3.SelectedRow.FindControl("lblBONUSWAGE") as Label;
        Label lblGRATUITYWAGE = Dginvoiceview3.SelectedRow.FindControl("lblGRATUITYWAGE") as Label;
        Label lblLEAVEWAGE = Dginvoiceview3.SelectedRow.FindControl("lblLEAVEWAGE") as Label;
        Label lbllwf = Dginvoiceview3.SelectedRow.FindControl("lbllwf") as Label;
        Label lblSERVICECHARGE = Dginvoiceview3.SelectedRow.FindControl("lblSERVICECHARGE") as Label;
        Label lblCGST = Dginvoiceview3.SelectedRow.FindControl("lblCGST") as Label;

        Label lblIGST = Dginvoiceview3.SelectedRow.FindControl("lblIGST") as Label;
        Label lblSGST = Dginvoiceview3.SelectedRow.FindControl("lblSGST") as Label;
        Label lblCESS = Dginvoiceview3.SelectedRow.FindControl("lblCESS") as Label;
        Label lblTOTALCHARGE = Dginvoiceview3.SelectedRow.FindControl("lblTOTALCHARGE") as Label;
   

        TypeId.Text = lblINVOICEDTID.Text;
        ddlclientname.SelectedValue= lblCLIENTID.Text;
        txtpfwages.Text = lblPFWAGES.Text;
        txtesitotalwages.Text = lblESIWAGES.Text;
        txtbonusonwages.Text = lblBONUSWAGE.Text;
        txtgratuityonwages.Text = lblGRATUITYWAGE.Text;
        txtleavewithwages.Text = lblLEAVEWAGE.Text;
        txtlwf.Text = lbllwf.Text;
        txtservicechargewithwages.Text = lblSERVICECHARGE.Text;
        txtcgst.Text = lblCGST.Text;
        txtigst.Text = lblIGST.Text;
        txtsgst.Text = lblSGST.Text;
        txtcess.Text = lblCESS.Text;
        txttotcharg.Text = lblTOTALCHARGE.Text;
        btnsave.Text = "Update";

    }
    protected void btnnew_Click(object sender, EventArgs e)
    {
        ClearTotalTxtBox();
    }

    private void ClearTotalTxtBox()
    {
        TypeId.Text = "0";
        ddlclientname.SelectedValue = "---Select Client---";
        txtpfwages.Text = "";
        txtesitotalwages.Text = "";
        txtbonusonwages.Text = "";
        txtgratuityonwages.Text = "";
        txtleavewithwages.Text = "";
        txtlwf.Text = "";
        txtservicechargewithwages.Text = "";
        txtcgst.Text = "";
        txtigst.Text = "";
        txtsgst.Text = "";
        txtcess.Text = "";
        txttotcharg.Text = "";
        txttotaltax.Text = "";
        btnsave.Text = "Save";
    }

    private void invoiceTxtBox()
    {
        txtpfwages.Text = "0";
        txtesitotalwages.Text = "0";
        txtbonusonwages.Text = "0";
        txtgratuityonwages.Text = "0";
        txtleavewithwages.Text = "0";
        txtlwf.Text = "0";
        txtservicechargewithwages.Text = "0";
        txttotcharg.Text = "0";

        txtcgst.Text = "0";
        txtsgst.Text = "0";
        txtigst.Text = "0";
        txtcess.Text = "0";

    }   

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";
    }


    protected void txtpfwages_TextChanged(object sender, EventArgs e)
    {
        if (txtpfwages.Text.Trim() == "")
        {
            txtpfwages.Text = "0";
        }
        Calculate();
    }

    private void Calculate()
    {
        decimal total = Convert.ToDecimal(txtpfwages.Text) + Convert.ToDecimal(txtesitotalwages.Text) + Convert.ToDecimal(txtbonusonwages.Text) +
            Convert.ToDecimal(txtgratuityonwages.Text) + Convert.ToDecimal(txtleavewithwages.Text) + Convert.ToDecimal(txtlwf.Text) +
            Convert.ToDecimal(txtservicechargewithwages.Text);
        txttotcharg.Text = total.ToString("####0.00");
    }

    protected void txtesitotalwages_TextChanged(object sender, EventArgs e)
    {
        if (txtesitotalwages.Text.Trim() == "")
        {
            txtesitotalwages.Text = "0";
        }
        Calculate();
    }

    protected void txtbonusonwages_TextChanged(object sender, EventArgs e)
    {
        if (txtbonusonwages.Text.Trim() == "")
        {
            txtbonusonwages.Text = "0";
        }
        Calculate();
    }

    protected void txtgratuityonwages_TextChanged(object sender, EventArgs e)
    {
        if (txtgratuityonwages.Text.Trim() == "")
        {
            txtgratuityonwages.Text = "0";
        }
        Calculate();
    }

    protected void txtleavewithwages_TextChanged(object sender, EventArgs e)
    {
        if (txtleavewithwages.Text.Trim() == "")
        {
            txtleavewithwages.Text = "0";
        }
        Calculate();
    }

    protected void txtlwf_TextChanged(object sender, EventArgs e)
    {
        if (txtlwf.Text.Trim() == "")
        {
            txtlwf.Text = "0";
        }
        Calculate();
    }

    protected void txtservicechargewithwages_TextChanged(object sender, EventArgs e)
    {
        if (txtservicechargewithwages.Text.Trim() == "")
        {
            txtservicechargewithwages.Text = "0";
        }
        Calculate();
    }

    protected void ddlclientname_SelectedIndexChanged(object sender, EventArgs e)
    {     
        dt = ObjectBA.SelectClientDetailID(ddlclientname.SelectedValue);
        txtdivision.Text = dt.Rows[0]["DIVISION"].ToString();
    }

    private void calculation()
    {
        decimal totaltax = Convert.ToDecimal(txtcgst.Text) + Convert.ToDecimal(txtsgst.Text) + Convert.ToDecimal(txtigst.Text) + Convert.ToDecimal(txtcess.Text);  
        
            txttotaltax.Text=totaltax.ToString("####0.00");
    }

    protected void txtcgst_TextChanged(object sender, EventArgs e)
    {

        if (txtcgst.Text.Trim() == "")
        {
            txtcgst.Text = "0";
        }      
            calculation();
    }

    protected void txtsgst_TextChanged(object sender, EventArgs e)
    {
        if (txtsgst.Text.Trim() == "")
        {
            txtsgst.Text = "0";
        }
            calculation();
    }

    protected void txtigst_TextChanged(object sender, EventArgs e)
    {
        if (txtigst.Text.Trim() == "")
        {
            txtigst.Text = "0";
        }
            calculation();
    }

    protected void txtcess_TextChanged(object sender, EventArgs e)
    {
        if (txtcess.Text.Trim() == "")
        {
            txtcess.Text = "0";
        }
        calculation();
    }

    protected void txttotaltax_TextChanged(object sender, EventArgs e)
    {
      
    }

    protected void txttotcharg_TextChanged(object sender, EventArgs e)
    {

    }
}