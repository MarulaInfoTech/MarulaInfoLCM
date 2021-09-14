using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using BLL;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Data.Sql;


public partial class MonthlyAttdendance : System.Web.UI.Page
{
    
    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();

    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();

    public string Errors = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            ddlclientnameLoad();
            Clearnew();
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

    protected void btnImportGrid_Click(object sender, EventArgs e)
    {
        //Response.Write("123");
        UploadFile();

        if (txtfromdate.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select From Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtfromdate.Focus();            
        }
        else if (txttodate.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select To Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txttodate.Focus();
        }
        else if (ddlclientname.Text == "---Select Client Name---")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Client Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlclientname.Focus();           
        }
                
        else if (SelectFiles.FileName == "")
        {

            System.Threading.Thread.Sleep(100);
            string message = "alert('Please Upload Attendance File')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            SelectFiles.Focus();           
        }

        else 
        {
            listOfEmp.Items.Clear();
            listOfEmp.Visible = false;
            string ConStr = "";
            string ext = Path.GetExtension(SelectFiles.FileName).ToLower();
            string path = Server.MapPath(SelectFiles.FileName);
            SelectFiles.SaveAs(path);        //Label1.Text = SelectFiles.FileName + "\'s Data showing into the GridView";

            if (ext.Trim() == ".xls")
            {
                ConStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
            }
            else if (ext.Trim() == ".xlsx")
            {
                ConStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
            }

            string query = "SELECT * FROM [Sheet1$]";
            OleDbConnection conn = new OleDbConnection(ConStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            OleDbCommand cmd = new OleDbCommand(query, conn);
            OleDbDataAdapter Olda = new OleDbDataAdapter(cmd);        //DataSet ds = new DataSet();
            DataTable Oldt = new DataTable();
            Olda.Fill(Oldt);
            GridView1.DataSource = Oldt;
            GridView1.DataBind();

            if (GridView1.Rows.Count > 0)           /* //--------messagebox show visible false//*/
            {
                //lblMessageBox.Visible = false;
            }
            else
            {
                //mess             
                //lblMessageBox.Text = " ";   
            }

            conn.Close();

            for (int i = 0; i < Oldt.Rows.Count; i++)
            {
//                con.Close();
//                con.Open();
//                string str = @"SELECT        dbo.EmployeeCompanyDetail.EMPLOYEECODE, dbo.EmployeeCompanyDetail.EMPLOYEEID, dbo.EmployeeCompanyDetail.APPLICATIONID, 
//dbo.EmployeeApplication.APPLICATIONAME, 
//                         dbo.ClientDetail.CLIENTNAME, dbo.ClientDetail.CLIENTID
//FROM            dbo.EmployeeApplication INNER JOIN
//                         dbo.EmployeeCompanyDetail ON dbo.EmployeeApplication.APPLICATIONID = dbo.EmployeeCompanyDetail.APPLICATIONID INNER JOIN
//                         dbo.ClientDetail ON dbo.EmployeeCompanyDetail.CLIENTID = dbo.ClientDetail.CLIENTID
//WHERE  dbo.EmployeeCompanyDetail.EMPLOYEESTATUS='Working' and dbo.EmployeeCompanyDetail.EMPLOYEECODE ='" + Convert.ToDouble(Oldt.Rows[i]["EMPLOYEECODE"]).ToString("0####") + "'" +
//               " and (dbo.ClientDetail.CLIENTID = '" + ddlclientname.SelectedValue + "') ORDER BY dbo.EmployeeCompanyDetail.EMPLOYEECODE";
//                da = new SqlDataAdapter(str, con);
                //da.Fill(dt)-----------;
                dt = ObjectBA.SelectEmployeeCompanyDetailCheckExl(Convert.ToDouble(Oldt.Rows[i]["EMPLOYEECODE"]).ToString("0####"), ddlclientname.SelectedValue);
                if (dt.Rows.Count > 0)
                {

                }
                else
                {
                    listOfEmp.Visible = true;/*-----------------------*/
                    listOfEmp.Items.Add(Oldt.Rows[i]["EMPLOYEECODE"].ToString() + "---> is not in EmployeeList ");
                    //ModalPopupExtender1.TargetControlID = "btnImportGrid";
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                }
                con.Close();
            }
        }
    }

    private void UploadFile()
    {
        StringBuilder sb = new StringBuilder();

        if (SelectFiles.HasFile)
        {
            try
            {
                sb.AppendFormat(" Uploading file: {0}", SelectFiles.FileName);

                //saving the file
                SelectFiles.SaveAs("<c:\\SaveDirectory>" + SelectFiles.FileName);

                //Showing the file information
                sb.AppendFormat("<br/> Save As: {0}", SelectFiles.PostedFile.FileName);
                sb.AppendFormat("<br/> File type: {0}", SelectFiles.PostedFile.ContentType);
                sb.AppendFormat("<br/> File length: {0}", SelectFiles.PostedFile.ContentLength);
                sb.AppendFormat("<br/> File name: {0}", SelectFiles.PostedFile.FileName);

            }
            catch (Exception ex)
            {
                sb.Append("<br/> Error <br/>");
                sb.AppendFormat("Unable to save file <br/> {0}", ex.Message);
            }
        }
        else
        {
            //lblMessageBox2.Text = sb.ToString();
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        checkedEx();

        if (Errors != "0")
        {
            // MSG
            System.Threading.Thread.Sleep(100);
            string message = "alert('Same Data Already Here..')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        }
        else
        {
            if (GridView1.Rows.Count > 0)
            {
                ObjectBA.DeleteDailyAttendane(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlclientname.SelectedValue);
                AttendanceSave();
                SaveFor12and25Form();
                Clearnew();
                //lblMessageBox2.Visible = true;
                //lblMessageBox2.ForeColor = System.Drawing.Color.Green;
                //lblMessageBox2.Text = "Data Save";

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            }
        }
    }

    private void SaveFor12and25Form()
    {
        string Type = "0";
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox lblType = GridView1.Rows[i].FindControl("lblType") as CheckBox;
           
                Label lblEMPLOYEECODE = GridView1.Rows[i].FindControl("lblEMPLOYEECODE") as Label;
                Label lblAPPLICATIONAME = GridView1.Rows[i].FindControl("lblAPPLICATIONAME") as Label;
                Label lblDEPARTMENTID = GridView1.Rows[i].FindControl("lblDEPARTMENTID") as Label;
                TextBox txtDAY1 = GridView1.Rows[i].FindControl("txtDAY1") as TextBox;
                TextBox txtDAY2 = GridView1.Rows[i].FindControl("txtDAY2") as TextBox;
                TextBox txtDAY3 = GridView1.Rows[i].FindControl("txtDAY3") as TextBox;
                TextBox txtDAY4 = GridView1.Rows[i].FindControl("txtDAY4") as TextBox;
                TextBox txtDAY5 = GridView1.Rows[i].FindControl("txtDAY5") as TextBox;
                TextBox txtDAY6 = GridView1.Rows[i].FindControl("txtDAY6") as TextBox;
                TextBox txtDAY7 = GridView1.Rows[i].FindControl("txtDAY7") as TextBox;
                TextBox txtDAY8 = GridView1.Rows[i].FindControl("txtDAY8") as TextBox;
                TextBox txtDAY9 = GridView1.Rows[i].FindControl("txtDAY9") as TextBox;
                TextBox txtDAY10 = GridView1.Rows[i].FindControl("txtDAY10") as TextBox;
                TextBox txtDAY11 = GridView1.Rows[i].FindControl("txtDAY11") as TextBox;
                TextBox txtDAY12 = GridView1.Rows[i].FindControl("txtDAY12") as TextBox;
                TextBox txtDAY13 = GridView1.Rows[i].FindControl("txtDAY13") as TextBox;
                TextBox txtDAY14 = GridView1.Rows[i].FindControl("txtDAY14") as TextBox;
                TextBox txtDAY15 = GridView1.Rows[i].FindControl("txtDAY15") as TextBox;
                TextBox txtDAY16 = GridView1.Rows[i].FindControl("txtDAY16") as TextBox;
                TextBox txtDAY17 = GridView1.Rows[i].FindControl("txtDAY17") as TextBox;
                TextBox txtDAY18 = GridView1.Rows[i].FindControl("txtDAY18") as TextBox;
                TextBox txtDAY19 = GridView1.Rows[i].FindControl("txtDAY19") as TextBox;
                TextBox txtDAY20 = GridView1.Rows[i].FindControl("txtDAY20") as TextBox;
                TextBox txtDAY21 = GridView1.Rows[i].FindControl("txtDAY21") as TextBox;
                TextBox txtDAY22 = GridView1.Rows[i].FindControl("txtDAY22") as TextBox;
                TextBox txtDAY23 = GridView1.Rows[i].FindControl("txtDAY23") as TextBox;
                TextBox txtDAY24 = GridView1.Rows[i].FindControl("txtDAY24") as TextBox;
                TextBox txtDAY25 = GridView1.Rows[i].FindControl("txtDAY25") as TextBox;
                TextBox txtDAY26 = GridView1.Rows[i].FindControl("txtDAY26") as TextBox;
                TextBox txtDAY27 = GridView1.Rows[i].FindControl("txtDAY27") as TextBox;
                TextBox txtDAY28 = GridView1.Rows[i].FindControl("txtDAY28") as TextBox;
                TextBox txtDAY29 = GridView1.Rows[i].FindControl("txtDAY29") as TextBox;
                TextBox txtDAY30 = GridView1.Rows[i].FindControl("txtDAY30") as TextBox;
                TextBox txtDAY31 = GridView1.Rows[i].FindControl("txtDAY31") as TextBox;

                TextBox txtOT1 = GridView1.Rows[i].FindControl("txtOT1") as TextBox;
                TextBox txtOT2 = GridView1.Rows[i].FindControl("txtOT2") as TextBox;
                TextBox txtOT3 = GridView1.Rows[i].FindControl("txtOT3") as TextBox;
                TextBox txtOT4 = GridView1.Rows[i].FindControl("txtOT4") as TextBox;
                TextBox txtOT5 = GridView1.Rows[i].FindControl("txtOT5") as TextBox;
                TextBox txtOT6 = GridView1.Rows[i].FindControl("txtOT6") as TextBox;
                TextBox txtOT7 = GridView1.Rows[i].FindControl("txtOT7") as TextBox;
                TextBox txtOT8 = GridView1.Rows[i].FindControl("txtOT8") as TextBox;
                TextBox txtOT9 = GridView1.Rows[i].FindControl("txtOT9") as TextBox;
                TextBox txtOT10 = GridView1.Rows[i].FindControl("txtOT10") as TextBox;
                TextBox txtOT11 = GridView1.Rows[i].FindControl("txtOT11") as TextBox;
                TextBox txtOT12 = GridView1.Rows[i].FindControl("txtOT12") as TextBox;
                TextBox txtOT13 = GridView1.Rows[i].FindControl("txtOT1") as TextBox;
                TextBox txtOT14 = GridView1.Rows[i].FindControl("txtOT14") as TextBox;
                TextBox txtOT15 = GridView1.Rows[i].FindControl("txtOT15") as TextBox;
                TextBox txtOT16 = GridView1.Rows[i].FindControl("txtOT16") as TextBox;
                TextBox txtOT17 = GridView1.Rows[i].FindControl("txtOT17") as TextBox;
                TextBox txtOT18 = GridView1.Rows[i].FindControl("txtOT18") as TextBox;
                TextBox txtOT19 = GridView1.Rows[i].FindControl("txtOT19") as TextBox;
                TextBox txtOT20 = GridView1.Rows[i].FindControl("txtOT20") as TextBox;
                TextBox txtOT21 = GridView1.Rows[i].FindControl("txtOT21") as TextBox;
                TextBox txtOT22 = GridView1.Rows[i].FindControl("txtOT22") as TextBox;
                TextBox txtOT23 = GridView1.Rows[i].FindControl("txtOT23") as TextBox;
                TextBox txtOT24 = GridView1.Rows[i].FindControl("txtOT24") as TextBox;
                TextBox txtOT25 = GridView1.Rows[i].FindControl("txtOT25") as TextBox;
                TextBox txtOT26 = GridView1.Rows[i].FindControl("txtOT26") as TextBox;
                TextBox txtOT27 = GridView1.Rows[i].FindControl("txtOT27") as TextBox;
                TextBox txtOT28 = GridView1.Rows[i].FindControl("txtOT28") as TextBox;
                TextBox txtOT29 = GridView1.Rows[i].FindControl("txtOT29") as TextBox;
                TextBox txtOT30 = GridView1.Rows[i].FindControl("txtOT31") as TextBox;
                TextBox txtOT31 = GridView1.Rows[i].FindControl("txtOT31") as TextBox;

                TextBox txtTOTAL = GridView1.Rows[i].FindControl("txtTOTAL") as TextBox;
                TextBox txtOTTOTAL = GridView1.Rows[i].FindControl("txtOTTOTAL") as TextBox;

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

            if (lblType.Checked == true)
            {
                Type = "1";
            }
            else
            {
                Type = "0";
            }

                ObjectBA.Attendance12and25Insert(lblEMPLOYEECODE.Text, lblDEPARTMENTID.Text, ddlclientname.SelectedValue, txtDAY1.Text, txtDAY2.Text,
                    txtDAY3.Text.ToUpper(), txtDAY4.Text.ToUpper(), txtDAY5.Text.ToUpper(), txtDAY6.Text.ToUpper(), txtDAY7.Text.ToUpper(), txtDAY8.Text.ToUpper(), txtDAY9.Text.ToUpper(), txtDAY10.Text.ToUpper(), txtDAY11.Text.ToUpper(), txtDAY12.Text,
                    txtDAY13.Text.ToUpper(), txtDAY14.Text.ToUpper(), txtDAY15.Text.ToUpper(), txtDAY16.Text.ToUpper(), txtDAY17.Text.ToUpper(), txtDAY18.Text.ToUpper(), txtDAY19.Text.ToUpper(), txtDAY20.Text.ToUpper(), txtDAY21.Text.ToUpper(),
                    txtDAY22.Text.ToUpper(), txtDAY23.Text.ToUpper(), txtDAY24.Text.ToUpper(), txtDAY25.Text.ToUpper(), txtDAY26.Text.ToUpper(), txtDAY27.Text.ToUpper(), txtDAY28.Text.ToUpper(), txtDAY29.Text.ToUpper(), txtDAY30.Text.ToUpper(),
                    txtDAY31.Text.ToUpper(), txtOT1.Text, txtOT2.Text, txtOT3.Text, txtOT4.Text, txtOT5.Text, txtOT6.Text, txtOT7.Text, txtOT8.Text, txtOT9.Text,
                    txtOT10.Text, txtOT11.Text, txtOT12.Text, txtOT13.Text, txtOT14.Text, txtOT15.Text, txtOT16.Text, txtOT17.Text, txtOT18.Text, txtOT19.Text, txtOT20.Text,
                    txtOT21.Text, txtOT22.Text, txtOT23.Text, txtOT24.Text, txtOT25.Text, txtOT26.Text, txtOT27.Text, txtOT28.Text, txtOT29.Text, txtOT30.Text, txtOT31.Text,
                    Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString(), Type, txtTOTAL.Text, txtOTTOTAL.Text);
            
        }
    }

    private void checkedEx()
    {
        dt = ObjectBA.SelectDailyAttendaceCheck(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlclientname.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            Errors = "1";
        }
    }

    private void AttendanceSave()
    {

        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            Label Code = GridView1.Rows[i].FindControl("lblEMPLOYEECODE") as Label;

            dt = ObjectBA.SelectEmployeeCompanyDetailCheckExl(Convert.ToString(Convert.ToDouble(Code.Text).ToString("0####")), ddlclientname.SelectedValue);
            
            con.Close();
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
                    //Label sts = GridView1.Rows[i].FindControl("DAY" + j) as Label;

                    //string status = GridView1.Rows[i].Cells[1 + j].Text;

                    int count = j + 1;

                    TextBox status = GridView1.Rows[i].FindControl("txtDAY" + count) as TextBox;

                    TextBox OTStatus = GridView1.Rows[i].FindControl("txtOT" + count) as TextBox;

                    if (status.Text.ToUpper() == "")
                    {
                        status.Text = GridView1.Rows[i].Cells[count].Text;
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
                        ObjectBA.InsertDailyAttendane(Fromdate.ToShortDateString(), ddlclientname.SelectedValue, txtdivisionname.Text, dt.Rows[0]["EMPLOYEEID"].ToString(),
                        dt.Rows[0]["EMPLOYEECODE"].ToString(), dt.Rows[0]["DEPARTMENTID"].ToString(), workedhour, "0",
    dt.Rows[0]["OTAMOUNT"].ToString(), dt.Rows[0]["BASICDA"].ToString(), dt.Rows[0]["HRA"].ToString(), dt.Rows[0]["CONVEYANCE"].ToString(),
    dt.Rows[0]["WASHING"].ToString(), dt.Rows[0]["OTHER"].ToString(), dt.Rows[0]["PFID"].ToString(), dt.Rows[0]["ESIID"].ToString(), "0", "0",
    OTStatus.Text, "0","0", "0", status.Text.ToUpper(), dt.Rows[0]["OTAMOUNT2"].ToString(), dt.Rows[0]["OTAMOUNT3"].ToString());
                    }

                    Fromdate = Fromdate.AddDays(1);
                }
            }            
        }
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    public void Clearnew()
    {
        ddlclientname.Items.Clear();
        ddlclientname.Items.Add("---Select Client Name---");
        ddlclientnameLoad();
        txtfromdate.Text = "";
        txttodate.Text = "";
        txtdivisionname.Text = "";
        txttotalnoofemployees.Text = "";
        listOfEmp.Items.Clear();

        GridView1.DataSource = null;
        GridView1.DataBind();
        txttotalmd.Text = "0";
        txttotalet.Text = "0";
        txtaa.Text = "0";
        txtcl.Text = "0";
        txtcoff.Text = "0";
        txtel.Text = "0";
        txtnh.Text = "0";
        txtph.Text = "0";
        txtsl.Text = "0";
        txtlop.Text = "0";        
    }

    protected void txtdivisionname_TextChanged(object sender, EventArgs e)
    {
        txtdivisionname.Text = txtdivisionname.Text.ToUpper();
    }

    protected void listOfEmp_SelectedIndexChanged(object sender, EventArgs e)
    {

        listOfEmp.Focus();
    }

    protected void btnTemplet_Click(object sender, EventArgs e)
    {
        
    }

    protected void btnGetEmp_Click(object sender, EventArgs e)
    {
        checkedEx();

        if (Errors != "0")
        {
            // MSG
            System.Threading.Thread.Sleep(100);
            string message = "alert('Same Data Already Here..')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
        }
        else
        {
            if (txtfromdate.Text.Trim() == "")
            {
                System.Threading.Thread.Sleep(100);
                string message = "alert('Enter the From Date')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                txtfromdate.Focus();
            }

            else if (txttodate.Text.Trim() == "")
            {
                System.Threading.Thread.Sleep(100);
                string message = "alert('Enter the To Date')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                txttodate.Focus();
            }

            else if (ddlclientname.Text.Trim() == "---Select Client Name---")
            {
                System.Threading.Thread.Sleep(100);
                string message = "alert('Enter the Client Name')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                ddlclientname.Focus();
            }

            string workedhour = "";
            int DayCount = 0;
            GridView1.Columns[33].Visible = true;
            GridView1.Columns[34].Visible = true;
            GridView1.Columns[35].Visible = true;
            //DateTime Fromdate = Convert.ToDateTime(txtfromdate.Text);
            //DateTime Todate = Convert.ToDateTime(txttodate.Text);
            //DayCount = Convert.ToInt16((Todate - Fromdate).TotalDays);
            //DayCount = DayCount + 1;

            GridView1.DataSource = ObjectBA.SelectMonthlyAttendanceExport(ddlclientname.SelectedValue,Convert.ToDateTime(txttodate.Text).ToShortDateString());
            GridView1.DataBind();

            txttotalnoofemployees.Text = GridView1.Rows.Count.ToString();

            dt = ObjectBA.SelectMonthlyAttendanceExport(ddlclientname.SelectedValue, Convert.ToDateTime(txttodate.Text).ToShortDateString());
            if (dt.Rows.Count > 0)
            {
                DataGridColumnText();

                for (int i = 0; dt.Rows.Count > i; i++)
                {
                    DateTime Fromdate = Convert.ToDateTime(txtfromdate.Text);
                    DateTime Todate = Convert.ToDateTime(txttodate.Text);
                    DayCount = Convert.ToInt16((Todate - Fromdate).TotalDays);
                    DayCount = DayCount + 1;
                    CalculateColumn(i);
                    if (DayCount <= 31)
                    {
                        for (int j = 0; DayCount > j; j++)
                        {
                            string day = Fromdate.DayOfWeek.ToString();
                            int date = j + 1;

                            if (day == "Sunday")
                            {
                                TextBox Day = GridView1.Rows[i].FindControl("txtDay" + date) as TextBox;

                                //GridView1.Columns[j + 3].HeaderText = "DAY" + dayscount;

                                Day.Text = "WH";

                                //GridView1.Rows[i].Cells[date].Text = "WH";
                                //GridView1.DataBind();
                                //TextBox Day = GridView1.Rows[i].FindControl("txtDay" + date) as TextBox;
                                //GridView1.Rows[i].FindControl("txtDay" + date).ToString() = Day.Text;
                            }

                            Fromdate = Fromdate.AddDays(1);
                        }
                        int Extra = 31 - DayCount;

                        if (Extra > 0)
                        {
                            int Days = DayCount;
                            Days = Days + 4;
                            for (int k = 0; Extra > k; k++)
                            {
                                if (31 >= DayCount)
                                {
                                    Days = Days + 1;
                                    GridView1.Columns[Days].Visible = false;
                                    GridView1.Rows[i].Cells[Days].Visible = false;
                                }
                            }
                        }
                    }
                    else
                    {
                        GridView1.DataSource = null;
                        GridView1.DataBind();

                        ///Grid Cleart And Mesg days count Greater than 31
                        System.Threading.Thread.Sleep(100);
                        string message = "alert('days count Greater than 31')";
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                    }
                }
            }
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
                GridView1.Columns[j + 5].HeaderText = "DAY" + dayscount;
                Fromdate = Fromdate.AddDays(1);

            }
            GridView1.DataBind();
        }
        
    }

    private void CalculateColumn(int i)
    {
        //int date = 0;
        //date = i + 1;
        //TextBox txtDAY1 = GridView1.Rows[i].FindControl("txtDAY1") as TextBox;
        //if (txtDAY1.Text == "XX")
        //{

        //}
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        
    }
    protected void btnCalc_Click(object sender, EventArgs e)
    {
        decimal TotMD = 0, TotET = 0, TotAB = 0, TotCL = 0, TotEL = 0, TotPH = 0, TotNH = 0, TOtCOFF = 0, TotSL = 0, TotLOP = 0;

        int CellVal = 0;

        if (GridView1.Rows.Count > 0)
        {
                    
            for (int i = 0; GridView1.Rows.Count > i; i++)
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

                    TextBox TypeStatus = GridView1.Rows[i].FindControl("txtDAY" + date) as TextBox;
                    
                    TextBox OTTypeStatus = GridView1.Rows[i].FindControl("txtOT" + date) as TextBox;

                    if (OTTypeStatus.Text == "")
                    {
                        OTTypeStatus.Text = "0";
                    }

                    if (OTTypeStatus.Text != "0")
                    {
                        OTDays += Convert.ToDecimal(OTTypeStatus.Text);

                        TextBox FootTotOT = GridView1.FooterRow.FindControl("txtTotalOT" + date) as TextBox;
                        if (CellVal == 0)
                        {
                            FootTotOT.Text = "0";
                        }
                        if (FootTotOT.Text == "")
                        {
                            FootTotOT.Text = "0";
                        }
                        ColumnOTTot = Convert.ToDecimal(FootTotOT.Text) + Convert.ToDecimal(OTTypeStatus.Text);
                        FootTotOT.Text = ColumnOTTot.ToString("###0.00");
                    }

                    TextBox FootTot = GridView1.FooterRow.FindControl("txtTotDAY" + date) as TextBox;
                    if (FootTot.Text == "")
                    {
                        FootTot.Text = "0";
                    }
                    if (CellVal == 0)
                    {
                        FootTot.Text = "0";
                    }

                    if (TypeStatus.Text.ToUpper() == "XX" || TypeStatus.Text.ToUpper() == "CL" || TypeStatus.Text.ToUpper() == "EL" || TypeStatus.Text.ToUpper() == "PH" || TypeStatus.Text.ToUpper() == "NH" || TypeStatus.Text.ToUpper() == "COFF" || TypeStatus.Text.ToUpper() == "SL")
                    {
                        PresentDays += 1;
                        ColumnTot = Convert.ToDecimal(FootTot.Text) + 1;
                        FootTot.Text = ColumnTot.ToString("##0.00");

                    }
                    if (TypeStatus.Text.ToUpper() == "XA" || TypeStatus.Text.ToUpper() == "AX" )
                    {
                        PresentDays += Convert.ToDecimal(0.5);                        
                        ColumnTot = Convert.ToDecimal(FootTot.Text) + Convert.ToDecimal(0.5);
                        FootTot.Text = ColumnTot.ToString("##0.00");

                        Absent += Convert.ToDecimal(0.5);

                        //LOP += Convert.ToDecimal(0.5);
                    }


                    if (GridView1.Rows[i].Cells[set].Text == "WH")
                    {
                        string TypeSunday = GridView1.Rows[i].Cells[set].Text;

                        GridView1.Rows[i].Cells[set].Text = TypeSunday;
                    }

                    if (TypeStatus.Text.ToUpper() == "AA")
                    {
                        Absent += 1;
                      
                    }

                    if (TypeStatus.Text.ToUpper() == "CL")
                    {
                        CL += 1;
                    }
                    if (TypeStatus.Text.ToUpper() == "EL")
                    {
                        EL += 1;
                    }
                    if (TypeStatus.Text.ToUpper() == "PH")
                    {
                        PH += 1;
                    }

                    if (TypeStatus.Text.ToUpper() == "NH")
                    {
                        NH += 1;
                    }

                    if (TypeStatus.Text.ToUpper() == "COFF")
                    {
                        COFF += 1;
                    }

                    if (TypeStatus.Text.ToUpper() == "SL")
                    {
                        SL += 1;
                    }
                    if (TypeStatus.Text.ToUpper() == "LOP")
                    {
                        LOP += 1;
                    }

                    Fromdate = Fromdate.AddDays(1);
                }

                //GridView1.Rows[i].Cells[32].Text = PresentDays.ToString();
                
                TextBox txtTOTAL = GridView1.Rows[i].FindControl("txtTOTAL") as TextBox;

                txtTOTAL.Text = PresentDays.ToString("##0.00");

                TextBox TOTALOT = GridView1.Rows[i].FindControl("txtOTTOTAL") as TextBox;

                TOTALOT.Text = OTDays.ToString("##0.00");

                TotMD += Convert.ToDecimal(PresentDays);
                txttotalmd.Text = TotMD.ToString("##0.00");

                TotET += Convert.ToDecimal(OTDays);
                txttotalet.Text = TotET.ToString("##0.00");

                TotAB += Convert.ToDecimal(Absent);
                txtaa.Text = TotAB.ToString("##0.00");

                TotCL += Convert.ToDecimal(CL);
                txtcl.Text = TotCL.ToString("##0.00");

                TotEL += Convert.ToDecimal(EL);
                txtel.Text = TotEL.ToString("##0.00");

                TotPH += Convert.ToDecimal(PH);
                txtph.Text = TotPH.ToString("##0.00");

                TotNH += Convert.ToDecimal(NH);
                txtnh.Text = TotNH.ToString("##0.00");

                TOtCOFF += Convert.ToDecimal(COFF);
                txtcoff.Text = TOtCOFF.ToString("##0.00");

                TotSL += Convert.ToDecimal(SL);
                txtsl.Text = TotSL.ToString("##0.00");

                TotLOP += Convert.ToDecimal(LOP);
                txtlop.Text = TotLOP.ToString("##0.00");

                CellVal = 1;
            }           
        }

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
    }

    protected void ddlclientname_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = ObjectBA.SelectClientDetailID(ddlclientname.SelectedValue);
        txtdivisionname.Text = dt.Rows[0]["DIVISION"].ToString();
        
    }

    protected void GridView1_Load(object sender, EventArgs e)
    {
        
    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
}