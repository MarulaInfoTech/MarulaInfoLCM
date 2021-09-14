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
using System.Drawing;

public partial class PayrollForms_PgEmployeeViewAndEdit : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBL = new ClsBusnssLayer();
    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();

    public string UpdateforLOad = "0";

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
        ddlclientname.DataSource = ObjectBL.SelectClinet();
        ddlclientname.DataValueField = "CLIENTID";
        ddlclientname.DataTextField = "CLIENTNAME";
        ddlclientname.DataBind();
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        if (txtfromdate.Text.Trim() == "" && txttodate.Text.Trim() == "")
        {
            string Clnt = "", Dpt = "";
            if (ddlclientname.Text == "---Select Client Name---")
            {
                Clnt = "";
            }
            else
            {
                Clnt = ddlclientname.SelectedValue;
            }

            if (ddldepartmentname.Text == "---Select Department Name---" || ddldepartmentname.Text == "ALL Department")
            {
                Dpt = "";
            }
            else
            {
                Dpt = ddldepartmentname.SelectedItem.Text;
            }
            if (Clnt == "")
            {
                GDEmpViewandEdit.DataSource = ObjectBL.SelectCompanyDetailEditAll(Dpt, txtemployeecode.Text, Clnt);
                GDEmpViewandEdit.DataBind();
                ColorColumn();
            }
            else
            {
                GDEmpViewandEdit.DataSource = ObjectBL.EmployeeCompanyDetailEditOnUnit(Dpt, txtemployeecode.Text, Clnt);
                GDEmpViewandEdit.DataBind();
                ColorColumn();
            }
            
        }
        else if (ddlclientname.Text == "---Select Client Name---" && txtfromdate.Text.Trim() == "" && txttodate.Text.Trim() == "" && ddldepartmentname.Text == "---Select Department Name---")
        {
            GDEmpViewandEdit.DataSource = ObjectBL.SelectCompanyDetailEditCode(txtemployeecode.Text);
             
            GDEmpViewandEdit.DataBind();
            ColorColumn();
        }

        else if (txtemployeecode.Text == "" && ddldepartmentname.Text == "---Select Department Name---")
        {
            string Clnt = "";
            if (ddlclientname.Text == "---Select Client Name---")
            {
                Clnt = "";
            }
            else
            {
                Clnt = ddlclientname.SelectedItem.Text;
            }
            GDEmpViewandEdit.DataSource = ObjectBL.SelectCompanyDetailEditClient(txtfromdate.Text, txttodate.Text, Clnt);
            GDEmpViewandEdit.DataBind();
            ColorColumn();
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
            GDEmpViewandEditLoad();

            if (GDEmpViewandEdit.Rows.Count > 0)          /* //--------messagebox show visible false//*/
            {
                //lblMessageBox.Visible = false;
            }
            else
            {
                System.Threading.Thread.Sleep(100);
                string messagealready = "alert('Employee Data Is Empty')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", messagealready, true);
            }
        }
    }

    private void ColorColumn()
    {
        for (int i = 0; GDEmpViewandEdit.Rows.Count > i; i++)
        {
            Label lbleveemployeestatus = GDEmpViewandEdit.Rows[i].FindControl("lbleveemployeestatus") as Label;
            if (lbleveemployeestatus.Text == "Working")
            {

            }
            else
            {
                GDEmpViewandEdit.Rows[i].BackColor = Color.Pink;
            }
        }
    }

    private void GDEmpViewandEditLoad()
    {
        if (txtfromdate.Text.Trim() == "" && txttodate.Text.Trim() == "")
        {
            string Clnt = "", Dpt = "";
            if (ddlclientname.Text == "---Select Client Name---")
            {
                Clnt = "";
            }
            else
            {
                Clnt = ddlclientname.SelectedItem.Text;
            }

            if (ddldepartmentname.Text == "---Select Department Name---" || ddldepartmentname.Text == "ALL Department")
            {
                Dpt = "";
            }
            else 
            {
                Dpt = ddldepartmentname.SelectedItem.Text;
            }

            GDEmpViewandEdit.DataSource = ObjectBL.SelectCompanyDetailEditAll(Dpt, txtemployeecode.Text, Clnt);
             
            GDEmpViewandEdit.DataBind();
            ColorColumn();

        }
        else if (ddlclientname.Text == "---Select Client Name---" && txtfromdate.Text.Trim() == "" && txttodate.Text.Trim() == "" && ddldepartmentname.Text == "---Select Department Name---")
        {
            GDEmpViewandEdit.DataSource = ObjectBL.SelectCompanyDetailEditCode(txtemployeecode.Text);
             
            GDEmpViewandEdit.DataBind();
            ColorColumn();

        }

        else if (txtemployeecode.Text == "" && ddldepartmentname.Text == "---Select Department Name---")
        {
            string Clnt = "";
            if (ddlclientname.Text == "---Select Client Name---")
            {
                Clnt = "";
            }
            else
            {
                Clnt = ddlclientname.SelectedItem.Text;
            }
            GDEmpViewandEdit.DataSource = ObjectBL.SelectCompanyDetailEditClient(txtfromdate.Text, txttodate.Text, Clnt);
            GDEmpViewandEdit.EditIndex = -1;
            GDEmpViewandEdit.DataBind();
            ColorColumn();

        }

        //string dpt = "";
        //if (ddldepartmentname.Text == "---Select Department Name---" || ddldepartmentname.Text == "ALL Department")
        //{
        //    dpt = "";
        //}
        //else
        //{
        //    dpt = ddldepartmentname.SelectedItem.ToString();
        //}
        //GDEmpViewandEdit.DataSource = ObjectBL.SelectCompanyDetailEdit(txtfromdate.Text, txttodate.Text, ddlclientname.SelectedValue, dpt, txtemployeecode.Text);
        //GDEmpViewandEdit.DataBind();
    }

    protected void GDEmpViewandEdit_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        GDEmpViewandEdit.EditIndex = e.NewEditIndex;
        GDEmpViewandEditLoad();               
    }   

    protected void GDEmpViewandEdit_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GDEmpViewandEdit.PageIndex = e.NewPageIndex;
        //GDEmpViewandEditLoad();
    }

    protected void GDEmpViewandEdit_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        GDEmpViewandEdit.EditIndex = -1;
        GDEmpViewandEdit.DataBind();
    }

    protected void GDEmpViewandEdit_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GDEmpViewandEdit.EditIndex = -1;
        GDEmpViewandEditLoad();
    }

    protected void GDEmpViewandEdit_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        UpdateforLOad = "1";
        DeleteEmployeeCompanyDetail(e);
        UpdateEmployeeDetail(e);

        System.Threading.Thread.Sleep(100);
        string messagealready = "alert('Data Save')";
        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", messagealready, true);

        //GDEmpViewandEdit.PageIndex = e.NewPageIndex;
        GDEmpViewandEdit.EditIndex = -1;
        GDEmpViewandEditLoad();
    }

    private void InsertIntoEmployeeCompanyDetail(GridViewUpdateEventArgs e)
    {        
    }

    private void DeleteEmployeeCompanyDetail(GridViewUpdateEventArgs e)
    {
        Label lbleveemployeeid = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveemployeeid") as Label;
        Label ClntId = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveclientid") as Label;

        ObjectBL.DeleteEmployeeCompanyDetail(lbleveemployeeid.Text, ClntId.Text);
    }

    private void UpdateEmployeeDetail(GridViewUpdateEventArgs e)
    {
        Label lbleveapplicationid = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveapplicationid") as Label;
        Label lbleveemployeeid = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveemployeeid") as Label;
        Label lbleveemployeeno = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveemployeeno") as Label;
        Label txteveemployeename = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteveemployeename") as Label;
        TextBox txtevedateofjoin = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txtevedateofjoin") as TextBox;
        DropDownList ddlevejobtype = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("ddlevejobtype") as DropDownList;
        DropDownList ddlevejobcategory = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("ddlevejobcategory") as DropDownList;
        TextBox lblevejobunit = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lblevejobunit") as TextBox;
        DropDownList ddlevedepartmentname = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("ddlevedepartmentname") as DropDownList;
        DropDownList ddlevedesignationname = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("ddlevedesignationname") as DropDownList;
        DropDownList ddlevegrade = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("ddlevegrade") as DropDownList;
        TextBox txtevebasicda = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txtevebasicda") as TextBox;
        TextBox txtevehra = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txtevehra") as TextBox;
        TextBox txteveconveyance = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteveconveyance") as TextBox;
        TextBox txtevewashing = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txtevewashing") as TextBox;
        TextBox txteveother = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteveother") as TextBox;
        TextBox txtevetotalperhour = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txtevetotalperhour") as TextBox;
        TextBox txteveotamount = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteveotamount") as TextBox;
        DropDownList ddlevecontractors = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("ddlevecontractors") as DropDownList;
        DropDownList ddlpfname = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("ddlpfname") as DropDownList;
        DropDownList ddlesino = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("ddlesino") as DropDownList;
        TextBox txteveta = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteveta") as TextBox;
        TextBox txteveempaadhar = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteveempaadhar") as TextBox;
        TextBox txteveuanno = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteveuanno") as TextBox;
        TextBox txtevepfno = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txtevepfno") as TextBox;
        TextBox txteveesino = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteveesino") as TextBox;
        DropDownList ddlevesalarytype = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("ddlevesalarytype") as DropDownList;
        DropDownList ddlevesalaryissuetype = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("ddlevesalaryissuetype") as DropDownList;
        TextBox txtevebankname = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txtevebankname") as TextBox;
        TextBox txtevebranch = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txtevebranch") as TextBox;
        TextBox txteveifsccode = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteveifsccode") as TextBox;
        TextBox txteveaccountno = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteveaccountno") as TextBox;

        TextBox txtevepanno = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txtevepanno") as TextBox;

        TextBox txteveemgname = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteveemgname") as TextBox;
        TextBox txteveemgrelationship = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteveemgrelationship") as TextBox;
        TextBox txteveemgmobilenumber = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteveemgmobilenumber") as TextBox;
        TextBox txteveemgnomineehomenumber = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteveemgnomineehomenumber") as TextBox;
        TextBox txteveempidmark = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteveempidmark") as TextBox;
        Label lblevepfnomineename = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lblevepfnomineename") as Label;
        Label lblevepfnomineedob = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lblevepfnomineedob") as Label;
        Label lblevepfnomineerelationship = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lblevepfnomineerelationship") as Label;
        Label lblevepfnomineenoandstreet = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lblevepfnomineenoandstreet") as Label;
        Label lblevepfnomineetown = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lblevepfnomineetown") as Label;
        Label lblevepfnomineecity = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lblevepfnomineecity") as Label;
        Label lblevepfnomineestate = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lblevepfnomineestate") as Label;
        Label lblevepfnomineepincode = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lblevepfnomineepincode") as Label;
        Label lblevepfnomineemobilenumber = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lblevepfnomineemobilenumber") as Label;
        Label lblevepfnomineehomenumber = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lblevepfnomineehomenumber") as Label;
        Label lbleveesinomineename = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveesinomineename") as Label;
        Label lbleveesinomineedob = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveesinomineedob") as Label;
        Label lbleveesinomineerelationship = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveesinomineerelationship") as Label;
        Label lbleveesinomineenoandstreet = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveesinomineenoandstreet") as Label;
        Label lbleveesinomineetown = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveesinomineetown") as Label;
        Label lbleveesinomineecity = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveesinomineecity") as Label;
        Label lbleveesinomineestate = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveesinomineestate") as Label;
        Label lbleveesinomineepincode = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveesinomineepincode") as Label;
        Label lbleveesinomineemobilenumber = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveesinomineemobilenumber") as Label;
        Label lbleveesinomineehomenumber = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveesinomineehomenumber") as Label;
        TextBox txteverefname1 = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteverefname1") as TextBox;
        TextBox txteverefdesignation1 = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteverefdesignation1") as TextBox;
        TextBox txteverefcontactnumber1 = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteverefcontactnumber1") as TextBox;
        TextBox txteverefname2 = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteverefname2") as TextBox;
        TextBox txteverefdesignation2 = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteverefdesignation2") as TextBox;
        TextBox txteverefcontactnumber2 = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteverefcontactnumber2") as TextBox;
        Label lbleveemployeestatus = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveemployeestatus") as Label;
        Label lbleveclientid = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveclientid") as Label;
        Label lblevedepartmentid = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lblevedepartmentid") as Label;
        Label lblevedesignationid = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lblevedesignationid") as Label;
        Label lblevesalaryid = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lblevesalaryid") as Label;
        Label lblevepfid = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lblevepfid") as Label;
        Label lbleveesiid = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("lbleveesiid") as Label;

        TextBox txteveWgPerDay = GDEmpViewandEdit.Rows[e.RowIndex].FindControl("txteveWgPerDay") as TextBox;

        ObjectBL.InsertEmployeeCompanyDetail(lbleveapplicationid.Text, lbleveemployeeno.Text, txtevedateofjoin.Text, ddlevejobtype.Text, ddlevejobcategory.Text, lbleveclientid.Text, lblevedepartmentid.Text, lblevedesignationid.Text, ddlevegrade.Text, txteveWgPerDay.Text, txtevebasicda.Text, txtevehra.Text,
                 txteveconveyance.Text, txtevewashing.Text, txteveother.Text, txtevetotalperhour.Text, txteveotamount.Text, ddlevecontractors.Text, lblevepfid.Text, txteveuanno.Text, txtevepfno.Text, lbleveesiid.Text, txteveesino.Text, txteveta.Text, txteveempaadhar.Text, ddlevesalarytype.Text, ddlevesalaryissuetype.Text, txteveifsccode.Text,
                 txtevebankname.Text, txtevebranch.Text, txteveaccountno.Text, txtevepanno.Text, txteveemgname.Text, txteveemgrelationship.Text, txteveemgmobilenumber.Text, txteveemgnomineehomenumber.Text, txteveempidmark.Text, lblevepfnomineename.Text, lblevepfnomineedob.Text, lblevepfnomineerelationship.Text, lblevepfnomineenoandstreet.Text, lblevepfnomineetown.Text,
                 lblevepfnomineecity.Text, lblevepfnomineestate.Text, lblevepfnomineepincode.Text, lblevepfnomineemobilenumber.Text, lblevepfnomineehomenumber.Text, lbleveesinomineename.Text, lbleveesinomineedob.Text, lbleveesinomineerelationship.Text, lbleveesinomineenoandstreet.Text, lbleveesinomineetown.Text, lbleveesinomineecity.Text, lbleveesinomineestate.Text,
                 lbleveesinomineepincode.Text, lbleveesinomineemobilenumber.Text, lbleveesinomineehomenumber.Text, txteverefname1.Text, txteverefdesignation1.Text, txteverefcontactnumber1.Text, txteverefname2.Text, txteverefdesignation2.Text, txteverefcontactnumber2.Text, lbleveemployeestatus.Text);

        //lblevejobunit.Text, ddlevedepartmentname.Text, ddlevedesignationname.Text, txtevehra.Text, ddlpfname.Text, ddlesino.Text, txteveta.Text,  txteveuanno.Text, txtevepfno.Text, txteveesino.Text,                        
    }

    protected void GDEmpViewandEdit_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowState & DataControlRowState.Edit) > 0)
        {           
            DepartmentLoad(e);
            DesignationLoad(e);
            PfStateLoad(e);           
            EsiStateLoad(e);
            PfNoLoad(e);
            EsiNoLoad(e);
            GradeLoad(e);

            //ColorColumn(e);

            //DropDownList ddlJobcat = (DropDownList)e.Row.FindControl("ddlevejobcategory");           
            //ddlJobcat.Text = JobID.Text;
        }
        //PfCityLoad(e);
    }

    private void GradeLoad(GridViewRowEventArgs e)
    {
        Label ClntId = (Label)e.Row.FindControl("lbleveclientid");

        Label GradID = (Label)e.Row.FindControl("lblevesalaryid");
        DropDownList ddlevegrade = (DropDownList)e.Row.FindControl("ddlevegrade");
        ddlevegrade.DataSource = ObjectBL.SelectSalaryDetailForUnit(ClntId.Text);
        ddlevegrade.DataTextField = "GRADE";
        ddlevegrade.DataValueField = "SALARYID";
        ddlevegrade.DataBind();
        ddlevegrade.SelectedValue = GradID.Text;
        DataRowView dr = e.Row.DataItem as DataRowView;
    }

    private void PfStateLoad(GridViewRowEventArgs e)
    {
        //DropDownList ddlPfState = (DropDownList)e.Row.FindControl("ddlpfstate");
        //ddlPfState.DataSource = ObjectBL.SelectStateMaster();
        //ddlPfState.DataTextField = "STATENAME"; 
        //ddlPfState.DataValueField = "STATEID";
        //ddlPfState.DataBind();
        //DataRowView dr = e.Row.DataItem as DataRowView;        
    }

    private void PfCityLoad(GridViewRowEventArgs e)
    {                   
    }
    private void EsiStateLoad(GridViewRowEventArgs e)
    {
        //DropDownList ddlesistate = (DropDownList)e.Row.FindControl("ddlesistate");
        //ddlesistate.DataSource = ObjectBL.SelectStateMaster();
        //ddlesistate.DataTextField = "STATENAME";
        //ddlesistate.DataValueField = "STATEID";
        //ddlesistate.DataBind();
        //DataRowView dr = e.Row.DataItem as DataRowView;
    }

    private void PfNoLoad(GridViewRowEventArgs e)  
    {
        Label PFID = (Label)e.Row.FindControl("lblevepfid");
        DropDownList ddlpfname = (DropDownList)e.Row.FindControl("ddlpfname");
        ddlpfname.DataSource = ObjectBL.SelectPFDetail();
        ddlpfname.DataTextField = "PFNAME";
        ddlpfname.DataValueField = "PFID";
        ddlpfname.DataBind();
        ddlpfname.SelectedValue = PFID.Text;
        DataRowView dr = e.Row.DataItem as DataRowView;
    }

    private void EsiNoLoad (GridViewRowEventArgs e)
    {
        Label ESIID = (Label)e.Row.FindControl("lbleveesiid");
        DropDownList ddlesino = (DropDownList)e.Row.FindControl("ddlesino");
        ddlesino.DataSource = ObjectBL.SelectESIDetail();
        ddlesino.DataTextField = "ESINAME";
        ddlesino.DataValueField = "ESIID";
        ddlesino.DataBind();
        ddlesino.SelectedValue = ESIID.Text;
        DataRowView dr = e.Row.DataItem as DataRowView;
    }

    private void DesignationLoad(GridViewRowEventArgs e)
    {
        Label DsgID = (Label)e.Row.FindControl("lblevedesignationid");
        DropDownList ddlDesignation = (DropDownList)e.Row.FindControl("ddlevedesignationname");

        Label ClntId = (Label)e.Row.FindControl("lbleveclientid");

        ddlDesignation.DataSource = ObjectBL.SelectDesignationMasterID(ClntId.Text);
        ddlDesignation.DataTextField = "DESIGNATIONNAME";
        ddlDesignation.DataValueField = "DESIGNATIONID";
        ddlDesignation.DataBind();
        ddlDesignation.SelectedValue = DsgID.Text;
        DataRowView dr = e.Row.DataItem as DataRowView;
    }

    private void DepartmentLoad(GridViewRowEventArgs e)
    {
        Label DptID = (Label)e.Row.FindControl("lblevedepartmentid");
        DropDownList ddlDepartment = (DropDownList)e.Row.FindControl("ddlevedepartmentname");

        Label ClntId = (Label)e.Row.FindControl("lbleveclientid");

        //.FindControl("lbleveesiid") as Label;

        ddlDepartment.DataSource = ObjectBL.SelectDepartmentClnt(ClntId.Text);
        ddlDepartment.DataTextField = "DEPARTMENTNAME";
        ddlDepartment.DataValueField = "DEPARTMENTID";
        
        ddlDepartment.DataBind();
        ddlDepartment.SelectedValue = DptID.Text;

        //DataRowView dr = e.Row.DataItem as DataRowView;
    }

    protected void ddlevegrade_SelectedIndexChanged(object sender, EventArgs e)
    {
        string Grade = "";
        DropDownList ddlevegrade = (DropDownList)sender;
        decimal basic = 0, basicda = 0, hra = 0, Conv = 0, Washing = 0, other = 0, WageHour = 0, OT = 0;

        DataTable dt = new DataTable();

        if (ddlevegrade.SelectedValue == "---GRADE---")
        {
            Grade = "";
        }
        else
        {
            Grade = ddlevegrade.SelectedValue;
        }    
        dt = ObjectBL.SelectSalaryMasterGrade(Grade);
        if (dt.Rows.Count > 0)
        {
            basic = Convert.ToDecimal(dt.Rows[0]["BASIC"]);
            hra = Convert.ToDecimal(dt.Rows[0]["HRA"]);
            basicda = Convert.ToDecimal(dt.Rows[0]["DA"]);
            Conv = Convert.ToDecimal(dt.Rows[0]["CONVEYANCE"]);
            Washing = Convert.ToDecimal(dt.Rows[0]["WASHING"]);
            other = Convert.ToDecimal(dt.Rows[0]["OTHER"]);
            OT = Convert.ToDecimal(dt.Rows[0]["OTAMOUNT"]);
        }

        basic = basic + basicda;

        TextBox txteveWgPerDay = (TextBox)GDEmpViewandEdit.Rows[GDEmpViewandEdit.EditIndex].FindControl("txteveWgPerDay");

        string aa = txteveWgPerDay.Text;

        basic = Convert.ToDecimal(txteveWgPerDay.Text) / 100 * basic;
        hra = Convert.ToDecimal(txteveWgPerDay.Text) / 100 * hra;
        Conv = Convert.ToDecimal(txteveWgPerDay.Text) / 100 * Conv;
        Washing = Convert.ToDecimal(txteveWgPerDay.Text) / 100 * Washing;
        other = Convert.ToDecimal(txteveWgPerDay.Text) / 100 * other;

        DropDownList ddlevesalarytype = (DropDownList)GDEmpViewandEdit.Rows[GDEmpViewandEdit.EditIndex].FindControl("ddlevesalarytype");


        if (ddlevesalarytype.Text == "Monthly")
        {
            WageHour = Convert.ToDecimal(txteveWgPerDay.Text) * OT / 100;
            WageHour = WageHour / 30;
            OT = WageHour / 8;
        }
        else
        {
            WageHour = Convert.ToDecimal(txteveWgPerDay.Text) * OT / 100;
            OT = WageHour / 8;
        }

        TextBox txtevebasicda = (TextBox)GDEmpViewandEdit.Rows[GDEmpViewandEdit.EditIndex].FindControl("txtevebasicda");
        TextBox txtevehra = (TextBox)GDEmpViewandEdit.Rows[GDEmpViewandEdit.EditIndex].FindControl("txtevehra");
        TextBox txteveconveyance = (TextBox)GDEmpViewandEdit.Rows[GDEmpViewandEdit.EditIndex].FindControl("txteveconveyance");
        TextBox txtevewashing = (TextBox)GDEmpViewandEdit.Rows[GDEmpViewandEdit.EditIndex].FindControl("txtevewashing");
        TextBox txteveother = (TextBox)GDEmpViewandEdit.Rows[GDEmpViewandEdit.EditIndex].FindControl("txteveother");
        TextBox txtevetotalperhour = (TextBox)GDEmpViewandEdit.Rows[GDEmpViewandEdit.EditIndex].FindControl("txtevetotalperhour");
        TextBox txteveotamount = (TextBox)GDEmpViewandEdit.Rows[GDEmpViewandEdit.EditIndex].FindControl("txteveotamount");


        txtevebasicda.Text = basic.ToString("###0.##");
        txtevehra.Text = hra.ToString("###0.##");
        txteveconveyance.Text = Conv.ToString("###0.##");
        txtevewashing.Text = Washing.ToString("###0.##");
        txteveother.Text = other.ToString("###0.##");
        txtevetotalperhour.Text = OT.ToString("###0.##");
        txteveotamount.Text = WageHour.ToString("###0.##");

        con.Close();

    }

    protected void ddlpfstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        //DropDownList ddlPfState = (DropDownList)sender;
        //DropDownList ddlpfcity = (DropDownList)sender;
        //ddlpfcity.DataSource = ObjectBL.SelectCityOnStateData(ddlPfState.SelectedValue);
        //ddlpfcity.DataTextField = "CITYNAME";
        //ddlpfcity.DataValueField = "CITYID";
        //ddlpfcity.DataBind();        
    }

    protected void ddlesistate_SelectedIndexChanged(object sender, EventArgs e)
    {
        //DropDownList ddlEsiState = (DropDownList)sender;
        //DropDownList ddlEsicity = (DropDownList)sender;
        //ddlEsicity.DataSource = ObjectBL.SelectCityOnStateData(ddlEsiState.SelectedValue);
        //ddlEsicity.DataTextField = "CITYNAME";
        //ddlEsicity.DataValueField = "CITYID";
        //ddlEsicity.DataBind();
    }

    protected void GDEmpViewandEdit_SelectedIndexChanged(object sender, EventArgs e)
    {
               
    }
    protected void btnnew_Click(object sender, EventArgs e)
    {
        txtfromdate.Text = "";
        txttodate.Text = "";
        txtemployeecode.Text = "";
        ddlclientname.Items.Clear();
        ddlclientname.Items.Add("---Select Client Name---");
        ddlclientnameLoad();

        ddldepartmentname.Items.Clear();
        ddldepartmentname.Items.Add("---Select Department Name---");

        GDEmpViewandEdit.DataSource = null;
        GDEmpViewandEdit.DataBind();        
    }

    protected void ddlclientname_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlclientname.SelectedValue == "---Select Client Name---")
        {
            ddldepartmentname.Items.Clear();
            ddldepartmentname.Items.Add("---Select Department Name---");
            
        }
        else
        {
            DepartmentLoad();
        }
        
    }

    private void DepartmentLoad()
    {
        ddldepartmentname.Items.Clear();
        ddldepartmentname.Items.Add("---Select Department Name---");
        ddldepartmentname.Items.Add("ALL Department");
        ddldepartmentname.DataSource = ObjectBL.SelectDepartmentClnt(ddlclientname.SelectedValue);
        ddldepartmentname.DataTextField = "DEPARTMENTNAME";
        ddldepartmentname.DataValueField = "DEPARTMENTID";
        ddldepartmentname.DataBind();
    }

    protected void ddldepartmentname_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddldepartmentname.SelectedValue == "ALL Department")
        {
            GDEmpViewandEditLoad();
        }
    }
}