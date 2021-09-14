using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Data.Sql;

public partial class PayrollForms_PgPayrollMonthlyWageGenerate : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();

    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    //SqlConnection con = new SqlConnection("Server=WHYNOT;Database=SuryaOnline;user=sa;password=Whynot@94896;");
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlcompanynameLoad();
        }        
    }
    private void ddlcompanynameLoad()
    {
        ddlcompanyname.Items.Clear();
        ddlcompanyname.Items.Add("------- Select Client -------");
        ddlcompanyname.DataSource = ObjectBA.SelectClinet();
        ddlcompanyname.DataValueField = "CLIENTID";
        ddlcompanyname.DataTextField = "CLIENTNAME";
        ddlcompanyname.DataBind();
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
    }
    protected void txtfromdate_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txttodate_TextChanged(object sender, EventArgs e)
    {
        //txttotaldays.Text=Convert.ToDateTime(txttodate.Text  - txtfromdate.Text).Date
        if (txttodate.Text != "")
        {
            //txtFromDate.Text = dtpFromDate.Text;
            DateTime datefrom = Convert.ToDateTime(txtfromdate.Text);
            DateTime todate = Convert.ToDateTime(txttodate.Text);
            int days = int.Parse((todate - datefrom).TotalDays.ToString());
            txttotaldays.Text = (days + 1).ToString();
        }
    }
    protected void btnpayrollgenrate_Click(object sender, EventArgs e)
    {
        if (txtfromdate.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The From Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtfromdate.Focus();
        }
        else if (txttodate.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The ToDate')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txttodate.Focus();
        }
        else if (ddlcompanyname.Text == "------- Select Client -------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter The Company Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlcompanyname.Focus();
        }

        else
        {
            if (DgPayroll.Rows.Count > 0)          /* //--------messagebox show visible false//*/
            {
                //MessageBox2.Visible = false;
            }
            else
            {
                //mess
                //MessageBox2.Text = " ";
            }
            ColumnNameSetForGrid();
            if (ddlGenarate.SelectedValue == "C")
            {
                dt = ObjectBA.SelectPayrollMonthlyGenerate(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(),
                Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlcompanyname.SelectedValue);
                DgPayroll.DataSource = dt;
                DgPayroll.DataBind();
            }
            else
            {
                dt = ObjectBA.SelectPayrollMonthlyGenerateForReportJ(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(),
               Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlcompanyname.SelectedValue);
                DgPayroll.DataSource = dt;
                DgPayroll.DataBind();
            }
            txtnoofemployees.Text = DgPayroll.Rows.Count.ToString();
            
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    CalculationForPayroll(i, dt);
                    //DgPayroll.DataBind();
                }
                
            }

            CalculationForRegularBill();
            //ColumnNameSetForGrid();
            //DgPayroll.DataBind();
        }
    }

    private void ColumnNameSetForGrid()
    {
        dt = new DataTable();
        dt = ObjectBA.SelectAllowanceForColumn(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(),
                Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlcompanyname.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            DgPayroll.Columns[16].HeaderText = dt.Rows[0]["AD1"].ToString().ToUpper();
            DgPayroll.Columns[17].HeaderText = dt.Rows[0]["AD2"].ToString().ToUpper();
            DgPayroll.Columns[18].HeaderText = dt.Rows[0]["AD3"].ToString().ToUpper();
            DgPayroll.Columns[19].HeaderText = dt.Rows[0]["AD4"].ToString().ToUpper();
            DgPayroll.Columns[20].HeaderText = dt.Rows[0]["AD5"].ToString().ToUpper();
            DgPayroll.Columns[21].HeaderText = dt.Rows[0]["AD6"].ToString().ToUpper();
            DgPayroll.Columns[22].HeaderText = dt.Rows[0]["AD7"].ToString().ToUpper();
            DgPayroll.Columns[23].HeaderText = dt.Rows[0]["AD8"].ToString().ToUpper();
            DgPayroll.Columns[24].HeaderText = dt.Rows[0]["AD9"].ToString().ToUpper();
            DgPayroll.DataBind();

        }

        dt = new DataTable();
        dt = ObjectBA.SelectDeductionsForColumn(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(),
                Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlcompanyname.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            DgPayroll.Columns[36].HeaderText = dt.Rows[0]["DD1"].ToString().ToUpper();
            DgPayroll.Columns[37].HeaderText = dt.Rows[0]["DD2"].ToString().ToUpper();
            DgPayroll.Columns[38].HeaderText = dt.Rows[0]["DD3"].ToString().ToUpper();
            DgPayroll.Columns[39].HeaderText = dt.Rows[0]["DD4"].ToString().ToUpper();
            DgPayroll.Columns[40].HeaderText = dt.Rows[0]["DD5"].ToString().ToUpper();
            DgPayroll.Columns[41].HeaderText = dt.Rows[0]["DD6"].ToString().ToUpper();
            DgPayroll.Columns[42].HeaderText = dt.Rows[0]["DD7"].ToString().ToUpper();
            DgPayroll.Columns[43].HeaderText = dt.Rows[0]["DD8"].ToString().ToUpper();
            DgPayroll.DataBind();
        }

    }

    private void CalculationForRegularBill()
    {
        decimal TotalWork=0, TotalOT1 = 0, TotalOT2 = 0, TotalOT3 = 0, EPF = 0, ESI = 0, BasicDA = 0, TotWage = 0, TotNetWage = 0,
            TotGross = 0, HRA = 0, EndTot = 0, Convey = 0, Wasing = 0, A1 = 0,
            A2 = 0, A3 = 0, A4 = 0, A5 = 0, A6 = 0, A7 = 0, A8 = 0, A9 = 0, OtWage1 = 0, OtWage2 = 0, OtWage3 = 0, TOtOtWage = 0, DEPF = 0, DESI = 0,
            Advance = 0, D1 = 0, D2 = 0, D3 = 0, D4 = 0, D5 = 0, D6 = 0, D7 = 0, D8 = 0, 
            TotDeduction = 0;
        

        if (DgPayroll.Rows.Count > 0)
        {
            for (int i = 0; DgPayroll.Rows.Count > i; i++)
            {
                Label lblNetwage = DgPayroll.Rows[i].FindControl("lblNetwage") as Label;
                TotNetWage = Convert.ToDecimal(lblNetwage.Text);
                EndTot += TotNetWage;

                Label lblEpfWage = DgPayroll.Rows[i].FindControl("lblEpfWage") as Label;
                EPF += Convert.ToDecimal(lblEpfWage.Text);

                Label lblEsiWage = DgPayroll.Rows[i].FindControl("lblEsiWage") as Label;
                ESI += Convert.ToDecimal(lblEsiWage.Text);

                Label lblBasicDA = DgPayroll.Rows[i].FindControl("lblBasicDA") as Label;
                BasicDA += Convert.ToDecimal(lblBasicDA.Text);

                Label lblTotWage = DgPayroll.Rows[i].FindControl("lblTotWage") as Label;
                TotWage += Convert.ToDecimal(lblTotWage.Text);

                Label lblEarnGross = DgPayroll.Rows[i].FindControl("lblEarnGross") as Label;
                TotGross += Convert.ToDecimal(lblEarnGross.Text);

                Label lblHRA = DgPayroll.Rows[i].FindControl("lblHRA") as Label;
                HRA += Convert.ToDecimal(lblHRA.Text);

                Label lblConvey = DgPayroll.Rows[i].FindControl("lblConvey") as Label;
                Convey += Convert.ToDecimal(lblConvey.Text);

                Label lblWashing = DgPayroll.Rows[i].FindControl("lblWashing") as Label;
                Wasing += Convert.ToDecimal(lblWashing.Text);

                Label lblA1 = DgPayroll.Rows[i].FindControl("lblA1") as Label;
                A1 += Convert.ToDecimal(lblA1.Text);

                Label lblA2 = DgPayroll.Rows[i].FindControl("lblA2") as Label;
                A2 += Convert.ToDecimal(lblA2.Text);

                Label lblA3 = DgPayroll.Rows[i].FindControl("lblA3") as Label;
                A3 += Convert.ToDecimal(lblA3.Text);

                Label lblA4 = DgPayroll.Rows[i].FindControl("lblA4") as Label;
                A4 += Convert.ToDecimal(lblA4.Text);

                Label lblA5 = DgPayroll.Rows[i].FindControl("lblA5") as Label;
                A5 += Convert.ToDecimal(lblA5.Text);

                Label lblA6 = DgPayroll.Rows[i].FindControl("lblA6") as Label;
                A6 += Convert.ToDecimal(lblA6.Text);

                Label lblA7 = DgPayroll.Rows[i].FindControl("lblA7") as Label;
                A7 += Convert.ToDecimal(lblA7.Text);

                Label lblA8 = DgPayroll.Rows[i].FindControl("lblA8") as Label;
                A8 += Convert.ToDecimal(lblA8.Text);

                Label lblA9 = DgPayroll.Rows[i].FindControl("lblA9") as Label;
                A9 += Convert.ToDecimal(lblA9.Text);

                Label lblEarnExtra = DgPayroll.Rows[i].FindControl("lblEarnExtra") as Label;
                TOtOtWage += Convert.ToDecimal(lblEarnExtra.Text);

                Label lblETAmount1 = DgPayroll.Rows[i].FindControl("lblETAmount1") as Label;
                OtWage1 += Convert.ToDecimal(lblETAmount1.Text);

                Label lblETAmount2 = DgPayroll.Rows[i].FindControl("lblETAmount2") as Label;
                OtWage2 += Convert.ToDecimal(lblETAmount2.Text);

                Label lblETAmount3 = DgPayroll.Rows[i].FindControl("lblETAmount3") as Label;
                OtWage3 += Convert.ToDecimal(lblETAmount3.Text);

                Label lblEpf = DgPayroll.Rows[i].FindControl("lblEpf") as Label;
                DEPF += Convert.ToDecimal(lblEpf.Text);


                Label lblEsi = DgPayroll.Rows[i].FindControl("lblEsi") as Label;
                DESI += Convert.ToDecimal(lblEsi.Text);

                Label lblAdvance = DgPayroll.Rows[i].FindControl("lblAdvance") as Label;
                Advance += Convert.ToDecimal(lblAdvance.Text);

                Label lblD1 = DgPayroll.Rows[i].FindControl("lblD1") as Label;
                D1 += Convert.ToDecimal(lblD1.Text);

                Label lblD2 = DgPayroll.Rows[i].FindControl("lblD2") as Label;
                D2 += Convert.ToDecimal(lblD2.Text);

                Label lblD3 = DgPayroll.Rows[i].FindControl("lblD3") as Label;
                D3 += Convert.ToDecimal(lblD3.Text);

                Label lblD4 = DgPayroll.Rows[i].FindControl("lblD4") as Label;
                D4 += Convert.ToDecimal(lblD4.Text);

                Label lblD5 = DgPayroll.Rows[i].FindControl("lblD5") as Label;
                D5 += Convert.ToDecimal(lblD5.Text);

                Label lblD6 = DgPayroll.Rows[i].FindControl("lblD6") as Label;
                D6 += Convert.ToDecimal(lblD6.Text);

                Label lblD7 = DgPayroll.Rows[i].FindControl("lblD7") as Label;
                D7 += Convert.ToDecimal(lblD7.Text);

                Label lblD8 = DgPayroll.Rows[i].FindControl("lblD8") as Label;
                D8 += Convert.ToDecimal(lblD8.Text);

                Label lblTotDeduction = DgPayroll.Rows[i].FindControl("lblTotDeduction") as Label;
                TotDeduction += Convert.ToDecimal(lblTotDeduction.Text);


                Label lblWrkDay = DgPayroll.Rows[i].FindControl("lblWrkDay") as Label;
                TotalWork += Convert.ToDecimal(lblWrkDay.Text);

                Label lblOT1 = DgPayroll.Rows[i].FindControl("lblOT1") as Label;
                TotalOT1 += Convert.ToDecimal(lblOT1.Text);

                Label lblOT2 = DgPayroll.Rows[i].FindControl("lblOT2") as Label;
                TotalOT2 += Convert.ToDecimal(lblOT2.Text);

                Label lblOT3 = DgPayroll.Rows[i].FindControl("lblOT3") as Label;
                TotalOT2 += Convert.ToDecimal(lblOT3.Text);

                //= 0, = 0,

            }

            Label lblTotOT1 = DgPayroll.FooterRow.FindControl("lblTotOT1") as Label;
            lblTotOT1.Text = TotalOT1.ToString();

            Label lblTotOT2 = DgPayroll.FooterRow.FindControl("lblTotOT2") as Label;
            lblTotOT2.Text = TotalOT2.ToString();

            Label lblTotOT3 = DgPayroll.FooterRow.FindControl("lblTotOT3") as Label;
            lblTotOT3.Text = TotalOT3.ToString();


            Label lblTotWrkDay = DgPayroll.FooterRow.FindControl("lblTotWrkDay") as Label;
            lblTotWrkDay.Text = TotalWork.ToString();

            Label lblOvTotDeduction = DgPayroll.FooterRow.FindControl("lblOvTotDeduction") as Label;
            lblOvTotDeduction.Text = TotDeduction.ToString();

            Label lblTotD8 = DgPayroll.FooterRow.FindControl("lblTotD8") as Label;
            lblTotD8.Text = D8.ToString();

            Label lblTotD7 = DgPayroll.FooterRow.FindControl("lblTotD7") as Label;
            lblTotD7.Text = D7.ToString();

            Label lblTotD6 = DgPayroll.FooterRow.FindControl("lblTotD6") as Label;
            lblTotD6.Text = D6.ToString();

            Label lblTotD5 = DgPayroll.FooterRow.FindControl("lblTotD5") as Label;
            lblTotD5.Text = D5.ToString();

            Label lblTotD4 = DgPayroll.FooterRow.FindControl("lblTotD4") as Label;
            lblTotD4.Text = D4.ToString();

            Label lblTotD3 = DgPayroll.FooterRow.FindControl("lblTotD3") as Label;
            lblTotD3.Text = D3.ToString();

            Label lblTotD2 = DgPayroll.FooterRow.FindControl("lblTotD2") as Label;
            lblTotD2.Text = D2.ToString();

            Label lblTotD1 = DgPayroll.FooterRow.FindControl("lblTotD1") as Label;
            lblTotD1.Text = D1.ToString();

            Label lblTotAdvance = DgPayroll.FooterRow.FindControl("lblTotAdvance") as Label;
            lblTotAdvance.Text = Advance.ToString();

            Label lblTotEsi = DgPayroll.FooterRow.FindControl("lblTotEsi") as Label;
            lblTotEsi.Text = DESI.ToString();

            Label lblTotEpf = DgPayroll.FooterRow.FindControl("lblTotEpf") as Label;
            lblTotEpf.Text = DEPF.ToString();

            Label lblTotEarnExtra = DgPayroll.FooterRow.FindControl("lblTotEarnExtra") as Label;
            lblTotEarnExtra.Text = TOtOtWage.ToString();

            Label lblTotETAmount1 = DgPayroll.FooterRow.FindControl("lblTotETAmount1") as Label;
            lblTotETAmount1.Text = OtWage1.ToString();

            Label lblTotETAmount2 = DgPayroll.FooterRow.FindControl("lblTotETAmount2") as Label;
            lblTotETAmount2.Text = OtWage2.ToString();

            Label lblTotETAmount3 = DgPayroll.FooterRow.FindControl("lblTotETAmount3") as Label;
            lblTotETAmount3.Text = OtWage3.ToString();

            Label lblTotA1 = DgPayroll.FooterRow.FindControl("lblTotA1") as Label;
            lblTotA1.Text = A1.ToString();

            Label lblTotA2 = DgPayroll.FooterRow.FindControl("lblTotA2") as Label;
            lblTotA2.Text = A2.ToString();

            Label lblTotA3 = DgPayroll.FooterRow.FindControl("lblTotA3") as Label;
            lblTotA3.Text = A3.ToString();

            Label lblTotA4 = DgPayroll.FooterRow.FindControl("lblTotA4") as Label;
            lblTotA4.Text = A4.ToString();

            Label lblTotA5 = DgPayroll.FooterRow.FindControl("lblTotA5") as Label;
            lblTotA5.Text = A5.ToString();

            Label lblTotA6 = DgPayroll.FooterRow.FindControl("lblTotA6") as Label;
            lblTotA6.Text = A6.ToString();

            Label lblTotA7 = DgPayroll.FooterRow.FindControl("lblTotA7") as Label;
            lblTotA7.Text = A7.ToString();

            Label lblTotA8 = DgPayroll.FooterRow.FindControl("lblTotA8") as Label;
            lblTotA8.Text = A8.ToString();

            Label lblTotA9 = DgPayroll.FooterRow.FindControl("lblTotA9") as Label;
            lblTotA9.Text = A9.ToString();


            Label lblTotWashing = DgPayroll.FooterRow.FindControl("lblTotWashing") as Label;
            lblTotWashing.Text = Wasing.ToString();

            Label lblTotConvey = DgPayroll.FooterRow.FindControl("lblTotConvey") as Label;
            lblTotConvey.Text = Convey.ToString();

            Label lblTotHRA = DgPayroll.FooterRow.FindControl("lblTotHRA") as Label;
            lblTotHRA.Text = HRA.ToString();

            Label lblTotNetwage = DgPayroll.FooterRow.FindControl("lblTotNetwage") as Label;
            lblTotNetwage.Text = EndTot.ToString();

            Label lblTotEpfWage = DgPayroll.FooterRow.FindControl("lblTotEpfWage") as Label;
            lblTotEpfWage.Text = EPF.ToString();

            Label lblTotEsiWage = DgPayroll.FooterRow.FindControl("lblTotEsiWage") as Label;
            lblTotEsiWage.Text = ESI.ToString();

            Label lblTotBasicDA = DgPayroll.FooterRow.FindControl("lblTotBasicDA") as Label;
            lblTotBasicDA.Text = BasicDA.ToString();

            Label lblFootTotWage = DgPayroll.FooterRow.FindControl("lblFootTotWage") as Label;
            lblFootTotWage.Text = TotWage.ToString();

            Label lblTotEarnGross = DgPayroll.FooterRow.FindControl("lblTotEarnGross") as Label;
            lblTotEarnGross.Text = TotGross.ToString();

            txttotalgrossamount.Text = TotGross.ToString("#####.00");
            txttotalnetamount.Text = EndTot.ToString("#####.00");

            //txtgrosswages.Text = lblTotEarnGross.Text;
        }
    }




    private void CalculationForPayroll(int i, DataTable dt)
    {
        decimal AcWrkDays = 0, WrkDays = 0, Epfcal = 0, basic = 0, HRA = 0, Conveyance = 0, Washing = 0, Roomrent = 0,
            Insurance = 0, Others = 0, Totalworkdays = 0, Esical = 0, Othededuct = 0, Netwage = 0, EPFWAGE = 0;

        decimal TotalGross = 0, TotalNet = 0;

        if (txttotaldays.Text == "")
        {
            txtnoofworkingdays.Text = "0";
        }
        Totalworkdays = Convert.ToDecimal(txtnoofworkingdays.Text);

        Label BasicDA = DgPayroll.Rows[i].FindControl("lblBasicDA") as Label;
        Label Workday = DgPayroll.Rows[i].FindControl("lblWrkDay") as Label;
        Label HRAAmount = DgPayroll.Rows[i].FindControl("lblHRA") as Label;
        Label Convey = DgPayroll.Rows[i].FindControl("lblConvey") as Label;
        Label Wash = DgPayroll.Rows[i].FindControl("lblWashing") as Label;

        //Label RmRent = DgPayroll.Rows[i].FindControl("lblRmRent") as Label;
        //Label Insur = DgPayroll.Rows[i].FindControl("lblInsurance") as Label;
        //Label Other = DgPayroll.Rows[i].FindControl("lblOther") as Label;

        Label lblA1 = DgPayroll.Rows[i].FindControl("lblA1") as Label;
        Label lblA2 = DgPayroll.Rows[i].FindControl("lblA2") as Label;
        Label lblA3 = DgPayroll.Rows[i].FindControl("lblA3") as Label;
        Label lblA4 = DgPayroll.Rows[i].FindControl("lblA4") as Label;
        Label lblA5 = DgPayroll.Rows[i].FindControl("lblA5") as Label;
        Label lblA6 = DgPayroll.Rows[i].FindControl("lblA6") as Label;
        Label lblA7 = DgPayroll.Rows[i].FindControl("lblA7") as Label;
        Label lblA8 = DgPayroll.Rows[i].FindControl("lblA8") as Label;
        Label lblA9 = DgPayroll.Rows[i].FindControl("lblA9") as Label;



        Label lblD1 = DgPayroll.Rows[i].FindControl("lblD1") as Label;
        Label lblD2 = DgPayroll.Rows[i].FindControl("lblD2") as Label;
        Label lblD3 = DgPayroll.Rows[i].FindControl("lblD3") as Label;
        Label lblD4 = DgPayroll.Rows[i].FindControl("lblD4") as Label;
        Label lblD5 = DgPayroll.Rows[i].FindControl("lblD5") as Label;
        Label lblD6 = DgPayroll.Rows[i].FindControl("lblD6") as Label;
        Label lblD7 = DgPayroll.Rows[i].FindControl("lblD7") as Label;
        Label lblD8 = DgPayroll.Rows[i].FindControl("lblD8") as Label;

        Label lblSunDay = DgPayroll.Rows[i].FindControl("lblSunDay") as Label;

        // Wage Per Day
        Label lblwageType = DgPayroll.Rows[i].FindControl("lblwageType") as Label;
        Label lblwageday = DgPayroll.Rows[i].FindControl("lblwageday") as Label;
        if (lblwageType.Text == "Monthly")
        {
            decimal WageDay = Convert.ToDecimal(lblwageday.Text);
            WageDay = WageDay / Convert.ToDecimal(txtnoofworkingdays.Text);
            lblwageday.Text = WageDay.ToString("####.##");

            //Basic
            basic = Convert.ToDecimal(dt.Rows[i]["BASICDA"]);
            basic = basic / Totalworkdays;

            // HRA
            HRA = Convert.ToDecimal(dt.Rows[i]["HRA"]);
            HRA = HRA / Totalworkdays;

            // Conveyance 
            Conveyance = Convert.ToDecimal(dt.Rows[i]["CONVEYANCE"]);
            Conveyance = Conveyance / Totalworkdays;

            // Washing 
            Washing = Convert.ToDecimal(dt.Rows[i]["WASHING"]);
            Washing = Washing / Totalworkdays;
        }
        else
        {
            basic = Convert.ToDecimal(dt.Rows[i]["BASICDA"]);
            HRA = Convert.ToDecimal(dt.Rows[i]["HRA"]);
            Conveyance = Convert.ToDecimal(dt.Rows[i]["CONVEYANCE"]);
            Washing = Convert.ToDecimal(dt.Rows[i]["WASHING"]);
        }
       



        // Workdays

        WrkDays = Convert.ToDecimal(dt.Rows[i]["STATUS"]);
            //- Convert.ToDecimal(lblSunDay.Text);
        Workday.Text = WrkDays.ToString();
        //dt.Rows[i]["STATUS"] = WrkDays.ToString();
        

        // ActualWageDays
        AcWrkDays = Convert.ToDecimal(Workday.Text);

        // BasicDA  
        basic = basic * Convert.ToDecimal(AcWrkDays);
        BasicDA.Text= basic.ToString("####0.00");
        //dt.Rows[i]["BASICDA"] = basic.ToString("####0.00");

        // HRA
        
        HRA = HRA * Convert.ToDecimal(AcWrkDays);
        HRAAmount.Text= HRA.ToString("####0.00");
        //dt.Rows[i]["HRA"] = HRA.ToString("####0.00");

        // Conveyance
        
        Conveyance = Conveyance * Convert.ToDecimal(AcWrkDays);
        Convey.Text = Conveyance.ToString("####0.00");
        //dt.Rows[i]["CONVEYANCE"] = Conveyance.ToString("####0.00");

        // Washing
       
        Washing = Washing * Convert.ToDecimal(AcWrkDays);
        Wash.Text= Washing.ToString("####0.00");
        //dt.Rows[i]["WASHING"] = Washing.ToString("####0.00");

        // Roomrent
        //Roomrent = Convert.ToDecimal(dt.Rows[i]["A1"]);
        //Roomrent = Roomrent / Totalworkdays;
        //Roomrent = Roomrent * Convert.ToDecimal(AcWrkDays);
        //dt.Rows[i]["A1"] = Roomrent.ToString("####0.00");

        // Insurance
        //Insurance = Convert.ToDecimal(dt.Rows[i]["A2"]);
        //Insurance = Insurance / Totalworkdays;
        //Insurance = Insurance * Convert.ToDecimal(AcWrkDays);
        //dt.Rows[i]["A2"] = Insurance.ToString("####0.00");

        // other
        //Others = Convert.ToDecimal(dt.Rows[i]["A3"]);
        //Others = Others / Totalworkdays;
        //Others = Others * Convert.ToDecimal(AcWrkDays);
        //dt.Rows[i]["A2"] = Others.ToString("####0.00");

        lblA1.Text = dt.Rows[i]["A1"].ToString();
        lblA2.Text = dt.Rows[i]["A2"].ToString();
        lblA3.Text = dt.Rows[i]["A3"].ToString();
        lblA4.Text = dt.Rows[i]["A4"].ToString();
        lblA5.Text = dt.Rows[i]["A5"].ToString();
        lblA6.Text = dt.Rows[i]["A6"].ToString();
        lblA7.Text = dt.Rows[i]["A7"].ToString();
        lblA8.Text = dt.Rows[i]["A8"].ToString();
        lblA9.Text = dt.Rows[i]["A9"].ToString();

        // TotalWage
        Label lblTotWage = DgPayroll.Rows[i].FindControl("lblTotWage") as Label;
        lblTotWage.Text = (basic + HRA + Conveyance + Washing + Convert.ToDecimal(lblA1.Text)
            + Convert.ToDecimal(lblA2.Text) + Convert.ToDecimal(lblA3.Text) + Convert.ToDecimal(lblA4.Text) + Convert.ToDecimal(lblA5.Text)
            + Convert.ToDecimal(lblA6.Text) + Convert.ToDecimal(lblA7.Text) + Convert.ToDecimal(lblA8.Text) + Convert.ToDecimal(lblA9.Text)).ToString("####.00");

        /// OT Wage
        Label lblEarnExtra = DgPayroll.Rows[i].FindControl("lblEarnExtra") as Label;
        Label lblOT1 = DgPayroll.Rows[i].FindControl("lblOT1") as Label;
        Label lblOT2 = DgPayroll.Rows[i].FindControl("lblOT2") as Label;
        Label lblOT3 = DgPayroll.Rows[i].FindControl("lblOT3") as Label;

        lblOT1.Text = dt.Rows[i]["OT1"].ToString();
        lblOT2.Text = dt.Rows[i]["OT2"].ToString();
        lblOT3.Text = dt.Rows[i]["OT3"].ToString();


        decimal OTAmount = Convert.ToDecimal(lblwageday.Text) / 8;
        decimal OTAmount2 = Convert.ToDecimal(lblwageday.Text) / 8;
        decimal OTAmount3;
        //Label lblOTper = DgPayroll.Rows[i].FindControl("lblOTper") as Label;

        decimal OTVal1 = Convert.ToDecimal(dt.Rows[i]["OTAMOUNT"]) / 100;
        OTAmount = OTAmount * OTVal1;

        decimal OTVal2 = Convert.ToDecimal(dt.Rows[i]["OTAMOUNT2"]) / 100;
        OTAmount2 = OTAmount2 * OTVal2;

        decimal OTVal3 = Convert.ToDecimal(dt.Rows[i]["OTAMOUNT3"]);
        OTAmount3 = OTVal3;

        OTAmount = Convert.ToDecimal(dt.Rows[i]["OT1"]) * OTAmount;
        OTAmount2 = Convert.ToDecimal(dt.Rows[i]["OT2"]) * OTAmount2;
        OTAmount3 = Convert.ToDecimal(dt.Rows[i]["OT3"]) * OTAmount3;

        Label lblETAmount1 = DgPayroll.Rows[i].FindControl("lblETAmount1") as Label;
        Label lblETAmount2 = DgPayroll.Rows[i].FindControl("lblETAmount2") as Label;
        Label lblETAmount3 = DgPayroll.Rows[i].FindControl("lblETAmount3") as Label;

        lblETAmount1.Text= OTAmount.ToString("###0.0#");
        lblETAmount2.Text = OTAmount2.ToString("###0.0#");
        lblETAmount3.Text = OTAmount3.ToString("###0.0#");

        lblEarnExtra.Text = (OTAmount + OTAmount2 + OTAmount3).ToString("###0.0#");


        //TotalGross
        decimal Gross = 0;
        Label lblEarnGross = DgPayroll.Rows[i].FindControl("lblEarnGross") as Label;
        Gross = Convert.ToDecimal(lblTotWage.Text) + Convert.ToDecimal(lblEarnExtra.Text);
        lblEarnGross.Text = Gross.ToString("####0.0#");

        // PF Wage
        Label lblEpfWage = DgPayroll.Rows[i].FindControl("lblEpfWage") as Label;
        

        if (ddlpflimit.SelectedValue == "No")
        {
            Label lblepfwageday = DgPayroll.Rows[i].FindControl("lblepfwageday") as Label;
            decimal PfWage = Convert.ToDecimal(dt.Rows[i]["BASICDA"]) / Convert.ToDecimal(txtnoofworkingdays.Text);
            lblepfwageday.Text = PfWage.ToString("###0.00");

            if (Convert.ToDecimal(BasicDA.Text) <= 15000)
            {
                lblEpfWage.Text = BasicDA.Text;
            }
            else
            {
                EPFWAGE = 15000 / Totalworkdays;
                EPFWAGE = EPFWAGE * WrkDays;
                lblEpfWage.Text = EPFWAGE.ToString("###0.##");


            }

        }
        else
        {
            Label lblepfwageday = DgPayroll.Rows[i].FindControl("lblepfwageday") as Label;
           

            if (Convert.ToDecimal(dt.Rows[i]["WAGEPERDAY"]) <= 15000)
            {
                decimal PfWage = Convert.ToDecimal(dt.Rows[i]["WAGEPERDAY"]) / Convert.ToDecimal(txtnoofworkingdays.Text);
                lblepfwageday.Text = PfWage.ToString("###0.00");
                decimal PFlimt = 0;
                PFlimt = Convert.ToDecimal(lblwageday.Text) * Convert.ToDecimal(WrkDays);
                //PFlimt = PFlimt / Totalworkdays;
                lblEpfWage.Text = PFlimt.ToString("####0");

            }
            else
            {
                decimal PfWage = Convert.ToDecimal(15000) / Convert.ToDecimal(txtnoofworkingdays.Text);
                lblepfwageday.Text = PfWage.ToString("###0.00");
                EPFWAGE = 15000 / Totalworkdays;
                EPFWAGE = EPFWAGE * WrkDays;
                lblEpfWage.Text = EPFWAGE.ToString("###0.##");
            }

        }


        // PF
        Label EPF = DgPayroll.Rows[i].FindControl("lblEpf") as Label;
        Epfcal = Convert.ToDecimal(dt.Rows[i]["PFEMPLOYEESEPF"]);
        Epfcal = Convert.ToDecimal(lblEpfWage.Text) / 100 * Epfcal;
        //basic = basic / 100;
        //Epfcal = basic * Epfcal;   
        EPF.Text = Epfcal.ToString("####0");




        //ESI Wage
        decimal ESIWage = 0;
        Label lblEsiWage = DgPayroll.Rows[i].FindControl("lblEsiWage") as Label;
        DataTable dtAdvance = new DataTable();
        dtAdvance = ObjectBA.SelectAllowanceDescriptionID(ddlcompanyname.SelectedValue);
        if (dtAdvance.Rows.Count > 0)
        {
            for (int k = 0; k < dtAdvance.Rows.Count; k++)
            {
                if (dtAdvance.Rows[k]["TYPE"].ToString() == "Yes")
                {
                    ESIWage += Convert.ToDecimal(dt.Rows[i][dtAdvance.Rows[k]["ALLDESCODE"].ToString()]);
                }
                
            }
        }

        lblEsiWage.Text = (ESIWage + basic + HRA + Conveyance + Washing + OTAmount + OTAmount2 + OTAmount3).ToString("####0.00");

        // ESI
        String Round = "";
        Label ESI = DgPayroll.Rows[i].FindControl("lblEsi") as Label;
        Esical = Convert.ToDecimal(dt.Rows[i]["ESIEMPLOYEES"]);
        Esical = Convert.ToDecimal(lblEsiWage.Text) / 100 * Esical;
        Round = Esical.ToString("####0.00");
        try
        {

            string[] bb = Round.Split('.');
            int m = int.Parse(bb[1]);
            int m1 = int.Parse(bb[0]);

            if ((m >= 10))
            {
                ESI.Text = (m1 + 1).ToString();
            }
            else
            {
                ESI.Text= (m1).ToString();
            }
        }
        catch
        {

        }
        

        lblD1.Text = dt.Rows[i]["D1"].ToString();
        lblD2.Text = dt.Rows[i]["D2"].ToString();
        lblD3.Text = dt.Rows[i]["D3"].ToString();
        lblD4.Text = dt.Rows[i]["D4"].ToString();
        lblD5.Text = dt.Rows[i]["D5"].ToString();
        lblD6.Text = dt.Rows[i]["D6"].ToString();
        lblD7.Text = dt.Rows[i]["D7"].ToString();
        lblD8.Text = dt.Rows[i]["D8"].ToString();

        // Netwages
        Label lblAdvance = DgPayroll.Rows[i].FindControl("lblAdvance") as Label;
        Othededuct = Convert.ToDecimal(EPF.Text) + Convert.ToDecimal(ESI.Text) + Convert.ToDecimal(lblAdvance.Text) +
             Convert.ToDecimal(lblD1.Text) +
            Convert.ToDecimal(lblD2.Text) + Convert.ToDecimal(lblD3.Text)
            + Convert.ToDecimal(lblD4.Text) + Convert.ToDecimal(lblD5.Text)
            + Convert.ToDecimal(lblD6.Text) + Convert.ToDecimal(lblD7.Text) + Convert.ToDecimal(lblD8.Text);

        Label lblTotDeduction = DgPayroll.Rows[i].FindControl("lblTotDeduction") as Label;
        lblTotDeduction.Text = Othededuct.ToString("####0.00");

        Netwage = Convert.ToDecimal(lblEarnGross.Text) - Othededuct;

        Label lblNetwage = DgPayroll.Rows[i].FindControl("lblNetwage") as Label;

        lblNetwage.Text = Netwage.ToString("####0.00");

        //TotalClaculationWage(i);

        //Label lblTotWage = DgPayroll.Rows[i].FindControl("lblEarnGross") as Label;
        //Label lblNetwage = DgPayroll.Rows[i].FindControl("lblNetwage") as Label;


        //TotalGross += Convert.ToDecimal(lblTotWage.Text);
        //TotalNet += Convert.ToDecimal(lblNetwage.Text);

        //txttotalgrossamount.Text = TotalGross.ToString("#####.00");
        //txttotalnetamount.Text = TotalNet.ToString("#####.00");
        //DgPayroll.DataBind();

    }

    private void TotalClaculationWage(int i)
    {
        Label lblTotWage = DgPayroll.Rows[i].FindControl("lblEarnGross") as Label;
        Label lblNetwage = DgPayroll.Rows[i].FindControl("lblNetwage") as Label;
        decimal TotalGross, TotalNet = 0;

        TotalGross =+ Convert.ToDecimal(lblTotWage.Text);
        TotalNet = +Convert.ToDecimal(lblNetwage.Text);

        txttotalgrossamount.Text = TotalGross.ToString("#####.00");
        txttotalnetamount.Text = TotalNet.ToString("#####.00");
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (ddlGenarate.SelectedValue == "C")
        {
            CheckExisting();
            ObjectBA.InsertMonthlyPayrollHdr(txtfromdate.Text, txttodate.Text, txttotaldays.Text, 
                ddlcompanyname.SelectedValue, txtnoofemployees.Text, txttotalgrossamount.Text, txttotalnetamount.Text, 
                ddlpflimit.Text, txtnoofworkingdays.Text);
            if (DgPayroll.Rows.Count > 0)
            {
                SelectMonthlyPayrollHdrID();
            }
            Clearnew();
            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        }
        else
        {
            CheckExistingForRepotJ();
            ObjectBA.InsertMonthlyPayrollHdrForReportJ(txtfromdate.Text, txttodate.Text, txttotaldays.Text,
                ddlcompanyname.SelectedValue, txtnoofemployees.Text, txttotalgrossamount.Text, txttotalnetamount.Text,
                ddlpflimit.Text, txtnoofworkingdays.Text);
            if (DgPayroll.Rows.Count > 0)
            {
                SelectMonthlyPayrollHdrIDForReportJ();
            }
        }


        //MessageBox2.ForeColor = System.Drawing.Color.Green;
        //MessageBox2.Visible = true;
        //MessageBox2.Text = "Data Save";
        
    }

    private void SelectMonthlyPayrollHdrIDForReportJ()
    {
        dt = new DataTable();
        dt = ObjectBA.MonthlyPayrollHdrForReportJIDSelect();
        if (dt.Rows.Count > 0)
        {
            string PAYROOLID = dt.Rows[0]["PAYROOLID"].ToString();
            InsertPayrollDetail(PAYROOLID);
        }
        con.Close();
    }

    private void CheckExistingForRepotJ()
    {
        ObjectBA.DeleteMonthlyPayrollDtlForReportJ(txtfromdate.Text, txttodate.Text, ddlcompanyname.SelectedValue);
        ObjectBA.DeleteMonthlyPayrollHdrForReportJ(txtfromdate.Text, txttodate.Text, ddlcompanyname.SelectedValue);
    }

    private void CheckExisting()
    {
        ObjectBA.DeleteMonthlyPayrollDtl(txtfromdate.Text, txttodate.Text, ddlcompanyname.SelectedValue);
        ObjectBA.DeleteMonthlyPayrollHdr(txtfromdate.Text, txttodate.Text, ddlcompanyname.SelectedValue);
    }

    private void SelectMonthlyPayrollHdrID()
    {
//        con.Close();
//        con.Open();
//        string PyrollID = @"SELECT        MAX(PAYROOLID) AS PAYROOLID
//FROM            MonthlyPayrollHdr";
//        da = new SqlDataAdapter(PyrollID, con);
        dt = new DataTable();
        dt = ObjectBA.MonthlyPayrollIDSelect();
        if (dt.Rows.Count > 0)
        {
            string PAYROOLID = dt.Rows[0]["PAYROOLID"].ToString();
            InsertPayrollDetail(PAYROOLID);
        }
        con.Close();
    }

    private void InsertPayrollDetail(string PAYROOLID)
    {
        for (int i = 0; i < DgPayroll.Rows.Count; i++)
        {
            Label EmpID = DgPayroll.Rows[i].FindControl("lblEmpID") as Label;
            Label EmpCode = DgPayroll.Rows[i].FindControl("lblEmpCode") as Label;
            Label EmpDptID = DgPayroll.Rows[i].FindControl("lblDptId") as Label;
            Label EmpDesgID = DgPayroll.Rows[i].FindControl("lblDesgID") as Label;

            Label lblwageType = DgPayroll.Rows[i].FindControl("lblwageType") as Label;
            Label lblGrade = DgPayroll.Rows[i].FindControl("lblGrade") as Label;
            Label lblwageday = DgPayroll.Rows[i].FindControl("lblwageday") as Label;
            Label lblepfwageday = DgPayroll.Rows[i].FindControl("lblepfwageday") as Label;

            Label EmpWrkDay = DgPayroll.Rows[i].FindControl("lblWrkDay") as Label;

            Label lblOT1 = DgPayroll.Rows[i].FindControl("lblOT1") as Label;
            Label lblOT2 = DgPayroll.Rows[i].FindControl("lblOT2") as Label;
            Label lblOT3 = DgPayroll.Rows[i].FindControl("lblOT3") as Label;

            Label BasicDA = DgPayroll.Rows[i].FindControl("lblBasicDA") as Label;
            Label HRAAmount = DgPayroll.Rows[i].FindControl("lblHRA") as Label;
            Label Convey = DgPayroll.Rows[i].FindControl("lblConvey") as Label;
            Label Wash = DgPayroll.Rows[i].FindControl("lblWashing") as Label;



            Label lblA1 = DgPayroll.Rows[i].FindControl("lblA1") as Label;
            Label lblA2 = DgPayroll.Rows[i].FindControl("lblA2") as Label;
            Label lblA3 = DgPayroll.Rows[i].FindControl("lblA3") as Label;
            Label lblA4 = DgPayroll.Rows[i].FindControl("lblA4") as Label;
            Label lblA5 = DgPayroll.Rows[i].FindControl("lblA5") as Label;
            Label lblA6 = DgPayroll.Rows[i].FindControl("lblA6") as Label;
            Label lblA7 = DgPayroll.Rows[i].FindControl("lblA7") as Label;
            Label lblA8 = DgPayroll.Rows[i].FindControl("lblA8") as Label;
            Label lblA9 = DgPayroll.Rows[i].FindControl("lblA9") as Label;


            Label TotalWage = DgPayroll.Rows[i].FindControl("lblTotWage") as Label;

            Label lblETAmount1 = DgPayroll.Rows[i].FindControl("lblETAmount1") as Label;
            Label lblETAmount2 = DgPayroll.Rows[i].FindControl("lblETAmount2") as Label;
            Label lblETAmount3 = DgPayroll.Rows[i].FindControl("lblETAmount3") as Label;

            Label lblEarnExtra = DgPayroll.Rows[i].FindControl("lblEarnExtra") as Label;
            Label lblEarnGross = DgPayroll.Rows[i].FindControl("lblEarnGross") as Label;

            Label lblEpfWage = DgPayroll.Rows[i].FindControl("lblEpfWage") as Label;
            Label lblEsiWage = DgPayroll.Rows[i].FindControl("lblEsiWage") as Label;
            Label Epf = DgPayroll.Rows[i].FindControl("lblEpf") as Label;
            Label Esi = DgPayroll.Rows[i].FindControl("lblEsi") as Label;


            Label lblAdvance = DgPayroll.Rows[i].FindControl("lblAdvance") as Label;


            Label lblD1 = DgPayroll.Rows[i].FindControl("lblD1") as Label;
            Label lblD2 = DgPayroll.Rows[i].FindControl("lblD2") as Label;
            Label lblD3 = DgPayroll.Rows[i].FindControl("lblD3") as Label;
            Label lblD4 = DgPayroll.Rows[i].FindControl("lblD4") as Label;
            Label lblD5 = DgPayroll.Rows[i].FindControl("lblD5") as Label;
            Label lblD6 = DgPayroll.Rows[i].FindControl("lblD6") as Label;
            Label lblD7 = DgPayroll.Rows[i].FindControl("lblD7") as Label;
            Label lblD8 = DgPayroll.Rows[i].FindControl("lblD8") as Label;

            Label lblTotDeduction = DgPayroll.Rows[i].FindControl("lblTotDeduction") as Label;
            Label Netwage = DgPayroll.Rows[i].FindControl("lblNetwage") as Label;

            if (ddlGenarate.SelectedValue == "C")
            {
                ObjectBA.InsertMonthlyPayrollDtl(PAYROOLID, EmpID.Text, EmpCode.Text, EmpDptID.Text, EmpDesgID.Text, lblwageType.Text, lblGrade.Text, lblwageday.Text, lblepfwageday.Text,
                EmpWrkDay.Text, lblOT1.Text, lblOT2.Text, lblOT3.Text, BasicDA.Text, HRAAmount.Text, Convey.Text, Wash.Text,
                lblA1.Text, lblA2.Text, lblA3.Text, lblA4.Text, lblA5.Text, lblA6.Text, lblA7.Text, lblA8.Text, lblA9.Text,
                TotalWage.Text, lblETAmount1.Text, lblETAmount2.Text, lblETAmount3.Text, lblEarnExtra.Text, lblEarnGross.Text,
                lblEpfWage.Text, Epf.Text, lblEsiWage.Text, Esi.Text, lblAdvance.Text, lblD1.Text, lblD2.Text, lblD3.Text, lblD4.Text,
               lblD5.Text, lblD6.Text, lblD7.Text, lblD8.Text, lblTotDeduction.Text, Netwage.Text);
            }
            else
            {
                ObjectBA.InsertMonthlyPayrollDtlForReportJ(PAYROOLID, EmpID.Text, EmpCode.Text, EmpDptID.Text, EmpDesgID.Text, lblwageType.Text, lblGrade.Text, lblwageday.Text, lblepfwageday.Text,
                EmpWrkDay.Text, lblOT1.Text, lblOT2.Text, lblOT3.Text, BasicDA.Text, HRAAmount.Text, Convey.Text, Wash.Text,
                lblA1.Text, lblA2.Text, lblA3.Text, lblA4.Text, lblA5.Text, lblA6.Text, lblA7.Text, lblA8.Text, lblA9.Text,
                TotalWage.Text, lblETAmount1.Text, lblETAmount2.Text, lblETAmount3.Text, lblEarnExtra.Text, lblEarnGross.Text,
                lblEpfWage.Text, Epf.Text, lblEsiWage.Text, Esi.Text, lblAdvance.Text, lblD1.Text, lblD2.Text, lblD3.Text, lblD4.Text,
               lblD5.Text, lblD6.Text, lblD7.Text, lblD8.Text, lblTotDeduction.Text, Netwage.Text);
            }

            
        }
    }
    
    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();

    }

    public void Clearnew()
    {
        ddlcompanyname.Items.Clear();
        ddlcompanyname.Items.Add("------- Select Client -------");
        txtfromdate.Text = "";
        txttodate.Text = "";
        txtdivisionname.Text = "";
        txttotaldays.Text = "";
        DgPayroll.DataSource = null;
        DgPayroll.DataBind();
        txtnoofworkingdays.Text = "";
        txtnoofemployees.Text = "";
        txttotalgrossamount.Text = "";
        txttotalnetamount.Text = "";
        btnclose.Text = "Save";
    }

    protected void ddlcompanyname_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = ObjectBA.SelectClientDetailID(ddlcompanyname.SelectedValue);
        txtdivisionname.Text = dt.Rows[0]["DIVISION"].ToString();
    }
}