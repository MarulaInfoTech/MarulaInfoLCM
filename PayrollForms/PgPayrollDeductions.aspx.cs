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

public partial class PayrollForms_PgPayrollDeductions : System.Web.UI.Page
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
        //hidcurrenttab.Value = "1";
        if (!IsPostBack)
        {           
            ddlcompanynameLoad();
            DgDeductionViewLoad();           
        }
    }

    private void DgDeductionViewLoad()
    {
        DgDeductionView.DataSource = ObjectBA.SelectEmployeeDeductionDetail();
        DgDeductionView.DataBind();
    }

    private void ddlcompanynameLoad()
    {
        ddlcompanyname.Items.Clear();
        ddlcompanyname.Items.Add("-Select Company Name-");
        ddlcompanyname.DataSource = ObjectBA.SelectClinet();
        ddlcompanyname.DataTextField = "CLIENTNAME";
        ddlcompanyname.DataValueField = "CLIENTID";
        ddlcompanyname.DataBind();
    }

    protected void btnGet_Click(object sender, EventArgs e)
    {
        if(txtdeductiondate.Text=="")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The DeductionDate')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtdeductiondate.Focus();
        }
        else if(ddlcompanyname.Text== "-Select Company Name-")
        {

            System.Threading.Thread.Sleep(100);
            string message = "alert('Select The Company Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlcompanyname.Focus();
        }
        else if (txtdivisionname.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Division Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtdivisionname.Focus();
        }
        else
        { 
            GetEmployeeDetail();
            DgDeductionColumnLoas();

            txtnoofemp.Text = DgDeduction.Rows.Count.ToString();

            if (DgDeduction.Rows.Count > 0)          /* //--------messagebox show visible false//*/
            {
                //MessageBox.Visible = false;
            }
            else
            {
                //mess
                //MessageBox.Text = " ";
            }
        }
    }

    private void DgDeductionColumnLoas()
    {
        int Col = 3;
        dt = new DataTable();
        dt = ObjectBA.SelectDeductionDescriptionID(ddlcompanyname.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (lblTotD1.Text == "D1")
                {
                    lblTotD1.Text = dt.Rows[i]["DESCRIPTION"].ToString();
                }
                else if (lblTotD2.Text == "D2")
                {
                    lblTotD2.Text = dt.Rows[i]["DESCRIPTION"].ToString();
                }
                else if (lblTotD3.Text == "D3")
                {
                    lblTotD3.Text = dt.Rows[i]["DESCRIPTION"].ToString();
                }
                else if (lblTotD4.Text == "D4")
                {
                    lblTotD4.Text = dt.Rows[i]["DESCRIPTION"].ToString();
                }
                else if (lblTotD5.Text == "D5")
                {
                    lblTotD5.Text = dt.Rows[i]["DESCRIPTION"].ToString();
                }
                else if(lblTotD6.Text == "D6")
                {
                    lblTotD6.Text = dt.Rows[i]["DESCRIPTION"].ToString();
                }
                else if(lblTotD7.Text == "D7")
                {
                    lblTotD7.Text = dt.Rows[i]["DESCRIPTION"].ToString();
                }
                else if(lblTotD8.Text == "D8")
                {
                    lblTotD8.Text = dt.Rows[i]["DESCRIPTION"].ToString();
                }
                if (Col < 9)
                {
                    DgDeduction.Columns[Col].HeaderText = dt.Rows[i]["DESCRIPTION"].ToString().ToUpper();
                    Col++;
                }

            }
            DgDeduction.DataBind();
        }
        else
        {
            DgDeduction.Columns[3].HeaderText = "D1";
            DgDeduction.Columns[4].HeaderText = "D2";
            DgDeduction.Columns[5].HeaderText = "D3";
            DgDeduction.Columns[6].HeaderText = "D4";
            DgDeduction.Columns[7].HeaderText = "D5";
            DgDeduction.Columns[8].HeaderText = "D6";
            DgDeduction.Columns[9].HeaderText = "D7";
            DgDeduction.DataBind();
        }
    }

    private void GetEmployeeDetail()
    {
        DgDeduction.DataSource = ObjectBA.SelectEmployeeDeductionDetail(ddlcompanyname.SelectedValue);
        DgDeduction.DataBind();                
    }

    protected void DgDeduction_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //ClaculationOfAmount();
    }

    private void ClaculationOfAmount()
    {
        TextBox txtD1 = new TextBox(); TextBox txtD2 = new TextBox();
        TextBox txtD3 = new TextBox(); TextBox txtD4 = new TextBox();
        TextBox txtD5 = new TextBox(); TextBox txtD6 = new TextBox();
        TextBox txtD7 = new TextBox(); TextBox txtD8 = new TextBox();
        TextBox txtGdtotal = new TextBox();
        decimal D1 = 0, D2 = 0, D3 = 0, D4 = 0, D5 = 0, D6 = 0, D7 = 0, D8 = 0;
        for (int i = 0; i < DgDeduction.Rows.Count; i++)
        {
             txtGdtotal = DgDeduction.Rows[i].FindControl("txtGdtotal") as TextBox;
             txtD1 = DgDeduction.Rows[i].FindControl("txtD1") as TextBox;
             txtD2 = DgDeduction.Rows[i].FindControl("txtD2") as TextBox;
             txtD3 = DgDeduction.Rows[i].FindControl("txtD3") as TextBox;
             txtD4 = DgDeduction.Rows[i].FindControl("txtD4") as TextBox;
             txtD5 = DgDeduction.Rows[i].FindControl("txtD5") as TextBox;
             txtD6 = DgDeduction.Rows[i].FindControl("txtD6") as TextBox;
             txtD7 = DgDeduction.Rows[i].FindControl("txtD7") as TextBox;
             txtD8 = DgDeduction.Rows[i].FindControl("txtD8") as TextBox;

            if (txtGdtotal.Text.Trim() == "")
            {
                txtGdtotal.Text = "0";
            }
            if (txtD1.Text.Trim() == "")
            {
                txtD1.Text = "0";
            }
            if (txtD2.Text.Trim() == "")
            {
                txtD2.Text = "0";
            }
            if (txtD3.Text.Trim() == "")
            {
                txtD3.Text = "0";
            }
            if (txtD4.Text.Trim() == "")
            {
                txtD4.Text = "0";
            }
            if (txtD5.Text.Trim() == "")
            {
                txtD5.Text = "0";
            }
            if (txtD6.Text.Trim() == "")
            {
                txtD6.Text = "0";
            }
            if (txtD7.Text.Trim() == "")
            {
                txtD7.Text = "0";
            }
            if (txtD8.Text.Trim() == "")
            {
                txtD8.Text = "0";
            }

            try
            {
                decimal Total = 0;
                Total = Convert.ToDecimal(txtD1.Text) + Convert.ToDecimal(txtD2.Text) + Convert.ToDecimal(txtD3.Text)
                    + Convert.ToDecimal(txtD4.Text) + Convert.ToDecimal(txtD5.Text) + Convert.ToDecimal(txtD6.Text) + 
                    Convert.ToDecimal(txtD7.Text)   + Convert.ToDecimal(txtD8.Text);
                
                txtGdtotal.Text = Total.ToString();
                
                D1 += Convert.ToDecimal(txtD1.Text);
                
                D2 += Convert.ToDecimal(txtD2.Text);
                
                D3 += Convert.ToDecimal(txtD3.Text);
                
                D4 += Convert.ToDecimal(txtD4.Text);
                
                D5 += Convert.ToDecimal(txtD5.Text);
               
                D6 += Convert.ToDecimal(txtD6.Text);
                
                D7 += Convert.ToDecimal(txtD7.Text);

                D8 += Convert.ToDecimal(txtD7.Text);
            }
            catch
            { }
                        
        }
        txttotD1.Text = D1.ToString("####.0#");
        txttotD2.Text = D2.ToString("####.0#");
        txttotD3.Text = D3.ToString("####.0#");
        txttotD4.Text = D4.ToString("####.0#");
        txttotD5.Text = D5.ToString("####.0#");
        txttotD6.Text = D6.ToString("####.0#");
        txttotD7.Text = D7.ToString("####.0#");
        txttotD8.Text = D8.ToString("####.0#");
        txttotal.Text = (D1 + D2 + D3 + D4 + D5 + D6 + D7 + D8).ToString("####.0#");
    }
    protected void DgDeduction_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void BtnCalc_Click(object sender, EventArgs e)
    {        
    }
    protected void DgDeduction_RowEditing(object sender, GridViewEditEventArgs e)
    {
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        ClaculationOfAmount();
        if (txttotD1.Text == "")
        {
            //MessageBox2.Visible = true;
            //MessageBox2.Text = "Select Calculate Button";
            System.Threading.Thread.Sleep(100);
            string message = "alert('elect Calculate Button')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            btncalculate.Focus();
        }
        else
        {
            if (btnsave.Text == "Save")
            {
                ObjectBA.InsertDeductionDetail(Convert.ToDateTime(txtdeductiondate.Text).ToShortDateString(), ddlcompanyname.SelectedValue, "0", txtdivisionname.Text, txttotD1.Text, txttotD2.Text,
                 txttotD3.Text, txttotD4.Text, txttotD5.Text, txttotD6.Text, txttotD7.Text, txttotD8.Text, txttotal.Text);
                SelectDeductionID();

                DgDeductionViewLoad();
                Clearnew();
                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                DgDeductionViewLoad();
            }
            else
            {
                ObjectBA.UpdateDeductionDetail(TypeID.Text, Convert.ToDateTime(txtdeductiondate.Text).ToShortDateString(), ddlcompanyname.SelectedValue, "0", txtdivisionname.Text, txttotD1.Text, txttotD2.Text,
                 txttotD3.Text, txttotD4.Text, txttotD5.Text, txttotD6.Text, txttotD7.Text, txttotD8.Text, txttotal.Text);
                DeleteDeductionDtl(TypeID.Text);
                SelectDeductionID();
                DgDeductionViewLoad();

                //MessageBox3.Visible = true;
                Clearnew();
                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                DgDeductionViewLoad();
                //MessageBox3.ForeColor = System.Drawing.Color.Green;
                //MessageBox3.Text = "Data Update";               
            }
        }
    }

    private void DeleteDeductionDtl(string text)
    {
       ObjectBA.DeleteDeductionDtlDetail(text);
    }
    private void SelectDeductionID()
    {
        string DEDUCTIONID = "";
//        con.Close();
//        con.Open();
//        string DeductID = @"SELECT        MAX(DEDUCTIONID) AS DEDUCTIONID
//FROM            DeductionsHdr";
//        da = new SqlDataAdapter(DeductID, con);
        dt = new DataTable();
        dt = ObjectBA.SelectDeductionsID();
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0][0].ToString() != "")
            {
                DEDUCTIONID = dt.Rows[0][0].ToString();
                InsertDeductionDetail(DEDUCTIONID);
            }        
        }
        
        con.Close();
    }

    private void InsertDeductionDetail(string DEDUCTIONID)
    {
        for (int i = 0; i < DgDeduction.Rows.Count; i++)
        {
            Label Empid = DgDeduction.Rows[i].FindControl("lblEmpID") as Label;
            Label Code = DgDeduction.Rows[i].FindControl("lblEmpNo") as Label;
            TextBox txtD1 = DgDeduction.Rows[i].FindControl("txtD1") as TextBox;
            TextBox txtD2 = DgDeduction.Rows[i].FindControl("txtD2") as TextBox;
            TextBox txtD3 = DgDeduction.Rows[i].FindControl("txtD3") as TextBox;
            TextBox txtD4 = DgDeduction.Rows[i].FindControl("txtD4") as TextBox;
            TextBox txtD5 = DgDeduction.Rows[i].FindControl("txtD5") as TextBox;
            TextBox txtD6 = DgDeduction.Rows[i].FindControl("txtD6") as TextBox;
            TextBox txtD7 = DgDeduction.Rows[i].FindControl("txtD7") as TextBox;
            TextBox txtD8 = DgDeduction.Rows[i].FindControl("txtD8") as TextBox;
            TextBox txtTotal = DgDeduction.Rows[i].FindControl("txtGdtotal") as TextBox;
            

            ObjectBA.InsertDeductionDtlDetail(DEDUCTIONID, Empid.Text, Code.Text, "0", txtD1.Text, txtD2.Text, txtD3.Text, txtD4.Text, txtD5.Text,
                txtD6.Text, txtD7.Text, txtD8.Text, txtTotal.Text,DgDeduction.Columns[3].HeaderText, DgDeduction.Columns[4].HeaderText
                , DgDeduction.Columns[5].HeaderText, DgDeduction.Columns[6].HeaderText, DgDeduction.Columns[7].HeaderText, DgDeduction.Columns[8].HeaderText
                , DgDeduction.Columns[9].HeaderText, DgDeduction.Columns[10].HeaderText);
        }
    }
    protected void btncalculate_Click(object sender, EventArgs e)
    {
        ClaculationOfAmount();
    }
    protected void DgDeductionView_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtnoofemp.Text = DgDeduction.Rows.Count.ToString();

        Label dedcurrentdate = DgDeductionView.SelectedRow.FindControl("lbldedcurrentdate") as Label;
        Label deddivision = DgDeductionView.SelectedRow.FindControl("lbldeddivision") as Label;
        Label dedclientid = DgDeductionView.SelectedRow.FindControl("lbldedclientid") as Label;
        Label dedclientname = DgDeductionView.SelectedRow.FindControl("lbldedclientname") as Label;
        Label lblTotD1 = DgDeductionView.SelectedRow.FindControl("lblTotD1") as Label;
        Label lblTotD2 = DgDeductionView.SelectedRow.FindControl("lblTotD2") as Label;
        Label lblTotD3 = DgDeductionView.SelectedRow.FindControl("lblTotD3") as Label;
        Label lblTotD4 = DgDeductionView.SelectedRow.FindControl("lblTotD4") as Label;
        Label lblTotD5 = DgDeductionView.SelectedRow.FindControl("lblTotD5") as Label;
        Label lblTotD6 = DgDeductionView.SelectedRow.FindControl("lblTotD6") as Label;
        Label lblTotD7 = DgDeductionView.SelectedRow.FindControl("lblTotD7") as Label;
        Label lblTotD8 = DgDeductionView.SelectedRow.FindControl("lblTotD8") as Label;
        Label deddeductionid = DgDeductionView.SelectedRow.FindControl("lbldeddeductionid") as Label;
        Label dedtotal = DgDeductionView.SelectedRow.FindControl("lbldedtotal") as Label;

        TypeID.Text = deddeductionid.Text;
        txtdeductiondate.Text = Convert.ToDateTime(dedcurrentdate.Text).ToString("dd/MM/yyyy");
        ddlcompanynameLoad();
        ddlcompanyname.SelectedValue = dedclientid.Text;
        txtdivisionname.Text = deddivision.Text;
        txttotD1.Text = lblTotD1.Text;
        lblTotD2.Text = lblTotD2.Text;
        lblTotD3.Text = lblTotD3.Text;
        lblTotD4.Text = lblTotD4.Text;
        lblTotD5.Text = lblTotD5.Text;
        lblTotD6.Text = lblTotD6.Text;
        lblTotD7.Text = lblTotD7.Text;
        lblTotD8.Text = lblTotD8.Text;
        txttotal.Text = dedtotal.Text;
        dt = ObjectBA.SelectDeductionEmployeeDetail(TypeID.Text);
        DgDeduction.DataSource = dt;
        DgDeduction.DataBind();        
        ColumnAssignLoad(dt);
        btnsave.Text = "Update";
    }

    private void ColumnAssignLoad(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            DgDeduction.Columns[3].HeaderText = dt.Rows[0]["DD1"].ToString();
            DgDeduction.Columns[4].HeaderText = dt.Rows[0]["DD2"].ToString();
            DgDeduction.Columns[5].HeaderText = dt.Rows[0]["DD3"].ToString();
            DgDeduction.Columns[6].HeaderText = dt.Rows[0]["DD4"].ToString();
            DgDeduction.Columns[7].HeaderText = dt.Rows[0]["DD5"].ToString();
            DgDeduction.Columns[8].HeaderText = dt.Rows[0]["DD6"].ToString();
            DgDeduction.Columns[9].HeaderText = dt.Rows[0]["DD7"].ToString();
            DgDeduction.Columns[10].HeaderText = dt.Rows[0]["DD8"].ToString();

        }
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    public void Clearnew()
    {
        ddlcompanyname.Items.Clear();
        ddlcompanyname.Items.Add("-Select Company Name-");
        ddlcompanynameLoad();

        txtnoofemp.Text = "";
        txtdeductiondate.Text = "";
        txtdivisionname.Text = "";
        txttotD1.Text = "";
        txttotD2.Text = "";
        txttotD3.Text = "";
        txttotD4.Text = "";
        txttotD5.Text = "";
        txttotD6.Text = "";
        txttotD7.Text = "";
        txttotD8.Text = "";
        txttotal.Text = "";
        DgDeduction.DataSource = null;
        DgDeduction.DataBind();

        btnsave.Text = "Save";
    }
    protected void txtempname_TextChanged(object sender, EventArgs e)
    {
        txtempname.Text = txtempname.Text.ToUpper();
    }

    protected void txtdivisionnameview_TextChanged(object sender, EventArgs e)
    {
        txtdivisionnameview.Text = txtdivisionnameview.Text.ToUpper();
    }

    protected void txtdivisionname_TextChanged(object sender, EventArgs e)
    {
        txtdivisionname.Text = txtdivisionname.Text.ToUpper();
    }

    protected void ddlcompanyname_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = ObjectBA.SelectClientDetailID(ddlcompanyname.SelectedValue);
        txtdivisionname.Text = dt.Rows[0]["DIVISION"].ToString();
    }

    protected void DgDeduction_RowCreated(object sender, GridViewRowEventArgs e)
    {
   //     if (e.Row.RowType == DataControlRowType.DataRow &&
   //(e.Row.RowState == DataControlRowState.Normal ||
   // e.Row.RowState == DataControlRowState.Alternate))
   //     {
   //         e.Row.TabIndex = -1;
   //         e.Row.Attributes["onclick"] =
   //           string.Format("javascript:SelectRow(this, {0});", e.Row.RowIndex);
   //         e.Row.Attributes["onkeydown"] = "javascript:return SelectSibling(event);";
   //         e.Row.Attributes["onselectstart"] = "javascript:return false;";
   //     }
    }

    protected void DgDeductionView_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {

    }
}