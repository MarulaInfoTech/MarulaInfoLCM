using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Data.Sql;

public partial class PayrollForms_PgReport_cAttendanceBreakUp : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();

    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();

    public string Errors = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TypeId.Text = "0";
            ddlcompanynameLoad();
        }
    }

    private void ddlcompanynameLoad()
    {
        ddlcompanyname.Items.Clear();
        ddlcompanyname.Items.Add("---Select Client Name---");
        ddlcompanyname.DataSource = ObjectBA.SelectClinet();
        ddlcompanyname.DataValueField = "CLIENTID";
        ddlcompanyname.DataTextField = "CLIENTNAME";
        ddlcompanyname.DataBind();
    }

    protected void ddlcompanyname_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = ObjectBA.SelectClientDetailID(ddlcompanyname.SelectedValue);
        txtdivisionname.Text = dt.Rows[0]["DIVISION"].ToString();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        checkEx();
        if (Errors == "1")
        {

        }
        else
        {
            DataGridColumnText();
            DgMDBreakUp.DataSource = ObjectBA.ReportJforSelect(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlcompanyname.SelectedValue);
            DgMDBreakUp.DataBind();
        }
        
    }

    private void checkEx()
    {
        dt = new DataTable();
        dt = ObjectBA.SelectMDAndETBreakUp(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlcompanyname.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            DgMDBreakUp.DataSource = ObjectBA.SelectMDAndETBreakUp(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlcompanyname.SelectedValue);
            DgMDBreakUp.DataBind();
            Errors = "1";
        }
        else
        {
            Errors = "0";
        }
    }

    private void DataGridColumnText()
    {
        int DayCount = 0;
        DateTime Fromdate = Convert.ToDateTime(txtfromdate.Text);
        DateTime Todate = Convert.ToDateTime(txttodate.Text);
        DayCount = Convert.ToInt16((Todate - Fromdate).TotalDays);
        DayCount = DayCount + 1;
        //int dayscount = Fromdate.Day;
        if (DayCount <= 31)
        {
            for (int j = 0; DayCount > j; j++)
            {
                int dayscount = Fromdate.Day;
                DgMDBreakUp.Columns[j + 4].HeaderText = "DAY" + dayscount;
                Fromdate = Fromdate.AddDays(1);

            }
            DgMDBreakUp.DataBind();
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        btnClac_Click(sender, e);
        DeletCurrentAttendance();
        if (TypeId.Text == "0")
        {
            DgMDBreakUpDetailSave(sender);
            //AttendanceSave();
           
        }
    }

    private void DeletCurrentAttendance()
    {
        ObjectBA.DeleteMDAndETBreakUp(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), 
            Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlcompanyname.SelectedValue);
    }

    private void AttendanceSave()
    {
        for (int i = 0; i < DgMDBreakUp.Rows.Count; i++)
        {
            Label Code = DgMDBreakUp.Rows[i].FindControl("lblEMPLOYEECODE") as Label;

            dt = ObjectBA.SelectEmployeeCompanyDetailCheckExl(Convert.ToString(Convert.ToDouble(Code.Text).ToString("0####")), ddlcompanyname.SelectedValue);
            if (dt.Rows.Count > 0)
            {
                string workedhour = "";
                int DayCount = 0;
                DateTime Fromdate = Convert.ToDateTime(txtfromdate.Text);
                DateTime Todate = Convert.ToDateTime(txttodate.Text);
                DayCount = Convert.ToInt16((Todate - Fromdate).TotalDays);
                DayCount = DayCount + 1;

                for (int j = 0; j < DayCount; j++)
                {
                    int count = j + 1;
                    TextBox status = DgMDBreakUp.Rows[i].FindControl("txtDAY" + count) as TextBox;
                    TextBox OTStatus = DgMDBreakUp.Rows[i].FindControl("txtOT" + count) as TextBox;
                    if (status.Text.ToUpper() == "")
                    {
                        status.Text = DgMDBreakUp.Rows[i].Cells[count].Text;
                    }

                    if (status.Text.ToUpper() == "XX")
                    {
                        workedhour = "8";
                    }

                    else if (status.Text.ToUpper() == "XA")
                    {
                        workedhour = "4";
                    }

                    else if (status.Text.ToUpper() == "AX")
                    {
                        workedhour = "4";
                    }

                    else if (status.Text.ToUpper() == "AA")
                    {
                        workedhour = "0";
                    }

                    else if (status.Text.ToUpper() == "CL")
                    {
                        workedhour = "8";
                    }

                    else if (status.Text.ToUpper() == "EL")
                    {
                        workedhour = "8";
                    }

                    else if (status.Text.ToUpper() == "PH")
                    {
                        workedhour = "8";
                    }

                    else if (status.Text.ToUpper() == "WH")
                    {
                        workedhour = "0";
                    }

                    else if (status.Text.ToUpper() == "NH")
                    {
                        workedhour = "8";
                    }

                    else if (status.Text.ToUpper() == "COFF")
                    {
                        workedhour = "8";
                    }

                    else if (status.Text.ToUpper() == "LOP")
                    {
                        workedhour = "0";
                    }

                    else if (status.Text.ToUpper() == "SL")
                    {
                        workedhour = "8";
                    }
                    if (OTStatus.Text.Trim() == "")
                    {
                        OTStatus.Text = "0";
                    }
                    if (Convert.ToDateTime(dt.Rows[0]["DATEOFJOIN"]) <= Fromdate)
                    {
                        ObjectBA.InsertDailyAttendane(Fromdate.ToShortDateString(), ddlcompanyname.SelectedValue, txtdivisionname.Text, dt.Rows[0]["EMPLOYEEID"].ToString(),
                        dt.Rows[0]["EMPLOYEECODE"].ToString(), dt.Rows[0]["DEPARTMENTID"].ToString(), workedhour, "0",
    dt.Rows[0]["OTAMOUNT"].ToString(), dt.Rows[0]["BASICDA"].ToString(), dt.Rows[0]["HRA"].ToString(), dt.Rows[0]["CONVEYANCE"].ToString(),
    dt.Rows[0]["WASHING"].ToString(), dt.Rows[0]["OTHER"].ToString(), dt.Rows[0]["PFID"].ToString(), dt.Rows[0]["ESIID"].ToString(), "0", "0",
    OTStatus.Text, "0", "0", "0", status.Text.ToUpper(), dt.Rows[0]["OTAMOUNT2"].ToString(), dt.Rows[0]["OTAMOUNT3"].ToString());
                    }

                }

            }
        }
    }

    private void DgMDBreakUpDetailSave(object sender)
    {
        for (int i = 0; i < DgMDBreakUp.Rows.Count; i++)
        {
            Label lblEMPLOYEECODE = DgMDBreakUp.Rows[i].FindControl("lblEMPLOYEECODE") as Label;
            Label lblAPPLICATIONAME = DgMDBreakUp.Rows[i].FindControl("lblAPPLICATIONAME") as Label;
            Label lblDEPARTMENTID = DgMDBreakUp.Rows[i].FindControl("lblDEPARTMENTID") as Label;
            TextBox txtDAY1 = DgMDBreakUp.Rows[i].FindControl("txtDAY1") as TextBox;
            TextBox txtDAY2 = DgMDBreakUp.Rows[i].FindControl("txtDAY2") as TextBox;
            TextBox txtDAY3 = DgMDBreakUp.Rows[i].FindControl("txtDAY3") as TextBox;
            TextBox txtDAY4 = DgMDBreakUp.Rows[i].FindControl("txtDAY4") as TextBox;
            TextBox txtDAY5 = DgMDBreakUp.Rows[i].FindControl("txtDAY5") as TextBox;
            TextBox txtDAY6 = DgMDBreakUp.Rows[i].FindControl("txtDAY6") as TextBox;
            TextBox txtDAY7 = DgMDBreakUp.Rows[i].FindControl("txtDAY7") as TextBox;
            TextBox txtDAY8 = DgMDBreakUp.Rows[i].FindControl("txtDAY8") as TextBox;
            TextBox txtDAY9 = DgMDBreakUp.Rows[i].FindControl("txtDAY9") as TextBox;
            TextBox txtDAY10 = DgMDBreakUp.Rows[i].FindControl("txtDAY10") as TextBox;
            TextBox txtDAY11 = DgMDBreakUp.Rows[i].FindControl("txtDAY11") as TextBox;
            TextBox txtDAY12 = DgMDBreakUp.Rows[i].FindControl("txtDAY12") as TextBox;
            TextBox txtDAY13 = DgMDBreakUp.Rows[i].FindControl("txtDAY13") as TextBox;
            TextBox txtDAY14 = DgMDBreakUp.Rows[i].FindControl("txtDAY14") as TextBox;
            TextBox txtDAY15 = DgMDBreakUp.Rows[i].FindControl("txtDAY15") as TextBox;
            TextBox txtDAY16 = DgMDBreakUp.Rows[i].FindControl("txtDAY16") as TextBox;
            TextBox txtDAY17 = DgMDBreakUp.Rows[i].FindControl("txtDAY17") as TextBox;
            TextBox txtDAY18 = DgMDBreakUp.Rows[i].FindControl("txtDAY18") as TextBox;
            TextBox txtDAY19 = DgMDBreakUp.Rows[i].FindControl("txtDAY19") as TextBox;
            TextBox txtDAY20 = DgMDBreakUp.Rows[i].FindControl("txtDAY20") as TextBox;
            TextBox txtDAY21 = DgMDBreakUp.Rows[i].FindControl("txtDAY21") as TextBox;
            TextBox txtDAY22 = DgMDBreakUp.Rows[i].FindControl("txtDAY22") as TextBox;
            TextBox txtDAY23 = DgMDBreakUp.Rows[i].FindControl("txtDAY23") as TextBox;
            TextBox txtDAY24 = DgMDBreakUp.Rows[i].FindControl("txtDAY24") as TextBox;
            TextBox txtDAY25 = DgMDBreakUp.Rows[i].FindControl("txtDAY25") as TextBox;
            TextBox txtDAY26 = DgMDBreakUp.Rows[i].FindControl("txtDAY26") as TextBox;
            TextBox txtDAY27 = DgMDBreakUp.Rows[i].FindControl("txtDAY27") as TextBox;
            TextBox txtDAY28 = DgMDBreakUp.Rows[i].FindControl("txtDAY28") as TextBox;
            TextBox txtDAY29 = DgMDBreakUp.Rows[i].FindControl("txtDAY29") as TextBox;
            TextBox txtDAY30 = DgMDBreakUp.Rows[i].FindControl("txtDAY30") as TextBox;
            TextBox txtDAY31 = DgMDBreakUp.Rows[i].FindControl("txtDAY31") as TextBox;

            TextBox txtOT1 = DgMDBreakUp.Rows[i].FindControl("txtOT1") as TextBox;
            TextBox txtOT2 = DgMDBreakUp.Rows[i].FindControl("txtOT2") as TextBox;
            TextBox txtOT3 = DgMDBreakUp.Rows[i].FindControl("txtOT3") as TextBox;
            TextBox txtOT4 = DgMDBreakUp.Rows[i].FindControl("txtOT4") as TextBox;
            TextBox txtOT5 = DgMDBreakUp.Rows[i].FindControl("txtOT5") as TextBox;
            TextBox txtOT6 = DgMDBreakUp.Rows[i].FindControl("txtOT6") as TextBox;
            TextBox txtOT7 = DgMDBreakUp.Rows[i].FindControl("txtOT7") as TextBox;
            TextBox txtOT8 = DgMDBreakUp.Rows[i].FindControl("txtOT8") as TextBox;
            TextBox txtOT9 = DgMDBreakUp.Rows[i].FindControl("txtOT9") as TextBox;
            TextBox txtOT10 = DgMDBreakUp.Rows[i].FindControl("txtOT10") as TextBox;
            TextBox txtOT11 = DgMDBreakUp.Rows[i].FindControl("txtOT11") as TextBox;
            TextBox txtOT12 = DgMDBreakUp.Rows[i].FindControl("txtOT12") as TextBox;
            TextBox txtOT13 = DgMDBreakUp.Rows[i].FindControl("txtOT1") as TextBox;
            TextBox txtOT14 = DgMDBreakUp.Rows[i].FindControl("txtOT14") as TextBox;
            TextBox txtOT15 = DgMDBreakUp.Rows[i].FindControl("txtOT15") as TextBox;
            TextBox txtOT16 = DgMDBreakUp.Rows[i].FindControl("txtOT16") as TextBox;
            TextBox txtOT17 = DgMDBreakUp.Rows[i].FindControl("txtOT17") as TextBox;
            TextBox txtOT18 = DgMDBreakUp.Rows[i].FindControl("txtOT18") as TextBox;
            TextBox txtOT19 = DgMDBreakUp.Rows[i].FindControl("txtOT19") as TextBox;
            TextBox txtOT20 = DgMDBreakUp.Rows[i].FindControl("txtOT20") as TextBox;
            TextBox txtOT21 = DgMDBreakUp.Rows[i].FindControl("txtOT21") as TextBox;
            TextBox txtOT22 = DgMDBreakUp.Rows[i].FindControl("txtOT22") as TextBox;
            TextBox txtOT23 = DgMDBreakUp.Rows[i].FindControl("txtOT23") as TextBox;
            TextBox txtOT24 = DgMDBreakUp.Rows[i].FindControl("txtOT24") as TextBox;
            TextBox txtOT25 = DgMDBreakUp.Rows[i].FindControl("txtOT25") as TextBox;
            TextBox txtOT26 = DgMDBreakUp.Rows[i].FindControl("txtOT26") as TextBox;
            TextBox txtOT27 = DgMDBreakUp.Rows[i].FindControl("txtOT27") as TextBox;
            TextBox txtOT28 = DgMDBreakUp.Rows[i].FindControl("txtOT28") as TextBox;
            TextBox txtOT29 = DgMDBreakUp.Rows[i].FindControl("txtOT29") as TextBox;
            TextBox txtOT30 = DgMDBreakUp.Rows[i].FindControl("txtOT31") as TextBox;
            TextBox txtOT31 = DgMDBreakUp.Rows[i].FindControl("txtOT31") as TextBox;

            TextBox txtTOTAL = DgMDBreakUp.Rows[i].FindControl("txtTOTAL") as TextBox;
            TextBox txtOTTOTAL = DgMDBreakUp.Rows[i].FindControl("txtOTTOTAL") as TextBox;

            if (txtOT1.Text.Trim() == "")
            { txtOT1.Text = "0"; }
            if (txtOT2.Text.Trim() == "")
            { txtOT2.Text = "0"; }
            if (txtOT3.Text.Trim() == "")
            { txtOT3.Text = "0"; }
            if (txtOT4.Text.Trim() == "")
            { txtOT4.Text = "0"; }
            if (txtOT5.Text.Trim() == "")
            { txtOT5.Text = "0"; }
            if (txtOT6.Text.Trim() == "")
            { txtOT6.Text = "0"; }
            if (txtOT7.Text.Trim() == "")
            { txtOT7.Text = "0"; }
            if (txtOT8.Text.Trim() == "")
            { txtOT8.Text = "0"; }
            if (txtOT9.Text.Trim() == "")
            { txtOT9.Text = "0"; }
            if (txtOT10.Text.Trim() == "")
            { txtOT10.Text = "0"; }
            if (txtOT11.Text.Trim() == "")
            { txtOT11.Text = "0"; }
            if (txtOT12.Text.Trim() == "")
            { txtOT12.Text = "0"; }
            if (txtOT13.Text.Trim() == "")
            { txtOT13.Text = "0"; }
            if (txtOT14.Text.Trim() == "")
            { txtOT14.Text = "0"; }
            if (txtOT15.Text.Trim() == "")
            { txtOT15.Text = "0"; }
            if (txtOT16.Text.Trim() == "")
            { txtOT16.Text = "0"; }
            if (txtOT17.Text.Trim() == "")
            { txtOT17.Text = "0"; }
            if (txtOT18.Text.Trim() == "")
            { txtOT18.Text = "0"; }
            if (txtOT19.Text.Trim() == "")
            { txtOT19.Text = "0"; }
            if (txtOT20.Text.Trim() == "")
            { txtOT20.Text = "0"; }
            if (txtOT21.Text.Trim() == "")
            { txtOT21.Text = "0"; }
            if (txtOT22.Text.Trim() == "")
            { txtOT22.Text = "0"; }
            if (txtOT23.Text.Trim() == "")
            { txtOT23.Text = "0"; }
            if (txtOT24.Text.Trim() == "")
            { txtOT24.Text = "0"; }
            if (txtOT25.Text.Trim() == "")
            { txtOT25.Text = "0"; }
            if (txtOT26.Text.Trim() == "")
            { txtOT26.Text = "0"; }
            if (txtOT27.Text.Trim() == "")
            { txtOT27.Text = "0"; }
            if (txtOT28.Text.Trim() == "")
            { txtOT28.Text = "0"; }
            if (txtOT29.Text.Trim() == "")
            { txtOT29.Text = "0"; }
            if (txtOT30.Text.Trim() == "")
            { txtOT30.Text = "0"; }
            if (txtOT31.Text.Trim() == "")
            { txtOT31.Text = "0"; }


 
            ObjectBA.InsertMDAndETBreakUp(lblEMPLOYEECODE.Text, lblDEPARTMENTID.Text, ddlcompanyname.SelectedValue, txtDAY1.Text.ToUpper(), txtDAY2.Text.ToUpper(),
                txtDAY3.Text.ToUpper(), txtDAY4.Text.ToUpper(), txtDAY5.Text.ToUpper(), txtDAY6.Text.ToUpper(), txtDAY7.Text.ToUpper(), txtDAY8.Text.ToUpper(), txtDAY9.Text.ToUpper(), txtDAY10.Text.ToUpper(), txtDAY11.Text.ToUpper(), txtDAY12.Text.ToUpper(),
                txtDAY13.Text.ToUpper(), txtDAY14.Text.ToUpper(), txtDAY15.Text.ToUpper(), txtDAY16.Text.ToUpper(), txtDAY17.Text.ToUpper(), txtDAY18.Text.ToUpper(), txtDAY19.Text.ToUpper(), txtDAY20.Text.ToUpper(), txtDAY21.Text.ToUpper(),
                txtDAY22.Text.ToUpper(), txtDAY23.Text.ToUpper(), txtDAY24.Text.ToUpper(), txtDAY25.Text.ToUpper(), txtDAY26.Text.ToUpper(), txtDAY27.Text.ToUpper(), txtDAY28.Text.ToUpper(), txtDAY29.Text.ToUpper(), txtDAY30.Text.ToUpper(),
                txtDAY31.Text.ToUpper(), txtOT1.Text, txtOT2.Text, txtOT3.Text, txtOT4.Text, txtOT5.Text, txtOT6.Text, txtOT7.Text, txtOT8.Text, txtOT9.Text,
                txtOT10.Text, txtOT11.Text, txtOT12.Text, txtOT13.Text, txtOT14.Text, txtOT15.Text, txtOT16.Text, txtOT17.Text, txtOT18.Text, txtOT19.Text, txtOT20.Text,
                txtOT21.Text, txtOT22.Text, txtOT23.Text, txtOT24.Text, txtOT25.Text, txtOT26.Text, txtOT27.Text, txtOT28.Text, txtOT29.Text, txtOT30.Text, txtOT31.Text,
                Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString(), "1", txtTOTAL.Text, txtOTTOTAL.Text);
           
        }
        System.Threading.Thread.Sleep(100);
        string message = "alert('Data Save')";
        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        newLoad();
    }

    protected void btnClac_Click(object sender, EventArgs e)
    {
        decimal TotMD = 0, TotET = 0, TotAB = 0, TotCL = 0, TotEL = 0, TotPH = 0, TotNH = 0, TOtCOFF = 0, TotSL = 0, TotLOP = 0;

        int CellVal = 0;

        if (DgMDBreakUp.Rows.Count > 0)
        {
            for (int i = 0; DgMDBreakUp.Rows.Count > i; i++)
            {
                decimal PresentDays = 0, OTDays = 0, Absent = 0, CL = 0, EL = 0, PH = 0, NH = 0, COFF = 0, SL = 0, LOP = 0;
                int DayCount = 0;
                DateTime Fromdate = Convert.ToDateTime(txtfromdate.Text);
                DateTime Todate = Convert.ToDateTime(txttodate.Text);
                DayCount = Convert.ToInt16((Todate - Fromdate).TotalDays);
                DayCount = DayCount + 1;
                for (int j = 0; DayCount > j; j++)
                {
                    string day = Fromdate.DayOfWeek.ToString();
                    int date = Fromdate.Day;
                    int set = j + 1;
                    decimal ColumnTot = 0, ColumnOTTot = 0;

                    TextBox TypeStatus = DgMDBreakUp.Rows[i].FindControl("txtDAY" + date) as TextBox;

                    TextBox OTTypeStatus = DgMDBreakUp.Rows[i].FindControl("txtOT" + date) as TextBox;
                    if (OTTypeStatus.Text == "")
                    {
                        OTTypeStatus.Text = "0";
                    }

                    if (OTTypeStatus.Text != "0")
                    {
                        OTDays += Convert.ToDecimal(OTTypeStatus.Text);
                        
                    }
                    if (TypeStatus.Text.ToUpper() == "XX" || TypeStatus.Text.ToUpper() == "CL" || TypeStatus.Text.ToUpper() == "EL" || TypeStatus.Text.ToUpper() == "PH" || TypeStatus.Text.ToUpper() == "NH" || TypeStatus.Text.ToUpper() == "COFF" || TypeStatus.Text.ToUpper() == "SL")
                    {
                        PresentDays += 1;
                       

                    }
                    if (TypeStatus.Text == "XA" || TypeStatus.Text == "AX")
                    {
                        PresentDays += Convert.ToDecimal(0.5);                 

                        Absent += Convert.ToDecimal(0.5);

                        //LOP += Convert.ToDecimal(0.5);
                    }
                    TextBox txtTOTAL = DgMDBreakUp.Rows[i].FindControl("txtTOTAL") as TextBox;
                    TextBox TOTALOT = DgMDBreakUp.Rows[i].FindControl("txtOTTOTAL") as TextBox;
                    txtTOTAL.Text = PresentDays.ToString("##0.00");
                    TOTALOT.Text = OTDays.ToString("##0.00");

                    Fromdate = Fromdate.AddDays(1);
                }
            }
        }
    }


    protected void btnnew_Click(object sender, EventArgs e)
    {
        newLoad();
    }

    private void newLoad()
    {
        DgMDBreakUp.DataSource = null;
        DgMDBreakUp.DataBind();
        txtfromdate.Text = "";
        txttodate.Text = "";
        ddlcompanynameLoad();
        txtdivisionname.Text = "";
        Errors = "0";
    }
}