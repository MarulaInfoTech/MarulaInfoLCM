using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;

public partial class PayrollForms_DepartmentValue : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();

    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";

        if (!IsPostBack)
        {
            
            ddlclientnameLoad();
            DgbankviewLoad();
            TypeId.Text = "0";
        }
    }

    private void DgbankviewLoad()
    {
        Dgbankview.DataSource = ObjectBA.SelectDepartmentValueMaster();
        Dgbankview.DataBind();
    }

    private void ddlclientnameLoad()
    {
        ddlclientname.Items.Clear();
        ddlclientname.Items.Add("------ Select Client Name -----");
        ddlclientname.DataSource = ObjectBA.SelectClinet();
        ddlclientname.DataValueField = "CLIENTID";
        ddlclientname.DataTextField = "CLIENTNAME";
        ddlclientname.DataBind();
    }

    private void ddldepartmentLoad()
    {
        ddldepartment.Items.Clear();
        ddldepartment.Items.Add("-------- Select Department -----");
        ddldepartment.DataSource = ObjectBA.SelectDepartmentClnt(ddlclientname.SelectedValue);
        ddldepartment.DataTextField = "DEPARTMENTNAME";
        ddldepartment.DataValueField = "DEPARTMENTID";
        ddldepartment.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (ddlclientname.SelectedValue == "------ Select Client Name -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Client Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlclientname.Focus();
        }
        else if (ddldepartment.SelectedValue == "-------- Select Department -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Department')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddldepartment.Focus();
        }
        else if (txtdayrate.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Day Rate')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtdayrate.Focus();
        }
        else if (txtotrate.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The OT Rate')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtotrate.Focus();
        }
        else if (TypeId.Text == "0")
        {
            ObjectBA.InsertDepartmentValueMaster(ddlclientname.SelectedValue, "0", txtdayrate.Text, txtotrate.Text, ddldepartment.SelectedValue);
            DgbankviewLoad();
            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ClearTotTxtBox();
        }
        else
        {
            ObjectBA.UpdateDepartmentValueMaster(TypeId.Text, ddlclientname.SelectedValue, "0", txtdayrate.Text, txtotrate.Text, ddldepartment.SelectedValue);
            DgbankviewLoad();
            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ClearTotTxtBox();
        }
    }

    protected void ddlclientname_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddldepartmentLoad();
    }

    protected void Dgbankview_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblCOMPANYID = Dgbankview.SelectedRow.FindControl("lblCOMPANYID") as Label;
        Label lblCLIENTID = Dgbankview.SelectedRow.FindControl("lblCLIENTID") as Label;
        Label lblDEPARTMENTID = Dgbankview.SelectedRow.FindControl("lblDEPARTMENTID") as Label;
        Label lblCLIENTNAME = Dgbankview.SelectedRow.FindControl("lblCLIENTNAME") as Label;
        Label lblDEPARTMENTNAME = Dgbankview.SelectedRow.FindControl("lblDEPARTMENTNAME") as Label;

        Label lblDAYRATE = Dgbankview.SelectedRow.FindControl("lblDAYRATE") as Label;
        Label lblOTRATE = Dgbankview.SelectedRow.FindControl("lblOTRATE") as Label;
        Label lblDPTVALID = Dgbankview.SelectedRow.FindControl("lblDPTVALID") as Label;
        
        TypeId.Text = lblDPTVALID.Text;
        ddlclientname.SelectedValue = lblCLIENTID.Text;
        ddldepartmentLoad();
        ddldepartment.SelectedValue = lblDEPARTMENTID.Text;
        txtdayrate.Text = lblDAYRATE.Text;
        txtotrate.Text = lblOTRATE.Text;
        btnsave.Text = "Update";

    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        ClearTotTxtBox();
    }

    private void ClearTotTxtBox()
    {
        TypeId.Text = "";
        ddlclientname.SelectedValue = "------ Select Client Name -----";
        ddldepartment.Items.Clear();
        ddldepartment.Items.Add("-------- Select Department -----");
        txtdayrate.Text = "";
        txtotrate.Text = "";
        btnsave.Text = "Save";
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";
    }
}