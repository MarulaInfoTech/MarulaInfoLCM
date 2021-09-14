using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;
using System.Data;

public partial class PayrollForms_PgOffRollLCM_ESIGenerate : System.Web.UI.Page
{
    ClsBusnssLayer objectBL = new ClsBusnssLayer();
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {                        
            GgESIMasterShow();
        }
    }

    protected void btnview_Click(object sender, EventArgs e)
    {

        if (ddlesimonth.Text == "---- Select ESI Month -------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select ESI Month')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlesimonth.Focus();           
        }

        else if (ddlselect.Text == "---Select Type---")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Type')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlselect.Focus();
        }

        else
        {
            DgESIGenerate.DataSource = objectBL.SelectESIGenerate(ddlesimonth.SelectedIndex.ToString(), DateTime.Parse(txtesigeneratedate.Text).ToString("yyyy"));
            DgESIGenerate.DataBind();

            CalculateAll();
        }

        if (DgESIGenerate.Rows.Count > 0)
        {
            Label lblperviousesistrenght = DgESIGenerate.Rows[0].FindControl("lblperviousesistrenght") as Label;
            txtPreviousESIStrength.Text = lblperviousesistrenght.Text;

            Label lblmemberaddition = DgESIGenerate.Rows[0].FindControl("lblmemberaddition") as Label;
            txtMemberAddition.Text = lblmemberaddition.Text;

            Label lblmemberdeletion = DgESIGenerate.Rows[0].FindControl("lblmemberdeletion") as Label;
            txtMemberDeletion.Text = lblmemberdeletion.Text;

            Label lblcurrentstrength = DgESIGenerate.Rows[0].FindControl("lblcurrentstrength") as Label;
            txtCurrentStrength.Text = lblcurrentstrength.Text;

            Label lbltotalactionstrength = DgESIGenerate.Rows[0].FindControl("lbltotalactionstrength") as Label;
            txtTotalActionStrength.Text = lbltotalactionstrength.Text;
        
        }
    }

    protected void ddlesimonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlesimonth.SelectedValue != "---- Select PF Month -------")
        {
            string date = "01-" + ddlesimonth.SelectedValue + DateTime.Now.Year;
            txtesigeneratedate.Text = Convert.ToDateTime(date).ToShortDateString();            
        }
    }

    public void Clearnew()
    {
        txtesigeneratedate.Text = "";

        ddlesimonth.SelectedIndex = 0;

        ddlselect.SelectedIndex = 0;

        txtPreviousESIStrength.Text = "";
        txtMemberAddition.Text = "";
        txtMemberDeletion.Text = "";
        txtCurrentStrength.Text = "";
        txtTotalActionStrength.Text = "";

        txttotalemployercontribution.Text = "";
        txttotalemployeecontribution.Text = "";
        txttotalesicontribution.Text = "";

        DgESIGenerate.DataSource = null;
        DgESIGenerate.DataBind();

        btnsave.Text = "Save";
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (btnsave.Text == "Save")
        {
            objectBL.InsertESIGenerateHdr(ddlesimonth.SelectedIndex.ToString(), txtesigeneratedate.Text, ddlselect.SelectedIndex.ToString(),
            txtPreviousESIStrength.Text, txtMemberAddition.Text, txtMemberDeletion.Text, txtCurrentStrength.Text, txtTotalActionStrength.Text);
            ESIGenerateHdrIDLoad();

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);

            Clearnew();

            GgESIMasterShow();
        }
        else
        {
            objectBL.UpdateESIGenerateHdr(TypeId.Text, ddlesimonth.SelectedIndex.ToString(), txtesigeneratedate.Text, ddlesimonth.SelectedIndex.ToString(),
            txtPreviousESIStrength.Text, txtMemberAddition.Text, txtMemberDeletion.Text, txtCurrentStrength.Text, txtTotalActionStrength.Text);
            ESIGenerateHdrIDDelete();
            ESIGenerateHdrIDLoad();

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);

            Clearnew();

            GgESIMasterShow();
        }        
    }

    private void ESIGenerateHdrIDDelete()
    {
        objectBL.DeleteESIGenerateDtl(TypeId.Text);
    }

    private void ESIGenerateHdrIDLoad()
    {
        dt = objectBL.SelectESIGenerateHdrMax();
        if (dt.Rows[0]["ESIGID"].ToString() != "")
        {
            TypeId.Text = dt.Rows[0]["ESIGID"].ToString();
            ESIGenerateDtlID();
        }
    }

    private void ESIGenerateDtlID()
    {
        for (int i = 0; DgESIGenerate.Rows.Count > i; i++)
        {
            Label lblempid = DgESIGenerate.Rows[i].FindControl("lblempid") as Label;
            Label lblclientid = DgESIGenerate.Rows[i].FindControl("lblclientid") as Label;
            Label lblempidno = DgESIGenerate.Rows[i].FindControl("lblempidno") as Label;
            Label lblIpnumber = DgESIGenerate.Rows[i].FindControl("lblIpnumber") as Label;
            Label lblnoofdays = DgESIGenerate.Rows[i].FindControl("lblnoofdays") as Label;
            Label lbltotalmonthlyesiwages = DgESIGenerate.Rows[i].FindControl("lbltotalmonthlyesiwages") as Label;
            Label lbltotalesicontribution = DgESIGenerate.Rows[i].FindControl("lbltotalesicontribution") as Label;
            Label lblemployeecontribution = DgESIGenerate.Rows[i].FindControl("lblemployeecontribution") as Label;
            Label lblemployercontribution = DgESIGenerate.Rows[i].FindControl("lblemployercontribution") as Label;

            objectBL.InsertESIGenerateDtl(TypeId.Text, lblempid.Text, lblempidno.Text, lbltotalmonthlyesiwages.Text, lblnoofdays.Text,
                lblclientid.Text, lblemployeecontribution.Text, lblemployercontribution.Text, lbltotalesicontribution.Text);
        }
    }

    private void CalculateAll()
    {
        double Emp1 = 0, Emp2 = 0, Total = 0;
        for (int i = 0; i < DgESIGenerate.Rows.Count; i++)
        {
           
            Label lblemployeecontribution = DgESIGenerate.Rows[i].FindControl("lblemployeecontribution") as Label;
            Label lblemployercontribution = DgESIGenerate.Rows[i].FindControl("lblemployercontribution") as Label;
            Label lbltotalesicontribution = DgESIGenerate.Rows[i].FindControl("lbltotalesicontribution") as Label;

            Emp1 += Convert.ToDouble(lblemployeecontribution.Text);
            Emp2 += Convert.ToDouble(lblemployercontribution.Text);

            lbltotalesicontribution.Text = (Convert.ToDouble(lblemployeecontribution.Text) + Convert.ToDouble(lblemployercontribution.Text)).ToString("#####.00");

            Total += Convert.ToDouble(lbltotalesicontribution.Text);
                     
        }

        TextBox txtFootemployeecontribution = DgESIGenerate.FooterRow.FindControl("txtFootemployeecontribution") as TextBox;
        TextBox txtFootemployercontribution = DgESIGenerate.FooterRow.FindControl("txtFootemployercontribution") as TextBox;
        TextBox txtFoottotalesicontribution = DgESIGenerate.FooterRow.FindControl("txtFoottotalesicontribution") as TextBox;

        txtFootemployeecontribution.Text = Emp1.ToString();
        txtFootemployercontribution.Text = Emp2.ToString();
        txtFoottotalesicontribution.Text = Total.ToString();

        txttotalemployeecontribution.Text = txtFootemployeecontribution.Text;
        txttotalemployercontribution.Text = txtFootemployercontribution.Text;
        txttotalesicontribution.Text = txtFoottotalesicontribution.Text;

    }
 
    public void GgESIMasterShow()
    {
        DGESIgenerateBS.DataSource = objectBL.ESIGenerateGridshowBS();
        DGESIgenerateBS.DataBind();
    }

    protected void DGESIgenerateBS_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblesigid = DGESIgenerateBS.SelectedRow.FindControl("lblesigid") as Label;
        Label lblesidate = DGESIgenerateBS.SelectedRow.FindControl("lblesidate") as Label;
        Label lbltype = DGESIgenerateBS.SelectedRow.FindControl("lbltype") as Label;
        Label lblesimonth = DGESIgenerateBS.SelectedRow.FindControl("lblesimonth") as Label;
        Label lblesiprestrength = DGESIgenerateBS.SelectedRow.FindControl("lblesiprestrength") as Label;
        Label lblmemberaddition = DGESIgenerateBS.SelectedRow.FindControl("lblmemberaddition") as Label;
        Label lblmemberdeletion = DGESIgenerateBS.SelectedRow.FindControl("lblmemberdeletion") as Label;
        Label lblcurrentstrength = DGESIgenerateBS.SelectedRow.FindControl("lblcurrentstrength") as Label;
        Label lbltotalactionstrength = DGESIgenerateBS.SelectedRow.FindControl("lbltotalactionstrength") as Label;

        btnsave.Text = "Update";

        TypeId.Text = lblesigid.Text;
        txtesigeneratedate.Text = lblesidate.Text;
        //ddlesimonth.Text = lbltype.Text;
        ddlesimonth.SelectedIndex = Convert.ToInt16(lblesimonth.Text);
        txtPreviousESIStrength.Text = lblesiprestrength.Text;
        txtMemberAddition.Text = lblmemberaddition.Text;
        txtMemberDeletion.Text = lblmemberdeletion.Text;
        txtCurrentStrength.Text = lblcurrentstrength.Text;
        txtTotalActionStrength.Text = lbltotalactionstrength.Text;

        DGESIgenerateBSLoad();
        
    }

    private void DGESIgenerateBSLoad()
    {
        DgESIGenerate.DataSource = objectBL.SelectESIGenerateDtl(TypeId.Text);
        DgESIGenerate.DataBind();
    }
}