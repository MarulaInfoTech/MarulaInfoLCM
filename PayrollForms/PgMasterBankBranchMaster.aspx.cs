using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BLL;

public partial class PageBankBranchMaster : System.Web.UI.Page
{
    ClsBusnssLayer objectBL = new ClsBusnssLayer();
    DataTable dt = new DataTable();

    string ErrorTag = "0";

    protected void Page_Load(object sender, EventArgs e)
    {
        DgBankDetailLoad();

    }

    private void DgBankDetailLoad()
    {
        DgBankDetail.DataSource = objectBL.SelectBankDetail();
        DgBankDetail.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {

        if (txtbankname.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Bank Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtbankname.Focus();
        }
        else if (txtbranchcode.Text.Trim()== "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The IFSC Code')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtbranchcode.Focus();
        }
        else if (txtbranchname.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The BranchName')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtbranchname.Focus();
        }
        else if (txtaccountno.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Account.No')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtaccountno.Focus();
        }

        //else if (txtaddress.Text.Trim() == "")
        //{
        //    System.Threading.Thread.Sleep(100);
        //    string message = "alert('Enter The Address')";
        //    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        //    txtaddress.Focus();
        //}
        //else if (txtphoneno.Text.Trim() == "")
        //{
        //    System.Threading.Thread.Sleep(100);
        //    string message = "alert('Enter The Phone.No')";
        //    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        //    txtphoneno.Focus();
        //}

        else
        {
            if (btnsave.Text == "Save")
            {
                CheckBankDetail();
                if (ErrorTag == "0")
                {
                    objectBL.InsertBankDetail(txtbankname.Text, txtbranchcode.Text, txtbranchname.Text, txtaccountno.Text, txtaddress.Text, txtphoneno.Text, txtemailid.Text, txtothernotes.Text);
                    DgBankDetailLoad();
                    Clearnew();
                    System.Threading.Thread.Sleep(100);
                    string message = "alert('Data Save')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                }
                else
                {
                    System.Threading.Thread.Sleep(100);
                    string messagealready = "alert('Same Data Already Here')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", messagealready, true);
                }                
            }
            else
            {
                objectBL.UpdateBankDetail(TypeID.Text, txtbankname.Text, txtbranchcode.Text, txtbranchname.Text, txtaccountno.Text, txtaddress.Text, txtphoneno.Text, txtemailid.Text, txtothernotes.Text);
                DgBankDetailLoad();
                Clearnew();
                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            }            
        }   
    }

    private void CheckBankDetail()
    {
        dt = objectBL.SelectBankDetailCheck(txtaccountno.Text);
        if (dt.Rows.Count > 0)
        {
            ErrorTag = "1";
        }
    }

    protected void DgBankDetail_SelectedIndexChanged(object sender, EventArgs e)
    {

        Label bbbankid = DgBankDetail.SelectedRow.FindControl("lblbbbankid") as Label;
        Label bbbankname = DgBankDetail.SelectedRow.FindControl("lblbbbankname") as Label;
        Label bbbankcode = DgBankDetail.SelectedRow.FindControl("lblbbbankcode") as Label;
        Label bbbranch = DgBankDetail.SelectedRow.FindControl("lblbbbranch") as Label;
        Label bbaccountnumber = DgBankDetail.SelectedRow.FindControl("lblbbaccountnumber") as Label;
        Label bbaddress = DgBankDetail.SelectedRow.FindControl("lblbbaddress") as Label;
        Label bbphoneno = DgBankDetail.SelectedRow.FindControl("lblbbphoneno") as Label;
        Label bbemailid = DgBankDetail.SelectedRow.FindControl("lblbbemailid") as Label;
        Label bbother = DgBankDetail.SelectedRow.FindControl("lblbbother") as Label;

        TypeID.Text = bbbankid.Text;
        txtbankname.Text = bbbankname.Text;
        txtbranchcode.Text = bbbankcode.Text;
        txtbranchname.Text = bbbranch.Text;
        txtaccountno.Text = bbaccountnumber.Text;
        txtaddress.Text = bbaddress.Text;
        txtemailid.Text = bbemailid.Text;
        txtothernotes.Text = bbother.Text;
        txtphoneno.Text = bbphoneno.Text;
        //txtbankcode.Text = DgBankDetail.SelectedRow.Cells[1].Text;
        btnsave.Text = "Update";
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }
    public void Clearnew()
    {
        txtbankname.Text = "";
        txtbranchcode.Text = "";
        txtbranchname.Text = "";
        txtaccountno.Text = "";
        txtaddress.Text = "";
        txtphoneno.Text = "";
        txtemailid.Text = "";
        txtothernotes.Text = "";

        btnsave.Text = "Save";

    }
    protected void txtbankname_TextChanged(object sender, EventArgs e)
    {
        txtbankname.Text = txtbankname.Text.ToUpper();
    }

    protected void txtbranchcode_TextChanged(object sender, EventArgs e)
    {
        txtbranchcode.Text = txtbranchcode.Text.ToUpper();
    }

    protected void txtbranchname_TextChanged(object sender, EventArgs e)
    {
        txtbranchname.Text = txtbranchname.Text.ToUpper();
    }

    protected void txtaccountno_TextChanged(object sender, EventArgs e)
    {
        txtaccountno.Text = txtaccountno.Text.ToUpper();
    }

    protected void txtaddress_TextChanged(object sender, EventArgs e)
    {
        txtaddress.Text = txtaddress.Text.ToUpper();
    }
}