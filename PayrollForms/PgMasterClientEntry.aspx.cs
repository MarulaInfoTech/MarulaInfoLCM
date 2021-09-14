using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;
using System.Data;

public partial class Client_Entry : System.Web.UI.Page
{
    ClsBusnssLayer objectBL = new ClsBusnssLayer();

    public string CmpID = "";
    string check = "0";
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";
        if (!IsPostBack)
        {
            DgCompanyLoad();
            ddlclientnameLoad();    
            ddlprestateLoad();
            ddlCompanynameLoad();
            txtenrolldate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txttodate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtcfdate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }
    }

    private void ddlCompanynameLoad()
    {
        ddlCompanyname.Items.Clear();
        ddlCompanyname.Items.Add("----- Select LCM Company Name ----");
        ddlCompanyname.DataSource = objectBL.SelectCompanyMaster();
        ddlCompanyname.DataValueField = "COMPANYID";
        ddlCompanyname.DataTextField = "COMPANYNAME";
        ddlCompanyname.DataBind();
    }

    private void ddlprestateLoad()
    {
        ddllcmstate.Items.Clear();
        ddllcmstate.Items.Add("------ Select State -----");
        ddllcmstate.DataSource = objectBL.SelectStateMaster();
        ddllcmstate.DataValueField = "STATEID";
        ddllcmstate.DataTextField = "STATENAME";
        ddllcmstate.DataBind();
    }

    private void ddlprecityLoad()
    {
        ddllcmcity.Items.Clear();
        ddllcmcity.Items.Add("---Select City---");
        ddllcmcity.DataSource = objectBL.SelectCityOnStateData(ddllcmstate.SelectedValue);
        ddllcmcity.DataValueField = "CITYID";
        ddllcmcity.DataTextField = "CITYNAME";
        ddllcmcity.DataBind();
    }

    private void ddlclientnameLoad()
    {
        ddlclientname.Items.Clear();
        ddlclientname.Items.Add("------ Select LCM Client Name -------");
        ddlclientname.DataSource = objectBL.SelectClinet();
        ddlclientname.DataValueField = "CLIENTID";
        ddlclientname.DataTextField = "CLIENTNAME";
        ddlclientname.DataBind();
    }

    private void DgCompanyLoad()
    {
        DgClinet.DataSource = objectBL.SelectLCMClinet();
        DgClinet.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (ddlclientname.Text == "------ Select LCM Client Name -------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select LCM Clinet Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlclientname.Focus();
        }

        else if (ddlCompanyname.Text == "----- Select LCM Company Name ----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select LCM Company Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlCompanyname.Focus();
        }

        else if (ddllcmstate.Text == "------ Select State -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Sate')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddllcmstate.Focus();
        }

        else if (ddllcmcity.Text == "---Select City---")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select City')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddllcmcity.Focus();
        }

        else if (txtgstnumber.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the GST Number')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtgstnumber.Focus();
        }

        else if (txtphoneno.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Phone.No')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtphoneno.Focus();
        }

        else if (txtmobileno.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Mobile.No')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtmobileno.Focus();
        }

        else
        {
            if (btnsave.Text == "Save")
            {
                CheckEx();
                if (check == "0")
                {
                    objectBL.InsertLcmClntData(ddlclientname.SelectedValue, ddlCompanyname.SelectedValue, txtdivi.Text, txtsector.Text, txtprenoandstreet.Text, txtpretownarea.Text,
                ddllcmcity.SelectedValue, ddllcmstate.SelectedValue, Convert.ToDateTime(txtenrolldate.Text).ToShortDateString(), txtpanno.Text, txtgstnumber.Text, txtpfno.Text, txtesino.Text, txteccno.Text, txtphoneno.Text, txtmobileno.Text, txthrnumber.Text,
                txtaccountantnumber.Text, txtemailid.Text, txtwebsite.Text, Convert.ToDateTime(txtcfdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString());

                    DgCompanyLoad();
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
                objectBL.UpdateLcmClntData(TypeId.Text, ddlclientname.SelectedValue, ddlCompanyname.SelectedValue, txtdivi.Text, txtsector.Text, txtprenoandstreet.Text, txtpretownarea.Text,
                ddllcmcity.SelectedValue, ddllcmstate.SelectedValue, Convert.ToDateTime(txtenrolldate.Text).ToShortDateString(), txtpanno.Text, txtgstnumber.Text, txtpfno.Text, txtesino.Text, txteccno.Text, txtphoneno.Text, txtmobileno.Text, txthrnumber.Text,
                txtaccountantnumber.Text, txtemailid.Text, txtwebsite.Text, Convert.ToDateTime(txtcfdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString());

                DgCompanyLoad();
                Clearnew();

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            }            
        }
    }

    private void CheckEx()
    {
        dt = objectBL.SelectLCMClientDetailID(ddlclientname.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            check = "1";
        }
    }
    protected void DgClinet_SelectedIndexChanged(object sender, EventArgs e)
    {

        Label lcmclientname = DgClinet.SelectedRow.FindControl("lbllcmclientname") as Label;
        Label lcmdivision = DgClinet.SelectedRow.FindControl("lbllcmdivision") as Label;
        Label lcmsector = DgClinet.SelectedRow.FindControl("lbllcmsector") as Label;
        Label lcmaddress = DgClinet.SelectedRow.FindControl("lbllcmaddress") as Label;
        Label lcmtown = DgClinet.SelectedRow.FindControl("lbllcmtown") as Label;
        Label lcmenrolldate = DgClinet.SelectedRow.FindControl("lbllcmenrolldate") as Label;

        Label lcmgstno = DgClinet.SelectedRow.FindControl("lbllcmgstno") as Label;
        Label lcmepfno = DgClinet.SelectedRow.FindControl("lbllcmepfno") as Label;
        Label lcmesino = DgClinet.SelectedRow.FindControl("lbllcmesino") as Label;

        Label lcmphoneno = DgClinet.SelectedRow.FindControl("lbllcmphoneno") as Label;
        Label lcmmobileno = DgClinet.SelectedRow.FindControl("lbllcmmobileno") as Label;
        Label lcmemailid = DgClinet.SelectedRow.FindControl("lbllcmemailid") as Label;
        Label lcmwebsite = DgClinet.SelectedRow.FindControl("lbllcmwebsite") as Label;
        Label lcmhrno = DgClinet.SelectedRow.FindControl("lbllcmhrno") as Label;
        Label lcmaccountantno = DgClinet.SelectedRow.FindControl("lbllcmaccountantno") as Label;
        Label lcmcontractfrom = DgClinet.SelectedRow.FindControl("lbllcmcontractfrom") as Label;
        Label lcmcontractto = DgClinet.SelectedRow.FindControl("lbllcmcontractto") as Label;
        Label lcmstatename = DgClinet.SelectedRow.FindControl("lbllcmstatename") as Label;
        Label lcmcityname = DgClinet.SelectedRow.FindControl("lbllcmcityname") as Label;
        Label lcmclientcode = DgClinet.SelectedRow.FindControl("lbllcmclientcode") as Label;
        Label lcmcityid = DgClinet.SelectedRow.FindControl("lbllcmcityid") as Label;
        Label lcmstateid = DgClinet.SelectedRow.FindControl("lbllcmstateid") as Label;
        Label lcmlcmid = DgClinet.SelectedRow.FindControl("lbllcmlcmid") as Label;
        Label lcmcompanycode = DgClinet.SelectedRow.FindControl("lbllcmcompanycode") as Label;
        Label lcmcompanyname = DgClinet.SelectedRow.FindControl("lbllcmcompanyname") as Label;
        Label lcmRegNo = DgClinet.SelectedRow.FindControl("lbllcmRegNo") as Label;

        TypeId.Text = lcmlcmid.Text;
        ddlclientnameLoad();
        ddlclientname.SelectedValue = lcmclientcode.Text;
        txtdivi.Text = lcmdivision.Text;
        txtsector.Text = lcmsector.Text;
        txtprenoandstreet.Text = lcmaddress.Text;
        txtpretownarea.Text = lcmtown.Text;

        ddlCompanyname.SelectedValue = lcmcompanycode.Text;

        txteccno.Text = lcmRegNo.Text;

        //ddllcmstate.Text = DgClinet.SelectedRow.Cells[17].Text;
        ddllcmstate.SelectedValue = lcmstateid.Text;
        ddlprecityLoad();
        ddllcmcity.SelectedValue = lcmcityid.Text;
        txtemailid.Text = lcmemailid.Text;
        txtwebsite.Text = lcmwebsite.Text;
        txtcfdate.Text = Convert.ToDateTime(lcmcontractfrom.Text).ToString("dd/MM/yyyy");
        txttodate.Text = Convert.ToDateTime(lcmcontractto.Text).ToString("dd/MM/yyyy");
        txtmobileno.Text = lcmmobileno.Text;
        txtenrolldate.Text = Convert.ToDateTime(lcmenrolldate.Text).ToString("dd/MM/yyyy");
        txtgstnumber.Text = lcmgstno.Text;
        txtpfno.Text = lcmepfno.Text;
        txtesino.Text = lcmesino.Text;
        txtphoneno.Text = lcmphoneno.Text;
        txtmobileno.Text = lcmmobileno.Text;
        txthrnumber.Text = lcmhrno.Text;
        txtaccountantnumber.Text = lcmaccountantno.Text;
        //txtemailid.Text = DgClinet.SelectedRow.Cells[19].Text;
        //txtwebsite.Text = Convert.ToDateTime(DgClinet.SelectedRow.Cells[21].Text).ToString("dd/MM/yyyy");
        btnsave.Text = "Update";
      
    }
    protected void ddllcmstate_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (ddllcmstate.SelectedValue == "------ Select State -----")
        {

        }
        else
            ddlprecityLoad();
    }

    protected void ddllcmstate_TextChanged(object sender, EventArgs e)
    {
            ddlprecityLoad();
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    public void Clearnew()
    {
        ddlclientnameLoad();
        ddlprestateLoad();
        ddlCompanynameLoad();
        ddllcmcity.Items.Clear();
        ddllcmcity.Items.Add("---Select City---");

        txtdivi.Text = "";
        txtsector.Text = "";
        txtprenoandstreet.Text = "";
        txtpretownarea.Text = "";
        txtcfdate.Text = "";
        txttodate.Text = "";
        txtenrolldate.Text = "";
        txtgstnumber.Text = "";
        txtphoneno.Text = "";
        txtmobileno.Text = "";
        txthrnumber.Text = "";
        txtaccountantnumber.Text = "";
        txtemailid.Text = "";
        txtwebsite.Text = "";
        txteccno.Text = "";
        txtpfno.Text = "";
        txtesino.Text = "";

        btnsave.Text = "Save";
    }

    protected void txtprenoandstreet_TextChanged(object sender, EventArgs e)
    {
        txtprenoandstreet.Text = txtprenoandstreet.Text.ToUpper();
    }

    protected void txtpretownarea_TextChanged(object sender, EventArgs e)
    {
        txtpretownarea.Text = txtpretownarea.Text.ToUpper();
    }

    protected void txtdivi_TextChanged(object sender, EventArgs e)
    {
        txtdivi.Text = txtdivi.Text.ToUpper();
    }

    protected void txtsector_TextChanged(object sender, EventArgs e)
    {
        txtsector.Text = txtsector.Text.ToUpper();
    }

    protected void txtgstnumber_TextChanged(object sender, EventArgs e)
    {
        txtgstnumber.Text = txtgstnumber.Text.ToUpper();
    }

    protected void txtaccountantnumber_TextChanged(object sender, EventArgs e)
    {
        txtaccountantnumber.Text = txtaccountantnumber.Text.ToUpper();
    }

    protected void txtwebsite_TextChanged(object sender, EventArgs e)
    {
        txtwebsite.Text = txtwebsite.Text.ToUpper();
    }

    protected void txtpanno_TextChanged(object sender, EventArgs e)
    {
        txtpanno.Text = txtpanno.Text.ToUpper();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";

        DgClinet.DataSource = objectBL.SelectLCMClientDetailID(txtcompanynameview.Text);
        DgClinet.DataBind();
    }

    protected void txtcompanynameview_TextChanged(object sender, EventArgs e)
    {
        txtcompanynameview.Text = txtcompanynameview.Text.ToUpper();
    }

    protected void ddlclientname_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = objectBL.SelectClientDetailID(ddlclientname.SelectedValue);
        txtdivi.Text = dt.Rows[0]["DIVISION"].ToString();

        //DataTable dt = objectBL.SelectClinet();
        //txtdivi.Text = dt.Rows[0]["DIVISION"].ToString();        
    }
       
    protected void ddlCompanyname_SelectedIndexChanged1(object sender, EventArgs e)
    {
        dt = objectBL.CompanyDetailIDSelect(ddlCompanyname.SelectedValue);
        txtsector.Text = dt.Rows[0]["SECTOR"].ToString();
    }

}