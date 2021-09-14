using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

using BLL;

public partial class PayrollForms_PgEntriesAtt : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlclientnameLoad();
        }
    }

    private void ddlclientnameLoad()
    {
        ddlclientname.Items.Clear();
        ddlclientname.Items.Add("---Select Client Name---");
        ddlclientname.DataSource = ObjectBA.SelectClinet();
        ddlclientname.DataValueField = "CLIENTID";
        ddlclientname.DataTextField = "CLIENTNAME";
        ddlclientname.DataBind();
    }

    private void DgCompanyLoad(object sender)
    {
        string dptName = "", Cat = "", Sat = "";

        if (ddldepartmentname.SelectedValue == "ALL Department")
        {
            dptName = "";
        }
        else
        {
            dptName = ddldepartmentname.SelectedItem.ToString();
        }
        if (ddlstatus.SelectedValue == "Status")
        {
            Sat = "";
        }
        else
        {
            Sat = ddlstatus.SelectedItem.ToString();
        }

        if (ddltype.SelectedValue == "Select Type")
        {
            Cat = "";
        }
        else
        {
            Cat = ddltype.SelectedItem.ToString();
        }

        dt = ObjectBA.SelectDailyAttendaneDetail(txtfromdate.Text, txttodate.Text, ddlclientname.SelectedValue, dptName, txtemployeecode.Text, Cat, Sat);

        if (dt.Rows.Count > 0)
        {
            GDAttViewandEdit.DataSource = ObjectBA.SelectDailyAttendaneDetail(txtfromdate.Text, txttodate.Text, ddlclientname.SelectedValue, dptName, txtemployeecode.Text, Cat, Sat);
            GDAttViewandEdit.DataBind();
        }

        //--------
        //else if (ddlclientname.Text == "---Select Client Name---" && txtfromdate.Text.Trim() == "" && txttodate.Text.Trim() == "" && ddldepartmentname.Text == "---Select Department Name---")
        //{
        //    GDAttViewandEdit.DataSource = ObjectBA.SelectDailyAttendaneEmployeeCode(txtemployeecode.Text);

        //    GDAttViewandEdit.DataBind();
        //}

        //-----

        else
        {
            //GDAttViewandEdit.DataSource = null;
            //GDAttViewandEdit.Columns.Clear();

            GDAttViewandEdit.DataSource = null;
            GDAttViewandEdit.DataBind();

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Not Here')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        }
        //string dptName = "";
        //if (ddldepartmentname.SelectedValue == "ALL Department")
        //{
        //    dptName = "";
        //}
        //else
        //{
        //    dptName = ddldepartmentname.SelectedIndex.ToString();
        //}
        //GDAttViewandEdit.DataSource = ObjectBA.SelectDailyAttendaneDetail(txtfromdate.Text, txttodate.Text, ddlclientname.SelectedValue, dptName, txtemployeecode.Text, ddltype.SelectedValue);
        //GDAttViewandEdit.DataBind();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        if (txtfromdate.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter FromDate')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtfromdate.Focus();
        }
        else if (txttodate.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter ToDate')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txttodate.Focus();
        }
        else if (ddlclientname.SelectedItem.Text.Trim() == "---Select Client Name---")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Client Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlclientname.Focus();
        }
        else if (ddldepartmentname.SelectedItem.Text.Trim() == "-------- Select Department -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Department Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddldepartmentname.Focus();
        }
        else
        {
            DgCompanyLoad(sender);
        }
                 
        txttotalnoofemployees.Text = GDAttViewandEdit.Rows.Count.ToString();

        TotalCalculation();
 
    }

    private void TotalCalculation()
    {
        decimal TotPresent = 0, TotAbsent = 0, TotCL = 0, TotEL = 0, TotSL = 0,
            TotLOP = 0, TotPH = 0, TotNH = 0, TotCOFF = 0, SalaryDay = 0, TotOT1 = 0, TotOT2 = 0, TotOT3 = 0, OTSing = 0;
        AttendanceCount.DataSource = ObjectBA.SelectAttendanceCountForMonth(txtfromdate.Text, txttodate.Text, ddlclientname.SelectedValue);
        AttendanceCount.DataBind();

        for (int i = 0; i < AttendanceCount.Rows.Count; i++)
        {
            Label lblPresent = AttendanceCount.Rows[i].FindControl("lblPresent") as Label;
            TotPresent += Convert.ToDecimal(lblPresent.Text);

            Label lblAbsent = AttendanceCount.Rows[i].FindControl("lblAbsent") as Label;
            TotAbsent += Convert.ToDecimal(lblAbsent.Text);

            Label lblCL = AttendanceCount.Rows[i].FindControl("lblCL") as Label;
            TotCL += Convert.ToDecimal(lblCL.Text);

            Label lblEL = AttendanceCount.Rows[i].FindControl("lblEL") as Label;
            TotEL += Convert.ToDecimal(lblEL.Text);

            Label lblNH = AttendanceCount.Rows[i].FindControl("lblNH") as Label;
            TotNH += Convert.ToDecimal(lblNH.Text);

            Label lblCOFF = AttendanceCount.Rows[i].FindControl("lblCOFF") as Label;
            TotCOFF += Convert.ToDecimal(lblCOFF.Text);

            Label lblSL = AttendanceCount.Rows[i].FindControl("lblSL") as Label;
            TotSL += Convert.ToDecimal(lblSL.Text);

            Label lblPH = AttendanceCount.Rows[i].FindControl("lblPH") as Label;
            TotPH += Convert.ToDecimal(lblPH.Text);

            Label lblLOP = AttendanceCount.Rows[i].FindControl("lblLOP") as Label;
            TotLOP += Convert.ToDecimal(lblLOP.Text);

            Label lblSalaryDay = AttendanceCount.Rows[i].FindControl("lblSalaryDay") as Label;
            SalaryDay = Convert.ToDecimal(lblPresent.Text) + Convert.ToDecimal(lblCL.Text) + Convert.ToDecimal(lblEL.Text) + Convert.ToDecimal(lblNH.Text) +
                Convert.ToDecimal(lblCOFF.Text) + Convert.ToDecimal(lblSL.Text) + Convert.ToDecimal(lblPH.Text);
            lblSalaryDay.Text = SalaryDay.ToString("#####.00");

            Label OT2 = AttendanceCount.Rows[i].FindControl("lblET2") as Label;
            Label OT1 = AttendanceCount.Rows[i].FindControl("lblET1") as Label;
            Label OT3 = AttendanceCount.Rows[i].FindControl("lblET3") as Label;
            
            OTSing = Convert.ToDecimal(OT1.Text) + Convert.ToDecimal(OT2.Text) + Convert.ToDecimal(OT3.Text);
            OT1.Text = OTSing.ToString();
            TotOT1 += OTSing;

            TotOT2 += Convert.ToDecimal(OT2.Text);
           
            TotOT3 += Convert.ToDecimal(OT2.Text);
        }

        Label lblTotPresent = AttendanceCount.FooterRow.FindControl("lblTotPresent") as Label;
        Label lblTotAbsent = AttendanceCount.FooterRow.FindControl("lblTotAbsent") as Label;
        Label lblTotCL = AttendanceCount.FooterRow.FindControl("lblTotCL") as Label;
        Label lblTotEL = AttendanceCount.FooterRow.FindControl("lblTotEL") as Label;
        Label lblTotPH = AttendanceCount.FooterRow.FindControl("lblTotPH") as Label;
        Label lblTotNH = AttendanceCount.FooterRow.FindControl("lblTotNH") as Label;
        Label lblTotCOFF = AttendanceCount.FooterRow.FindControl("lblTotCOFF") as Label;
        Label lblTotSL = AttendanceCount.FooterRow.FindControl("lblTotSL") as Label;
        Label lblTotLOP = AttendanceCount.FooterRow.FindControl("lblTotLOP") as Label;
        Label lblTotSalaryDay = AttendanceCount.FooterRow.FindControl("lblTotSalaryDay") as Label;

        Label lblTotET1 = AttendanceCount.FooterRow.FindControl("lblTotET1") as Label;
        Label lblTotET2 = AttendanceCount.FooterRow.FindControl("lblTotET2") as Label;
        Label lblTotET3 = AttendanceCount.FooterRow.FindControl("lblTotET3") as Label;

        lblTotET1.Text = TotOT1.ToString("####.00");
        lblTotET2.Text = TotOT2.ToString("####.00");
        lblTotET3.Text = TotOT3.ToString("####.00");

        lblTotLOP.Text = TotLOP.ToString();
        lblTotSalaryDay.Text = (TotPresent + TotCL + TotEL + TotPH + TotNH + TotCOFF + TotSL).ToString("####.00");
        lblTotPresent.Text = TotPresent.ToString("####.00");
        lblTotAbsent.Text = TotAbsent.ToString("####.00");
        lblTotCL.Text = TotCL.ToString("####.00");
        lblTotEL.Text = TotEL.ToString("####.00");
        lblTotPH.Text = TotPH.ToString("####.00");
        lblTotNH.Text = TotNH.ToString("####.00");
        lblTotCOFF.Text = TotCOFF.ToString("####.00");
        lblTotSL.Text = TotSL.ToString("####.00");

    }

    protected void GDAttViewandEdit_RowDataBound(object sender, GridViewRowEventArgs e)
    {    
        //DropDownList ddlStatus = (DropDownList)e.Row.FindControl("ddlStatus");
        //ddlstatus
        //ddlstatus.DataSource = ObjectBA.SelectDailyAttendaneDetail(txtfromdate.Text, txttodate.Text, ddlclientname.SelectedValue);
        //ddlstatus.DataTextField = "STATUS";
        //ddlstatus.DataValueField = "STATUS";
        //ddlstatus.DataBind();
    }

    protected void GDAttViewandEdit_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GDAttViewandEdit.EditIndex = e.NewEditIndex;
        DgCompanyLoad(sender);
        DropDownList sts = GDAttViewandEdit.Rows[e.NewEditIndex].FindControl("ddlStatus") as DropDownList;
        Label lblStatusID = GDAttViewandEdit.Rows[GDAttViewandEdit.EditIndex].FindControl("lblStatusID") as Label;
        sts.SelectedValue = lblStatusID.Text;

    }

    protected void GDAttViewandEdit_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GDAttViewandEdit.PageIndex = e.NewPageIndex;
        //Label lblStatus = GDAttViewandEdit.Rows[e.NewPageIndex].FindControl("lblStatus") as Label;

        //DropDownList ddlStatus = (DropDownList)GDAttViewandEdit.Rows[GDAttViewandEdit.EditIndex].FindControl("ddlStatus");
        //ddlStatus.Text = lblStatus.Text;
    }

    protected void GDAttViewandEdit_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        GDAttViewandEdit.EditIndex = -1;
        GDAttViewandEdit.DataBind();    
    }
    protected void GDAttViewandEdit_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GDAttViewandEdit.EditIndex = -1;
        DgCompanyLoad(sender);
    }

    protected void GDAttViewandEdit_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        DropDownList sts = GDAttViewandEdit.Rows[e.RowIndex].FindControl("ddlStatus") as DropDownList;
        object status = sts.SelectedItem.Text;

        if (status == "Status")
        {
            //lblMessageBox.ForeColor = System.Drawing.Color.Red;
            //lblMessageBox.Visible = true;
            //lblMessageBox.Text = "Select Status";
        }
        else
        {
            UpdateAttendance(e);

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        }

        //Label EMPLOYEEID = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblEmpNo") as Label;
        //DropDownList Status = GDAttViewandEdit.Rows[e.RowIndex].FindControl("ddlStatus") as DropDownList;
        //TextBox ET1 = GDAttViewandEdit.Rows[e.RowIndex].FindControl("txtET1") as TextBox;
        //TextBox ET2 = GDAttViewandEdit.Rows[e.RowIndex].FindControl("txtET2") as TextBox;
        //TextBox ET3 = GDAttViewandEdit.Rows[e.RowIndex].FindControl("txtET3") as TextBox;

        GDAttViewandEdit.EditIndex = -1;
        DgCompanyLoad(sender);
        TotalCalculation();
    }

    private void UpdateAttendance(GridViewUpdateEventArgs e)
    {
        string workedHour = "0";
        string Basic = "", Hra = "", Conv = "", Wash = "", Othr = "", OTAmt = "", Pfid = "", Esi = "";
        Label BasicDA = new Label();
            Label HRA = new Label();
        Label Conveyance = new Label(); Label Washing = new Label();
        Label Other = new Label(); Label OTAmount = new Label(); Label lblAmount2 = new Label(); Label lblAmount3 = new Label();
        Label PFID = new Label(); Label ESI = new Label();


        Label Date = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblDate") as Label;
        Label Empid = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblEmpID") as Label;
        Label Code = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblEmpNo") as Label;
        Label Name = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblEmpName") as Label;
        Label deptName = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblEmpDpt") as Label;
        Label deptID = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblEmpDptID") as Label;

        Label Divi = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblDivi") as Label;

        DropDownList sts = GDAttViewandEdit.Rows[e.RowIndex].FindControl("ddlStatus") as DropDownList;
        object status = sts.SelectedItem.Text;


        dt = ObjectBA.SelectEmployeeCode(Code.Text);

        if (dt.Rows.Count > 0)
        {
            Basic = dt.Rows[0]["BASICDA"].ToString();
            BasicDA.Text = Basic.ToString();

            Hra = dt.Rows[0]["HRA"].ToString();
            HRA.Text = Hra.ToString();

            Conv = dt.Rows[0]["CONVEYANCE"].ToString();
            Conveyance.Text = Conv.ToString();

            Wash = dt.Rows[0]["WASHING"].ToString();
            Washing.Text = Wash.ToString();

            Othr = dt.Rows[0]["OTHER"].ToString();
            Other.Text = Othr.ToString();

            OTAmt = dt.Rows[0]["OTAMOUNT"].ToString();
            OTAmount.Text = OTAmt.ToString();

            lblAmount2.Text = dt.Rows[0]["OTAMOUNT2"].ToString();
            //lblAmount2.Text = OTAmt.ToString();

            lblAmount3.Text = dt.Rows[0]["OTAMOUNT3"].ToString();
            //lblAmount3.Text = OTAmt.ToString();

            Pfid = dt.Rows[0]["PFID"].ToString();
            PFID.Text = Pfid.ToString();

            Esi = dt.Rows[0]["ESIID"].ToString();
            ESI.Text = Esi.ToString();
        }
        else
        {
            BasicDA = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblbasicDA") as Label;
            HRA = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblHra") as Label;
            Conveyance = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblConve") as Label;
            Washing = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblWahing") as Label;
            Other = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblOther") as Label;
            OTAmount = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblAmount") as Label;
            lblAmount2 = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblAmount2") as Label;
            lblAmount3 = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblAmount3") as Label;
            PFID = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblpfid") as Label;
            ESI = GDAttViewandEdit.Rows[e.RowIndex].FindControl("lblesiid") as Label;
        }        

        TextBox txtET1 = GDAttViewandEdit.Rows[e.RowIndex].FindControl("txtET1") as TextBox;
        object OT1 = txtET1.Text;
        TextBox txtET2 = GDAttViewandEdit.Rows[e.RowIndex].FindControl("txtET2") as TextBox;
        object OT2 = txtET2.Text;
        TextBox txtET3 = GDAttViewandEdit.Rows[e.RowIndex].FindControl("txtET3") as TextBox;
        object OT3 = txtET3.Text;
        //string status = GridView1.Rows[i].Cells[13].Text;
        //string selectedCity = DataBinder.Eval(GridView1.Rows.DataItem, "City").ToString();
        //decimal txtET1 = Convert.ToDecimal(GridView1.Rows[i].FindControl("txtET2"));
        //decimal txtET2 = Convert.ToDecimal(GridView1.Rows[i].Cells[14].Text);
        //decimal txtET3 = Convert.ToDecimal(GridView1.Rows[i].Cells[14].Text);
        if (status == "XX")
        {
            workedHour = "8";
        }
        else if (status == "XA")
        {
            workedHour = "4";
        }
        else if (status == "AX")
        {
            workedHour = "4";
        }
        else if (status == "AA")
        {
            workedHour = "0";
        }
        else if (status == "CL")
        {
            workedHour = "8";
        }
        else if (status == "EL")
        {
            workedHour = "8";
        }
        else if (status == "PH")
        {
            workedHour = "8";
        }

        else if (status == "NH")
        {
            workedHour = "8";
        }

        else if (status == "COFF")
        {
            workedHour = "8";
        }

        else if (status == "LOP")
        {
            workedHour = "0";
        }

        else if (status == "SL")
        {
            workedHour = "8";
        }

        DeleteCurrentdate(Date.Text, ddlclientname.SelectedValue, Empid.Text);

        ObjectBA.InsertDailyAttendane(Date.Text, ddlclientname.SelectedValue, Divi.Text, Empid.Text, Code.Text, deptID.Text, workedHour, "0",
            OTAmount.Text, BasicDA.Text, HRA.Text, Conveyance.Text, Washing.Text, Other.Text, PFID.Text, ESI.Text, "0", "0",
            OT1.ToString(), OT2.ToString(), OT3.ToString(), "0", status.ToString(), lblAmount2.Text, lblAmount3.Text);
        //DgCompanyLoad();
    }

    private void DeleteCurrentdate(string Date, string ClntID, string EmpID)
    {
        ObjectBA.DeletePerDailyAttendane(Convert.ToDateTime(Date).ToShortDateString(), EmpID, ClntID);
    }

    protected void ddlclientname_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlclientname.SelectedValue == "---Select Client Name---")
        {
            ddldepartmentname.Items.Clear();
            ddldepartmentname.Items.Add("-------- Select Department -----");            
        }
        else
        {
            ddldepartmentnameload();
        }        
    }

    private void ddldepartmentnameload()
    {
        ddldepartmentname.Items.Clear();
        ddldepartmentname.Items.Add("-------- Select Department -----");
        ddldepartmentname.Items.Add("ALL Department");
        ddldepartmentname.DataSource = ObjectBA.SelectDepartmentClnt(ddlclientname.SelectedValue);
        ddldepartmentname.DataTextField = "DEPARTMENTNAME";
        ddldepartmentname.DataValueField = "DEPARTMENTID";
        ddldepartmentname.DataBind();
    }

    protected void ddldepartmentname_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (ddldepartmentname.SelectedValue == "ALL Department")
        //{
        //    ddldepartmentnameload();
        //}
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    public void Clearnew()
    {
        ddlclientnameLoad();
        ddldepartmentname.Items.Clear();
        ddldepartmentname.Items.Add("-------- Select Department -----");
        ddldepartmentname.Items.Add("ALL Department");
        ddltype.Items.Clear();
        ddltype.Items.Add("Select Type");

        txttotalnoofemployees.Text = "";
        txtfromdate.Text = "";
        txttodate.Text = "";

        GDAttViewandEdit.DataSource = null;
        GDAttViewandEdit.DataBind();


        AttendanceCount.DataSource = null;
        AttendanceCount.DataBind();

        //btnsave.Text = "Save";
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
    }

    protected void GDAttViewandEdit_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    // The id parameter name should match the DataKeyNames value set on the control
    public void GDAttViewandEdit_UpdateItem(int id)
    {

    }
}