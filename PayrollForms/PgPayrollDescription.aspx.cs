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

public partial class PayrollForms_PgPayrollDescription : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlClntIDLoad();
            DgDescription();
            TypeId.Text = "0";
        }
        
    }

    private void ddlClntIDLoad()
    {
        ddlClaint.Items.Clear();
        ddlClaint.Items.Add("---- Select Client -------");
        ddlClaint.DataSource = ObjectBA.SelectClinet();
        ddlClaint.DataTextField = "CLIENTNAME";
        ddlClaint.DataValueField = "CLIENTID";
        ddlClaint.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (txtdescription.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter Description')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtdescription.Focus();
        }
        else
        {
            if (btnsave.Text == "Save")
            {
                ObjectBA.InsertDeductionDescription(txtdescription.Text,ddlTypeCode.SelectedValue,ddlClaint.SelectedValue,ddlType.SelectedValue);
                DgDescription();
            }
            else
            {
                ObjectBA.UpdateDeductionDescription(txtdescription.Text, ddlTypeCode.SelectedValue, ddlClaint.SelectedValue, ddlType.SelectedValue, TypeId.Text);
                DgDescription();
                ClearTxtB();
            }

            ClearTxtB();

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            DgDescription();
        }
    }

    private void ClearTxtB()
    {
        ddlClntIDLoad();
        txtdescription.Text = "";
        ddlType.SelectedValue = "--Deduction Type--";
        ddlTypeCode.SelectedValue = "Select Type";
        TypeId.Text = "0";

    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        ClearTxtB();
    }

    private void DgDescription()
    {
        DGdescription.DataSource = ObjectBA.SelectDescription();
        DGdescription.DataBind();
    }

    protected void DGdescription_SelectedIndexChanged(object sender, EventArgs e)
    {        
        Label lbldesID = DGdescription.SelectedRow.FindControl("lbldesID") as Label;
        Label lbldesName = DGdescription.SelectedRow.FindControl("lbldesName") as Label;
        Label lblDesCode = DGdescription.SelectedRow.FindControl("lblDesCode") as Label;
        Label lblClntID = DGdescription.SelectedRow.FindControl("lblClntID") as Label;
        Label lblType = DGdescription.SelectedRow.FindControl("lblType") as Label;

        TypeId.Text = lbldesID.Text;
        txtdescription.Text = lbldesName.Text;
        ddlTypeCode.SelectedValue = lblDesCode.Text;
        ddlType.SelectedValue= lblType.Text;
        ddlClaint.SelectedValue = lblClntID.Text;
        btnsave.Text = "Update";
    }
}