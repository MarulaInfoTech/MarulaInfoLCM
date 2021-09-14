using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BLL;

public partial class PageSalaryGradeMaster : System.Web.UI.Page
{
    
    ClsBusnssLayer ObjectBL = new ClsBusnssLayer();
    DataTable dt = new DataTable();
    string ErrorTag = "0";

    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";
        if (!IsPostBack)
        {
            txtOt1.Text = "1";
            txtOtAmount1.Text = "100";
            txtOt2.Text = "1";
            txtOtAmount2.Text = "100";
            txtOt3.Text = "1";
            txtOtAmount3.Text = "100";
            DgSalaryDetailLoad();
            ddlclientnameLoad();
        }       
    }

    private void ddlclientnameLoad()
    {
        ddlclientname.Items.Clear();
        ddlclientname.Items.Add("---Select Client Name---");
        ddlclientname.DataSource = ObjectBL.SelectClinet();
        ddlclientname.DataTextField = "CLIENTNAME";
        ddlclientname.DataValueField = "CLIENTID";
        ddlclientname.DataBind();
    }

    private void DgSalaryDetailLoad()
    {
        DgSalaryDetail.DataSource = ObjectBL.SelectSalaryDetail();
        DgSalaryDetail.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (ddlclientname.Text== "---Select Client Name---")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Client Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlclientname.Focus();
        }

        else if (txtsalarygradeid.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Salary Grade Id')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtsalarygradeid.Focus();
        }

        else if (txtbasic.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Basic')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtbasic.Focus();
        }

        else if (txtda.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The DA')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtda.Focus();
        }

        else if (txtconveyance.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Conveyance')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtconveyance.Focus();
        }

        else if (txtwashing.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Washing')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtwashing.Focus();
        }

        else if (txthra.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The HRA')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txthra.Focus();
        }

        else if (txtother.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Other')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtother.Focus();
        }

        else if (txttotal.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Total')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txttotal.Focus();
        }

        else if (txtOt1.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The OT')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtOt1.Focus();
        }

        else if (txtOtAmount1.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The OT Amount')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtOtAmount1.Focus();
        }

        else if (txtspecial.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Special')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtspecial.Focus();
        }

        else if (txtbonus.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Bonus')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtbonus.Focus();
        }

        else if (txtpf.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The PF')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtpf.Focus();
        }

        else if (txtesi.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Esi')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtesi.Focus();
        }

        else if (txtgraduity.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Graduity')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtgraduity.Focus();
        }

        else if (txtleavewithwages.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Leave With Wages')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtleavewithwages.Focus();
        }

        else
        {

            if (btnsave.Text == "Save")
            {
                CheckGrade();
                if (ErrorTag == "0")
                {
                    ObjectBL.InsertSalaryDetail(ddlclientname.SelectedValue, txtdivision.Text, txtsalarygradeid.Text, txtbasic.Text, txthra.Text, txtda.Text, txtconveyance.Text,
                    txtwashing.Text, txtother.Text,
                    txttotal.Text, txtOtAmount1.Text, txtspecial.Text, txtbonus.Text, txtpf.Text, txtesi.Text, 
                    txtgraduity.Text, txtleavewithwages.Text, txtOt1.Text,txtOt2.Text,txtOtAmount2.Text,txtOt3.Text,txtOtAmount3.Text);
                    DgSalaryDetailLoad();

                    System.Threading.Thread.Sleep(100);
                    string message = "alert('Data Save')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
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
                ObjectBL.UpdateSalaryDetail(TypeID.Text, ddlclientname.SelectedValue, txtsalarygradeid.Text, txtbasic.Text, txthra.Text, txtda.Text, txtconveyance.Text,
                txtwashing.Text, txtother.Text,
                txttotal.Text, txtOtAmount1.Text, txtspecial.Text, txtbonus.Text, 
                txtpf.Text, txtesi.Text, txtgraduity.Text, txtleavewithwages.Text, txtOt1.Text, txtOt2.Text, txtOtAmount2.Text, txtOt3.Text, txtOtAmount3.Text);
                DgSalaryDetailLoad();
                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                Clearnew();
            }            
        }
    }

    private void CheckGrade()
    {
        dt = ObjectBL.SelectSalaryDetailView(txtsalarygradeid.Text);
        if (dt.Rows.Count > 0)
        {
            ErrorTag = "1";
        }
    }

    protected void DgSalaryDetail_SelectedIndexChanged(object sender, EventArgs e)
    {

        Label slyclientname = DgSalaryDetail.SelectedRow.FindControl("lblslyclientname") as Label;
        Label division = DgSalaryDetail.SelectedRow.FindControl("lbldivision") as Label;

        Label slygrade = DgSalaryDetail.SelectedRow.FindControl("lblslygrade") as Label;
        Label slybasic = DgSalaryDetail.SelectedRow.FindControl("lblslybasic") as Label;
        Label slyhra = DgSalaryDetail.SelectedRow.FindControl("lblslyhra") as Label;
        Label slyda = DgSalaryDetail.SelectedRow.FindControl("lblslyda") as Label;
        Label slyconveyance = DgSalaryDetail.SelectedRow.FindControl("lblslyconveyance") as Label;
        Label slywashing = DgSalaryDetail.SelectedRow.FindControl("lblslywashing") as Label;
        Label slyother = DgSalaryDetail.SelectedRow.FindControl("lblslyother") as Label;
        Label slytotal = DgSalaryDetail.SelectedRow.FindControl("lblslytotal") as Label;
        Label slyotamount = DgSalaryDetail.SelectedRow.FindControl("lblslyotamount") as Label;
        Label slyspecial = DgSalaryDetail.SelectedRow.FindControl("lblslyspecial") as Label;
        Label slybonus = DgSalaryDetail.SelectedRow.FindControl("lblslybonus") as Label;
        Label slypf = DgSalaryDetail.SelectedRow.FindControl("lblslypf") as Label;
        Label slyesi = DgSalaryDetail.SelectedRow.FindControl("lblslyesi") as Label;
        Label slygraduity = DgSalaryDetail.SelectedRow.FindControl("lblslygraduity") as Label;
        Label slyleavewage = DgSalaryDetail.SelectedRow.FindControl("lblslyleavewage") as Label;
        Label slyothour = DgSalaryDetail.SelectedRow.FindControl("lblslyothour") as Label;
        Label slysalaryid = DgSalaryDetail.SelectedRow.FindControl("lblslysalaryid") as Label;
        Label slyclientid = DgSalaryDetail.SelectedRow.FindControl("lblslyclientid") as Label;

        Label lblslyothour2 = DgSalaryDetail.SelectedRow.FindControl("lblslyothour2") as Label;
        Label lblslyotamount2 = DgSalaryDetail.SelectedRow.FindControl("lblslyotamount2") as Label;
        Label lblslyothour3 = DgSalaryDetail.SelectedRow.FindControl("lblslyothour3") as Label;
        Label lblslyotamount3 = DgSalaryDetail.SelectedRow.FindControl("lblslyotamount3") as Label;

        TypeID.Text = slysalaryid.Text;
        ddlclientnameLoad();
        ddlclientname.SelectedValue = slyclientid.Text;

        txtdivision.Text = division.Text;

        txtsalarygradeid.Text = slygrade.Text;
        txtbasic.Text = slybasic.Text;
        txthra.Text = slyhra.Text;
        txtda.Text  = slyda.Text;
        txtconveyance.Text = slyconveyance.Text;
        txtwashing.Text = slywashing.Text;
        txtother.Text = slyother.Text;
        txttotal.Text = slytotal.Text;
        txtOtAmount1.Text = slyotamount.Text;
        txtspecial.Text = slyspecial.Text;
        txtbonus.Text = slybonus.Text;
        txtpf.Text = slypf.Text;
        txtesi.Text = slyesi.Text;
        txtgraduity.Text = slygraduity.Text;
        txtleavewithwages.Text = slyleavewage.Text;
        txtOt1.Text = slyothour.Text;

        txtOt2.Text = lblslyothour2.Text;
        txtOtAmount2.Text = lblslyotamount2.Text;
        txtOt3.Text = lblslyothour3.Text;
        txtOtAmount3.Text = lblslyotamount3.Text;



        btnsave.Text = "Update";
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    public void Clearnew()
    {

        ddlclientname.Items.Clear();
        ddlclientname.Items.Add("---Select Client Name---");

        txtsalarygradeid.Text = "";
        txtbasic.Text = "0";
        txtda.Text = "0";
        txtconveyance.Text = "0";
        txtwashing.Text = "0";
        txthra.Text = "0";
        txtother.Text = "0";
        txttotal.Text = "0";
        txtspecial.Text = "0";
        txtbonus.Text = "0";
        txtpf.Text = "0";
        txtesi.Text = "0";
        txtgraduity.Text = "0";
        txtleavewithwages.Text = "0";
        txtOt1.Text = "1";
        txtOtAmount1.Text = "100";
        txtOt2.Text = "1";
        txtOtAmount2.Text = "100";
        txtOt3.Text = "1";
        txtOtAmount3.Text = "100";
        ddlclientnameLoad();
    }

    protected void txtother_TextChanged(object sender, EventArgs e)
    {
        calculation();
    }

    private void calculation()
    {
        txttotal.Text = (Convert.ToDecimal(txtbasic.Text) + Convert.ToDecimal(txtda.Text) + Convert.ToDecimal(txtconveyance.Text) + Convert.ToDecimal(txtwashing.Text) + Convert.ToDecimal(txthra.Text) + Convert.ToDecimal(txtother.Text).ToString());
    }

    protected void txtbasic_TextChanged(object sender, EventArgs e)
    {
        calculation();
    }

    protected void txtda_TextChanged(object sender, EventArgs e)
    {
        calculation();
    }

    protected void txtconveyance_TextChanged(object sender, EventArgs e)
    {
        calculation();
    }

    protected void txtwashing_TextChanged(object sender, EventArgs e)
    {
        calculation();
    }

    protected void txthra_TextChanged(object sender, EventArgs e)
    {
        calculation();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";

        DgSalaryDetail.DataSource = ObjectBL.SelectSalaryDetailView(txtsalarygradeidview.Text);
        DgSalaryDetail.DataBind();
    }

    protected void txtOt_TextChanged(object sender, EventArgs e)
    {
    }

    protected void txtOtAmount_TextChanged(object sender, EventArgs e)
    {
    }

    protected void txtsalarygradeidview_TextChanged(object sender, EventArgs e)
    {
        txtsalarygradeidview.Text = txtsalarygradeidview.Text.ToUpper();
    }

    protected void ddlclientname_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = ObjectBL.SelectClientDetailID(ddlclientname.SelectedValue);
        txtdivision.Text = dt.Rows[0]["DIVISION"].ToString();
    }
}