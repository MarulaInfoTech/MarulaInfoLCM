using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BLL;
using Message;



public partial class PageSubAddState : System.Web.UI.Page
{
    ClsBusnssLayer objectBL = new ClsBusnssLayer();    
    string Error = "0";
        
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadStateMaster();
            TypeId.Text = "0";
        }        
    }

    private void LoadStateMaster()
    {
        DgState.DataSource = objectBL.SelectStateMaster();
        DgState.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (txtaddstate.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select State Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtaddstate.Focus();
        }

        else 
        {
            
            if (TypeId.Text == "0")
            {
                checkedEx();
                if (Error == "0")
                {
                    objectBL.StateMasterInsertAndUpdate(TypeId.Text, txtaddstate.Text, "0", DateTime.Now.ToString());
                    System.Threading.Thread.Sleep(100);
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", MessageBox.Save, true);
                }
                else
                {
                    System.Threading.Thread.Sleep(100);
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", MessageBox.Exists, true);
                }                

            }
            else 
            {
                objectBL.StateMasterInsertAndUpdate(TypeId.Text, txtaddstate.Text, "0", DateTime.Now.ToString());
                System.Threading.Thread.Sleep(100);
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", MessageBox.Save, true);

            }
        }
        

        LoadStateMaster();
    }

    private void checkedEx()
    {        
        DataTable dt = new DataTable();
        dt = objectBL.SelectCheckState(txtaddstate.Text);
        if (dt.Rows.Count > 0)
        {
            Error = "1";
        }
        else
        {
            Error = "0";
        }
        
    }

    protected void DgState_SelectedIndexChanged(object sender, EventArgs e)
    {

        Label adsstateid = DgState.SelectedRow.FindControl("lbladsstateid") as Label;
        Label adsstatename = DgState.SelectedRow.FindControl("lbladsstatename") as Label;
       
        TypeId.Text = adsstateid.Text;
        txtaddstate.Text = adsstatename.Text;
        btnsave.Text = "Update";
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Cleartext();
    }
    public void Cleartext()
    {
        txtaddstate.Text = "";
    }

    protected void txtaddstate_TextChanged(object sender, EventArgs e)
    {
        txtaddstate.Text = txtaddstate.Text.ToUpper();
    }
}