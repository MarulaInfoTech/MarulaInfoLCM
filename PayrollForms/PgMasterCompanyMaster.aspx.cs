using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using BLL;
using System.Data;
using System.Configuration;

public partial class CompanyMasterPage : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();
    DataSet ds = new DataSet();

    ClsBusnssLayer objectBL = new ClsBusnssLayer();
    //private string typeId;

    //string check = "0", typeId = "0";

    string check = "0";


    protected void Page_Load(object sender, EventArgs e)
    {
        //TabName.Value = "pills-companymaster";
        hidcurrenttab.Value = "1";

        if (!IsPostBack)
        {
            DataBindingForDgrid();
            txtenrolldate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtcompanycodeLoad();
            txtcompanyname.Focus();

            btnupdate.Attributes.Add("onclick", "return validate()");

            //string script = "$(document).ready(function () { $('[id*=btnupdate]').click(); });";
            //ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);

        }
    }
    private void txtcompanycodeLoad()
    {        
        dt = new DataTable();
        dt = objectBL.SelectGetCompanyCode();
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0][0].ToString() != "")
            {
                decimal Number = Convert.ToDecimal(dt.Rows[0][0]);
                Number = Number + 1;
                txtcompanycode.Text = Number.ToString("0###");
            }
            else
            {
                txtcompanycode.Text = "0001";
            }
        }
        else
        {
            txtcompanycode.Text = "0001";
        }
        con.Close();
    }

    //class Global
    //{       
    //         //public static string typeId;
    //         //public static string check;     
    //}

    private void DataBindingForDgrid()
    {        
        DgCompany.DataSource = objectBL.SelectCompanyMaster();        
        DgCompany.DataBind();
        //DgCompany.Columns[1].Visible = false;
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if(txtemailid.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Email.Id')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtemailid.Focus();
        }

       else if(txtmobileno.Text.Trim()=="")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Mobile.No')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtmobileno.Focus();
        }
        else 
        {           
            if (btnupdate.Text == "Save")
            {
                checkEx();
                if (check == "0")
                {
                    objectBL.InsertCmpData(txtcompanycode.Text, txtcompanyname.Text, txtsector.Text, txtnoandstreet.Text,
                        txttownarea.Text, txtcityname.Text, txtstate.Text, txtemailid.Text,
                        txtwebsite.Text, txtofficeph1.Text, txtofficeph2.Text, txtmobileno.Text, txtfaxno.Text, txtgstno.Text,
                        txtcstno.Text, txteccno.Text, txtsacno.Text, txtesino.Text, txtpfno.Text, txtcitypin.Text, Convert.ToDateTime(txtenrolldate.Text).ToShortDateString());

                    System.Threading.Thread.Sleep(100);
                    string message = "alert('Data Save')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
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
                objectBL.UpdateCmpData(TypeId.Text, txtcompanycode.Text, txtcompanyname.Text, txtsector.Text,
                    txtnoandstreet.Text, txttownarea.Text, txtcityname.Text, txtstate.Text, txtemailid.Text, txtwebsite.Text,
                    txtofficeph1.Text, txtofficeph2.Text, txtmobileno.Text, txtfaxno.Text, txtgstno.Text, txtcstno.Text, txteccno.Text,
                    txtsacno.Text, txtesino.Text, txtpfno.Text, txtcitypin.Text, Convert.ToDateTime(txtenrolldate.Text).ToShortDateString());

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            }

            // Add Fake Delay to simulate long running process.
            //System.Threading.Thread.Sleep(1000);

            DataBindingForDgrid();

            CleartheText();            
        }
                   
    }
    private void checkEx()
    {        
        DgCompany.DataSource = objectBL.SelectCompanyCheck(txtcompanyname.Text.Trim(), txtgstno.Text.Trim());
        DgCompany.DataBind();
        if (DgCompany.Rows.Count > 0)
        {
            check = "1";
        }
    }
    protected void chk_CheckedChanged(object sender, EventArgs e)
    {
        //int rowind = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
        //txtcompanycode.Text = DgCompany.Rows[rowind].Cells[1].Text;
    }
    protected void DgCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label cmcompanid = DgCompany.SelectedRow.FindControl("lblcmcompanid") as Label;
        Label cmcompanycode = DgCompany.SelectedRow.FindControl("lblcmcompanycode") as Label;
        Label cmcompanyname = DgCompany.SelectedRow.FindControl("lblcmcompanyname") as Label;
        Label cmsector = DgCompany.SelectedRow.FindControl("lblcmsector") as Label;
        Label cmstreetno = DgCompany.SelectedRow.FindControl("lblcmstreetno") as Label;
        Label cmtownandarea = DgCompany.SelectedRow.FindControl("lblcmtownandarea") as Label;
        Label cmcity = DgCompany.SelectedRow.FindControl("lblcmcity") as Label;
        Label cmstate = DgCompany.SelectedRow.FindControl("lblcmstate") as Label;
        Label cmpincode = DgCompany.SelectedRow.FindControl("lblcmpincode") as Label;
        Label cmemail = DgCompany.SelectedRow.FindControl("lblcmemail") as Label;
        Label cmweb = DgCompany.SelectedRow.FindControl("lblcmweb") as Label;
        Label cmoffice1 = DgCompany.SelectedRow.FindControl("lblcmoffice1") as Label;
        Label cmoffice2 = DgCompany.SelectedRow.FindControl("lblcmoffice2") as Label;
        Label cmmobileno = DgCompany.SelectedRow.FindControl("lblcmmobileno") as Label;
        Label cmfaxno = DgCompany.SelectedRow.FindControl("lblcmfaxno") as Label;
        Label cmgstno = DgCompany.SelectedRow.FindControl("lblcmgstno") as Label;
        Label cmcinno = DgCompany.SelectedRow.FindControl("lblcmcinno") as Label;
        Label cmregno = DgCompany.SelectedRow.FindControl("lblcmregno") as Label;
        Label cmsaccodeno = DgCompany.SelectedRow.FindControl("lblcmsaccodeno") as Label;
        Label cmesino = DgCompany.SelectedRow.FindControl("lblcmesino") as Label;
        Label cmepfno = DgCompany.SelectedRow.FindControl("lblcmepfno") as Label;
        Label cmdate = DgCompany.SelectedRow.FindControl("lblcmdate") as Label;

        TypeId.Text = cmcompanid.Text;
        txtcompanycode.Text = cmcompanycode.Text;
        txtcompanyname.Text = cmcompanyname.Text;
        txtsector.Text = cmsector.Text;
        txtnoandstreet.Text = cmstreetno.Text;
        txttownarea.Text = cmtownandarea.Text;
        txtcityname.Text = cmcity.Text;
        txtstate.Text = cmstate.Text;
        txtcitypin.Text = cmpincode.Text;
        txtemailid.Text = cmemail.Text;
        txtwebsite.Text = cmweb.Text;
        txtofficeph1.Text = cmoffice1.Text;
        txtofficeph2.Text = cmoffice2.Text;
        txtmobileno.Text = cmmobileno.Text;
        txtfaxno.Text = cmfaxno.Text;
        txtgstno.Text = cmgstno.Text;
        txtcstno.Text = cmcinno.Text;
        txteccno.Text = cmregno.Text;
        txtsacno.Text = cmsaccodeno.Text;
        txtpfno.Text = cmepfno.Text;
        txtesino.Text = cmesino.Text;
        txtenrolldate.Text = Convert.ToDateTime(cmdate.Text).ToString("dd/MM/yyyy");
        btnupdate.Text = "Update";

}
    protected void btnnew_Click(object sender, EventArgs e)
    {
        CleartheText();
    }

    private void CleartheText()
    {
        txtcompanycode.ReadOnly = true;
        txtcompanyname.Text = "";
        txtsector.Text = "";
        txtnoandstreet.Text = "";
        txttownarea.Text = "";
        txtcitypin.Text = "";
        txtcityname.Text = "";
        txtstate.Text = "";
        txtemailid.Text = "";
        txtwebsite.Text = "";
        txtofficeph1.Text = "";
        txtofficeph2.Text = "";
        txtmobileno.Text = "";
        txtfaxno.Text = "";
        txtgstno.Text = "";
        txtcstno.Text = "";
        txteccno.Text = "";
        txtsacno.Text = "";
        txtpfno.Text = "";
        txtesino.Text = "";
        txtenrolldate.Text = "";
        txtcompanycodeLoad();
        btnupdate.Text = "Save";

        TypeId.Text = "0";
    }

    protected void txtnoandstreet_TextChanged(object sender, EventArgs e)
    {
        txtnoandstreet.Text = txtnoandstreet.Text.ToUpper();
    }

    protected void txttownarea_TextChanged1(object sender, EventArgs e)
    {
        txttownarea.Text = txttownarea.Text.ToUpper();
    }

    protected void txtcompanycode_TextChanged(object sender, EventArgs e)
    {
        txtcompanycode.Text = txtcompanycode.Text.ToUpper();
    }

    protected void txtcompanyname_TextChanged(object sender, EventArgs e)
    {
        txtcompanyname.Text = txtcompanyname.Text.ToUpper();
    }

    protected void txtsector_TextChanged(object sender, EventArgs e)
    {
        txtsector.Text = txtsector.Text.ToUpper();
    }

    protected void txtstate_TextChanged(object sender, EventArgs e)
    {
        txtstate.Text = txtstate.Text.ToUpper();
    }

    protected void txtfaxno_TextChanged(object sender, EventArgs e)
    {
        txtfaxno.Text = txtfaxno.Text.ToUpper();
    }

    protected void txtgstno_TextChanged(object sender, EventArgs e)
    {
        txtgstno.Text = txtgstno.Text.ToUpper();
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

    protected void txtesino_TextChanged(object sender, EventArgs e)
    {
        txtesino.Text = txtesino.Text.ToUpper();
    }

    protected void txtwebsite_TextChanged(object sender, EventArgs e)
    {
        txtwebsite.Text = txtwebsite.Text.ToUpper();
    }

    protected void txtcompanynameview_TextChanged(object sender, EventArgs e)
    {
        txtcompanynameview.Text = txtcompanynameview.Text.ToUpper();
    }

    protected void txtcityname_TextChanged(object sender, EventArgs e)
    {
        txtcityname.Text = txtcityname.Text.ToUpper();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";

        DgCompany.DataSource = objectBL.SelectCompanyViewDetails(txtcompanynameview.Text);
        DgCompany.DataBind();
    }


    protected void txtmobileno_TextChanged(object sender, EventArgs e)
    {
        // allows only numbers

        //if (!char.IsNumber(e.KeyChar))

        //{

        //    e.Handled = true;

        //}
    }











    //e.Item.Cells(0).CssClass = "locked";
    //    e.Item.Cells(1).CssClass = "locked";



    protected void Item_Bound(object sender, EventArgs e)
    {

    }
}