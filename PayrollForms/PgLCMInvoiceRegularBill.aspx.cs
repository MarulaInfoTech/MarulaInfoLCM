using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.Sql;
using BLL;

public partial class PayrollForms_Invoice : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";
        if (!IsPostBack)
        {
            ddlclientnameviewLoad();
            Dginvoiceview3Load();
            ClearTotTxtBox();
            TypeId.Text = "0";           
        }
    }

    private void Dginvoiceview3Load()
    {
        Dginvoiceview3.DataSource = ObjectBA.SelectRegularBillHdr();
        Dginvoiceview3.DataBind();
    }

    private void ddlclientnameviewLoad()
    {
        ddlClient.Items.Clear();
        ddlClient.Items.Add("------ Select Client Name -----");
        ddlClient.DataSource = ObjectBA.SelectClinet();
        ddlClient.DataValueField = "CLIENTID";
        ddlClient.DataTextField = "CLIENTNAME";
        ddlClient.DataBind();
    }

    protected void btngenerate_Click(object sender, EventArgs e)
    {
        if (txtinvoicedate.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Invoice Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtinvoicedate.Focus();
        }

        else if (ddlClient.Text == "------- Select Client Name ----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Client Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlClient.Focus();
        }

        else if (txtworkingday.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter Working Days')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtworkingday.Focus();
        }

        else if (txtfromdate.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the From Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtfromdate.Focus();
        }

        else if (txttodate.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the To Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txttodate.Focus();
        }

        else if (txtaccyear.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Account Year')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtaccyear.Focus();
        }

        else
        {
            ColumnNameSetForGrid();
            Dginvoiceview.DataSource = ObjectBA.SelectRegularBillCalc(txtfromdate.Text, txttodate.Text, ddlClient.Text);
            Dginvoiceview.DataBind();
            if (Dginvoiceview.Rows.Count > 0)
            {
                CalculationForRegularBill();
                Manpersent();
            }
            else
            {
                System.Threading.Thread.Sleep(100);
                string message = "alert('No Data Found')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            }
                
        }
    }

    private void ColumnNameSetForGrid()
    {
        dt = new DataTable();
        dt = ObjectBA.SelectAllowanceForColumn(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(),
                Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlClient.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            Dginvoiceview.Columns[18].HeaderText = dt.Rows[0]["AD1"].ToString().ToUpper();
            Dginvoiceview.Columns[19].HeaderText = dt.Rows[0]["AD2"].ToString().ToUpper();
            Dginvoiceview.Columns[20].HeaderText = dt.Rows[0]["AD3"].ToString().ToUpper();
            Dginvoiceview.Columns[21].HeaderText = dt.Rows[0]["AD4"].ToString().ToUpper();
            Dginvoiceview.Columns[22].HeaderText = dt.Rows[0]["AD5"].ToString().ToUpper();
            Dginvoiceview.Columns[23].HeaderText = dt.Rows[0]["AD6"].ToString().ToUpper();
            Dginvoiceview.Columns[24].HeaderText = dt.Rows[0]["AD7"].ToString().ToUpper();
            Dginvoiceview.Columns[25].HeaderText = dt.Rows[0]["AD8"].ToString().ToUpper();
            Dginvoiceview.Columns[26].HeaderText = dt.Rows[0]["AD9"].ToString().ToUpper();
            Dginvoiceview.DataBind();

        }

        dt = new DataTable();
        dt = ObjectBA.SelectDeductionsForColumn(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(),
                Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlClient.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            Dginvoiceview.Columns[38].HeaderText = dt.Rows[0]["DD1"].ToString().ToUpper();
            Dginvoiceview.Columns[39].HeaderText = dt.Rows[0]["DD2"].ToString().ToUpper();
            Dginvoiceview.Columns[40].HeaderText = dt.Rows[0]["DD3"].ToString().ToUpper();
            Dginvoiceview.Columns[41].HeaderText = dt.Rows[0]["DD4"].ToString().ToUpper();
            Dginvoiceview.Columns[42].HeaderText = dt.Rows[0]["DD5"].ToString().ToUpper();
            Dginvoiceview.Columns[43].HeaderText = dt.Rows[0]["DD6"].ToString().ToUpper();
            Dginvoiceview.Columns[44].HeaderText = dt.Rows[0]["DD7"].ToString().ToUpper();
            Dginvoiceview.Columns[45].HeaderText = dt.Rows[0]["DD8"].ToString().ToUpper();
            Dginvoiceview.DataBind();
        }
    }

    private void CalculationForRegularBill()
    {
        decimal EPF = 0, ESI = 0, BasicDA = 0, TotWage = 0, TotNetWage = 0, TotETErn1 = 0, TotETErn2 = 0, TotETErn3 = 0,
            TotGross = 0, HRA = 0, EndTot = 0, Convey = 0, Wasing = 0, A1 = 0, TotET1 = 0, TotET2 = 0, TotET3 = 0, TotWkr = 0,
            A2 = 0, A3 = 0, A4 = 0, A5 = 0, A6 = 0, A7 = 0, A8 = 0, A9 = 0, OtWage = 0, DEPF = 0, DESI = 0,
            Advance = 0, D1 = 0, D2 = 0, D3 = 0, D4 = 0, D5 = 0, D6 = 0, D7 = 0, D8 = 0,
            TotDeduction = 0;
        if (Dginvoiceview.Rows.Count > 0)
        {
            for (int i = 0; Dginvoiceview.Rows.Count > i; i++)
            {
                Label lblNetwage = Dginvoiceview.Rows[i].FindControl("lblNetwage") as Label;
                TotNetWage = Convert.ToDecimal(lblNetwage.Text);
                EndTot += TotNetWage;               

                Label lblEpfWage = Dginvoiceview.Rows[i].FindControl("lblEpfWage") as Label;
                EPF += Convert.ToDecimal(lblEpfWage.Text);

                Label lblEsiWage = Dginvoiceview.Rows[i].FindControl("lblEsiWage") as Label;
                ESI += Convert.ToDecimal(lblEsiWage.Text);

                Label lblBasicDA = Dginvoiceview.Rows[i].FindControl("lblBasicDA") as Label;
                BasicDA += Convert.ToDecimal(lblBasicDA.Text);

                Label lblTotWage = Dginvoiceview.Rows[i].FindControl("lblTotWage") as Label;
                TotWage += Convert.ToDecimal(lblTotWage.Text);

                Label lblEarnGross = Dginvoiceview.Rows[i].FindControl("lblEarnGross") as Label;
                TotGross += Convert.ToDecimal(lblEarnGross.Text);

                Label lblHRA = Dginvoiceview.Rows[i].FindControl("lblHRA") as Label;
                HRA += Convert.ToDecimal(lblHRA.Text);

                Label lblConvey = Dginvoiceview.Rows[i].FindControl("lblConvey") as Label;
                Convey += Convert.ToDecimal(lblConvey.Text);                

                Label lblWashing = Dginvoiceview.Rows[i].FindControl("lblWashing") as Label;
                Wasing += Convert.ToDecimal(lblWashing.Text);

                Label lblA1 = Dginvoiceview.Rows[i].FindControl("lblA1") as Label;
                A1 += Convert.ToDecimal(lblA1.Text);

                Label lblA2 = Dginvoiceview.Rows[i].FindControl("lblA2") as Label;
                A2 += Convert.ToDecimal(lblA2.Text);

                Label lblA3 = Dginvoiceview.Rows[i].FindControl("lblA3") as Label;
                A3 += Convert.ToDecimal(lblA3.Text);

                Label lblA4 = Dginvoiceview.Rows[i].FindControl("lblA4") as Label;
                A4 += Convert.ToDecimal(lblA4.Text);

                Label lblA5 = Dginvoiceview.Rows[i].FindControl("lblA5") as Label;
                A5 += Convert.ToDecimal(lblA5.Text);

                Label lblA6 = Dginvoiceview.Rows[i].FindControl("lblA6") as Label;
                A6 += Convert.ToDecimal(lblA6.Text);

                Label lblA7 = Dginvoiceview.Rows[i].FindControl("lblA7") as Label;
                A7 += Convert.ToDecimal(lblA7.Text);

                Label lblA8 = Dginvoiceview.Rows[i].FindControl("lblA8") as Label;
                A8 += Convert.ToDecimal(lblA8.Text);

                Label lblA9 = Dginvoiceview.Rows[i].FindControl("lblA9") as Label;
                A9 += Convert.ToDecimal(lblA9.Text);

                

                Label lblEarnExtra = Dginvoiceview.Rows[i].FindControl("lblEarnExtra") as Label;
                OtWage += Convert.ToDecimal(lblEarnExtra.Text);

                Label lblEpf = Dginvoiceview.Rows[i].FindControl("lblEpf") as Label;
                DEPF += Convert.ToDecimal(lblEpf.Text);

                 
                Label lblEsi = Dginvoiceview.Rows[i].FindControl("lblEsi") as Label;
                DESI += Convert.ToDecimal(lblEsi.Text);

                Label lblAdvance = Dginvoiceview.Rows[i].FindControl("lblAdvance") as Label;
                Advance += Convert.ToDecimal(lblAdvance.Text);

                Label lblD1 = Dginvoiceview.Rows[i].FindControl("lblD1") as Label;
                D1 += Convert.ToDecimal(lblD1.Text);

                Label lblD2 = Dginvoiceview.Rows[i].FindControl("lblD2") as Label;
                D2 += Convert.ToDecimal(lblD2.Text);

                Label lblD3 = Dginvoiceview.Rows[i].FindControl("lblD3") as Label;
                D3 += Convert.ToDecimal(lblD3.Text);

                Label lblD4 = Dginvoiceview.Rows[i].FindControl("lblD4") as Label;
                D4 += Convert.ToDecimal(lblD4.Text);

                Label lblD5 = Dginvoiceview.Rows[i].FindControl("lblD5") as Label;
                D5 += Convert.ToDecimal(lblD5.Text);

                Label lblD6 = Dginvoiceview.Rows[i].FindControl("lblD6") as Label;
                D6 += Convert.ToDecimal(lblD6.Text);

                Label lblD7 = Dginvoiceview.Rows[i].FindControl("lblD7") as Label;
                D7 += Convert.ToDecimal(lblD7.Text);

                Label lblD8 = Dginvoiceview.Rows[i].FindControl("lblD8") as Label;
                D8 += Convert.ToDecimal(lblD8.Text);

                Label lblTotDeduction = Dginvoiceview.Rows[i].FindControl("lblTotDeduction") as Label;
                TotDeduction += Convert.ToDecimal(lblTotDeduction.Text);

                Label lblETExtra1 = Dginvoiceview.Rows[i].FindControl("lblETExtra1") as Label;
                TotETErn1 += Convert.ToDecimal(lblETExtra1.Text);

                Label lblETExtra2 = Dginvoiceview.Rows[i].FindControl("lblETExtra2") as Label;
                TotETErn2 += Convert.ToDecimal(lblETExtra2.Text);

                Label lblETExtra3 = Dginvoiceview.Rows[i].FindControl("lblETExtra3") as Label;
                TotETErn3 += Convert.ToDecimal(lblETExtra3.Text);

                Label lblET1 = Dginvoiceview.Rows[i].FindControl("lblET1") as Label;
                TotET1 += Convert.ToDecimal(lblET1.Text);

                Label lblET2 = Dginvoiceview.Rows[i].FindControl("lblET2") as Label;
                TotET2 += Convert.ToDecimal(lblET2.Text);

                Label lblET3 = Dginvoiceview.Rows[i].FindControl("lblET3") as Label;
                TotET3 += Convert.ToDecimal(lblET3.Text);

                Label lblWrkDay = Dginvoiceview.Rows[i].FindControl("lblWrkDay") as Label;
                TotWkr += Convert.ToDecimal(lblWrkDay.Text);


            }

            Label lblTotWrkDay = Dginvoiceview.FooterRow.FindControl("lblTotWrkDay") as Label;
            lblTotWrkDay.Text = TotWkr.ToString();

            Label lblTotET1 = Dginvoiceview.FooterRow.FindControl("lblTotET1") as Label;
            lblTotET1.Text = TotET1.ToString();

            Label lblTotET2 = Dginvoiceview.FooterRow.FindControl("lblTotET2") as Label;
            lblTotET2.Text = TotET2.ToString();

            Label lblTotET3 = Dginvoiceview.FooterRow.FindControl("lblTotET3") as Label;
            lblTotET3.Text = TotET3.ToString();


            Label lblTotETExtra3 = Dginvoiceview.FooterRow.FindControl("lblTotETExtra3") as Label;
            lblTotETExtra3.Text = TotETErn3.ToString();

            Label lblTotETExtra2 = Dginvoiceview.FooterRow.FindControl("lblTotETExtra2") as Label;
            lblTotETExtra2.Text = TotETErn2.ToString();

            Label lblTotETExtra1 = Dginvoiceview.FooterRow.FindControl("lblTotETExtra1") as Label;
            lblTotETExtra1.Text = TotETErn1.ToString();

            Label lblOvTotDeduction = Dginvoiceview.FooterRow.FindControl("lblOvTotDeduction") as Label;
            lblOvTotDeduction.Text = TotDeduction.ToString();

            Label lblTotD8 = Dginvoiceview.FooterRow.FindControl("lblTotD8") as Label;
            lblTotD8.Text = D8.ToString();

            Label lblTotD7 = Dginvoiceview.FooterRow.FindControl("lblTotD7") as Label;
            lblTotD7.Text = D7.ToString();

            Label lblTotD6 = Dginvoiceview.FooterRow.FindControl("lblTotD6") as Label;
            lblTotD6.Text = D6.ToString();

            Label lblTotD5 = Dginvoiceview.FooterRow.FindControl("lblTotD5") as Label;
            lblTotD5.Text = D5.ToString();

            Label lblTotD4 = Dginvoiceview.FooterRow.FindControl("lblTotD4") as Label;
            lblTotD4.Text = D4.ToString();

            Label lblTotD3 = Dginvoiceview.FooterRow.FindControl("lblTotD3") as Label;
            lblTotD3.Text = D3.ToString();

            Label lblTotD2 = Dginvoiceview.FooterRow.FindControl("lblTotD2") as Label;
            lblTotD2.Text = D2.ToString();

            Label lblTotD1 = Dginvoiceview.FooterRow.FindControl("lblTotD1") as Label;
            lblTotD1.Text = D1.ToString();

            Label lblTotAdvance = Dginvoiceview.FooterRow.FindControl("lblTotAdvance") as Label;
            lblTotAdvance.Text = Advance.ToString();

            Label lblTotEsi = Dginvoiceview.FooterRow.FindControl("lblTotEsi") as Label;
            lblTotEsi.Text = DESI.ToString();

            Label lblTotEpf = Dginvoiceview.FooterRow.FindControl("lblTotEpf") as Label;
            lblTotEpf.Text = DEPF.ToString();

            Label lblTotEarnExtra = Dginvoiceview.FooterRow.FindControl("lblTotEarnExtra") as Label;
            lblTotEarnExtra.Text = OtWage.ToString();

            Label lblTotA9 = Dginvoiceview.FooterRow.FindControl("lblTotA9") as Label;
            lblTotA9.Text = A9.ToString();

            Label lblTotA8 = Dginvoiceview.FooterRow.FindControl("lblTotA8") as Label;
            lblTotA8.Text = A8.ToString();

            
            Label lblTotA7 = Dginvoiceview.FooterRow.FindControl("lblTotA7") as Label;
            lblTotA7.Text = A7.ToString();

            Label lblTotA6 = Dginvoiceview.FooterRow.FindControl("lblTotA6") as Label;
            lblTotA6.Text = A6.ToString();

            Label lblTotA5 = Dginvoiceview.FooterRow.FindControl("lblTotA5") as Label;
            lblTotA5.Text = A5.ToString();

            Label lblTotA4 = Dginvoiceview.FooterRow.FindControl("lblTotA4") as Label;
            lblTotA4.Text = A4.ToString();

            Label lblTotA3 = Dginvoiceview.FooterRow.FindControl("lblTotA3") as Label;
            lblTotA3.Text = A3.ToString();

            Label lblTotA2 = Dginvoiceview.FooterRow.FindControl("lblTotA2") as Label;
            lblTotA2.Text = A2.ToString();

            Label lblTotA1 = Dginvoiceview.FooterRow.FindControl("lblTotA1") as Label;
            lblTotA1.Text = A1.ToString();


            Label lblTotWashing = Dginvoiceview.FooterRow.FindControl("lblTotWashing") as Label;
            lblTotWashing.Text = Wasing.ToString();

            Label lblTotConvey = Dginvoiceview.FooterRow.FindControl("lblTotConvey") as Label;
            lblTotConvey.Text = Convey.ToString();

            Label lblTotHRA = Dginvoiceview.FooterRow.FindControl("lblTotHRA") as Label;
            lblTotHRA.Text = HRA.ToString();

            Label lblTotNetwage = Dginvoiceview.FooterRow.FindControl("lblTotNetwage") as Label;
            lblTotNetwage.Text = EndTot.ToString();

            Label lblTotEpfWage = Dginvoiceview.FooterRow.FindControl("lblTotEpfWage") as Label;
            lblTotEpfWage.Text = EPF.ToString();

            Label lblTotEsiWage = Dginvoiceview.FooterRow.FindControl("lblTotEsiWage") as Label;
            lblTotEsiWage.Text = ESI.ToString();

            Label lblTotBasicDA = Dginvoiceview.FooterRow.FindControl("lblTotBasicDA") as Label;
            lblTotBasicDA.Text = BasicDA.ToString();

            Label lblFootTotWage = Dginvoiceview.FooterRow.FindControl("lblFootTotWage") as Label;
            lblFootTotWage.Text = TotWage.ToString();

            Label lblTotEarnGross = Dginvoiceview.FooterRow.FindControl("lblTotEarnGross") as Label;
            lblTotEarnGross.Text = TotGross.ToString();

            txtgrosswages.Text = lblTotEarnGross.Text;
        }
    }

    protected void ddlClient_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = ObjectBA.SelectClientDetailID(ddlClient.SelectedValue);
        txtdivisionname.Text = dt.Rows[0]["DIVISION"].ToString();

        dt = new DataTable();
        dt = ObjectBA.SelectInvoiceValueMasterClnt(ddlClient.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            txtpfonwagesper.Text = dt.Rows[0]["PFWAGES"].ToString();
            txtesitotalwagesper.Text = dt.Rows[0]["ESIWAGES"].ToString();
            txtbonusonwagesper.Text = dt.Rows[0]["BONUSWAGE"].ToString();
            txtgratuityonwagesper.Text = dt.Rows[0]["GRATUITYWAGE"].ToString();
            txtleavewithwagesper.Text = dt.Rows[0]["LEAVEWAGE"].ToString();
            txtServicePer.Text = dt.Rows[0]["SERVICECHARGE"].ToString();
            //txtservicechargewithwagesper.Text = dt.Rows[0]["SERVICECHARGE"].ToString();
            //txtlwfpercentage.Text = dt.Rows[0]["LWF"].ToString();
            //txtlwfpercentage.Text = "0";
            txtotherpercentage.Text = "0";
            //txtTotalper.Text = (Convert.ToDecimal(txtpfonwagesper.Text)+ Convert.ToDecimal(txtesitotalwagesper.Text)+ 
            //    Convert.ToDecimal(txtbonusonwagesper.Text)+ Convert.ToDecimal(txtgratuityonwagesper.Text)+ 
            //    Convert.ToDecimal(txtleavewithwagesper.Text)+ 
            //    Convert.ToDecimal(txtlwfpercentage.Text)+ Convert.ToDecimal(txtotherpercentage.Text)).ToString();

            txtLTABasicPer.Text = "0";
            txtLTABasicVal.Text = "0";
            txtlwfvalues.Text = "0";
            txtothervalues.Text = "0";
            txtStatutoryPer.Text = "0";
            txtStatutoryVal.Text = "0";
            txtDefaultPer.Text = "0";
            txtDefaultVal.Text = "0";
            txtRoundUp.Text = "0";
            txtgrosswages.Text = "0";
            txtStatutoryTotPer.Text = "0";
            txtStatutoryTotVal.Text = "0";
            //txtServicePer.Text = "0";
            txtServiceVal.Text = "0";
            txtGrandTot.Text = "0";

            txtBillGrandTot.Text = "0";
            //txtBillTaxPer.Text = "0";
            //txtBillTaxVal.Text = "0";
            txtbdcanteen.Text = "0";
            txtbillother.Text = "0";
            txttotalbillvalue.Text = "0";

            txtcgstper.Text = dt.Rows[0]["CGST"].ToString();
            txtigstper.Text = dt.Rows[0]["IGST"].ToString();
            txtsgstper.Text = dt.Rows[0]["SGST"].ToString();
            txtcessper.Text = dt.Rows[0]["CESS"].ToString();

            //txtltaOnBasic.Text = "0";           
            //txttotalservicechargeper.Text = dt.Rows[0]["TOTALCHARGE"].ToString();
            //txttotalservicechargesper.Text = dt.Rows[0]["TOTALCHARGE"].ToString();

            txtpfonwageesvalue.Text = "0";
            txtesitotalwagesvalue.Text = "0";
            txtbonusonwagesvalue.Text = "0";
            txtgratuityonwagesvalue.Text = "0";
            txtleavewithwagesvalue.Text = "0";
            //txtservicechargewithwagesvalue.Text = "0";
            txtcgstvalue.Text = "0";
            txtigstvalue.Text = "0";
            txtsgstvalue.Text = "0";
            txtcessvalue.Text = "0";
            //txtservicechargewithwagesvalue.Text = "0";

            ddlpfonwagespers.Text = "YES";
            ddlesitotalwagesper.Text = "YES";
            ddlbonusonwagesper.Text = "YES";
            ddlgratuityonwagesper.Text = "YES";
            ddlleavewithwagesper.Text = "YES";
            ddlLTA.Text = "YES";
            ddlotheroption.Text = "YES";
        }

        else

        {
            txtpfonwagesper.Text = "0";
            txtesitotalwagesper.Text = "0";
            txtbonusonwagesper.Text = "0";
            txtgratuityonwagesper.Text = "0";
            txtleavewithwagesper.Text = "0";
            //txtservicechargewithwagesper.Text = "0";
            txtcgstper.Text = "0";
            txtigstper.Text = "0";
            txtsgstper.Text = "0";
            txtcessper.Text = "0";
            //txttotalservicechargeper.Text = "0";
            //txttotalservicechargesper.Text = "0";
            txtpfonwageesvalue.Text = "0";
            txtesitotalwagesvalue.Text = "0";
            txtbonusonwagesvalue.Text = "0";
            txtgratuityonwagesvalue.Text = "0";
            txtleavewithwagesvalue.Text = "0";
            //txtservicechargewithwagesvalue.Text = "0";
            txtcgstvalue.Text = "0";
            txtigstvalue.Text = "0";
            txtsgstvalue.Text = "0";
            txtcessvalue.Text = "0";
            //txtservicechargewithwagesvalue.Text = "0";

            txtLTABasicPer.Text = "0";
            txtLTABasicVal.Text = "0";
            txtlwfvalues.Text = "0";
            txtothervalues.Text = "0";
            txtStatutoryPer.Text = "0";
            txtStatutoryVal.Text = "0";
            txtDefaultPer.Text = "0";
            txtDefaultVal.Text = "0";
            txtRoundUp.Text = "0";
            txtgrosswages.Text = "0";
            txtStatutoryTotPer.Text = "0";
            txtStatutoryTotVal.Text = "0";
            txtServicePer.Text = "0";
            txtServiceVal.Text = "0";
            txtGrandTot.Text = "0";

            txtBillGrandTot.Text = "0";
            //txtBillTaxPer.Text = "0";
            //txtBillTaxVal.Text = "0";
            txtbdcanteen.Text = "0";
            txtbillother.Text = "0";
            txttotalbillvalue.Text = "0";
        }
        
        TotalStatutory();
    }

    protected void txttotalincentive_TextChanged(object sender, EventArgs e)
    {
        decimal Grosswage = 0, GrossTot = 0, Incentive = 0, CGST = 0, SGST = 0, IGST = 0, CESS = 0, NetAmount = 0;

        //GrossTot = Convert.ToDecimal(txtgrosswages.Text) + Convert.ToDecimal(txttotalincentive.Text) + Convert.ToDecimal(txttotalservicechargevalue.Text);

        //txtgrandtotal.Text = GrossTot.ToString("#####.0#");

        CGST = Convert.ToDecimal(txtcgstper.Text);
        SGST = Convert.ToDecimal(txtsgstper.Text);
        IGST = Convert.ToDecimal(txtigstper.Text);
        CESS = Convert.ToDecimal(txtcessper.Text);

        CGST = GrossTot / 100 * CGST;
        txtcgstvalue.Text = CGST.ToString("#####.0#");

        SGST = GrossTot / 100 * SGST;
        txtsgstvalue.Text = SGST.ToString("#####.0#");

        IGST = GrossTot / 100 * IGST;
        txtigstvalue.Text = IGST.ToString("#####.0#");

        CESS = GrossTot / 100 * CESS;
        txtcessvalue.Text = CESS.ToString("#####.0#");

        NetAmount = GrossTot - (Convert.ToDecimal(txtcgstvalue.Text) + Convert.ToDecimal(txtsgstvalue.Text) + Convert.ToDecimal(txtigstvalue.Text) + Convert.ToDecimal(txtcessvalue.Text));

        //txtnetamount.Text = NetAmount.ToString("#####.0#");

    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (TypeId.Text == "0")
        {
            ObjectBA.InsertRegularBillHdr(txtinvoiceno.Text, txtinvoicedate.Text, ddlClient.SelectedValue, txtworkingday.Text,
                Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString(),
                txtaccyear.Text, txtpfonwagesper.Text, txtesitotalwagesper.Text, txtbonusonwagesper.Text, txtgratuityonwagesper.Text,
                txtleavewithwagesper.Text, txtLTABasicPer.Text, txtotherpercentage.Text,txtpfonwageesvalue.Text, txtesitotalwagesvalue.Text, 
                txtbonusonwagesvalue.Text, txtgratuityonwagesvalue.Text, txtleavewithwagesvalue.Text, txtLTABasicVal.Text, txtlwfvalues.Text, 
                txtothervalues.Text, txtStatutoryTotPer.Text, txtStatutoryTotVal.Text, txtServicePer.Text, txtServiceVal.Text, 
                txtgrosswages.Text, txtGrandTot.Text, txtcgstper.Text, txtsgstper.Text, txtigstper.Text, txtcessper.Text, ddlcgstoption.Text, 
                ddlsgstoption.Text, ddligstoption.Text, ddlcessoption.Text, txtcgstvalue.Text, txtsgstvalue.Text, txtigstvalue.Text, 
                txtcessvalue.Text, txtDefaultPer.Text, txtDefaultVal.Text, txtRoundUp.Text, txtbdcanteen.Text, txtbillother.Text,
                txttotalbillvalue.Text, ddlpfonwagespers.Text, ddlesitotalwagesper.Text, ddlbonusonwagesper.Text, ddlgratuityonwagesper.Text, 
                ddlleavewithwagesper.Text, ddlLTA.Text, ddlotheroption.Text, ddlService.Text);

            InsertDetailRegularBill();

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        }

        else
        {
            ObjectBA.DeleteRegularBillHdr(TypeId.Text);
            ObjectBA.DeleteRegularBillDtl(TypeId.Text);

            ObjectBA.InsertRegularBillHdr(txtinvoiceno.Text, txtinvoicedate.Text, ddlClient.SelectedValue, txtworkingday.Text,
                Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString(),
                txtaccyear.Text, txtpfonwagesper.Text, txtesitotalwagesper.Text, txtbonusonwagesper.Text, txtgratuityonwagesper.Text,
                txtleavewithwagesper.Text, txtLTABasicPer.Text, txtotherpercentage.Text, txtpfonwageesvalue.Text, txtesitotalwagesvalue.Text,
                txtbonusonwagesvalue.Text, txtgratuityonwagesvalue.Text, txtleavewithwagesvalue.Text, txtLTABasicVal.Text, txtlwfvalues.Text,
                txtothervalues.Text, txtStatutoryTotPer.Text, txtStatutoryTotVal.Text, txtServicePer.Text, txtServiceVal.Text,
                txtgrosswages.Text, txtGrandTot.Text, txtcgstper.Text, txtsgstper.Text, txtigstper.Text, txtcessper.Text, ddlcgstoption.Text,
                ddlsgstoption.Text, ddligstoption.Text, ddlcessoption.Text, txtcgstvalue.Text, txtsgstvalue.Text, txtigstvalue.Text,
                txtcessvalue.Text, txtDefaultPer.Text, txtDefaultVal.Text, txtRoundUp.Text, txtbdcanteen.Text, txtbillother.Text,
                txttotalbillvalue.Text, ddlpfonwagespers.Text, ddlesitotalwagesper.Text, ddlbonusonwagesper.Text, ddlgratuityonwagesper.Text,
                ddlleavewithwagesper.Text, ddlLTA.Text, ddlotheroption.Text, ddlService.Text);

            InsertDetailRegularBill();

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        }

        Dginvoiceview3Load();
        ClearTotTxtBox();

    }

    private void InsertDetailRegularBill()
    {
        string RGBID = "";
        DataTable dt = new DataTable();
        dt = ObjectBA.SelectRegularBillHdrMax();
        if (dt.Rows.Count > 0)
        {
            RGBID = dt.Rows[0][0].ToString();
            DetailInsertForRegularBill(RGBID);
        }
        
        //ObjectBA.InsertRegularBillDtl();
    }

    private void DetailInsertForRegularBill(string RGBID)
    {
        for (int i = 0; i < Dginvoiceview.Rows.Count; i++)
        {
            Label EmpID = Dginvoiceview.Rows[i].FindControl("lblEmpID") as Label;
            Label EmpCode = Dginvoiceview.Rows[i].FindControl("lblEmpCode") as Label;
            Label EmpDptID = Dginvoiceview.Rows[i].FindControl("lblDptId") as Label;
            Label EmpDesgID = Dginvoiceview.Rows[i].FindControl("lblDesgID") as Label;

            Label lblwageType = Dginvoiceview.Rows[i].FindControl("lblwageType") as Label;
            Label lblGrade = Dginvoiceview.Rows[i].FindControl("lblGrade") as Label;
            Label lblwageday = Dginvoiceview.Rows[i].FindControl("lblwageday") as Label;
            Label lblepfwageday = Dginvoiceview.Rows[i].FindControl("lblepfwageday") as Label;

            Label EmpWrkDay = Dginvoiceview.Rows[i].FindControl("lblWrkDay") as Label;

            Label lblET1 = Dginvoiceview.Rows[i].FindControl("lblET1") as Label;
            Label lblET2 = Dginvoiceview.Rows[i].FindControl("lblET2") as Label;
            Label lblET3 = Dginvoiceview.Rows[i].FindControl("lblET3") as Label;

            Label BasicDA = Dginvoiceview.Rows[i].FindControl("lblBasicDA") as Label;
            Label HRAAmount = Dginvoiceview.Rows[i].FindControl("lblHRA") as Label;
            Label Convey = Dginvoiceview.Rows[i].FindControl("lblConvey") as Label;
            Label Wash = Dginvoiceview.Rows[i].FindControl("lblWashing") as Label;


            Label lblA1 = Dginvoiceview.Rows[i].FindControl("lblA1") as Label;
            Label lblA2 = Dginvoiceview.Rows[i].FindControl("lblA2") as Label;
            Label lblA3 = Dginvoiceview.Rows[i].FindControl("lblA3") as Label;
            Label lblA4 = Dginvoiceview.Rows[i].FindControl("lblA4") as Label;
            Label lblA5 = Dginvoiceview.Rows[i].FindControl("lblA5") as Label;
            Label lblA6 = Dginvoiceview.Rows[i].FindControl("lblA6") as Label;
            Label lblA7 = Dginvoiceview.Rows[i].FindControl("lblA7") as Label;
            Label lblA8 = Dginvoiceview.Rows[i].FindControl("lblA8") as Label;
            Label lblA9 = Dginvoiceview.Rows[i].FindControl("lblA9") as Label;

            Label TotalWage = Dginvoiceview.Rows[i].FindControl("lblTotWage") as Label;

            Label lblETExtra1 = Dginvoiceview.Rows[i].FindControl("lblETExtra1") as Label;
            Label lblETExtra2 = Dginvoiceview.Rows[i].FindControl("lblETExtra1") as Label;
            Label lblETExtra3 = Dginvoiceview.Rows[i].FindControl("lblETExtra1") as Label;

            Label lblEarnExtra = Dginvoiceview.Rows[i].FindControl("lblEarnExtra") as Label;
            Label lblEarnGross = Dginvoiceview.Rows[i].FindControl("lblEarnGross") as Label;

            Label lblEpfWage = Dginvoiceview.Rows[i].FindControl("lblEpfWage") as Label;
            Label lblEsiWage = Dginvoiceview.Rows[i].FindControl("lblEsiWage") as Label;
            Label Epf = Dginvoiceview.Rows[i].FindControl("lblEpf") as Label;
            Label Esi = Dginvoiceview.Rows[i].FindControl("lblEsi") as Label;

            Label lblAdvance = Dginvoiceview.Rows[i].FindControl("lblAdvance") as Label;

            Label lblD1 = Dginvoiceview.Rows[i].FindControl("lblD1") as Label;
            Label lblD2 = Dginvoiceview.Rows[i].FindControl("lblD2") as Label;
            Label lblD3 = Dginvoiceview.Rows[i].FindControl("lblD3") as Label;
            Label lblD4 = Dginvoiceview.Rows[i].FindControl("lblD4") as Label;
            Label lblD5 = Dginvoiceview.Rows[i].FindControl("lblD5") as Label;
            Label lblD6 = Dginvoiceview.Rows[i].FindControl("lblD6") as Label;
            Label lblD7 = Dginvoiceview.Rows[i].FindControl("lblD7") as Label;
            Label lblD8 = Dginvoiceview.Rows[i].FindControl("lblD8") as Label;

            
            Label lblTotDeduction = Dginvoiceview.Rows[i].FindControl("lblTotDeduction") as Label;
            Label Netwage = Dginvoiceview.Rows[i].FindControl("lblNetwage") as Label;

            ObjectBA.InsertRegularBillDtl(RGBID, EmpID.Text, EmpCode.Text, EmpDptID.Text, EmpDesgID.Text, lblwageType.Text, lblGrade.Text, lblwageday.Text, lblepfwageday.Text,
                EmpWrkDay.Text, lblET1.Text, lblET2.Text, lblET3.Text, BasicDA.Text, HRAAmount.Text, Convey.Text, Wash.Text,
                lblA1.Text, lblA2.Text, lblA3.Text, lblA4.Text, lblA5.Text, lblA6.Text, lblA7.Text, lblA8.Text, lblA9.Text,
                TotalWage.Text, lblETExtra1.Text, lblETExtra2.Text, lblETExtra3.Text, lblEarnExtra.Text, lblEarnGross.Text,
                lblEpfWage.Text, Epf.Text, lblEsiWage.Text, Esi.Text, lblAdvance.Text, lblD1.Text, lblD2.Text, lblD3.Text, lblD4.Text,
               lblD5.Text, lblD6.Text, lblD7.Text, lblD8.Text, lblTotDeduction.Text, Netwage.Text);
        }
    }

    private void SaveDetailsRegularBill()
    {
        
        if (TypeId.Text != "")
        {
            Label lblRGBID = Dginvoiceview3.SelectedRow.FindControl("lblRGBID") as Label;
            Label lblDEPARTMENTID = Dginvoiceview3.SelectedRow.FindControl("lblDEPARTMENTID") as Label;
            Label lblSHIFTHOUR = Dginvoiceview3.SelectedRow.FindControl("lblSHIFTHOUR") as Label;
            Label lblDAYRATE = Dginvoiceview3.SelectedRow.FindControl("lblDAYRATE") as Label;
            Label lblOTHOURS = Dginvoiceview3.SelectedRow.FindControl("lblOTHOURS") as Label;
            Label lblOTRATE = Dginvoiceview3.SelectedRow.FindControl("lblOTRATE") as Label;
            Label lblTOTALWAGE = Dginvoiceview3.SelectedRow.FindControl("lblTOTALWAGE") as Label;

            Label lblTOTALOT = Dginvoiceview3.SelectedRow.FindControl("lblTOTALOT") as Label;
            Label lblTOTALAMOUNT = Dginvoiceview3.SelectedRow.FindControl("lblTOTALAMOUNT") as Label;

            //ObjectBA.InsertRegularBillDtl(TypeId.Text, lblDEPARTMENTID.Text, lblSHIFTHOUR.Text, lblDAYRATE.Text, 
            //    lblOTHOURS.Text, lblOTRATE.Text, lblTOTALWAGE.Text, lblTOTALOT.Text, lblTOTALAMOUNT.Text);
        }
    }

    private void ClearTotTxtBox()
    {
        TypeId.Text = "0";
        txtinvoiceno.Text = "";
        txtinvoicedate.Text = "";
        ddlclientnameviewLoad();
        ddlClient.SelectedValue = "------ Select Client Name -----";
        txtworkingday.Text = "";
        txtfromdate.Text = "";
        txttodate.Text = "";
        txtaccyear.Text = "";
        txtgrosswages.Text = "0";

        txtdivisionname.Text = "";

        txtotherpercentage.Text = "0";

        txtLTABasicPer.Text = "0";
        txtLTABasicVal.Text = "0";
        txtlwfvalues.Text = "0";
        txtothervalues.Text = "0";
        txtStatutoryPer.Text = "0";
        txtStatutoryVal.Text = "0";
        txtDefaultPer.Text = "0";
        txtDefaultVal.Text = "0";
        txtRoundUp.Text = "0";
        txtgrosswages.Text = "0";
        txtStatutoryTotPer.Text = "0";
        txtStatutoryTotVal.Text = "0";
        txtServicePer.Text = "0";
        txtServiceVal.Text = "0";
        txtGrandTot.Text = "0";

        txtBillGrandTot.Text = "0";
        //txtBillTaxPer.Text = "0";
        //txtBillTaxVal.Text = "0";
        txtbdcanteen.Text = "0";
        txtbillother.Text = "0";
        txttotalbillvalue.Text = "0";

        txtpfonwageesvalue.Text = "0";
        txtesitotalwagesvalue.Text = "0";
        txtbonusonwagesvalue.Text = "0";
        txtgratuityonwagesvalue.Text = "0";
        txtleavewithwagesvalue.Text = "0";
     
        txtcgstvalue.Text = "0";
        txtigstvalue.Text = "0";
        txtsgstvalue.Text = "0";
        txtcessvalue.Text = "0";

        txtpfonwagesper.Text = "0";
        txtesitotalwagesper.Text = "0";
        txtbonusonwagesper.Text = "0";
        txtgratuityonwagesper.Text = "0";
        txtleavewithwagesper.Text = "0";
        //txtservicechargewithwagesper.Text = "0";
        txtcgstper.Text = "0";
        txtigstper.Text = "0";
        txtsgstper.Text = "0";
        txtcessper.Text = "0";
        //txttotalservicechargeper.Text = "0";
        //txttotalservicechargesper.Text = "0";
        txtpfonwageesvalue.Text = "0";
        txtesitotalwagesvalue.Text = "0";
        txtbonusonwagesvalue.Text = "0";
        txtgratuityonwagesvalue.Text = "0";
        txtleavewithwagesvalue.Text = "0";
        //txtservicechargewithwagesvalue.Text = "0";
        txtcgstvalue.Text = "0";
        txtigstvalue.Text = "0";
        txtsgstvalue.Text = "0";
        txtcessvalue.Text = "0";
        //txtservicechargewithwagesvalue.Text = "0";

        txtLTABasicPer.Text = "0";
        txtLTABasicVal.Text = "0";
        txtlwfvalues.Text = "0";
        txtothervalues.Text = "0";
        txtStatutoryPer.Text = "0";
        txtStatutoryVal.Text = "0";
        txtDefaultPer.Text = "0";
        txtDefaultVal.Text = "0";
        txtRoundUp.Text = "0";
        txtgrosswages.Text = "0";
        txtStatutoryTotPer.Text = "0";
        txtStatutoryTotVal.Text = "0";
        txtServicePer.Text = "0";
        txtServiceVal.Text = "0";
        txtGrandTot.Text = "0";

        txtBillGrandTot.Text = "0";
        //txtBillTaxPer.Text = "0";
        //txtBillTaxVal.Text = "0";
        txtbdcanteen.Text = "0";
        txtbillother.Text = "0";
        txttotalbillvalue.Text = "0";

        txtStatutoryPer.Text = "0";
        txtStatutoryVal.Text = "0";

        txtStatutoryTotPer.Text = "0";
        txtStatutoryTotVal.Text = "0";
       
        txtServicePer.Text = "0";
        txtServiceVal.Text = "0";

        txtGrandTot.Text = "0";


        ddlpfonwagespers.SelectedValue = "Options";
        ddlesitotalwagesper.SelectedValue = "Options";
        ddlbonusonwagesper.SelectedValue = "Options";
        ddlgratuityonwagesper.SelectedValue = "Options";
        ddlleavewithwagesper.SelectedValue = "Options";
        ddlLTA.SelectedValue = "Options";
        ddlotheroption.SelectedValue = "Options";

        ddlService.SelectedValue = "Options";

        ddlcgstoption.SelectedValue = "Options";
        ddligstoption.SelectedValue = "Options";
        ddlcessoption.SelectedValue = "Options";
        ddlsgstoption.SelectedValue = "Options";


        //ddlpfonwagespers.Items.Clear();
        //ddlpfonwagespers.Items.Add("Options");

        //ddlesitotalwagesper.Items.Clear();
        //ddlesitotalwagesper.Items.Add("Options");

        //ddlbonusonwagesper.Items.Clear();
        //ddlbonusonwagesper.Items.Add("Options");

        //ddlgratuityonwagesper.Items.Clear();
        //ddlgratuityonwagesper.Items.Add("Options");

        //ddlleavewithwagesper.Items.Clear();
        //ddlleavewithwagesper.Items.Add("Options");

        //ddlLTA.Items.Clear();
        //ddlLTA.Items.Add("Options");

        //ddlotheroption.Items.Clear();
        //ddlotheroption.Items.Add("Options");

        //ddlcgstoption.Items.Clear();
        //ddlcgstoption.Items.Add("Options");

        //ddligstoption.Items.Clear();
        //ddligstoption.Items.Add("Options");

        //ddlcessoption.Items.Clear();
        //ddlcessoption.Items.Add("Options");

        //ddlsgstoption.Items.Clear();
        //ddlsgstoption.Items.Add("Options");

        Dginvoiceview.DataSource = null;
        Dginvoiceview.DataBind();

        //txttotalincentive.Text ="";
        //txtnetamount.Text = "0";
        //txttotalservicechargesper.Text = "0";
        //txttotalservicechargesvalue.Text = "0";
        //txtservicechargewithwagesvalue.Text ="0";
        //txtservicechargewithwagesper.Text = "0";
        //txtgrandtotal.Text = "0";

        btnsave.Text = "Save";
        TxtboxZero();
    }

    private void TxtboxZero()
    {
        txtpfonwagesper.Text = "0";
        txtesitotalwagesper.Text = "0";
        txtbonusonwagesper.Text = "0";
        txtgratuityonwagesper.Text = "0";
        txtleavewithwagesper.Text = "0";        
        txtcgstper.Text = "0";
        txtigstper.Text = "0";
        txtsgstper.Text = "0";
        txtcessper.Text = "0";        
        txtpfonwageesvalue.Text = "0";
        txtesitotalwagesvalue.Text = "0";
        txtbonusonwagesvalue.Text = "0";
        txtgratuityonwagesvalue.Text = "0";
        txtleavewithwagesvalue.Text = "0";
        
        txtcgstvalue.Text = "0";
        txtigstvalue.Text = "0";
        txtsgstvalue.Text = "0";
        txtcessvalue.Text = "0";

        //txtservicechargewithwagesvalue.Text = "0";
        //txtservicechargewithwagesper.Text = "0";
        //txttotalservicechargeper.Text = "0";
        //txttotalservicechargevalue.Text = "0";
        //txttotalservicechargesper.Text = "0";
        //txttotalservicechargesvalue.Text = "0";

    }

    protected void Dginvoiceview3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblrgbid = Dginvoiceview3.SelectedRow.FindControl("lblrgbid") as Label;
        Label lblclientid = Dginvoiceview3.SelectedRow.FindControl("lblclientid") as Label;
        Label lblinvoicedate = Dginvoiceview3.SelectedRow.FindControl("lblinvoicedate") as Label;
        Label lblinvoiceno = Dginvoiceview3.SelectedRow.FindControl("lblinvoiceno") as Label;
        Label lblclinetname = Dginvoiceview3.SelectedRow.FindControl("lblclinetname") as Label;
        Label lbldivision = Dginvoiceview3.SelectedRow.FindControl("lbldivision") as Label;
        Label lblworkingdays = Dginvoiceview3.SelectedRow.FindControl("lblworkingdays") as Label;
        Label lblfromdate = Dginvoiceview3.SelectedRow.FindControl("lblfromdate") as Label;
        Label lbltodate = Dginvoiceview3.SelectedRow.FindControl("lbltodate") as Label;
        Label lblaccyear = Dginvoiceview3.SelectedRow.FindControl("lblaccyear") as Label;

        Label lblpfper = Dginvoiceview3.SelectedRow.FindControl("lblpfper") as Label;
        Label lblesiper = Dginvoiceview3.SelectedRow.FindControl("lblesiper") as Label;
        Label lblbonusper = Dginvoiceview3.SelectedRow.FindControl("lblbonusper") as Label;
        Label lblgratuityper = Dginvoiceview3.SelectedRow.FindControl("lblgratuityper") as Label;
        Label lblleaveper = Dginvoiceview3.SelectedRow.FindControl("lblleaveper") as Label;
        Label lblltaper = Dginvoiceview3.SelectedRow.FindControl("lblltaper") as Label;
        Label lblotherper = Dginvoiceview3.SelectedRow.FindControl("lblotherper") as Label;

        Label lblpfstatus = Dginvoiceview3.SelectedRow.FindControl("lblpfstatus") as Label;
        Label lblesistatus = Dginvoiceview3.SelectedRow.FindControl("lblesistatus") as Label;
        Label lblbonustatus = Dginvoiceview3.SelectedRow.FindControl("lblbonustatus") as Label;
        Label lblgratuistatus = Dginvoiceview3.SelectedRow.FindControl("lblgratuistatus") as Label;
        Label lblleavestatus = Dginvoiceview3.SelectedRow.FindControl("lblleavestatus") as Label;
        Label lblltastatus = Dginvoiceview3.SelectedRow.FindControl("lblltastatus") as Label;
        Label lblothestatus = Dginvoiceview3.SelectedRow.FindControl("lblothestatus") as Label;

        Label lblpfvalue = Dginvoiceview3.SelectedRow.FindControl("lblpfvalue") as Label;
        Label lblesivalue = Dginvoiceview3.SelectedRow.FindControl("lblesivalue") as Label;
        Label lblbonusvalue = Dginvoiceview3.SelectedRow.FindControl("lblbonusvalue") as Label;
        Label lblgratuityvalue = Dginvoiceview3.SelectedRow.FindControl("lblgratuityvalue") as Label;
        Label lblleavevalue = Dginvoiceview3.SelectedRow.FindControl("lblleavevalue") as Label;
        Label lblltavalue = Dginvoiceview3.SelectedRow.FindControl("lblltavalue") as Label;
        Label lbllwfvalue = Dginvoiceview3.SelectedRow.FindControl("lbllwfvalue") as Label;
        Label lblothervalue = Dginvoiceview3.SelectedRow.FindControl("lblothervalue") as Label;

        Label lbltotalsatutoryper = Dginvoiceview3.SelectedRow.FindControl("lbltotalsatutoryper") as Label;
        Label lbltotalsatutoryval = Dginvoiceview3.SelectedRow.FindControl("lbltotalsatutoryval") as Label;
        Label lblservicestatus = Dginvoiceview3.SelectedRow.FindControl("lblservicestatus") as Label; 
        Label lblserviceper = Dginvoiceview3.SelectedRow.FindControl("lblserviceper") as Label;
        Label lblservicevalue = Dginvoiceview3.SelectedRow.FindControl("lblservicevalue") as Label;
        Label lblgrosswages = Dginvoiceview3.SelectedRow.FindControl("lblgrosswages") as Label;

        Label lblgrandtotal = Dginvoiceview3.SelectedRow.FindControl("lblgrandtotal") as Label;
        Label lblcgstper = Dginvoiceview3.SelectedRow.FindControl("lblcgstper") as Label;
        Label lbligstper = Dginvoiceview3.SelectedRow.FindControl("lbligstper") as Label;
        Label lblcessper = Dginvoiceview3.SelectedRow.FindControl("lblcessper") as Label;
        Label lblsgstper = Dginvoiceview3.SelectedRow.FindControl("lblsgstper") as Label;
       
        Label lblcgststatus = Dginvoiceview3.SelectedRow.FindControl("lblcgststatus") as Label;
        Label lbligststatus = Dginvoiceview3.SelectedRow.FindControl("lbligststatus") as Label;
        Label lblcessstatus = Dginvoiceview3.SelectedRow.FindControl("lblcessstatus") as Label;
        Label lblsgststatus = Dginvoiceview3.SelectedRow.FindControl("lblsgststatus") as Label;

        Label lblcgstvalue = Dginvoiceview3.SelectedRow.FindControl("lblcgstvalue") as Label;
        Label lbligstvalue = Dginvoiceview3.SelectedRow.FindControl("lbligstvalue") as Label;
        Label lblcessvalue = Dginvoiceview3.SelectedRow.FindControl("lblcessvalue") as Label;
        Label lblsgstvalue = Dginvoiceview3.SelectedRow.FindControl("lblsgstvalue") as Label;

        Label lbltotaltax = Dginvoiceview3.SelectedRow.FindControl("lbltotaltax") as Label;
        Label lbltotalvalue = Dginvoiceview3.SelectedRow.FindControl("lbltotalvalue") as Label;

        Label lblroundup = Dginvoiceview3.SelectedRow.FindControl("lblroundup") as Label;
        Label lblcanteen = Dginvoiceview3.SelectedRow.FindControl("lblcanteen") as Label;
        Label lblother = Dginvoiceview3.SelectedRow.FindControl("lblother") as Label;
        Label lblnetamount = Dginvoiceview3.SelectedRow.FindControl("lblnetamount") as Label;

        TypeId.Text = lblrgbid.Text;
        txtinvoiceno.Text = lblinvoiceno.Text;
        txtinvoicedate.Text = Convert.ToDateTime(lblinvoicedate.Text).ToString("dd/MM/yyyy");
        ddlclientnameviewLoad();
        ddlClient.SelectedValue = lblclientid.Text;
        ddlClient_SelectedIndexChanged(sender, e);
        txtworkingday.Text = lblworkingdays.Text;
        txtfromdate.Text = Convert.ToDateTime(lblfromdate.Text).ToString("dd/MM/yyyy");
        txttodate.Text = Convert.ToDateTime(lbltodate.Text).ToString("dd/MM/yyyy");
        txtaccyear.Text = lblaccyear.Text;

        txtpfonwagesper.Text = lblpfper.Text;
        txtesitotalwagesper.Text = lblesiper.Text;
        txtbonusonwagesper.Text = lblbonusper.Text;
        txtgratuityonwagesper.Text = lblgratuityper.Text;
        txtleavewithwagesper.Text = lblleaveper.Text;
        txtLTABasicPer.Text = lblltaper.Text;
        txtotherpercentage.Text = lblotherper.Text;
        txtStatutoryPer.Text = lbltotalsatutoryper.Text;

        ddlpfonwagespers.SelectedValue = lblpfstatus.Text;
        ddlesitotalwagesper.SelectedValue = lblesistatus.Text;
        ddlbonusonwagesper.SelectedValue = lblbonustatus.Text;
        ddlgratuityonwagesper.SelectedValue = lblgratuistatus.Text;
        ddlleavewithwagesper.SelectedValue = lblleavestatus.Text;
        ddlLTA.SelectedValue = lblltastatus.Text;
        ddlotheroption.SelectedValue = lblothestatus.Text;

        txtpfonwageesvalue.Text = lblpfvalue.Text;
        txtesitotalwagesvalue.Text = lblesivalue.Text;
        txtbonusonwagesvalue.Text = lblbonusvalue.Text;
        txtgratuityonwagesvalue.Text = lblgratuityvalue.Text;
        txtleavewithwagesvalue.Text = lblleavevalue.Text;
        txtLTABasicVal.Text = lblltavalue.Text;
        txtlwfvalues.Text = lbllwfvalue.Text;
        txtothervalues.Text = lblothervalue.Text;
        txtStatutoryVal.Text = lbltotalsatutoryval.Text;

        txtgrosswages.Text = lblgrosswages.Text;
        txtStatutoryTotPer.Text = lbltotalsatutoryper.Text;
        txtStatutoryTotVal.Text = lbltotalsatutoryval.Text;
        ddlService.SelectedValue = lblservicestatus.Text;
        txtServicePer.Text = lblserviceper.Text;
        txtServiceVal.Text = lblservicevalue.Text;
        txtGrandTot.Text = lblgrandtotal.Text;

        txtcgstper.Text = lblcgstper.Text;
        ddlcgstoption.SelectedValue = lblcgststatus.Text;
        txtcgstvalue.Text = lblcgstvalue.Text;
        txtigstper.Text = lbligstper.Text;
        ddligstoption.SelectedValue = lbligststatus.Text;
        txtigstvalue.Text = lbligstvalue.Text;
        txtcessper.Text = lblcessper.Text;
        ddlcessoption.SelectedValue = lblcessstatus.Text;
        txtcessvalue.Text = lblcessvalue.Text;
        txtsgstper.Text = lblsgstper.Text;
        ddlsgstoption.SelectedValue = lblsgststatus.Text;
        txtsgstvalue.Text = lblsgstvalue.Text;

        txtDefaultPer.Text = lbltotaltax.Text;
        txtDefaultVal.Text = lbltotalvalue.Text;
        txtRoundUp.Text = lblroundup.Text;

        txtBillGrandTot.Text = lblgrandtotal.Text;
        //txtBillTaxPer.Text = lbltotaltax.Text;
        //txtBillTaxVal.Text = lbltotalvalue.Text;
        txtbdcanteen.Text = lblcanteen.Text;
        txtbillother.Text = lblother.Text;
        txttotalbillvalue.Text = lblnetamount.Text;

        btnsave.Text = "Update";

        SelectGridDetails();

    }

    private void SelectGridDetails()
    {
        Dginvoiceview.DataSource = ObjectBA.SelectRegularBillDtl(TypeId.Text);
        Dginvoiceview.DataBind();
        CalculationForRegularBill();
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        ClearTotTxtBox();
    }

    protected void ddlpfonwagespers_SelectedIndexChanged(object sender, EventArgs e)
    {
        CalculationForEach();
        GrandValueTot();
        GStTotTax();
    }

    private void CalculationForEach()
    {
        Label lblTotEpfWage = Dginvoiceview.FooterRow.FindControl("lblTotEpfWage") as Label;
        Label lblTotEsiWage = Dginvoiceview.FooterRow.FindControl("lblTotEsiWage") as Label;
        Label lblTotBasicDA = Dginvoiceview.FooterRow.FindControl("lblTotBasicDA") as Label;
        Label lblFootTotWage = Dginvoiceview.FooterRow.FindControl("lblFootTotWage") as Label;
        decimal PF = 0, ESI = 0, Bonus = 0, Gratuity = 0, Leave = 0, Other = 0, LWF = 0;

        if (ddlpfonwagespers.SelectedValue == "YES" && txtpfonwagesper.Text == "0")
        {
            DataTable dt = new DataTable();
            dt = ObjectBA.SelectInvoiceValueMasterClnt(ddlClient.SelectedValue);
            if (dt.Rows.Count > 0)
            {
                txtpfonwagesper.Text = dt.Rows[0]["PFWAGES"].ToString();
            }
            PF = Convert.ToDecimal(lblTotEpfWage.Text) / 100 * Convert.ToDecimal(txtpfonwagesper.Text);
            txtpfonwageesvalue.Text = PF.ToString("####0.0#");
        }
        else
        {
            if (ddlpfonwagespers.SelectedValue != "YES")
            {
                txtpfonwagesper.Text = "0";
                txtpfonwageesvalue.Text = "0";
            }            
        }
        if (ddlesitotalwagesper.SelectedValue == "YES" && txtesitotalwagesper.Text == "0")
        {
            DataTable dt = new DataTable();
            dt = ObjectBA.SelectInvoiceValueMasterClnt(ddlClient.SelectedValue);
            if (dt.Rows.Count > 0)
            {
                txtesitotalwagesper.Text = dt.Rows[0]["ESIWAGES"].ToString();
            }

            ESI = Convert.ToDecimal(lblTotEsiWage.Text) / 100 * Convert.ToDecimal(txtesitotalwagesper.Text);
            txtesitotalwagesvalue.Text = ESI.ToString("####0.0#");
        }
        else
        {
            if (ddlesitotalwagesper.SelectedValue != "YES")
            {
                txtesitotalwagesper.Text = "0";
                txtesitotalwagesvalue.Text = "0";
            }            
        }
        if (ddlbonusonwagesper.SelectedValue == "YES" && txtbonusonwagesper.Text == "0")
        {
            DataTable dt = new DataTable();
            dt = ObjectBA.SelectInvoiceValueMasterClnt(ddlClient.SelectedValue);
            if (dt.Rows.Count > 0)
            {
                txtbonusonwagesper.Text = dt.Rows[0]["BONUSWAGE"].ToString();               
                //txtservicechargewithwagesper.Text = dt.Rows[0]["SERVICECHARGE"].ToString();
                //txtlwfpercentage.Text = dt.Rows[0]["LWF"].ToString();
            }

            Bonus = Convert.ToDecimal(lblTotBasicDA.Text) / 100 * Convert.ToDecimal(txtbonusonwagesper.Text);
            txtbonusonwagesvalue.Text = Bonus.ToString("####0.0#");
        }
        else
        {
            if (ddlbonusonwagesper.SelectedValue != "YES")
            {
                txtbonusonwagesper.Text = "0";
                txtbonusonwagesvalue.Text = "0";
            }            
        }

        if (ddlgratuityonwagesper.SelectedValue == "YES" && txtgratuityonwagesper.Text == "0")
        {
            DataTable dt = new DataTable();
            dt = ObjectBA.SelectInvoiceValueMasterClnt(ddlClient.SelectedValue);
            if (dt.Rows.Count > 0)
            {
                txtgratuityonwagesper.Text = dt.Rows[0]["GRATUITYWAGE"].ToString();
            }

            Gratuity = Convert.ToDecimal(lblTotBasicDA.Text) / 100 * Convert.ToDecimal(txtgratuityonwagesper.Text);
            txtgratuityonwagesvalue.Text = Gratuity.ToString("####0.0#");
        }

        else
        {
            if (ddlgratuityonwagesper.SelectedValue != "YES")
            {
                txtgratuityonwagesper.Text = "0";
                txtgratuityonwagesvalue.Text = "0";
            }
            
        }

        if (ddlleavewithwagesper.SelectedValue == "YES" && txtleavewithwagesper.Text == "0")
        {
            DataTable dt = new DataTable();
            dt = ObjectBA.SelectInvoiceValueMasterClnt(ddlClient.SelectedValue);
            if (dt.Rows.Count > 0)
            {
                txtleavewithwagesper.Text = dt.Rows[0]["LEAVEWAGE"].ToString();
            }

            Leave = Convert.ToDecimal(lblFootTotWage.Text) / 100 * Convert.ToDecimal(txtleavewithwagesper.Text);
            txtleavewithwagesvalue.Text = Leave.ToString("####0.0#");
        }

        else
        {
            if (ddlleavewithwagesper.SelectedValue != "YES")
            {
                txtleavewithwagesper.Text = "0";
                txtleavewithwagesvalue.Text = "0";
            }
           
        }

        if (ddlLTA.SelectedValue == "YES" && txtLTABasicPer.Text == "0")
        {
            DataTable dt = new DataTable();
            dt = ObjectBA.SelectInvoiceValueMasterClnt(ddlClient.SelectedValue);
            if (dt.Rows.Count > 0)
            {
                txtLTABasicPer.Text = dt.Rows[0]["LWF"].ToString();
            }

            Leave = Convert.ToDecimal(lblFootTotWage.Text) / 100 * Convert.ToDecimal(txtLTABasicPer.Text);
            txtLTABasicVal.Text = Leave.ToString("####0.0#");
        }

        else
        {
            if (ddlLTA.SelectedValue != "YES")
            {
                txtLTABasicPer.Text = "0";
                txtLTABasicVal.Text = "0";
            }

        }

        TotalStatutory();
        TotalBillGrand();
    }

    private void TotalStatutory()
    {
        try
        {
            txtStatutoryPer.Text = (Convert.ToDecimal(txtpfonwagesper.Text) + Convert.ToDecimal(txtesitotalwagesper.Text)
           + Convert.ToDecimal(txtbonusonwagesper.Text) + Convert.ToDecimal(txtgratuityonwagesper.Text) + Convert.ToDecimal(txtleavewithwagesper.Text)
           + Convert.ToDecimal(txtLTABasicPer.Text) + Convert.ToDecimal(txtotherpercentage.Text)).ToString();

            txtStatutoryVal.Text = (Convert.ToDecimal(txtpfonwageesvalue.Text) + Convert.ToDecimal(txtesitotalwagesvalue.Text)
                + Convert.ToDecimal(txtbonusonwagesvalue.Text) + Convert.ToDecimal(txtgratuityonwagesvalue.Text) + Convert.ToDecimal(txtleavewithwagesvalue.Text)
                + Convert.ToDecimal(txtLTABasicVal.Text) + Convert.ToDecimal(txtothervalues.Text) + Convert.ToDecimal(txtlwfvalues.Text)).ToString();

            txtStatutoryTotPer.Text = txtStatutoryPer.Text;
            txtStatutoryTotVal.Text = txtStatutoryVal.Text;
        }
        catch
        {

        }
       
    }

    protected void ddlesitotalwagesper_SelectedIndexChanged(object sender, EventArgs e)
    {
        CalculationForEach();
        GrandValueTot();
        GStTotTax();
        TotalBillGrand();
    }

    protected void ddlbonusonwagesper_SelectedIndexChanged(object sender, EventArgs e)
    {
        CalculationForEach();
        GrandValueTot();
        GStTotTax();
        TotalBillGrand();
    }

    protected void ddlgratuityonwagesper_SelectedIndexChanged(object sender, EventArgs e)
    {
        CalculationForEach();
        GrandValueTot();
        GStTotTax();
        
    }

    protected void ddlleavewithwagesper_SelectedIndexChanged(object sender, EventArgs e)
    {
        CalculationForEach();
        GrandValueTot();
        GStTotTax();
        
    }

    protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
    {
        CalculationForEach();
        GrandValueTot();
        GStTotTax();
       
    }

    protected void ddlLTA_TextChanged(object sender, EventArgs e)
    {

    }
    protected void ddllwfoption_SelectedIndexChanged(object sender, EventArgs e)
    {
        CalculationForEach();
        GrandValueTot();
        GStTotTax();
        
    }

    protected void ddlotheroption_SelectedIndexChanged(object sender, EventArgs e)
    {
        CalculationForEach();
        GrandValueTot();
        GStTotTax();       
    }

    protected void ddlService_SelectedIndexChanged(object sender, EventArgs e)
    {
        //txtServicePer.Text = "0";
        GrandValueTot();
        GStTotTax();        
    }

    private void GrandValueTot()
    {
        decimal Grand = 0;

        if (ddlService.SelectedValue == "ALL Grand")
        {
            txtServicePer.Enabled = true ;

            Grand = Convert.ToDecimal(txtgrosswages.Text) + Convert.ToDecimal(txtStatutoryTotVal.Text);

            Grand = Grand * Convert.ToDecimal(txtServicePer.Text) / 100;
            txtServiceVal.Text = Grand.ToString();
            txtGrandTot.Text = (Convert.ToDecimal(txtgrosswages.Text) + Convert.ToDecimal(txtServiceVal.Text) +
                Convert.ToDecimal(txtStatutoryTotVal.Text)).ToString("###0");

            txtBillGrandTot.Text = (Convert.ToDecimal(txtgrosswages.Text) + Convert.ToDecimal(txtServiceVal.Text) +
                Convert.ToDecimal(txtStatutoryTotVal.Text)).ToString("###0");
        }
        else if (ddlService.SelectedValue == "Gross")
        {
            txtServicePer.Enabled = true;

            Grand = Convert.ToDecimal(txtgrosswages.Text);
            Grand = Grand * Convert.ToDecimal(txtServicePer.Text) / 100;
            txtServiceVal.Text = Grand.ToString();
            txtGrandTot.Text = (Convert.ToDecimal(txtgrosswages.Text) + Convert.ToDecimal(txtServiceVal.Text)+ 
                Convert.ToDecimal(txtStatutoryTotVal.Text)).ToString("###0");

            txtBillGrandTot.Text = (Convert.ToDecimal(txtgrosswages.Text) + Convert.ToDecimal(txtServiceVal.Text) +
                Convert.ToDecimal(txtStatutoryTotVal.Text)).ToString("###0");

        }

        else if (ddlService.SelectedValue == "Wages")
        {
            txtServicePer.Enabled = true;

            Label lblFootTotWage = Dginvoiceview.FooterRow.FindControl("lblFootTotWage") as Label;
            Grand = Convert.ToDecimal(lblFootTotWage.Text);
            Grand = Grand * Convert.ToDecimal(txtServicePer.Text) / 100;
            txtServiceVal.Text = Grand.ToString();
            txtGrandTot.Text = (Convert.ToDecimal(txtgrosswages.Text) + Convert.ToDecimal(txtServiceVal.Text) +
                Convert.ToDecimal(txtStatutoryTotVal.Text)).ToString("###0");

            txtBillGrandTot.Text = (Convert.ToDecimal(txtgrosswages.Text) + Convert.ToDecimal(txtServiceVal.Text) +
                Convert.ToDecimal(txtStatutoryTotVal.Text)).ToString("###0");
        }
        else if (ddlService.SelectedValue == "Standard")
        {
            txtServicePer.Enabled = false;
            txtGrandTot.Text = (Convert.ToDecimal(txtgrosswages.Text) + Convert.ToDecimal(txtServiceVal.Text) + 
                Convert.ToDecimal(txtStatutoryTotVal.Text)).ToString("###0");

            txtBillGrandTot.Text = (Convert.ToDecimal(txtgrosswages.Text) + Convert.ToDecimal(txtServiceVal.Text) + 
                Convert.ToDecimal(txtStatutoryTotVal.Text)).ToString("###0");
        }
        else
        {
            txtGrandTot.Text = "0";
        }
        TotalBillGrand();        
    }

    protected void txtServicePer_TextChanged(object sender, EventArgs e)
    {
        GrandValueTot();
        GStTotTax();
        TotalBillGrand();
    }

    protected void txtServiceVal_TextChanged(object sender, EventArgs e)
    {
        if (ddlService.SelectedValue == "Standard")
        {
            txtGrandTot.Text = (Convert.ToDecimal(txtgrosswages.Text) + Convert.ToDecimal(txtServiceVal.Text)+ 
                Convert.ToDecimal(txtStatutoryTotVal.Text)).ToString("###0");
            txtBillGrandTot.Text = (Convert.ToDecimal(txtgrosswages.Text) + Convert.ToDecimal(txtServiceVal.Text) + 
                Convert.ToDecimal(txtStatutoryTotVal.Text)).ToString("###0");
            GStTotTax();
            TotalBillGrand();
        }
    }

    protected void ddlcgstoption_SelectedIndexChanged(object sender, EventArgs e)
    {
        GStTotTax();
        TotalBillGrand();
    }

    private void GStTotTax()
    {
        decimal CGST = 0;
        if (ddlcgstoption.SelectedValue == "YES")
        {
            CGST = Convert.ToDecimal(txtGrandTot.Text) * Convert.ToDecimal(txtcgstper.Text) / 100;
            txtcgstvalue.Text = CGST.ToString("###0.00");
        }
        else
        {
            txtcgstvalue.Text = "0";
        }
        decimal IGST = 0;
        if (ddligstoption.SelectedValue == "YES")
        {
            IGST = Convert.ToDecimal(txtGrandTot.Text) * Convert.ToDecimal(txtigstper.Text) / 100;
            txtigstvalue.Text = IGST.ToString("###0.00");
        }
        else
        {
            txtigstvalue.Text = "0";
        }
        decimal CESS = 0;
        if (ddlcessoption.SelectedValue == "YES")
        {
            CESS = Convert.ToDecimal(txtGrandTot.Text) * Convert.ToDecimal(txtcessper.Text) / 100;
            txtcessvalue.Text = CESS.ToString("###0.00");
        }
        else
        {
            txtcessvalue.Text = "0";
        }
        decimal SGST = 0;
        if (ddlsgstoption.SelectedValue == "YES")
        {
            SGST = Convert.ToDecimal(txtGrandTot.Text) * Convert.ToDecimal(txtsgstper.Text) / 100;
            txtsgstvalue.Text = SGST.ToString("###0.00");
        }
        else
        {
            txtsgstvalue.Text = "0";
        }
        TotalTaxVal();
    }

    private void TotalTaxVal()
    {
        //String Round = "";
        decimal TotalTaxPer = 0, TotalTaxVal = 0;
        TotalTaxPer = Convert.ToDecimal(txtcgstper.Text) + Convert.ToDecimal(txtigstper.Text) + Convert.ToDecimal(txtcessper.Text) +
            Convert.ToDecimal(txtsgstper.Text);
        txtDefaultPer.Text = TotalTaxPer.ToString();
        //txtBillTaxPer.Text = TotalTaxPer.ToString();


        TotalTaxVal = Convert.ToDecimal(txtcgstvalue.Text) + Convert.ToDecimal(txtigstvalue.Text) + Convert.ToDecimal(txtcessvalue.Text) +
            Convert.ToDecimal(txtsgstvalue.Text);
        txtDefaultVal.Text = TotalTaxVal.ToString();

        
        TotalBillGrand();

    }

    protected void ddligstoption_SelectedIndexChanged(object sender, EventArgs e)
    {
                
    }

    protected void ddlcessoption_SelectedIndexChanged(object sender, EventArgs e)
    {
        GStTotTax();
        TotalBillGrand();
    }

    protected void ddlsgstoption_SelectedIndexChanged(object sender, EventArgs e)
    {
        GStTotTax();
        TotalBillGrand();
    }

    protected void txtbdcanteen_TextChanged(object sender, EventArgs e)
    {
        TotalBillGrand();
    }

    private void TotalBillGrand()
    {
        String Round = "";
        decimal Canteen = 0, BillTot = 0, Other = 0, Total = 0;
        if (txtbdcanteen.Text != "" && txtbillother.Text != "")
        {
            Canteen = Convert.ToDecimal(txtbdcanteen.Text);
            Other = Convert.ToDecimal(txtbillother.Text);
            Total = Other + Canteen;
            BillTot = Convert.ToDecimal(txtBillGrandTot.Text) + Convert.ToDecimal(txtDefaultVal.Text);
            BillTot = BillTot - Total;



            Round = BillTot.ToString("####0.00");
            try
            {

                string[] bb = Round.Split('.');
                int m = int.Parse(bb[1]);
                int m1 = int.Parse(bb[0]);

                if ((m >= 10))
                {

                    txttotalbillvalue.Text = (m1 + 1).ToString("0###");
                    txtRoundUp.Text = (Convert.ToDecimal(txttotalbillvalue.Text) - Convert.ToDecimal(Round)).ToString();
                    //txttotalbillvalue.Text = (Convert.ToDecimal(txtGrandTot.Text) + Convert.ToDecimal(txtBillTaxVal.Text)).ToString();
                }
                else
                {
                    txtDefaultPer.Text = Math.Round(BillTot, 1).ToString("0###");
                    txttotalbillvalue.Text = (Convert.ToDecimal(txtGrandTot.Text) + Convert.ToDecimal(txtDefaultPer.Text)).ToString();
                    txtRoundUp.Text = "0";
                }
            }
            catch
            {

            }

            //txttotalbillvalue.Text = BillTot.ToString("###0.00");
        }
    }

    protected void txtbillother_TextChanged(object sender, EventArgs e)
    {
        TotalBillGrand();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";
    }

    protected void txtpfonwagesper_TextChanged(object sender, EventArgs e)
    {
        Manpersent();
        GrandValueTot();
        GStTotTax();
    }

    private void Manpersent()
    {
        Label lblTotEpfWage = Dginvoiceview.FooterRow.FindControl("lblTotEpfWage") as Label;
        Label lblTotEsiWage = Dginvoiceview.FooterRow.FindControl("lblTotEsiWage") as Label;
        Label lblTotBasicDA = Dginvoiceview.FooterRow.FindControl("lblTotBasicDA") as Label;
        Label lblFootTotWage = Dginvoiceview.FooterRow.FindControl("lblFootTotWage") as Label;
        decimal PF = 0, ESI = 0, Bonus = 0, Gratuity = 0, Leave = 0, Other = 0, LWF = 0;

        if (ddlpfonwagespers.SelectedValue == "YES")
        {
            
            PF = Convert.ToDecimal(lblTotEpfWage.Text) / 100 * Convert.ToDecimal(txtpfonwagesper.Text);
            txtpfonwageesvalue.Text = PF.ToString("####0.0#");
        }
        else
        {
            txtpfonwagesper.Text = "0";
            txtpfonwageesvalue.Text = "0";
        }
        if (ddlesitotalwagesper.SelectedValue == "YES")
        {           

            ESI = Convert.ToDecimal(lblTotEsiWage.Text) / 100 * Convert.ToDecimal(txtesitotalwagesper.Text);
            txtesitotalwagesvalue.Text = ESI.ToString("####0.0#");
        }
        else
        {
            txtesitotalwagesper.Text = "0";
            txtesitotalwagesvalue.Text = "0";
        }
        if (ddlbonusonwagesper.SelectedValue == "YES")
        {
            Bonus = Convert.ToDecimal(lblTotBasicDA.Text) / 100 * Convert.ToDecimal(txtbonusonwagesper.Text);
            txtbonusonwagesvalue.Text = Bonus.ToString("####0.0#");
        }
        else
        {
            txtbonusonwagesper.Text = "0";
            txtbonusonwagesvalue.Text = "0";
        }

        if (ddlgratuityonwagesper.SelectedValue == "YES")
        {
           
            Gratuity = Convert.ToDecimal(lblTotBasicDA.Text) / 100 * Convert.ToDecimal(txtgratuityonwagesper.Text);
            txtgratuityonwagesvalue.Text = Gratuity.ToString("####0.0#");
        }

        else
        {
            txtgratuityonwagesper.Text = "0";
            txtgratuityonwagesvalue.Text = "0";
        }

        if (ddlleavewithwagesper.SelectedValue == "YES")
        {
            Leave = Convert.ToDecimal(lblFootTotWage.Text) / 100 * Convert.ToDecimal(txtleavewithwagesper.Text);
            txtleavewithwagesvalue.Text = Leave.ToString("####0.0#");
        }

        else
        {
            txtleavewithwagesper.Text = "0";
            txtleavewithwagesvalue.Text = "0";
        }

        if (ddlLTA.SelectedValue == "YES")
        {
            LWF = Convert.ToDecimal(lblTotBasicDA.Text) / 100 * Convert.ToDecimal(txtLTABasicPer.Text);
            txtLTABasicVal.Text = LWF.ToString("####0.0#");
        }

        else
        {
            txtotherpercentage.Text = "0";
            txtothervalues.Text = "0";
        }

        TotalStatutory(); 
    }

    protected void txtesitotalwagesper_TextChanged(object sender, EventArgs e)
    {
        Manpersent();
        GrandValueTot();
        GStTotTax();
    }

    protected void txtbonusonwagesper_TextChanged(object sender, EventArgs e)
    {
        Manpersent();
        GrandValueTot();
        GStTotTax();
    }

    protected void txtgratuityonwagesper_TextChanged(object sender, EventArgs e)
    {
        Manpersent();
        GrandValueTot();
        GStTotTax();
    }

    protected void txtleavewithwagesper_TextChanged(object sender, EventArgs e)
    {
        Manpersent();
        GrandValueTot();
        GStTotTax();
    }

    protected void txtLTABasicPer_TextChanged(object sender, EventArgs e)
    {
        Manpersent();
        GrandValueTot();
        GStTotTax();
    }

    protected void txtotherpercentage_TextChanged(object sender, EventArgs e)
    {
        Manpersent();
        GrandValueTot();
        GStTotTax();
    }

    protected void txtlwfvalues_TextChanged(object sender, EventArgs e)
    {
        Manpersent();
        GrandValueTot();
        GStTotTax();
       
    }

    protected void txtGrandTot_TextChanged(object sender, EventArgs e)
    {
        TotalBillGrand();
    }

    protected void btnprint_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/PayrollForms/RegularBillWageStatement.aspx");
    }
}