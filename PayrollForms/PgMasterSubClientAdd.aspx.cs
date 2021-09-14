using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using BLL;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    //SqlConnection con = new SqlConnection("Server=WHYNOT;Database=SuryaOnline;user=sa;password=Whynot@94896;");
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();

    ClsBusnssLayer objectBL = new ClsBusnssLayer();
    
    public string Error = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DgClinetLoad();
            Autotxtclientcode();
        }
    }

    private void Autotxtclientcode()
    {
        con.Close();
        con.Open();
        string AutoNo = @"select max(CLIENTCODE) as CLIENTCODE  from ClientDetail";
        da = new SqlDataAdapter(AutoNo, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["CLIENTCODE"].ToString() != "")
            {
                decimal Auto = Convert.ToDecimal(dt.Rows[0]["CLIENTCODE"]);
                Auto = Auto + 1;
                txtclientcode.Text = Auto.ToString("0####");
                txtclientcode.ReadOnly = true;
            }
            else
            {
                txtclientcode.Text = "00001";
            }            
        }
        con.Close();
    }

    private void DgClinetLoad()
    {
        DgClinet.DataSource = objectBL.SelectClinet();
        DgClinet.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (txtclientname.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Client Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtclientname.Focus();
        }
        else if (txtdivision.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Division')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtdivision.Focus();
        }
        else
        {
            if (btnsave.Text == "Save")
            {
                emptyCheck();
                if (Error == "0")
                {
                    objectBL.InsertClntMasterData(txtclientcode.Text, txtclientname.Text, txtdivision.Text);

                    DgClinetLoad();
                    System.Threading.Thread.Sleep(100);
                    string message = "alert('Data Save')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                    Clearnew();
                }
                else
                {
                    //---- message for already exists
                    //MessageBox.Text = "Data Already Exists";

                    System.Threading.Thread.Sleep(100);
                    string messagealready = "alert('Same Data Already Here')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", messagealready, true);
                }
            }
            else
            {
                objectBL.UpdateClntData(txtclientcode.Text, txtclientname.Text, TypeId.Text, txtdivision.Text);
                
                DgClinetLoad();
                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                Clearnew();
            }
        }
    }

    private void emptyCheck()
    {
        con.Close();
        con.Open();
        string AutoNo = @"SELECT        CLIENTID, CLIENTCODE, CLIENTNAME
            FROM            ClientDetail
                where CLIENTNAME='" + txtclientname.Text + "'";
        da = new SqlDataAdapter(AutoNo, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
           Error = "1";
        }
        con.Close();
    }

    protected void DgClinet_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label camclientid = DgClinet.SelectedRow.FindControl("lblcamclientid") as Label; 
        Label camclientcode = DgClinet.SelectedRow.FindControl("lblcamclientcode") as Label;
        Label camclientname = DgClinet.SelectedRow.FindControl("lblcamclientname") as Label;
        Label lblcamdiviname = DgClinet.SelectedRow.FindControl("lblcamdiviname") as Label;

        TypeId.Text = camclientid.Text;
        txtclientcode.Text = camclientcode.Text;
        txtclientname.Text = camclientname.Text;
        txtdivision.Text = lblcamdiviname.Text;
        btnsave.Text = "Update";
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    public void Clearnew()
    {
        Autotxtclientcode();
        txtclientname.Text = "";
        txtdivision.Text = "";
        btnsave.Text = "Save";
    }

    protected void txtclientname_TextChanged(object sender, EventArgs e)
    {
        txtclientname.Text = txtclientname.Text.ToUpper();
    }

    protected void txtdivision_TextChanged(object sender, EventArgs e)
    {
        txtdivision.Text = txtdivision.Text.ToUpper();
    }
}