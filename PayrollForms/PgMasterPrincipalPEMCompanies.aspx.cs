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
public partial class PgMasterPrincipalPEMCompanies : System.Web.UI.Page
{
    ClsBusnssLayer objectBL = new ClsBusnssLayer();
  
    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();

    public string CmpID = "0";
    public string Error = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";

        if (!IsPostBack)
        {
            DgPEMClinetLoad();
            ddlpemcompaniesnameLoad();
            //ddlprecityLoad();
            ddlprestateLoad();
            ddlCompanyLoad();
            txtenrolldate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txttodate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtcfdate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }        
    }

    private void ddlCompanyLoad()
    {
        ddlCompany.Items.Clear();
        ddlCompany.Items.Add("------ Select PEM Company -------");
        ddlCompany.DataSource = objectBL.SelectCompanyMaster();
        ddlCompany.DataValueField = "COMPANYID";
        ddlCompany.DataTextField = "COMPANYNAME";
        ddlCompany.DataBind();
    }

    private void ddlprestateLoad()
    {
        ddlprestate.Items.Clear();
        ddlprestate.Items.Add("------ Select State ------");
        ddlprestate.DataSource = objectBL.SelectStateMaster();
        ddlprestate.DataTextField = "STATENAME";
        ddlprestate.DataValueField = "STATEID";
        ddlprestate.DataBind();
    }

    private void ddlprecityLoad()
    {
        ddlprecity.Items.Clear();
        ddlprecity.Items.Add("------ Select City ------");
        ddlprecity.DataSource = objectBL.SelectCityOnStateData(ddlprestate.SelectedValue);
        ddlprecity.DataTextField = "CITYNAME";
        ddlprecity.DataValueField = "CITYID";
        ddlprecity.DataBind();
    }

    private void ddlpemcompaniesnameLoad()
    {
        ddlpemcompaniesname.Items.Clear();
        ddlpemcompaniesname.Items.Add("------ Select PEM Client Name -------");
        ddlpemcompaniesname.DataSource = objectBL.SelectClinet();
        ddlpemcompaniesname.DataValueField = "CLIENTID";
        ddlpemcompaniesname.DataTextField = "CLIENTNAME";
        ddlpemcompaniesname.DataBind();
    }

    private void DgPEMClinetLoad()
    {
        DgPEMClinet.DataSource = objectBL.SelectPEMClinet();
        DgPEMClinet.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (ddlpemcompaniesname.Text == "------ Select PEM Client Name -------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select LCM Clinet Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlpemcompaniesname.Focus();
        }

        else if (ddlCompany.Text == "------ Select PEM Company -------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select LCM Company Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlCompany.Focus();
        }

        else if (ddlprestate.Text == "------ Select State -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Sate')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlprestate.Focus();
        }

        else if (ddlprecity.Text == "---Select City---")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select City')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlprecity.Focus();
        }

        else if (txtgstnumber.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the GST')";
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
                checkEx();
                if (Error == "0")
                {
                    objectBL.InsertPemClntData(ddlpemcompaniesname.SelectedValue, ddlCompany.SelectedValue, txtcompanyname.Text, txtsector.Text, 
                        txtprenoandstreet.Text, txtpretownarea.Text,
                    ddlprecity.SelectedValue, ddlprestate.SelectedValue, Convert.ToDateTime(txtenrolldate.Text).ToShortDateString(), txtpanno.Text, txtgstnumber.Text, txtcstno.Text, txteccno.Text, 
                    txtsacno.Text, txtpfno.Text, txtesino.Text,
                    txtphoneno.Text, txtmobileno.Text, txthrnumber.Text,
                    txtaccountantnumber.Text, txtemailid.Text, txtwebsite.Text, Convert.ToDateTime(txtcfdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString());
                }
                else
                {
                    //Message-Box-Show-Data-Already-Code    
                    System.Threading.Thread.Sleep(100);
                    string messagealready = "alert('Same Data Already Here')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", messagealready, true);
                }

            }
            else
            {
                objectBL.UpdatePemClntData(TypeID.Text, ddlpemcompaniesname.SelectedValue, ddlCompany.SelectedValue, txtcompanyname.Text, txtsector.Text,
                    txtprenoandstreet.Text, txtpretownarea.Text,
                ddlprecity.SelectedValue, ddlprestate.SelectedValue, Convert.ToDateTime(txtenrolldate.Text).ToShortDateString(),txtpanno.Text, txtgstnumber.Text, txtcstno.Text, txteccno.Text, txtsacno.Text, txtpfno.Text,txtesino.Text,
                txtphoneno.Text, txtmobileno.Text, txthrnumber.Text,
                txtaccountantnumber.Text, txtemailid.Text, txtwebsite.Text, Convert.ToDateTime(txtcfdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString());
            }
            DgPEMClinetLoad();

            //----- Save Message Box
           
            Clearnew();
            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);

        }

    }

    private void checkEx()
    {
        dt = objectBL.SelectPEMClientDetailView(ddlpemcompaniesname.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            Error = "1";
        }
    }

    protected void DgPEMClinet_SelectedIndexChanged(object sender, EventArgs e)
    {

        Label pemclientname = DgPEMClinet.SelectedRow.FindControl("lblpemclientname") as Label;
        Label pemdivision = DgPEMClinet.SelectedRow.FindControl("lblpemdivision") as Label;
        Label pemcompanyname = DgPEMClinet.SelectedRow.FindControl("lblpemcompanyname") as Label;
        Label pemsector = DgPEMClinet.SelectedRow.FindControl("lblpemsector") as Label;
        Label pemaddress = DgPEMClinet.SelectedRow.FindControl("lblpemaddress") as Label;
        Label pemtown = DgPEMClinet.SelectedRow.FindControl("lblpemtown") as Label;
        Label pemstatename = DgPEMClinet.SelectedRow.FindControl("lblpemstatename") as Label;
        Label pemcityname = DgPEMClinet.SelectedRow.FindControl("lblpemcityname") as Label;
        Label pemcontractfrom = DgPEMClinet.SelectedRow.FindControl("lblpemcontractfrom") as Label;
        Label pemcontractto = DgPEMClinet.SelectedRow.FindControl("lblpemcontractto") as Label;
        Label pemenrolldate = DgPEMClinet.SelectedRow.FindControl("lblpemenrolldate") as Label;
        Label pemgstno = DgPEMClinet.SelectedRow.FindControl("lblpemgstno") as Label;

        Label pemcinno = DgPEMClinet.SelectedRow.FindControl("lblpemcinno") as Label;
        Label pemregno = DgPEMClinet.SelectedRow.FindControl("lblpemregno") as Label;
        Label pemsaccodeno = DgPEMClinet.SelectedRow.FindControl("lblpemsaccodeno") as Label;
        Label pemepfno = DgPEMClinet.SelectedRow.FindControl("lblpemepfno") as Label;
        Label pemesino = DgPEMClinet.SelectedRow.FindControl("lblpemesino") as Label;


        Label pemphoneno = DgPEMClinet.SelectedRow.FindControl("lblpemphoneno") as Label;
        Label pemmobileno = DgPEMClinet.SelectedRow.FindControl("lblpemmobileno") as Label;
        Label pemhrno = DgPEMClinet.SelectedRow.FindControl("lblpemhrno") as Label;
        Label pemaccountantno = DgPEMClinet.SelectedRow.FindControl("lblpemaccountantno") as Label;
        Label pememailid = DgPEMClinet.SelectedRow.FindControl("lblpememailid") as Label;
        Label pemwebsite = DgPEMClinet.SelectedRow.FindControl("lblpemwebsite") as Label;

        Label pemclientid = DgPEMClinet.SelectedRow.FindControl("lblpemclientid") as Label;
        Label pemcityid = DgPEMClinet.SelectedRow.FindControl("lblpemcityid") as Label;
        Label pemstateid = DgPEMClinet.SelectedRow.FindControl("lblpemstateid") as Label;
        Label pempemid = DgPEMClinet.SelectedRow.FindControl("lblpempemid") as Label;
        Label pemcompanyid = DgPEMClinet.SelectedRow.FindControl("lblpemcompanyid") as Label;

        TypeID.Text = pempemid.Text;
        ddlCompany.SelectedValue = pemcompanyid.Text;
        ddlpemcompaniesname.SelectedValue = pemclientid.Text;
        txtcompanyname.Text = pemdivision.Text;
        txtsector.Text = pemsector.Text;
        
        txtprenoandstreet.Text = pemaddress.Text;
        txtpretownarea.Text = pemtown.Text;

        txtcstno.Text = pemcinno.Text;
        txteccno.Text = pemregno.Text;
        txtsacno.Text = pemsaccodeno.Text;
        txtpfno.Text = pemepfno.Text;
        txtesino.Text = pemesino.Text;

        //ddllcmstate.Text = DgClinet.SelectedRow.Cells[17].Text;
        ddlprestate.SelectedValue = pemstateid.Text;
        ddlprecityLoad();
        ddlprecity.SelectedValue = pemcityid.Text;
        txtemailid.Text = pememailid.Text;
        txtwebsite.Text = pemwebsite.Text;
        txtcfdate.Text = Convert.ToDateTime(pemcontractfrom.Text).ToString("dd/MM/yyyy");

 
        txttodate.Text = Convert.ToDateTime(pemcontractto.Text).ToString("dd/MM/yyyy");
        txtmobileno.Text = pemmobileno.Text;
        txtenrolldate.Text = Convert.ToDateTime(pemenrolldate.Text).ToString("dd/MM/yyyy");
        txtgstnumber.Text = pemgstno.Text;
        txtphoneno.Text = pemphoneno.Text;
        txtmobileno.Text = pemmobileno.Text;
        txthrnumber.Text = pemhrno.Text;
        txtaccountantnumber.Text = pemaccountantno.Text;
        //txtemailid.Text = DgClinet.SelectedRow.Cells[19].Text;
        //txtwebsite.Text = Convert.ToDateTime(DgClinet.SelectedRow.Cells[21].Text).ToString("dd/MM/yyyy");
        btnsave.Text = "Update";
    }

    protected void ddlprestate_SelectedIndexChanged(object sender, EventArgs e)

    {
        if (ddlprestate.SelectedValue == "------ Select State -----")
        {

        }
        else
        {
            ddlprecityLoad();
        }
            
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    public void Clearnew()
    {

        ddlpemcompaniesnameLoad();
        ddlprestateLoad();
        ddlCompanyLoad();
        ddlprecity.Items.Clear();
        ddlprecity.Items.Add("------ Select City ------");

        txtcompanyname.Text = "";
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
        txtpfno.Text = "";
        txtesino.Text = "";
        txteccno.Text = "";


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

    protected void ddlpemcompaniesname_SelectedIndexChanged(object sender, EventArgs e)
    {
//        con.Close();
//        con.Open();
//        string Select = @"SELECT        dbo.LCMClientMaster.LCMID, dbo.LCMClientMaster.COMPANYID, dbo.LCMClientMaster.CLIENTID, dbo.LCMClientMaster.DIVISION, dbo.LCMClientMaster.SECTOR, dbo.LCMClientMaster.ADDRESS1, 
//                         dbo.LCMClientMaster.TOWN, dbo.LCMClientMaster.STATEID, dbo.LCMClientMaster.CITYID, dbo.LCMClientMaster.ENDATE, dbo.LCMClientMaster.GSTNO, dbo.LCMClientMaster.PHONENO, 
//                         dbo.LCMClientMaster.MOBILENO, dbo.LCMClientMaster.EMAILID, dbo.LCMClientMaster.WEBSITE, dbo.LCMClientMaster.HRNO, dbo.LCMClientMaster.ACCOUNTANTNO, dbo.LCMClientMaster.CONTRACTFROM, 
//                         dbo.LCMClientMaster.CONTRACTTO
//FROM            dbo.LCMClientMaster INNER JOIN
//                         dbo.CompanyMaster ON dbo.LCMClientMaster.COMPANYID = dbo.CompanyMaster.COMPANYID INNER JOIN
//                         dbo.ClientDetail ON dbo.LCMClientMaster.CLIENTID = dbo.ClientDetail.CLIENTID
//WHERE        (dbo.ClientDetail.CLIENTID = '" + ddlpemcompaniesname.SelectedValue + "')";
//        da = new SqlDataAdapter(Select, con);
        dt = new DataTable();
        dt = objectBL.SelectLCMClientDetailID(ddlpemcompaniesname.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            FillDataInPEM(dt);
        }
                
        con.Close();
        SelectDivision();
    }

    private void SelectDivision()
    {
        dt = objectBL.SelectClientDetailID(ddlpemcompaniesname.SelectedValue);
        txtcompanyname.Text = dt.Rows[0]["DIVISION"].ToString();

        //DataTable dt = objectBL.SelectClinet();
        //txtcompanyname.Text = dt.Rows[0]["DIVISION"].ToString();
    }

    private void FillDataInPEM(DataTable dt)
    {
        txtcompanyname.Text = dt.Rows[0]["DIVISION"].ToString();
        ddlCompany.SelectedValue = dt.Rows[0]["COMPANYID"].ToString();
        txtsector.Text = dt.Rows[0]["SECTOR"].ToString();
        txtprenoandstreet.Text = dt.Rows[0]["ADDRESS1"].ToString();
        txtpretownarea.Text = dt.Rows[0]["TOWN"].ToString();
        ddlprestate.SelectedValue = dt.Rows[0]["STATEID"].ToString();
        ddlprecityLoad();
        ddlprecity.SelectedValue = dt.Rows[0]["CITYID"].ToString();
        txtenrolldate.Text = dt.Rows[0]["ENDATE"].ToString();
        txtgstnumber.Text = dt.Rows[0]["GSTNO"].ToString();

        txteccno.Text = dt.Rows[0]["REGNO"].ToString();      
        txtpfno.Text = dt.Rows[0]["EPFNO"].ToString();
        txtesino.Text = dt.Rows[0]["ESINO"].ToString();

        txtphoneno.Text = dt.Rows[0]["PHONENO"].ToString();
        txtmobileno.Text = dt.Rows[0]["MOBILENO"].ToString();
        txtemailid.Text = dt.Rows[0]["EMAILID"].ToString();
        txtwebsite.Text = dt.Rows[0]["WEBSITE"].ToString();
        txthrnumber.Text = dt.Rows[0]["HRNO"].ToString();
        txtaccountantnumber.Text = dt.Rows[0]["ACCOUNTANTNO"].ToString();
        txtcfdate.Text = dt.Rows[0]["CONTRACTFROM"].ToString();
        txttodate.Text = dt.Rows[0]["CONTRACTTO"].ToString();
        
    }

    protected void txtcompanyname_TextChanged(object sender, EventArgs e)
    {
        txtcompanyname.Text = txtcompanyname.Text.ToUpper();
    }

    protected void txtsector_TextChanged(object sender, EventArgs e)
    {
        txtsector.Text = txtsector.Text.ToUpper();
    }

    protected void txtgstnumber_TextChanged(object sender, EventArgs e)
    {
        txtgstnumber.Text = txtgstnumber.Text.ToUpper();
    }

    protected void txtcstno_TextChanged(object sender, EventArgs e)
    {
        txtcstno.Text = txtcstno.Text.ToUpper();
    }

    protected void txteccno_TextChanged(object sender, EventArgs e)
    {
        txteccno.Text = txteccno.Text.ToUpper();
    }

    protected void txtsacno_TextChanged(object sender, EventArgs e)
    {
        txtsacno.Text = txtsacno.Text.ToUpper();
    }

    protected void txtpfno_TextChanged(object sender, EventArgs e)
    {
        txtpfno.Text = txtpfno.Text.ToUpper();
    }

    protected void txthrnumber_TextChanged(object sender, EventArgs e)
    {
        txthrnumber.Text = txthrnumber.Text.ToUpper();
    }

    protected void txtaccountantnumber_TextChanged(object sender, EventArgs e)
    {
        txtaccountantnumber.Text = txtaccountantnumber.Text.ToUpper();
    }

    protected void txtwebsite_TextChanged(object sender, EventArgs e)
    {
        txtwebsite.Text = txtwebsite.Text.ToUpper();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";

        DgPEMClinet.DataSource = objectBL.SelectPEMClientDetailView(txtcompanynameview.Text);
        DgPEMClinet.DataBind();
    }

    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = objectBL.CompanyDetailIDSelect(ddlCompany.SelectedValue);
        txtsector.Text = dt.Rows[0]["SECTOR"].ToString();
    }
}