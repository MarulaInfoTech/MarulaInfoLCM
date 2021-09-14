using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Message;

public partial class PageSubAddCity : System.Web.UI.Page
{
    ClsBusnssLayer objectBL = new ClsBusnssLayer();
    string Error = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cboboxState();
            DgCityLoad();
        }        
    }

    private void DgCityLoad()
    {
        DgCity.DataSource = objectBL.SelectCityData();
        DgCity.DataBind();        
    }

    private void cboboxState()
    {
        ddlchoosestate.DataSource = objectBL.SelectStateMaster();
        ddlchoosestate.DataValueField = "STATEID";
        ddlchoosestate.DataTextField = "STATENAME";
        ddlchoosestate.DataBind();    
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (ddlchoosestate.Text.Trim() == "---- Select State ----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select State Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlchoosestate.Focus();
        }

        else if (txtaddcity.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter City Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtaddcity.Focus();
        }

        else
        {
            objectBL.CityMasterInsertAndUpdate(TypeId.Text, ddlchoosestate.SelectedValue, txtaddcity.Text, "0", DateTime.Now.ToString());
            if (TypeId.Text == "0")
            {
                checkedEx();
                if (Error == "0")
                {
                    objectBL.CityMasterInsertAndUpdate(TypeId.Text, ddlchoosestate.SelectedValue, txtaddcity.Text, "0", DateTime.Now.ToString());
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
                objectBL.CityMasterInsertAndUpdate(TypeId.Text, ddlchoosestate.SelectedValue, txtaddcity.Text, "0", DateTime.Now.ToString());
                System.Threading.Thread.Sleep(100);
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", MessageBox.Save, true);

            }
            // Add Fake Delay to simulate long running process.
            //System.Threading.Thread.Sleep(3000);

            DgCityLoad();
            btnnew_Click(sender, e);
            Cleartext();
        }
    }

    private void checkedEx()
    {
        //con.Close();
        //con.Open();
        //string str = @"select * from CityMaster where STATEID='" + ddlchoosestate.SelectedValue + "' and CITYNAME='" + txtaddcity.Text + "'";
        //da = new SqlDataAdapter(str, con);
        //da.Fill(dt);
        dt = new DataTable();
        dt = objectBL.SelectCheckCityMasterOnState(ddlchoosestate.SelectedValue, txtaddcity.Text);
        if (dt.Rows.Count > 0)
        {
            Error = "1";
        }
        else
        {
            Error = "0";
        }
        con.Close();
    }

    protected void DgCity_SelectedIndexChanged(object sender, EventArgs e)
    {

        Label adccityname = DgCity.SelectedRow.FindControl("lbladccityname") as Label;
        Label adcstatename = DgCity.SelectedRow.FindControl("lbladcstatename") as Label;
        Label adccityid = DgCity.SelectedRow.FindControl("lbladccityid") as Label;
        Label adcstateid = DgCity.SelectedRow.FindControl("lbladcstateid") as Label;

        TypeId.Text = adccityid.Text;
        txtaddcity.Text = adccityname.Text;
        ddlchoosestate.SelectedValue = adcstateid.Text;
        btnsave.Text = "Update";
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Cleartext();
    }

    public void Cleartext()
    {
        ddlchoosestate.ClearSelection();
        txtaddcity.Text = "";
        btnsave.Text = "Save";
    }

    protected void txtaddcity_TextChanged(object sender, EventArgs e)
    {
        txtaddcity.Text = txtaddcity.Text.ToUpper();
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {

    }
}