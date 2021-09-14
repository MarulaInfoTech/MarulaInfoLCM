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

public partial class PayrollForms_PgEntriesAllowances : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();

    //string cs = ConfigurationManager.ConnectionStrings["SuryaOnlineConnectionString"].ConnectionString;

    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    //SqlConnection con = new SqlConnection("Server=WHYNOT;Database=SuryaOnline;user=sa;password=Whynot@94896;");
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";
        if (!IsPostBack)
        {
            ddlcompanynameLoad();
            DgAlowancesDetailLoad();
            ddldescriptionLoad();
        }
    }

    private void ddldescriptionLoad()
    {
        //ddldescription.DataSource = ObjectBA.SelectDescription();
        //ddldescription.DataTextField = "DESCRIPTION";
        //ddldescription.DataValueField = "DESID";
        //ddldescription.DataBind();
    }

    private void DgAlowancesDetailLoad()
    {
        DgAlowancesDetail.DataSource = ObjectBA.SelectAllowanceDetail();
        DgAlowancesDetail.DataBind();
    }

    private void ddlcompanynameLoad()
    {
        ddlCliant.Items.Clear();
        ddlCliant.Items.Add("-Select Company Name-");
        ddlCliant.DataSource = ObjectBA.SelectClinet();
        ddlCliant.DataTextField = "CLIENTNAME";
        ddlCliant.DataValueField = "CLIENTID";
        ddlCliant.DataBind();
    }

    protected void btnGet_Click(object sender, EventArgs e)
    {
        if (txtallowancedate.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Allowance Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtallowancedate.Focus();
        }

        else if (ddlCliant.Text == "-Select Company Name-")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Company Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlCliant.Focus();
        }
        else
        {
            DgAllowancesLoad();
            DgAllowancesGridColoumns();
            if (DgAllowances.Rows.Count > 0)   /* //--------messagebox show visible false//*/
            {
                //MessageBox.Visible = false;
            }
            else
            {
                //mess
                //MessageBox.Text = " ";
            }
        }

        //for (int i = 0; DgAllowances.Rows.Count > i; i++)
        //{
        //    if (ddldescription.Text == "---Select Description---")
        //    {
        //        DropDownList description = DgAllowances.Rows[i].FindControl("ddldescription") as DropDownList;
        //        //description.Text = ddldescription.SelectedItem.ToString();
        //        description.DataSource = ObjectBA.SelectDescription();
        //        description.DataTextField = "DESCRIPTION";
        //        description.DataValueField = "DESID";
        //        description.DataBind();               
        //    }
        //    else
        //    {
        //        DropDownList description = DgAllowances.Rows[i].FindControl("ddldescription") as DropDownList;
        //        //description.Text = ddldescription.SelectedItem.ToString();
        //        description.DataSource = ObjectBA.SelectDescription();
        //        description.DataTextField = "DESCRIPTION";
        //        description.DataValueField = "DESID";
        //        description.DataBind();
        //        description.SelectedValue = ddldescription.SelectedValue;
        //    }            
        //}
    }

    private void DgAllowancesLoad()
    {
        string dptName = "";
        if (ddldepartment.SelectedValue == "ALL Department")
        {
            dptName = "";
        }
        else
        {
            dptName = ddldepartment.SelectedItem.ToString();
        }
        DgAllowances.DataSource = ObjectBA.SelectAllowanceFor(ddlCliant.SelectedValue, dptName, txtempcode.Text);
        DgAllowances.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (txtallowancedate.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter Allowance Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtallowancedate.Focus();
        }

        else if (ddlCliant.Text == "-Select Company Name-")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Mobile.No')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlCliant.Focus();
        }
        else
        {
            if (btnsave.Text == "Update")
            {
                ObjectBA.DeleteAllowanceDetail(Convert.ToDateTime(txtallowancedate.Text).ToShortDateString(), ddlCliant.SelectedValue, txtdivisionname.Text);
            }
            for (int i = 0; i < DgAllowances.Rows.Count; i++)
            {
                Label Empid = DgAllowances.Rows[i].FindControl("lblEmpID") as Label;
                Label Code = DgAllowances.Rows[i].FindControl("lblEmpNo") as Label;
                Label Name = DgAllowances.Rows[i].FindControl("lblEmpName") as Label;
                Label DeptID = DgAllowances.Rows[i].FindControl("lblDpt") as Label;

                TextBox txtA1 = DgAllowances.Rows[i].FindControl("txtA1") as TextBox;
                TextBox txtA2 = DgAllowances.Rows[i].FindControl("txtA2") as TextBox;
                TextBox txtA3 = DgAllowances.Rows[i].FindControl("txtA3") as TextBox;
                TextBox txtA4 = DgAllowances.Rows[i].FindControl("txtA4") as TextBox;
                TextBox txtA5 = DgAllowances.Rows[i].FindControl("txtA5") as TextBox;
                TextBox txtA6 = DgAllowances.Rows[i].FindControl("txtA6") as TextBox;
                TextBox txtA7 = DgAllowances.Rows[i].FindControl("txtA7") as TextBox;
                TextBox txtA8 = DgAllowances.Rows[i].FindControl("txtA8") as TextBox;
                TextBox txtA9 = DgAllowances.Rows[i].FindControl("txtA9") as TextBox;

                //TextBox txtAmount = DgAllowances.Rows[i].FindControl("txtAmount") as TextBox;
                //object Amount = txtAmount.Text;
                //DropDownList txtDis = DgAllowances.Rows[i].FindControl("ddldescription") as DropDownList;
                //object Discrp = txtDis.Text;

                ObjectBA.InsertAllowanceDetail(Convert.ToDateTime(txtallowancedate.Text).ToShortDateString(), 
                    Empid.Text, Code.Text, ddlCliant.SelectedValue, txtdivisionname.Text, DeptID.Text,"0",txtA1.Text,txtA2.Text,txtA3.Text,txtA4.Text,txtA5.Text,txtA6.Text,txtA7.Text,txtA8.Text,txtA9.Text,
                    DgAllowances.Columns[4].HeaderText, DgAllowances.Columns[5].HeaderText, DgAllowances.Columns[6].HeaderText,
                    DgAllowances.Columns[7].HeaderText, DgAllowances.Columns[8].HeaderText, DgAllowances.Columns[9].HeaderText,
                    DgAllowances.Columns[10].HeaderText, DgAllowances.Columns[11].HeaderText, DgAllowances.Columns[12].HeaderText);
            }

            DgAllowancesLoad();

            Clearnew();

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            DgAlowancesDetailLoad();
        }
    }

    protected void DgAlowancesDetail_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label alwcurrentdate = DgAlowancesDetail.SelectedRow.FindControl("lblalwcurrentdate") as Label;
        Label alwclientid = DgAlowancesDetail.SelectedRow.FindControl("lblalwclientid") as Label;
        Label alwdivision = DgAlowancesDetail.SelectedRow.FindControl("lblalwdivision") as Label;

        txtallowancedate.Text = Convert.ToDateTime(alwcurrentdate.Text).ToString("dd/MM/yyyy");
        ddlCliant.SelectedValue = alwclientid.Text;

        if(alwdivision.Text=="&nbsp;")
        {
            txtdivisionname.Text = "";
        }
        else
        {
            txtdivisionname.Text = alwdivision.Text;
        }

        DgAllowances.DataSource = ObjectBA.SelectSetAllowanceDetail(Convert.ToDateTime(alwcurrentdate.Text).ToShortDateString(),
            ddlCliant.SelectedValue, txtdivisionname.Text);
        DgAllowances.DataBind();
        dt = ObjectBA.SelectSetAllowanceDetail(Convert.ToDateTime(alwcurrentdate.Text).ToShortDateString(),
            ddlCliant.SelectedValue, txtdivisionname.Text);
        if (dt.Rows.Count > 0)
        {
             
            DgAllowances.Columns[4].HeaderText= dt.Rows[0]["AD1"].ToString();
            DgAllowances.Columns[5].HeaderText = dt.Rows[0]["AD2"].ToString();
            DgAllowances.Columns[6].HeaderText = dt.Rows[0]["AD3"].ToString();
            DgAllowances.Columns[7].HeaderText = dt.Rows[0]["AD4"].ToString();
            DgAllowances.Columns[8].HeaderText = dt.Rows[0]["AD5"].ToString();
            DgAllowances.Columns[9].HeaderText = dt.Rows[0]["AD6"].ToString();
            DgAllowances.Columns[10].HeaderText = dt.Rows[0]["AD7"].ToString();
            DgAllowances.Columns[11].HeaderText = dt.Rows[0]["AD8"].ToString();
            DgAllowances.Columns[12].HeaderText = dt.Rows[0]["AD9"].ToString();
            DgAllowances.DataBind();
            //for (int i = 0; i < dt.Rows.Count; i++)
            //{

            //    TextBox txtA1 = DgAllowances.Rows[i].FindControl("txtA1") as TextBox;
            //    TextBox txtA2 = DgAllowances.Rows[i].FindControl("txtA2") as TextBox;
            //    TextBox txtA3 = DgAllowances.Rows[i].FindControl("txtA3") as TextBox;
            //    TextBox txtA4 = DgAllowances.Rows[i].FindControl("txtA4") as TextBox;
            //    TextBox txtA5 = DgAllowances.Rows[i].FindControl("txtA5") as TextBox;
            //    TextBox txtA6 = DgAllowances.Rows[i].FindControl("txtA6") as TextBox;
            //    TextBox txtA7 = DgAllowances.Rows[i].FindControl("txtA7") as TextBox;
            //    TextBox txtA8 = DgAllowances.Rows[i].FindControl("txtA8") as TextBox;
            //    TextBox txtA9 = DgAllowances.Rows[i].FindControl("txtA9") as TextBox;

            //    txtA1.Text = dt.Rows[i]["A1"].ToString();
            //    txtA2.Text = dt.Rows[i]["A2"].ToString();
            //    txtA3.Text = dt.Rows[i]["A3"].ToString();
            //    txtA4.Text = dt.Rows[i]["A4"].ToString();
            //    txtA5.Text = dt.Rows[i]["A5"].ToString();
            //    txtA6.Text = dt.Rows[i]["A6"].ToString();
            //    txtA7.Text = dt.Rows[i]["A7"].ToString();
            //    txtA8.Text = dt.Rows[i]["A8"].ToString();
            //    txtA9.Text = dt.Rows[i]["A9"].ToString();
            //    DgAllowances.DataBind();
            //}

        }
        


        //for (int i = 0; DgAllowances.Rows.Count > i; i++)
        //{

        //    Label lblDesID = DgAllowances.Rows[i].FindControl("lblDesID") as Label;
        //    //description.Text = ddldescription.SelectedItem.ToString();
        //    string Descrp = lblDesID.Text;
        //    DropDownList description = DgAllowances.Rows[i].FindControl("ddldescription") as DropDownList;
        //    description.DataSource = ObjectBA.SelectDescription();
        //    description.DataTextField = "DESCRIPTION";
        //    description.DataValueField = "DESID";
        //    description.DataBind();
        //    if (Descrp != "---Select Description---")
        //    {
        //        description.SelectedValue = Descrp;
        //    }

        //}

        btnsave.Text = "Update";
        btnacalculation_Click(sender, e);
    }

    protected void btnacalculation_Click(object sender, EventArgs e)
    {
        decimal A1 = 0, A2 = 0, A3 = 0, A4 = 0, A5= 0, A6 = 0, A7 = 0, A8 = 0, A9 = 0;
        TextBox txtFootA1 = DgAllowances.FooterRow.FindControl("txtFootA1") as TextBox;
        TextBox txtFootA2 = DgAllowances.FooterRow.FindControl("txtFootA2") as TextBox;
        TextBox txtFootA3 = DgAllowances.FooterRow.FindControl("txtFootA3") as TextBox;
        TextBox txtFootA4 = DgAllowances.FooterRow.FindControl("txtFootA4") as TextBox;
        TextBox txtFootA5 = DgAllowances.FooterRow.FindControl("txtFootA5") as TextBox;
        TextBox txtFootA6 = DgAllowances.FooterRow.FindControl("txtFootA6") as TextBox;
        TextBox txtFootA7 = DgAllowances.FooterRow.FindControl("txtFootA7") as TextBox;
        TextBox txtFootA8 = DgAllowances.FooterRow.FindControl("txtFootA8") as TextBox;
        TextBox txtFootA9 = DgAllowances.FooterRow.FindControl("txtFootA9") as TextBox;
        TextBox txtTotal = DgAllowances.FooterRow.FindControl("txtTotal") as TextBox;

        for (int i = 0; i < DgAllowances.Rows.Count; i++)
        {


            CalculateCellValue(i);

            TextBox txtA1 = DgAllowances.Rows[i].FindControl("txtA1") as TextBox;
            TextBox txtA2 = DgAllowances.Rows[i].FindControl("txtA2") as TextBox;
            TextBox txtA3 = DgAllowances.Rows[i].FindControl("txtA3") as TextBox;
            TextBox txtA4 = DgAllowances.Rows[i].FindControl("txtA4") as TextBox;
            TextBox txtA5 = DgAllowances.Rows[i].FindControl("txtA5") as TextBox;
            TextBox txtA6 = DgAllowances.Rows[i].FindControl("txtA6") as TextBox;
            TextBox txtA7 = DgAllowances.Rows[i].FindControl("txtA7") as TextBox;
            TextBox txtA8 = DgAllowances.Rows[i].FindControl("txtA8") as TextBox;
            TextBox txtA9 = DgAllowances.Rows[i].FindControl("txtA9") as TextBox;




            A1 += Convert.ToDecimal(txtA1.Text);
            A2 += Convert.ToDecimal(txtA2.Text);
            A3 += Convert.ToDecimal(txtA3.Text);
            A4 += Convert.ToDecimal(txtA4.Text);
            A5 += Convert.ToDecimal(txtA5.Text);
            A6 += Convert.ToDecimal(txtA6.Text);
            A7 += Convert.ToDecimal(txtA7.Text);
            A8 += Convert.ToDecimal(txtA8.Text);
            A9 += Convert.ToDecimal(txtA9.Text);
        }

        txtFootA1.Text = A1.ToString();
        txtFootA2.Text = A2.ToString();
        txtFootA3.Text = A3.ToString();
        txtFootA4.Text = A4.ToString();
        txtFootA5.Text = A5.ToString();
        txtFootA6.Text = A6.ToString();
        txtFootA7.Text = A7.ToString();
        txtFootA8.Text = A8.ToString();
        txtFootA9.Text = A9.ToString();

        txttotalamountallowance.Text = (A1 + A2 + A3 + A4 + A5 + A6 + A7 + A8 + A9).ToString();
        txtTotal.Text = (A1 + A2 + A3 + A4 + A5 + A6 + A7 + A8 + A9).ToString();
    }

    private void CalculateCellValue(int i)
    {
        int Column = 1;
        decimal TotalEmp = 0;
        for (int j = 1; 10 > Column; j++)
        {
            TextBox ColumnTot = DgAllowances.Rows[i].FindControl("txtA" + j) as TextBox;
            TotalEmp += Convert.ToDecimal(ColumnTot.Text);
            Column++;
        }
        TextBox txtTotal = DgAllowances.Rows[i].FindControl("txtTotal") as TextBox;
        txtTotal.Text = TotalEmp.ToString();
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    public void Clearnew()
    {
        ddlCliant.Items.Clear();
        ddlCliant.Items.Add("-Select Company Name-");
        ddlcompanynameLoad();

        ddldepartment.Items.Clear();
        ddldepartment.Items.Add("-Select Department-");
      
        //ddldescription.Items.Clear();      
        //ddldescription.Items.Add("---Select Description---");
        //ddldescriptionLoad();

        txtallowancedate.Text = "";
        txtdivisionname.Text = "";
        txttotalamountallowance.Text = "";
        DgAllowances.DataSource = null;
        DgAllowances.DataBind();

        btnsave.Text = "Save";
    }

    protected void txtdivisionname_TextChanged(object sender, EventArgs e)
    {
        txtdivisionname.Text = txtdivisionname.Text.ToUpper();
    }

    protected void btnImportview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";
    }

    protected void ddlcompanyname_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }

    private void DgAllowancesGridColoumns()
    {
        int Col = 4;
        dt = ObjectBA.SelectAllowanceDescriptionID(ddlCliant.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (Col < 9)
                {
                    DgAllowances.Columns[Col].HeaderText = dt.Rows[i]["DESCRIPTION"].ToString().ToUpper();
                    Col++;
                }

            }
            DgAllowances.DataBind();
        }
        else
        {
            DgAllowances.Columns[4].HeaderText = "A1";
            DgAllowances.Columns[5].HeaderText = "A2";
            DgAllowances.Columns[6].HeaderText = "A3";
            DgAllowances.Columns[7].HeaderText = "A4";
            DgAllowances.Columns[8].HeaderText = "A5";
            DgAllowances.Columns[9].HeaderText = "A6";
            DgAllowances.Columns[10].HeaderText = "A7";
            DgAllowances.Columns[11].HeaderText = "A8";
            DgAllowances.Columns[12].HeaderText = "A9";
            DgAllowances.DataBind();
        }
    }

    private void ddldepartmentLoad()
    {        
        ddldepartment.Items.Clear();
        ddldepartment.Items.Add("-Select Department-");
        ddldepartment.Items.Add("ALL Department");
        ddldepartment.DataSource = ObjectBA.SelectDepartmentClnt(ddlCliant.SelectedValue);
        ddldepartment.DataTextField = "DEPARTMENTNAME";
        ddldepartment.DataValueField = "DEPARTMENTID";
        ddldepartment.DataBind();
    }

    protected void ddldescription_SelectedIndexChanged(object sender, EventArgs e)
    {
        //for (int i = 0; DgAllowances.Rows.Count > 0; i++)
        //{
        //    if (ddldescription.Text == "---Select Description---")
        //    {


        //        TextBox description = DgAllowances.Rows[i].FindControl("TxtDESCRIPTION") as TextBox;
        //        description.Text = "";
        //    }
        //    else
        //    {

        //        TextBox description = DgAllowances.Rows[i].FindControl("TxtDESCRIPTION") as TextBox;
        //        description.Text = ddldescription.Text.ToString();
        //    }
        //}
    }


    protected void ddlCliant_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = ObjectBA.SelectClientDetailID(ddlCliant.SelectedValue);
        txtdivisionname.Text = dt.Rows[0]["DIVISION"].ToString();
        ddldepartmentLoad();        
    }
}