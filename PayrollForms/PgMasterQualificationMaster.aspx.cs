using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BLL;

public partial class PageQualificationMaster : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBL = new ClsBusnssLayer();
    public string CompId = "1";
    DataTable dt = new DataTable();
    string ErrorTag = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";
        if (!IsPostBack)
        {
            ddlcategoryLoad();
            DgQualyLoad();
            //txtcategory.Enabled = true;
            //txtqualification.Enabled = true;
        }
    }

    private void DgQualyLoad()
    {
        DgQualy.DataSource = ObjectBL.SelectQualyDetail();
        DgQualy.DataBind();
    }

    private void ddlqualificationLoad()
    {
        ddlqualification.Items.Clear();
        ddlqualification.Items.Add("------ Select Qualification -----");
        ddlqualification.DataSource = null;
        ddlqualification.DataSource = ObjectBL.SelectCategoryDetail(ddlcategory.Text);
        ddlqualification.DataTextField = "QUALIFICATION";
        ddlqualification.DataBind();
    }

    private void ddlcategoryLoad()
    {
        ddlcategory.Items.Clear();
        ddlcategory.Items.Add("------ Select Category -----");
        ddlcategory.DataSource = null;
        ddlcategory.DataSource = ObjectBL.SelectEducationDetail();
        ddlcategory.DataTextField = "CATEGORY";
        ddlcategory.DataBind();        
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (ddlcategory.Text == "------ Select Category -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Category')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlcategory.Focus();
        }
        else if (txtcategory.Text.Trim()== "------ Select Category -----" || txtcategory.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Category')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtcategory.Focus();
        }
        else if (ddlqualification.Text == "------ Select Qualification -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Qualification')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlqualification.Focus();
        }
        else if (txtqualification.Text.Trim()== "------ Select Qualification -----" || txtqualification.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Qualification')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtqualification.Focus();
        }
        else if (txtnewcoursename.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The New Course Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtnewcoursename.Focus();
        }        
        else
        {
            if(btnsave.Text=="Save")
            {
                CheckQualification();
                if (ErrorTag == "0")
                {
                    ObjectBL.InsertQualificationDetail(txtcategory.Text, txtqualification.Text, txtnewcoursename.Text, CompId);
                    NewLoad();
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
                ObjectBL.UpdateQualificationDetail(Typeid.Text, txtcategory.Text, txtqualification.Text, txtnewcoursename.Text, CompId);
                NewLoad();
                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            }            
        } 
    }

    private void CheckQualification()
    {
        dt = ObjectBL.SelectQualificationDetailCheck(txtnewcoursename.Text);
        if (dt.Rows.Count > 0)
        {
            ErrorTag = "1";
        }
    }

    protected void ddlcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlcategory.Text == "Other")
        {
            txtcategory.Enabled = true;
        }   
        else
        {
            txtcategory.Enabled = false;
            txtcategory.Text = ddlcategory.Text;
        }
        ddlqualificationLoad();
    }

    protected void ddlqualification_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlqualification.Text == "Other")
        {
            txtqualification.Enabled = true;
        }
        else
        {
            txtqualification.Enabled = false;
            txtqualification.Text = ddlqualification.Text;
        }
        
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        NewLoad();
    }

    private void NewLoad()
    {
        txtcategory.Text = "";
        txtqualification.Text = "";
        txtnewcoursename.Text = "";
        ddlcategory.Text = "------ Select Category -----";
        ddlqualification.Text = "------ Select Qualification -----";
        txtqualification.Enabled = false;
        txtcategory.Enabled = false;
        ddlcategoryLoad();
        DgQualyLoad();
        MessageBox.Text = "";
        ddlqualification.DataSource = null;
        ddlcategory.DataSource = null;
    }

    protected void DgQualy_SelectedIndexChanged(object sender, EventArgs e)
    {

        Label qmqualificationid = DgQualy.SelectedRow.FindControl("lblqmqualificationid") as Label;
        Label qmcategory = DgQualy.SelectedRow.FindControl("lblqmcategory") as Label;
        Label qmqualification = DgQualy.SelectedRow.FindControl("lblqmqualification") as Label;
        Label qmcourse = DgQualy.SelectedRow.FindControl("lblqmcourse") as Label;
        Label qmcompanyid = DgQualy.SelectedRow.FindControl("lblqmcompanyid") as Label;

        Typeid.Text= qmqualificationid.Text;
        ddlcategory.Text = qmcategory.Text;
        txtcategory.Text = qmcategory.Text;
        ddlqualificationLoad();
        ddlqualification.Text = qmqualification.Text;
        txtqualification.Text = qmqualification.Text;
        txtnewcoursename.Text = qmcourse.Text;
        btnsave.Text = "Update";
    }

    protected void txtnewcoursename_TextChanged(object sender, EventArgs e)
    {
        txtnewcoursename.Text = txtnewcoursename.Text.ToUpper();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {

        hidcurrenttab.Value = "2";

        DgQualy.DataSource = ObjectBL.SelectQualificationDetailView(txtcategoryview.Text);
        DgQualy.DataBind();
    }
}