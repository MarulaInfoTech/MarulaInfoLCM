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
using System.IO;

using BLL;
using System.Data.OleDb;
using System.Text;

public partial class PayrollForms_PgEmployeeImportEmployeeData : System.Web.UI.Page
{

    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();

    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    //SqlConnection con = new SqlConnection("Server=WHYNOT;Database=SuryaOnline;user=sa;password=Whynot@94896;");
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();

    public static string Grade, PFID, ESIID = "";
    public static string PFCity, PFSate, ESICity, ESISate = "";
    public static string dptID, DesgID, AppID = "";
    public static string PresentCity, PresentSate, PermenetCity, PermenetSate = "";
    public string Error = "0", SaveUpdate = "0";
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
        ddlcompanyname.Items.Add("---Select Client Name---");
        ddlcompanyname.DataSource = ObjectBA.SelectClinet();
        ddlcompanyname.DataValueField = "CLIENTID";
        ddlcompanyname.DataTextField = "CLIENTNAME";
        ddlcompanyname.DataBind();

    }

    protected void btndowtemp_Click(object sender, EventArgs e)
    {
        UploadFile();

        if (ddlcompanyname.SelectedItem.Text == "---Select Client Name---")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Client Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlcompanyname.Focus();
        }

        else if (txtdivisionname.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the DivisionName')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtdivisionname.Focus();
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
            conn.Close();
            if (Oldt.Rows.Count > 0)
            {
                gdEmployeeImport.DataSource = Oldt;
                gdEmployeeImport.DataBind();
                txttotalnoofemployees.Text = Oldt.Rows.Count.ToString();
                for (int i = 0; i < gdEmployeeImport.Rows.Count; i++)
                {
                    StateandCityID(i);
                    CheckApplicationNo(i);
                    //EmployeeApplicationID(i);
                    EmployeeCompanyStateandCityID(i);
                    ESIPFIdSelect(i);
                    DepartmentAndDesig(i);
                    SalaryGradeLoad(i);
                }
                
            }
            else
            {
                //----
                System.Threading.Thread.Sleep(100);
                string message = "alert('Excel File is Empty')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
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

        if (gdEmployeeImport.Rows.Count > 0)
        {
            for (int i = 0; i < gdEmployeeImport.Rows.Count; i++)
            {
                CheckApplicationNo(i);
                if (Error == "0")
                {
                    SaveEmployeeApplication(i);

                    if (Error == "0")
                    {
                        SaveEmployeeCompanyDetail(i);
                    }
                    else
                    {                      
                    }
                }  
            }

            if (SaveUpdate == "1")
            {               
                Clearnew();
                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            }           
        }
    }

    private void CheckApplicationNo(int i)
    {
        

        dt = new DataTable();
        dt = ObjectBA.SelectApplicationNoNamAdharCheck(gdEmployeeImport.Rows[i].Cells[0].Text, gdEmployeeImport.Rows[i].Cells[1].Text, gdEmployeeImport.Rows[i].Cells[25].Text);
        if (dt.Rows.Count > 0)
        {
            Error = "1";
            listOfEmp.Visible = true;/*-----------------------*/
            listOfEmp.Items.Add(gdEmployeeImport.Rows[i].Cells[0].Text + "----> Application Number Already Exist");
        }
        else
        {
            Error = "0";
        }
        con.Close();
    }

    private void SaveEmployeeCompanyDetail(int i)
    {
        EmployeeApplicationID(i);
        EmployeeCompanyStateandCityID(i);
        ESIPFIdSelect(i);
        DepartmentAndDesig(i);
        SalaryGradeLoad(i);
        if (Error == "0")
        {
          ObjectBA.InsertEmployeeCompanyDetail(AppID, gdEmployeeImport.Rows[i].Cells[28].Text, gdEmployeeImport.Rows[i].Cells[29].Text, gdEmployeeImport.Rows[i].Cells[30].Text,
          gdEmployeeImport.Rows[i].Cells[31].Text, ddlcompanyname.SelectedValue, dptID,
          DesgID, Grade, gdEmployeeImport.Rows[i].Cells[35].Text,
          gdEmployeeImport.Rows[i].Cells[36].Text, gdEmployeeImport.Rows[i].Cells[37].Text, gdEmployeeImport.Rows[i].Cells[38].Text,
          gdEmployeeImport.Rows[i].Cells[39].Text, gdEmployeeImport.Rows[i].Cells[40].Text, gdEmployeeImport.Rows[i].Cells[41].Text,
          gdEmployeeImport.Rows[i].Cells[42].Text, gdEmployeeImport.Rows[i].Cells[43].Text, PFID,
          gdEmployeeImport.Rows[i].Cells[45].Text, gdEmployeeImport.Rows[i].Cells[46].Text, ESIID,
          gdEmployeeImport.Rows[i].Cells[48].Text, gdEmployeeImport.Rows[i].Cells[49].Text, gdEmployeeImport.Rows[i].Cells[50].Text,
          gdEmployeeImport.Rows[i].Cells[51].Text, gdEmployeeImport.Rows[i].Cells[52].Text, gdEmployeeImport.Rows[i].Cells[53].Text,
          gdEmployeeImport.Rows[i].Cells[54].Text, gdEmployeeImport.Rows[i].Cells[55].Text, gdEmployeeImport.Rows[i].Cells[56].Text, gdEmployeeImport.Rows[i].Cells[89].Text,
          gdEmployeeImport.Rows[i].Cells[57].Text, gdEmployeeImport.Rows[i].Cells[58].Text, gdEmployeeImport.Rows[i].Cells[59].Text,
          gdEmployeeImport.Rows[i].Cells[60].Text, gdEmployeeImport.Rows[i].Cells[61].Text, gdEmployeeImport.Rows[i].Cells[62].Text,
          gdEmployeeImport.Rows[i].Cells[63].Text, gdEmployeeImport.Rows[i].Cells[64].Text, gdEmployeeImport.Rows[i].Cells[65].Text,
          gdEmployeeImport.Rows[i].Cells[66].Text, gdEmployeeImport.Rows[i].Cells[67].Text, PFCity,
          PFSate, gdEmployeeImport.Rows[i].Cells[70].Text, gdEmployeeImport.Rows[i].Cells[71].Text,
          gdEmployeeImport.Rows[i].Cells[72].Text, gdEmployeeImport.Rows[i].Cells[73].Text, gdEmployeeImport.Rows[i].Cells[74].Text,
          gdEmployeeImport.Rows[i].Cells[75].Text, gdEmployeeImport.Rows[i].Cells[76].Text, gdEmployeeImport.Rows[i].Cells[77].Text,
          ESICity, ESISate, gdEmployeeImport.Rows[i].Cells[80].Text,
          gdEmployeeImport.Rows[i].Cells[81].Text, gdEmployeeImport.Rows[i].Cells[82].Text, gdEmployeeImport.Rows[i].Cells[83].Text,
          gdEmployeeImport.Rows[i].Cells[84].Text, gdEmployeeImport.Rows[i].Cells[85].Text, gdEmployeeImport.Rows[i].Cells[86].Text,
          gdEmployeeImport.Rows[i].Cells[87].Text, gdEmployeeImport.Rows[i].Cells[88].Text);

            SaveUpdate = "1";
        }
        else
        {
            DeleteEmployeeApplication(i);
        }
      
    }
    private void SalaryGradeLoad(int i)
    {
        
        dt = new DataTable();
        dt = ObjectBA.SelectSalaryMasterGradeCheck(gdEmployeeImport.Rows[i].Cells[35].Text, ddlcompanyname.SelectedValue);
        
        if (dt.Rows.Count > 0)
        {
            Grade = dt.Rows[0]["SALARYID"].ToString();
        }
        else
        {
            Error = "1";
            Error = "1";
            // Msg Box
            listOfEmp.Visible = true;/*-----------------------*/  /* is not in EmployeeList*/
            listOfEmp.Items.Add(gdEmployeeImport.Rows[i].Cells[0].Text + "--->Salary Grade Not match");
        }
        con.Close();
    }

    private void ESIPFIdSelect(int i)
    {       

        dt = new DataTable();
        dt = ObjectBA.SelectPFCheck(gdEmployeeImport.Rows[i].Cells[44].Text);        
        if (dt.Rows.Count > 0)
        {
            PFID = dt.Rows[0]["PFID"].ToString();
        }
        else
        {
            
            Error = "1";
            // Msg Box
            listOfEmp.Visible = true;/*-----------------------*/  /* is not in EmployeeList*/
            listOfEmp.Items.Add(gdEmployeeImport.Rows[i].Cells[0].Text + "--->PF is No Match");
        }
        con.Close();

        

        dt = new DataTable();
        dt = ObjectBA.SelectESICheck(gdEmployeeImport.Rows[i].Cells[47].Text);
        
        if (dt.Rows.Count > 0)
        {
            ESIID = dt.Rows[0]["ESIID"].ToString();
        }
        else
        {
            Error = "1";
            // Msg Box
            listOfEmp.Visible = true;/*-----------------------*/  /* is not in EmployeeList*/
            listOfEmp.Items.Add(gdEmployeeImport.Rows[i].Cells[0].Text + "--->ESI is No Match");
        }
        con.Close();
    }

    private void DeleteEmployeeApplication(int i)
    {
        ObjectBA.DeleteApplication(AppID);
    }

    private void DepartmentAndDesig(int i)
    {
        dptID = "";
       
        dt = new DataTable();
        dt = ObjectBA.SelectDepartmentMasterCheck(gdEmployeeImport.Rows[i].Cells[32].Text, ddlcompanyname.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            dptID = dt.Rows[0]["DEPARTMENTID"].ToString();
        }
        else
        {
            Error = "1";
            listOfEmp.Visible = true;/*-----------------------*//* is not in EmployeeList*/
            listOfEmp.Items.Add(gdEmployeeImport.Rows[i].Cells[0].Text + "---> Department ID No Match");
        }
        con.Close();

        DesgID = "";
        
        dt = new DataTable();
        dt = ObjectBA.SelectDesignationMasterCheck(gdEmployeeImport.Rows[i].Cells[33].Text);
        if (dt.Rows.Count > 0)
        {
            DesgID = dt.Rows[0]["DESIGNATIONID"].ToString();
        }
        else
        {
            Error = "1";
            // Msg Box
            listOfEmp.Visible = true;/*-----------------------*/ /*is not in EmployeeList*/
            listOfEmp.Items.Add(gdEmployeeImport.Rows[i].Cells[0].Text + "---> Designation ID No Match");
        }
        con.Close();
    }

    private void EmployeeApplicationID(int i)
    {
        AppID = "";
        
        dt = new DataTable();
        dt = ObjectBA.SelectEmployeeApplicationID(gdEmployeeImport.Rows[i].Cells[0].Text.Trim());        
        if (dt.Rows.Count > 0)
        {
            AppID = dt.Rows[0]["APPLICATIONID"].ToString();
            
        }
        else
        {
            Error = "1";
            // Msg Box
            listOfEmp.Visible = true;/*-----------------------*/    /*is not in EmployeeList  Not Match*/
            listOfEmp.Items.Add(gdEmployeeImport.Rows[i].Cells[0].Text + "---> Application ID Not Found  ");
        }
        con.Close();
    }

    private void EmployeeCompanyStateandCityID(int i)
    {       
        PFCity = gdEmployeeImport.Rows[i].Cells[67].Text;
        PFSate = gdEmployeeImport.Rows[i].Cells[68].Text;
        ESICity = gdEmployeeImport.Rows[i].Cells[77].Text;
        ESISate = gdEmployeeImport.Rows[i].Cells[78].Text;

       
        dt = new DataTable();
        dt = ObjectBA.SelectCityAndStateID(PFCity, PFSate);        
        if (dt.Rows.Count > 0)
        {
            PFCity = dt.Rows[0]["CITYID"].ToString();
            PFSate = dt.Rows[0]["STATEID"].ToString();
        }
        else
        {
            Error = "1";
            // Msg Box
            listOfEmp.Visible = true;/*-----------------------*/  /* is not in EmployeeList*/
            listOfEmp.Items.Add(gdEmployeeImport.Rows[i].Cells[0].Text + "---> No Match PFCity And PFState ");
        }

        con.Close();

       
        dt = new DataTable();
        dt = ObjectBA.SelectCityAndStateID(ESICity, ESISate);
        if (dt.Rows.Count > 0)
        {
            ESICity = dt.Rows[0]["CITYID"].ToString();
            ESISate = dt.Rows[0]["STATEID"].ToString();
        }
        else
        {
            Error = "1";
            // Msg Box
            listOfEmp.Visible = true;/*-----------------------*/    /*is not in EmployeeList*/
            listOfEmp.Items.Add(gdEmployeeImport.Rows[i].Cells[0].Text + "---> No Match ESI City And State  ");
        }
        con.Close();
    }

    private void SaveEmployeeApplication(int i)
    {
        StateandCityID(i);

        if (Error == "0")
        {
            ObjectBA.InsertApplicationDetail(gdEmployeeImport.Rows[i].Cells[0].Text, DateTime.Now.ToShortDateString(),
            gdEmployeeImport.Rows[i].Cells[1].Text, gdEmployeeImport.Rows[i].Cells[2].Text, gdEmployeeImport.Rows[i].Cells[3].Text,
            gdEmployeeImport.Rows[i].Cells[4].Text, gdEmployeeImport.Rows[i].Cells[5].Text, gdEmployeeImport.Rows[i].Cells[6].Text,
            gdEmployeeImport.Rows[i].Cells[7].Text, gdEmployeeImport.Rows[i].Cells[8].Text, gdEmployeeImport.Rows[i].Cells[9].Text,
            gdEmployeeImport.Rows[i].Cells[10].Text, PresentCity, PresentSate,
            gdEmployeeImport.Rows[i].Cells[13].Text, gdEmployeeImport.Rows[i].Cells[14].Text, gdEmployeeImport.Rows[i].Cells[15].Text,
            PermenetCity, PermenetSate, gdEmployeeImport.Rows[i].Cells[18].Text,
            gdEmployeeImport.Rows[i].Cells[19].Text, gdEmployeeImport.Rows[i].Cells[20].Text, gdEmployeeImport.Rows[i].Cells[21].Text,
            gdEmployeeImport.Rows[i].Cells[22].Text, gdEmployeeImport.Rows[i].Cells[23].Text, gdEmployeeImport.Rows[i].Cells[24].Text,
            gdEmployeeImport.Rows[i].Cells[25].Text, gdEmployeeImport.Rows[i].Cells[26].Text, gdEmployeeImport.Rows[i].Cells[27].Text);

            SaveUpdate = "1";
        }
        else
        {
            Error = "1";
        }        
    }

    private void StateandCityID(int i)
    {
        PresentCity = gdEmployeeImport.Rows[i].Cells[11].Text;
        PresentSate = gdEmployeeImport.Rows[i].Cells[12].Text;

        PermenetCity = gdEmployeeImport.Rows[i].Cells[16].Text;
        PermenetSate = gdEmployeeImport.Rows[i].Cells[17].Text;

       
        dt = new DataTable();
        dt = ObjectBA.SelectCityAndStateID(PresentCity, PresentSate);
        if (dt.Rows.Count > 0)
        {
            PresentCity = dt.Rows[0]["CITYID"].ToString();
            PresentSate = dt.Rows[0]["STATEID"].ToString();           
        }
        else
        {
            Error = "1";
            // Msg Box
            listOfEmp.Visible = true;/*-----------------------*/  /* is not in EmployeeList*/
            listOfEmp.Items.Add(gdEmployeeImport.Rows[i].Cells[0].Text + "--->No Match PreCity And PreState");
        }

        con.Close();

       

        dt = new DataTable();
        dt = ObjectBA.SelectCityAndStateID(PermenetCity, PermenetSate);
        if (dt.Rows.Count > 0)
        {
            PermenetCity = dt.Rows[0]["CITYID"].ToString();
            PermenetSate = dt.Rows[0]["STATEID"].ToString();
        }
        else
        {
            Error = "1";
            // Msg BoxSelectFiles
            listOfEmp.Visible = true;/*-----------------------*/  /* is not in EmployeeList*/
            listOfEmp.Items.Add(gdEmployeeImport.Rows[i].Cells[0].Text + "--->No Match PermenetCity And PermenetSate");
        }
        con.Close();
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        Clearnew();
    }

    public void Clearnew()
    {
        ddlcompanyname.Items.Clear();
        ddlcompanyname.Items.Add("---Select Company Name---");
        ddlcompanynameLoad();
        txtdivisionname.Text = "";
        gdEmployeeImport.DataSource = null;
        gdEmployeeImport.DataBind();
        //listOfEmp.Items.Clear();
        //listOfEmp.Visible = false;

        txttotalnoofemployees.Text = "";

        lblemployeecode.Text = "";
        lblapplicationno.Text = "";


    }

    protected void ddlcompanyname_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = ObjectBA.SelectClientDetailID(ddlcompanyname.SelectedValue);
        txtdivisionname.Text = dt.Rows[0]["DIVISION"].ToString();

        dt = new DataTable();
        dt = ObjectBA.SelectApplicationCountForImport();
        
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0][0].ToString() != "")
            {
                lblapplicationno.Text = "Employee Application Start from---->" + (Convert.ToDouble(dt.Rows[0][0]) + 1);
            }
            else
            {
                lblapplicationno.Text = "Employee Application Start from---->1";
            }
               
        }

        dt = ObjectBA.SelectEmployeeCountForImport(ddlcompanyname.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0][0].ToString() != "")
            {
                lblemployeecode.Text = "Employee Code Start from---->" + (Convert.ToDouble(dt.Rows[0][0]) + 1).ToString("0####"); ;                    
            }
            else
            {
                lblemployeecode.Text = "Employee Code Start from---->00001";
            }
            
        }                
    }
}