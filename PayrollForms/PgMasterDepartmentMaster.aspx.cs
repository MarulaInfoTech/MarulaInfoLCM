using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using BLL;

public partial class PageDepartmentMaster : System.Web.UI.Page
{

    ClsBusnssLayer objectBL = new ClsBusnssLayer();

    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    //SqlConnection con = new SqlConnection("Server=WHYNOT;Database=SuryaOnline;user=sa;password=Whynot@94896;");
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();
    string Error = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";
        if (!IsPostBack)
        {            
            DgDepartmentLoad();
            ddlclientnameviewLoad();
            ddlclientnameLoad();
        }     
    }

    private void ddlclientnameviewLoad()
    {
        ddlclientnameview.Items.Clear();
        ddlclientnameview.Items.Add("---- Select Client -------");
        ddlclientnameview.DataSource = objectBL.SelectClinet();
        ddlclientnameview.DataTextField = "CLIENTNAME";
        ddlclientnameview.DataValueField = "CLIENTID";
        ddlclientnameview.DataBind();
    }

    private void DgDepartmentLoad()
    {
        DgDepartment.DataSource = objectBL.SelectDepartment();
        DgDepartment.DataBind();
    }

    private void ddlclientnameLoad()
    {
        ddlclientname.Items.Clear();
        ddlclientname.Items.Add("---- Select Client -------");
        ddlclientname.DataSource = objectBL.SelectClinet();
        ddlclientname.DataTextField = "CLIENTNAME";
        ddlclientname.DataValueField = "CLIENTID";
        ddlclientname.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (ddlclientname.Text == "---- Select Client -------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Client Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlclientname.Focus();
        }

        else if (txtdepartmentcode.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Designation Code')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtdepartmentcode.Focus();
        }

        else if (txtdepartmentname.Text.Trim() == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Department Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtdepartmentname.Focus();
        }

        else
        {

            if (btnsave.Text == "Save")
            {
                checkError();
                if (Error == "0")
                {
                    objectBL.InsertDptData(txtdepartmentcode.Text, txtdepartmentname.Text, ddlclientname.SelectedValue);
                    NewLoad();
                    DgDepartmentLoad();

                    System.Threading.Thread.Sleep(100);
                    string message = "alert('Data Save')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                }
                else
                {
                    //----- Message box exists
                    //Message-Box-Show-Data-Already-Code    
                    System.Threading.Thread.Sleep(100);
                    string messagealready = "alert('Same Data Already Here')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", messagealready, true);
                }
            }
            else
            {
                objectBL.UpdateDetData(txtdepartmentcode.Text, txtdepartmentname.Text, ddlclientname.SelectedValue, TypeID.Text);
                NewLoad();
                DgDepartmentLoad();

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            }
        }
    }

    private void checkError()
    {
        //        con.Close();
        //        con.Open();
        //        string CheckEx = @"SELECT        dbo.DepartmentMaster.DEPARTMENTID, dbo.DepartmentMaster.DEPARTMENTCODE, dbo.DepartmentMaster.DEPARTMENTNAME, dbo.DepartmentMaster.CLIENTID, dbo.ClientDetail.CLIENTNAME
        //FROM            dbo.DepartmentMaster INNER JOIN
        //                         dbo.ClientDetail ON dbo.DepartmentMaster.CLIENTID = dbo.ClientDetail.CLIENTID
        //WHERE        (dbo.DepartmentMaster.DEPARTMENTNAME = '"+ txtdepartmentname.Text +"')";
        //        da = new SqlDataAdapter(CheckEx, con);
        DataTable dt = new DataTable();
        dt = objectBL.SelectDepartmentDept(txtdepartmentname.Text,ddlclientname.SelectedValue);        
        if (dt.Rows.Count > 0)
        {
            Error = "1";
        }
        con.Close();
    }

    protected void ddlclientname_SelectedIndexChanged(object sender, EventArgs e)
    {
        dt = objectBL.SelectClientDetailID(ddlclientname.SelectedValue);
        txtdivi.Text = dt.Rows[0]["DIVISION"].ToString();

        //con.Close();
        //con.Open();
        //string str = @"select max(DEPARTMENTCODE) as DEPARTMENTCODE from DepartmentMaster where CLIENTID='" + ddlclientname.SelectedValue +"'";
        //da = new SqlDataAdapter(str, con);

        dt = new DataTable();
        dt = objectBL.SelectDepartmentMasterIDMax(ddlclientname.SelectedValue);
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["DEPARTMENTCODE"].ToString() == "")
            {
                txtdepartmentcode.Text = "0001";
            }
            else
            {
                decimal dptcode = Convert.ToDecimal(dt.Rows[0]["DEPARTMENTCODE"]);
                dptcode = dptcode + 1;
                txtdepartmentcode.Text = dptcode.ToString("0###");
            }
            
        }
        con.Close();
    }

    protected void DgDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label Dptid = DgDepartment.SelectedRow.FindControl("lblDptID") as Label;
        Label Code = DgDepartment.SelectedRow.FindControl("lblDptCode") as Label;
        Label Name = DgDepartment.SelectedRow.FindControl("lblDptName") as Label;
        Label division = DgDepartment.SelectedRow.FindControl("lblClntdivision") as Label;

        Label ClntID = DgDepartment.SelectedRow.FindControl("lblClntID") as Label;

        TypeID.Text = Dptid.Text;
        ddlclientname.SelectedValue = ClntID.Text;
        txtdepartmentcode.Text = Code.Text;
        txtdepartmentname.Text = Name.Text;
        txtdivi.Text = division.Text;

        btnsave.Text = "Update";
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        NewLoad();
    }

    private void NewLoad()
    {
        ddlclientname.ClearSelection();
        txtdepartmentcode.Text = "";
        txtdepartmentname.Text = "";
        txtdivi.Text = "";
        btnsave.Text = "Save";
    }

    protected void txtdepartmentname_TextChanged(object sender, EventArgs e)
    {
        txtdepartmentname.Text = txtdepartmentname.Text.ToUpper();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";

        DgDepartment.DataSource = objectBL.SelectDepartmentClnt(ddlclientnameview.SelectedValue);
        DgDepartment.DataBind();
    }

    protected void txtdepartmentcode_TextChanged(object sender, EventArgs e)
    {
    }
}