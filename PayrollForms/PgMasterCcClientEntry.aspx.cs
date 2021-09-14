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
public partial class PgMasterCcClientEntry : System.Web.UI.Page
{

    ClsBusnssLayer ObjectBL = new ClsBusnssLayer();
    public string CmpID = "0";

    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();

    string check = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";
        if (!IsPostBack)
        {
            DgCCClinetLoad();
            ddlccclientnameLoad();            
            ddlprestateLoad();
            ddlCompanynameLoad();
            txtenrolldate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txttodate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtcfdate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }
    }

    private void ddlCompanynameLoad()
    {
        ddlcompanyname.Items.Clear();
        ddlcompanyname.Items.Add("------ Select LCM Company Name ------");
        ddlcompanyname.DataSource = ObjectBL.SelectCompanyMaster();
        ddlcompanyname.DataValueField = "COMPANYID";
        ddlcompanyname.DataTextField = "COMPANYNAME";
        ddlcompanyname.DataBind();
    }

    private void ddlprestateLoad()
    {
        ddlprestate.Items.Clear();
        ddlprestate.Items.Add("------ Select State ------");
        ddlprestate.DataSource = ObjectBL.SelectStateMaster();
        ddlprestate.DataTextField = "STATENAME";
        ddlprestate.DataValueField = "STATEID";
        ddlprestate.DataBind();
    }

    private void ddlprecityLoad()
    {
        ddlprecity.Items.Clear();
        ddlprecity.Items.Add("------- Select City ------");
        ddlprecity.DataSource = ObjectBL.SelectCityOnStateData(ddlprestate.SelectedValue);
        ddlprecity.DataTextField = "CITYNAME";
        ddlprecity.DataValueField = "CITYID";
        ddlprecity.DataBind();
    }

    private void ddlccclientnameLoad()
    {
        ddlccclientname.Items.Clear();
        ddlccclientname.Items.Add("------ Select CC Client Name -----");
        ddlccclientname.DataSource = ObjectBL.SelectClinet();
        ddlccclientname.DataValueField = "CLIENTID";
        ddlccclientname.DataTextField = "CLIENTNAME";
        ddlccclientname.DataBind();
    }

    private void DgCCClinetLoad()
    {
        DgCCClinet.DataSource = ObjectBL.SelectCCClinet();
        DgCCClinet.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (ddlccclientname.Text == "------ Select CC Client Name -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select CC Clinet Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlccclientname.Focus();
        }

        else if (ddlcompanyname.Text == "------ Select LCM Company Name ------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select CC Company Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlcompanyname.Focus();
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
                    ObjectBL.InsertCCClntData(ddlccclientname.SelectedValue, ddlcompanyname.SelectedValue, txtcompanyname.Text, txtsector.Text, txtprenoandstreet.Text, txtpretownarea.Text,
                    ddlprecity.SelectedValue, ddlprestate.SelectedValue, Convert.ToDateTime(txtenrolldate.Text).ToShortDateString(), txtgstnumber.Text, txtphoneno.Text, txtmobileno.Text, txthrnumber.Text,
                    txtaccountantnumber.Text, txtemailid.Text, txtwebsite.Text,txtpfno.Text,txtesino.Text,txteccno.Text, Convert.ToDateTime(txtcfdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString());

                    System.Threading.Thread.Sleep(100);
                    string message = "alert('Data Save')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);

                    DgCCClinetLoad();
                    Clearnew();

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
                ObjectBL.UpdateCCClntData(TypeID.Text, ddlccclientname.SelectedValue, ddlcompanyname.SelectedValue, txtcompanyname.Text, txtsector.Text, txtprenoandstreet.Text, txtpretownarea.Text,
                ddlprecity.SelectedValue, ddlprestate.SelectedValue, Convert.ToDateTime(txtenrolldate.Text).ToShortDateString(), txtgstnumber.Text, txtphoneno.Text, txtmobileno.Text, txthrnumber.Text,
                txtaccountantnumber.Text, txtemailid.Text, txtwebsite.Text, txtpfno.Text, txtesino.Text, txteccno.Text, Convert.ToDateTime(txtcfdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString());

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);

                DgCCClinetLoad();
                Clearnew();

            } 
        }
    }

    private void CheckEx()
    {
        dt = ObjectBL.SelectGetCCClient(ddlccclientname.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            check = "1";
        }
    }

    protected void DgCCClinet_SelectedIndexChanged(object sender, EventArgs e)
    {

        Label ccmclientname = DgCCClinet.SelectedRow.FindControl("lblccmclientname") as Label;
        Label ccmdivision = DgCCClinet.SelectedRow.FindControl("lblccmdivision") as Label;
        Label ccmsector = DgCCClinet.SelectedRow.FindControl("lblccmsector") as Label;
        Label ccmaddress = DgCCClinet.SelectedRow.FindControl("lblccmaddress") as Label;
        Label ccmtown = DgCCClinet.SelectedRow.FindControl("lblccmtown") as Label;
        Label ccmenrolldate = DgCCClinet.SelectedRow.FindControl("lblccmenrolldate") as Label;
        Label ccmgstno = DgCCClinet.SelectedRow.FindControl("lblccmgstno") as Label;

        Label ccepfno = DgCCClinet.SelectedRow.FindControl("lblccepfno") as Label;
        Label ccesino = DgCCClinet.SelectedRow.FindControl("lblccesino") as Label;
        Label ccfirmno = DgCCClinet.SelectedRow.FindControl("lblccfirmno") as Label;

        Label ccmphoneno = DgCCClinet.SelectedRow.FindControl("lblccmphoneno") as Label;
        Label ccmmobileno = DgCCClinet.SelectedRow.FindControl("lblccmmobileno") as Label;
        Label ccmemailid = DgCCClinet.SelectedRow.FindControl("lblccmemailid") as Label;
        Label ccmwebsite = DgCCClinet.SelectedRow.FindControl("lblccmwebsite") as Label;
        Label ccmhrno = DgCCClinet.SelectedRow.FindControl("lblccmhrno") as Label;
        Label ccmaccountantno = DgCCClinet.SelectedRow.FindControl("lblccmaccountantno") as Label;
        Label ccmcontractfrom = DgCCClinet.SelectedRow.FindControl("lblccmcontractfrom") as Label;
        Label ccmcontractto = DgCCClinet.SelectedRow.FindControl("lblccmcontractto") as Label;
        Label ccmstatename = DgCCClinet.SelectedRow.FindControl("lblccmstatename") as Label;
        Label ccmcityname = DgCCClinet.SelectedRow.FindControl("lblccmcityname") as Label;
        Label ccmclientid = DgCCClinet.SelectedRow.FindControl("lblccmclientid") as Label;
        Label ccmcityid = DgCCClinet.SelectedRow.FindControl("lblccmcityid") as Label;
        Label ccmstateid = DgCCClinet.SelectedRow.FindControl("lblccmstateid") as Label;
        Label ccmccid = DgCCClinet.SelectedRow.FindControl("lblccmccid") as Label;
        Label ccmcompanyid = DgCCClinet.SelectedRow.FindControl("lblccmcompanyid") as Label;
        Label ccmcompanyname = DgCCClinet.SelectedRow.FindControl("lblccmcompanyname") as Label;

        TypeID.Text = ccmccid.Text;
        ddlccclientnameLoad();
        ddlccclientname.SelectedValue = ccmclientid.Text;
        txtcompanyname.Text = ccmdivision.Text;
        txtsector.Text = ccmsector.Text;
        txtprenoandstreet.Text = ccmaddress.Text;
        txtpretownarea.Text = ccmtown.Text;
        //TypeID.Text = DgCCClinet.SelectedRow.Cells[2].Text;
        ddlcompanyname.SelectedValue= ccmcompanyid.Text;
        ddlprestate.SelectedValue = ccmstateid.Text;
        ddlprecityLoad();
        ddlprecity.SelectedValue = ccmcityid.Text;
        txtemailid.Text = ccmemailid.Text;
        txtwebsite.Text = ccmwebsite.Text;
        txtcfdate.Text = Convert.ToDateTime(ccmcontractfrom.Text).ToString("dd/MM/yyyy");
        txttodate.Text = Convert.ToDateTime(ccmcontractto.Text).ToString("dd/MM/yyyy");
        txtmobileno.Text = ccmmobileno.Text;
        txtenrolldate.Text = Convert.ToDateTime(ccmenrolldate.Text).ToString("dd/MM/yyyy");
        txtgstnumber.Text = ccmgstno.Text;

        txteccno.Text = ccfirmno.Text;
        txtpfno.Text = ccepfno.Text;
        txtesino.Text = ccesino.Text;

        txtphoneno.Text = ccmphoneno.Text;
        txtmobileno.Text = ccmmobileno.Text;
        txthrnumber.Text = ccmhrno.Text;
        txtaccountantnumber.Text = ccmaccountantno.Text;
        
        //txtemailid.Text = DgClinet.SelectedRow.Cells[19].Text;
        //txtwebsite.Text = Convert.ToDateTime(DgClinet.SelectedRow.Cells[21].Text).ToString("dd/MM/yyyy");
        btnsave.Text = "Update";
    }

    protected void ddlprestate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlprestate.SelectedValue == "------ Select State ------")
        {

        }
        else
            ddlprecityLoad();
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    public void Clearnew()
    {

        ddlccclientnameLoad();
        ddlprestateLoad();
        ddlCompanynameLoad();

        ddlprecity.Items.Clear();
        ddlprecity.Items.Add("------- Select City ------");
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

    protected void ddlccclientname_SelectedIndexChanged(object sender, EventArgs e)
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
//WHERE        (dbo.ClientDetail.CLIENTID = '" + ddlccclientname.SelectedValue + "')";
//        da = new SqlDataAdapter(Select, con);
        dt = new DataTable();
        dt = ObjectBL.SelectGetCCClient(ddlccclientname.SelectedValue);
        if (dt.Rows.Count == 1)
        {
            FillDataInPEM(dt);
        }
        con.Close();

        SelectDivision();
    }

    private void SelectDivision()
    {
        dt = ObjectBL.SelectClientDetailID(ddlccclientname.SelectedValue);
        txtcompanyname.Text = dt.Rows[0]["DIVISION"].ToString();

        //DataTable dt = ObjectBL.SelectClinet();
        //txtcompanyname.Text = dt.Rows[0]["DIVISION"].ToString();
    }

    private void FillDataInPEM(DataTable dt)
    {
        txtcompanyname.Text = dt.Rows[0]["DIVISION"].ToString();
        ddlcompanyname.SelectedValue = dt.Rows[0]["COMPANYID"].ToString();
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

        DgCCClinet.DataSource = ObjectBL.SelectCCClientDetailView(txtcompanynameview.Text);
        DgCCClinet.DataBind();
    }

    protected void ddlcompanyname_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = ObjectBL.CompanyDetailIDSelect(ddlcompanyname.SelectedValue);
        txtsector.Text = dt.Rows[0]["SECTOR"].ToString();
    }
}