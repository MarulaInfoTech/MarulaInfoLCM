using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;

public partial class PageAccountYearMaster : System.Web.UI.Page
{

    ClsBusnssLayer objectBL = new ClsBusnssLayer();

    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";

        if (!IsPostBack)
        {
            txtaccountfromdate.Text = DateTime.Now.ToString("dd/MM/yyyy");

            txtaccounttodate.Text = DateTime.Now.ToString("dd/MM/yyyy");

            TypeId.Text = "0";
            DgAccountLoad();
        }
    }

    private void DgAccountLoad()
    {
        DgAccount.DataSource = objectBL.SelectAccounYear();
        DgAccount.DataBind();
    }

    protected void txtaccountfromdate_TextChanged(object sender, EventArgs e)
    {
        
    }

    protected void txtaccounttodate_TextChanged(object sender, EventArgs e)
    {
              
    }

    protected void txtaccountfromdate_TextChanged1(object sender, EventArgs e)
    {
        if (txtaccountfromdate.Text != "")
        {
            txtnewname.Text = Convert.ToDateTime(txtaccountfromdate.Text).ToString("yyyy") + "-";
        }
        if (txtaccountfromdate.Text != "" && txtaccounttodate.Text != "")
        {
            txtnewname.Text = Convert.ToDateTime(txtaccountfromdate.Text).ToString("yyyy") + "-" + Convert.ToDateTime(txtaccounttodate.Text).ToString("yy");
        }
    }

    protected void txtaccountfromdate_TextChanged2(object sender, EventArgs e)
    {
        if (txtaccountfromdate.Text != "")
        {
            txtnewname.Text = Convert.ToDateTime(txtaccountfromdate.Text).ToString("yyyy");
        }
        if (txtaccountfromdate.Text != "" && txtaccounttodate.Text != "")
        {
            txtnewname.Text = Convert.ToDateTime(txtaccountfromdate.Text).ToString("yyyy") + "-" + Convert.ToDateTime(txtaccounttodate.Text).ToString("yy");
        }
    }

    protected void txtaccounttodate_TextChanged1(object sender, EventArgs e)
    {
       
        if (txtaccountfromdate.Text != "" && txtaccounttodate.Text != "")
        {
            txtnewname.Text = Convert.ToDateTime(txtaccountfromdate.Text).ToString("yyyy") + "-" + Convert.ToDateTime(txtaccounttodate.Text).ToString("yy");
        }

        if (txtaccountfromdate.Text != "")
        {
            // mesg 
            //System.Threading.Thread.Sleep(100);
            //string message = "alert('Select First From Date')";
            //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            //txtaccountfromdate.Focus();
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {

        if (txtaccountfromdate.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select From Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtaccountfromdate.Focus();
        }

        else if (txtaccounttodate.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select To Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtaccounttodate.Focus();
        }

        else if (txtnewname.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Account Year')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtnewname.Focus();
        }

        else
        {
            if (TypeId.Text == "0")
            {
                objectBL.InsertAccounYear(txtaccountfromdate.Text, txtaccounttodate.Text, txtnewname.Text);

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            }
            else
            {
                objectBL.UpdateAccounYear(txtaccountfromdate.Text, txtaccounttodate.Text, txtnewname.Text, TypeId.Text);

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            }

            DgAccountLoad();
            CleartheText();

        }

    }
    protected void DgAccount_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label accyearid = DgAccount.SelectedRow.FindControl("lblaccyearid") as Label;
        Label accfromdate = DgAccount.SelectedRow.FindControl("lblaccfromdate") as Label;
        Label acctodate = DgAccount.SelectedRow.FindControl("lblacctodate") as Label;
        Label accyear = DgAccount.SelectedRow.FindControl("lblaccyear") as Label;

        TypeId.Text = accyearid.Text;
        txtaccountfromdate.Text = accfromdate.Text;
        txtaccounttodate.Text = acctodate.Text;
        txtnewname.Text = accyear.Text;

        btnsave.Text = "Update";

    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        CleartheText();
    }

    public void CleartheText()
    {
        txtaccountfromdate.Text = "";
        txtaccounttodate.Text = "";
        txtnewname.Text = "";

        btnsave.Text = "Save";
    }


}