using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;
using System.Data;

public partial class PayrollForms_AdvanceRequest : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";

        if (!IsPostBack)
        {
            ddlclientnameLoad();
            TypeId.Text = "0";
            DgadvancerequestviewLoad();
        }
        
    }

    private void DgadvancerequestviewLoad()
    {
        Dgadvancerequestview.DataSource = ObjectBA.SelectAdvanceDetail();
        Dgadvancerequestview.DataBind();
    }

    private void ddlclientnameLoad()
    {
        ddlclientname.Items.Clear();
        ddlclientname.Items.Add("----Client Name----");
        ddlclientname.DataSource = ObjectBA.SelectClinet();
        ddlclientname.DataValueField = "CLIENTID";
        ddlclientname.DataTextField = "CLIENTNAME";
        ddlclientname.DataBind();

    }

    protected void ddlclientname_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlempnameLoad();
    }

    private void ddlempnameLoad()
    {
        ddlempname1.Items.Clear();
        ddlempname1.Items.Add("----Employee Name----");
        ddlempname1.DataSource = ObjectBA.SelectEmployeeName(ddlclientname.SelectedValue);
        ddlempname1.DataValueField = "EMPLOYEEID";
        ddlempname1.DataTextField = "APPLICATIONAME";
        ddlempname1.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if(txtrequestdate.Text.Trim()=="")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Request Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtrequestdate.Focus();
        }       
        else if (ddlclientname.Text == "----Client Name----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Client Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlclientname.Focus();
        }
       
        else if (ddlempname1.Text == "----Employee Name----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Employee Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlempname1.Focus();
        }

        else if (txtdepartment.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Department')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtdepartment.Focus();
        }
        else if (txtremarks.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Remarks')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtremarks.Focus();
        }
        else if (txtadvancerequestcode.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Advance Request Code')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtadvancerequestcode.Focus();
        }
        else if (txtempcode.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Emp Code')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtempcode.Focus();
        }
        else if (ddlstatus1.Text == "----Select Status----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Status')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlstatus1.Focus();
        }

        else if (TypeId.Text == "0")
        {
            ObjectBA.InsertAdvanceDetail(txtrequestdate.Text, txtadvancerequestcode.Text, 
                ddlempname1.SelectedValue, ddlclientname.SelectedValue, txtamount.Text, txtremarks.Text, ddlstatus1.Text);
            DgadvancerequestviewLoad();           
            cleartotalTxtBox();

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);

        }
        else
        {
            ObjectBA.AdvanceDetailUpdate(TypeId.Text, txtrequestdate.Text, txtadvancerequestcode.Text,
                ddlempname1.SelectedValue, ddlclientname.SelectedValue, txtamount.Text, txtremarks.Text, ddlstatus1.Text);
            DgadvancerequestviewLoad();            
            cleartotalTxtBox();

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        }
    }

    private void cleartotalTxtBox()
    {
        TypeId.Text = "";
        txtrequestdate.Text = "";
        txtadvancerequestcode.Text = "";
        ddlclientname.Items.Clear();
        ddlclientname.Items.Add("----Client Name----");
        ddlempname1.Items.Clear();
        ddlempname1.Items.Add("----Employee Name----");
        txtamount.Text = "";
        txtremarks.Text = "";
        txtdepartment.Text = "";
        ddlstatus1.Items.Clear();
        ddlstatus1.Items.Add("----Request----");
        txtempcode.Text = "";
        btnsave.Text = "Save";

    }

    protected void ddlempname1_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadEmplyeeDetail();
    }

    private void LoadEmplyeeDetail()
    {
        DataTable dt = new DataTable();
        dt = ObjectBA.SelectEmployeeNameDetail(ddlempname1.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            txtempcode.Text = dt.Rows[0]["EMPLOYEECODE"].ToString();
            txtdepartment.Text = dt.Rows[0]["DEPARTMENTNAME"].ToString();

        }
    }

    protected void Dgadvancerequestview_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblAdvanceID = Dgadvancerequestview.SelectedRow.FindControl("lblAdvanceID") as Label;
        Label lblDate = Dgadvancerequestview.SelectedRow.FindControl("lblDate") as Label;
        Label lblAdvanceCode = Dgadvancerequestview.SelectedRow.FindControl("lblAdvanceCode") as Label;
        Label EmployeeId = Dgadvancerequestview.SelectedRow.FindControl("EmployeeId") as Label;
        Label lblClientId = Dgadvancerequestview.SelectedRow.FindControl("lblClientId") as Label;

        Label lblAmount = Dgadvancerequestview.SelectedRow.FindControl("lblAmount") as Label;
        Label lblRemark = Dgadvancerequestview.SelectedRow.FindControl("lblRemark") as Label;
        Label lblStatus = Dgadvancerequestview.SelectedRow.FindControl("lblStatus") as Label;
        Label lblClientName = Dgadvancerequestview.SelectedRow.FindControl("lblClientName") as Label;
        Label lblApllicationName = Dgadvancerequestview.SelectedRow.FindControl("lblApllicationName") as Label;

        Label lblDepartmentName = Dgadvancerequestview.SelectedRow.FindControl("lblDepartmentName") as Label;
        Label lblEmployeeCode = Dgadvancerequestview.SelectedRow.FindControl("lblEmployeeCode") as Label;

        TypeId.Text = lblAdvanceID.Text;
        txtrequestdate.Text = Convert.ToDateTime(lblDate.Text).ToString("dd/MM/yyyy");
        txtadvancerequestcode.Text = lblAdvanceCode.Text;
        ddlclientnameLoad();
        ddlclientname.SelectedValue = lblClientId.Text;
        ddlempnameLoad();
        ddlempname1.SelectedValue = EmployeeId.Text;
        
        txtamount.Text = lblAmount.Text;
        txtremarks.Text = lblRemark.Text;
        txtdepartment.Text = lblDepartmentName.Text;
        ddlstatus1.SelectedValue = lblStatus.Text;
        txtempcode.Text = lblEmployeeCode.Text;
        btnsave.Text="Update";

    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        cleartotalTxtBox();
    }

    protected void txtdepartment_TextChanged(object sender, EventArgs e)
    {
        txtdepartment.Text = txtdepartment.Text.ToUpper();
    }

    protected void txtremarks_TextChanged(object sender, EventArgs e)
    {
        txtremarks.Text = txtremarks.Text.ToUpper();
    }
    protected void txtempcode_TextChanged(object sender, EventArgs e)
    {
        txtempcode.Text = txtempcode.Text.ToUpper();
    }
    protected void txtempname2_TextChanged(object sender, EventArgs e)
    {
        txtempname2.Text = txtempname2.Text.ToUpper();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";


    }
}