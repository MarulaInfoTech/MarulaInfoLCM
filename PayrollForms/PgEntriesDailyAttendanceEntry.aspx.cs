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

public partial class PayrollForms_PgEntriesDailyAttendanceEntry : System.Web.UI.Page
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
        if(!IsPostBack)
        {
            ddlclientnameLoad();
        }        
    }

    private void ddlclientnameLoad()
    {
        ddlclientname.DataSource = ObjectBA.SelectClinet();
        ddlclientname.DataTextField = "CLIENTNAME";
        ddlclientname.DataValueField = "CLIENTID";
        ddlclientname.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        // Label Empid = GridView1.Rows[e.RowIndex].FindControl("EMPLOYEEID") as Label;
        //TextBox Code = GridView1.Rows[e.RowIndex].FindControl("EMPLOYEECODE") as TextBox;
        //TextBox Name = GridView1.Rows[e.RowIndex].FindControl("APPLICATIONAME") as TextBox;
        //TextBox deptID = GridView1.Rows[e.RowIndex].FindControl("APPLICATIONAME") as TextBox;

        if (GridView1.Rows.Count > 0)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                InsertAttendanceDetail(i);
            }

            //Save
            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            Clearnew();           
        }
    }
    private void InsertAttendanceDetail(int i)
    {
        string workedhour = "";
        Label Empid = GridView1.Rows[i].FindControl("lblEmpID") as Label;
        Label Code = GridView1.Rows[i].FindControl("lblEmpNo") as Label;
        Label Name = GridView1.Rows[i].FindControl("lblEmpName") as Label;
        Label deptName = GridView1.Rows[i].FindControl("lblEmpDpt") as Label;
        Label deptID = GridView1.Rows[i].FindControl("lblEmpDptID") as Label;
        DropDownList sts = GridView1.Rows[i].FindControl("ddlStatus") as DropDownList;
        string status = sts.SelectedValue;
        Label BasicDA = GridView1.Rows[i].FindControl("lblbasicDA") as Label;
        Label HRA = GridView1.Rows[i].FindControl("lblHra") as Label;
        Label Conveyance = GridView1.Rows[i].FindControl("lblConve") as Label;
        Label Washing = GridView1.Rows[i].FindControl("lblWahing") as Label;
        Label Other = GridView1.Rows[i].FindControl("lblOther") as Label;
        Label OTAmount = GridView1.Rows[i].FindControl("lblAmount") as Label;

        Label lblAmount2 = GridView1.Rows[i].FindControl("lblAmount2") as Label;
        Label lblAmount3 = GridView1.Rows[i].FindControl("lblAmount3") as Label;

        Label PFID = GridView1.Rows[i].FindControl("lblpfid") as Label;
        Label ESI = GridView1.Rows[i].FindControl("lblesiid") as Label;

        TextBox txtET1 = GridView1.Rows[i].FindControl("txtET1") as TextBox;
        object OT1 = txtET1.Text;
        TextBox txtET2 = GridView1.Rows[i].FindControl("txtET2") as TextBox;
        object OT2 = txtET2.Text;
        TextBox txtET3 = GridView1.Rows[i].FindControl("txtET3") as TextBox;
        object OT3 = txtET3.Text;

        if(OT1=="")
        {
            OT1 = "0";
        }
        if(OT2=="")
        {
            OT2 = "0";
        }
        if(OT3=="")
        {
            OT3 = "0";
        }



        //string status = GridView1.Rows[i].Cells[13].Text;
        //string selectedCity = DataBinder.Eval(GridView1.Rows.DataItem, "City").ToString();
        //decimal txtET1 = Convert.ToDecimal(GridView1.Rows[i].FindControl("txtET2"));
        //decimal txtET2 = Convert.ToDecimal(GridView1.Rows[i].Cells[14].Text);
        //decimal txtET3 = Convert.ToDecimal(GridView1.Rows[i].Cells[14].Text);
        if (status == "XX")
        {
            workedhour = "8";
        }
        else if (status == "XA")
        {
            workedhour = "4";
        }
        else if (status == "AX")
        {
            workedhour = "4";
        }
        else if (status == "AA")
        {
            workedhour = "0";
        }
        else if (status == "CL")
        {
            workedhour = "8";
        }
        else if (status == "EL")
        {
            workedhour = "8";
        }
        else if (status == "PH")
        {
            workedhour = "8";
        }

        else if (status == "NH")
        {
            workedhour = "8";
        }

        else if (status == "COFF")
        {
            workedhour = "8";
        }

        else if (status == "LOP")
        {
            workedhour = "0";
        }

        else if (status == "SL")
        {
            workedhour = "8";
        }

        if (status == "Status")
        {

        }
        else
        {
            DeleteAttendanceEntry(txtattendancedate.Text, ddlclientname.SelectedValue, Empid.Text);
            ObjectBA.InsertDailyAttendane(txtattendancedate.Text, ddlclientname.SelectedValue, txtDivi.Text, Empid.Text, Code.Text, deptID.Text, workedhour, "0",
            OTAmount.Text, BasicDA.Text, HRA.Text, Conveyance.Text, Washing.Text, Other.Text, PFID.Text, ESI.Text, "0", "0",
            OT1.ToString(), OT2.ToString(), OT3.ToString(), "0", status.ToString(), lblAmount2.Text, lblAmount3.Text);
        }        
    }

    private void DeleteAttendanceEntry(string Date, string ClntID, string EmpID)
    {
        ObjectBA.DeleteAttendanceEntry(Convert.ToDateTime(Date).ToShortDateString(), EmpID, ClntID);
    }

    protected void ddlclientname_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = ObjectBA.SelectClientDetailID(ddlclientname.SelectedValue);
        txtDivi.Text = dt.Rows[0]["DIVISION"].ToString();
        
        ddlselectdepartmentLoad();
    }

    private void ddlselectdepartmentLoad()
    {
        //ddlselectdepartment.DataSource = ObjectBA.SelectDepartmentClnt(ddlclientname.SelectedValue);
        //ddlselectdepartment.DataTextField = "DEPARTMENTNAME";
        //ddlselectdepartment.DataValueField = "DEPARTMENTID";
        //ddlselectdepartment.DataBind();
    }

    protected void btngetemployees_Click(object sender, EventArgs e)
    {
        if (txtattendancedate.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Attendance Date')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtattendancedate.Focus();            
        }
        else if (ddlclientname.Text == "---Select Client Name---")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Client Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlclientname.Focus();           
        }       
        else
        {
            //DgCompany.DataSource = ObjectBA.SelectApplicationDetail();
            //DgCompany.DataBind();
            DgCompanyLoad();

            if (GridView1.Rows.Count > 0)          /* //--------messagebox show visible false//*/
            {
                MessageBox.Visible = false;
            }
            else
            {
                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            }
        }
    }

    private void DgCompanyLoad()
    {
        GridView1.DataSource = ObjectBA.SelectEmployeeAttendaceDetail(ddlclientname.SelectedValue);
        GridView1.DataBind();

        if (GridView1.Rows.Count > 0)
        {
            txttotalnoofemployees.Text = GridView1.Rows.Count.ToString();
        }
        else
        {
            txttotalnoofemployees.Text = "0";
        }
    }

    protected void GridView1_RowCancelingEdit(object sender, EventArgs e)
    {
        //DgCompany.DataSource = ObjectBA.SelectApplicationDetail();
        //DgCompany.DataBind();
        DgCompanyLoad();
    }
    protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        //NewEditIndex property used to determine the index of the row being edited.  
        GridView1.EditIndex = e.NewEditIndex;
        DgCompanyLoad();
    }
    protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        if (GridView1.Rows.Count > 0)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                InsertAttendanceDetail(i);
            }
   
            //MessageBox2.Visible = true;

            Clearnew();

            System.Threading.Thread.Sleep(100);
            string message = "alert('Data Save')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);

            //MessageBox2.ForeColor = System.Drawing.Color.Green;
            //MessageBox2.Text = "Data Save";
        }
    }

    protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
        GridView1.EditIndex = -1;
        DgCompanyLoad();
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
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
        txtattendancedate.Text = "";
        txtDivi.Text = "";
        txttotalnoofemployees.Text = "";
        GridView1.DataSource = null;
        GridView1.DataBind();
    }

    protected void txtDivi_TextChanged(object sender, EventArgs e)
    {
        txtDivi.Text = txtDivi.Text.ToUpper();
    }

}