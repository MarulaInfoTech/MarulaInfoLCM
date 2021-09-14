using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Data.Sql;
using BLL;


public partial class PayrollForms_PgPettyCashAddForms : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();

    protected void Page_Load(object sender, EventArgs e)
    {
        DgPettyCashReason();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (txtcashreason.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter Cash Reason')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtcashreason.Focus();
        }
        else
        {
            if (btnsave.Text == "Save")
            {
                ObjectBA.PettyCashReasonInsert(txtcashreason.Text);
                DgPettyCashReason();                
            }
            else
            {
                ObjectBA.PettyCashReasonUpdate(txtcashreason.Text, TypeId.Text);
                DgPettyCashReason();
                ClearText();
            }
            ClearText();

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            DgPettyCashReason();
        }
    }   

    private void DgPettyCashReason()
    {
        DGcashreason.DataSource = ObjectBA.PettyCashReasonSelect();
        DGcashreason.DataBind();
    }

    private void ClearText()
    {
        txtcashreason.Text = "";

        btnsave.Text = "Save";
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        ClearText();
    }

    protected void DGcashreason_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lbldesID = DGcashreason.SelectedRow.FindControl("lbldesID") as Label;
        Label lblcashreason = DGcashreason.SelectedRow.FindControl("lblcashreason") as Label;

        TypeId.Text = lbldesID.Text;
        txtcashreason.Text = lblcashreason.Text;
        btnsave.Text = "Update";
    }
}