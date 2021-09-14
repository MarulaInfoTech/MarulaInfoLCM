using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class PgEmployeeReleavingForm : System.Web.UI.Page
{

    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();

    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";
        if (!IsPostBack)
        {
            txtentrydate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtcompanynameview.Text = DateTime.Now.ToString("dd/MM/yyyy");
            DgEmployeeReleaveLoad();
        }
    }

    private void DgEmployeeReleaveLoad()
    {
        DgEmployeeReleave.DataSource = ObjectBA.SelectEmployeeReleaving();
        DgEmployeeReleave.DataBind();
    }

    private void ddlemployeenameLoad()
    {       
        dt = new DataTable();
        dt = ObjectBA.SelectEmployeeCode(txtemployeecode.Text);
        
        if (dt.Rows.Count == 1)
        {
            txtemployeename.Text = dt.Rows[0]["APPLICATIONAME"].ToString();
            txtdateofjoining .Text = dt.Rows[0]["DATEOFJOIN"].ToString();
            txtclientname.Text = dt.Rows[0]["CLIENTNAME"].ToString();
            txtdepartment .Text = dt.Rows[0]["DEPARTMENTNAME"].ToString();
            lblrelemployeeid.Text = dt.Rows[0]["EMPLOYEEID"].ToString(); 
        }
        con.Close();     
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {

        if (txtemployeecode.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter Employee Code')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtemployeecode.Focus();
        }

        else if (txtreleavingdate.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Releaving Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtreleavingdate.Focus();
        }

        else if (txtreleavingreason.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Releaving Reason')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtreleavingreason.Focus();
        }

        else
        {
            if (btnsave.Text == "Save")
            {
                ObjectBA.InsertEmployeeReleaving(Convert.ToDateTime(txtentrydate.Text).ToShortDateString(), Convert.ToDateTime(txtreleavingdate.Text).ToShortDateString(), 
                    txtreleavingreason.Text, lblrelemployeeid.Text);
                ObjectBA.UpdateEmployeeReleavingMaster("Relieved", lblrelemployeeid.Text);

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            }

            else
            {
                ObjectBA.UpdateEmployeeReleaving(TypeId.Text, Convert.ToDateTime(txtentrydate.Text).ToShortDateString(), Convert.ToDateTime( txtreleavingdate.Text).ToShortDateString(), txtreleavingreason.Text, lblrelemployeeid.Text);
                ObjectBA.UpdateEmployeeReleavingMaster("Relieved", lblrelemployeeid.Text);

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true); 
            }

            DgEmployeeReleaveLoad();
            Clearnew();
            //MessageBox.Visible = true;
            //MessageBox.ForeColor = System.Drawing.Color.Green;
            //MessageBox.Text = "Data Save";
        }
    }

    protected void txtemployeecode_TextChanged(object sender, EventArgs e)
    {
        ddlemployeenameLoad();
    }

    protected void DgEmployeeReleave_SelectedIndexChanged(object sender, EventArgs e)
    {

        Label erfempreleavid = DgEmployeeReleave.SelectedRow.FindControl("lblerfempreleavid") as Label;
        Label erfentrydate = DgEmployeeReleave.SelectedRow.FindControl("lblerfentrydate") as Label;
        Label erfemployeeid = DgEmployeeReleave.SelectedRow.FindControl("lblerfemployeeid") as Label;
        Label erfapplicationid = DgEmployeeReleave.SelectedRow.FindControl("lblerfapplicationid") as Label;
        Label erfemployeecode = DgEmployeeReleave.SelectedRow.FindControl("lblerfemployeecode") as Label;
        Label erfapplicationname = DgEmployeeReleave.SelectedRow.FindControl("lblerfapplicationname") as Label;
        Label erfclientname = DgEmployeeReleave.SelectedRow.FindControl("lblerfclientname") as Label;
        Label erfclientid = DgEmployeeReleave.SelectedRow.FindControl("lblerfclientid") as Label;
        Label erfdateofjoin = DgEmployeeReleave.SelectedRow.FindControl("lblerfdateofjoin") as Label;
        Label erfdepartmentid = DgEmployeeReleave.SelectedRow.FindControl("lblerfdepartmentid") as Label;
        Label erfdepartmentname = DgEmployeeReleave.SelectedRow.FindControl("lblerfdepartmentname") as Label;
        Label erfreleavingdate = DgEmployeeReleave.SelectedRow.FindControl("lblerfreleavingdate") as Label;
        Label erfreson = DgEmployeeReleave.SelectedRow.FindControl("lblerfreson") as Label;

        TypeId.Text = erfempreleavid.Text;
        lblrelemployeeid.Text = erfemployeeid.Text;

        txtentrydate.Text = Convert.ToDateTime(erfentrydate.Text).ToString("dd/MM/yyyy");
        txtemployeecode.Text = erfemployeecode.Text;
        txtemployeename.Text = erfapplicationname.Text;
        txtdateofjoining.Text = Convert.ToDateTime(erfdateofjoin.Text).ToString("dd/MM/yyyy");
        txtclientname.Text = erfclientname.Text;
        txtdepartment.Text = erfdepartmentname.Text;
        txtreleavingdate.Text = Convert.ToDateTime(erfreleavingdate.Text).ToString("dd/MM/yyyy");
        txtreleavingreason.Text = erfreson.Text;

        btnsave.Text = "Update";
    }

    protected void txtemployeename_TextChanged(object sender, EventArgs e)
    {
       
        txtemployeename.Text = txtemployeename.Text.ToUpper();
    }

    protected void txtclientname_TextChanged(object sender, EventArgs e)
    {
        txtclientname.Text = txtclientname.Text.ToUpper();
    }

    protected void txtdepartment_TextChanged(object sender, EventArgs e)
    {
        txtdepartment.Text = txtdepartment.Text.ToUpper();
    }

    protected void txtreleavingreason_TextChanged(object sender, EventArgs e)
    {
        txtreleavingreason.Text = txtreleavingreason.Text.ToUpper();
    }
    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    private void Clearnew()
    {
        txtentrydate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        txtemployeename.Text = "";
        txtemployeecode.Text = "";
        txtdateofjoining.Text = "";
        txtclientname.Text = "";
        txtdepartment.Text = "";
        txtreleavingdate.Text = "";
        txtreleavingreason.Text = "";
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";
    }
}