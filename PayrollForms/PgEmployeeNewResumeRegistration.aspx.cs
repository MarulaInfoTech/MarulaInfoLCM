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

public partial class PageNewResumeRegistration : System.Web.UI.Page
{

    ClsBusnssLayer ObjectBL = new ClsBusnssLayer();
    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();
    static byte[] imageData;
    static byte[] Document;
    static string contentType;
    string Error = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "1";

        if (!IsPostBack)
        {
            ddlprastateLoad();
            ddlprestateLoad();
            ddleducategoryLoad();
            DgApplicationLoad();
            txtapplicationnoLoad();
            EmployeeApplicationImage();
            txtDOBdate.Text = DateTime.Now.ToString("dd/MM/yyyy");           
        }
    }
    private void txtapplicationnoLoad()
    {       
        dt = new DataTable();
        dt = ObjectBL.SelectApplicationNoMax();
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0][0].ToString() != "")
            {
                decimal Number = Convert.ToDecimal(dt.Rows[0][0]);
                Number = Number + 1;
                txtapplicationno.Text = Number.ToString();
            }
            else
            {
                txtapplicationno.Text = "1";
            }            
        }
        else
        {
            txtapplicationno.Text = "1";
        }
        con.Close();
    }

    private void DgApplicationLoad()
    {
        DgApplication.DataSource = ObjectBL.SelectApplicationDetail();
        DgApplication.DataBind();
    }

    private void ddleducategoryLoad()
    {
        ddleducategory.Items.Clear();
        ddleducategory.Items.Add("--- Select Education ---");
        ddleducategory.DataSource = ObjectBL.SelectEducationDetail();
        ddleducategory.DataTextField = "CATEGORY";
        ddleducategory.DataBind();
    }

    private void ddlprestateLoad()
    {
        ddlPresentState.Items.Clear();
        ddlPresentState.Items.Add("------ Select State ------");
        ddlPresentState.DataSource = ObjectBL.SelectStateMaster();
        ddlPresentState.DataTextField = "STATENAME";
        ddlPresentState.DataValueField = "STATEID";
        ddlPresentState.DataBind();
    }

    private void ddlprastateLoad()
    {
        ddlPermenetState.Items.Clear();
        ddlPermenetState.Items.Add("----- Select State -------");
        ddlPermenetState.DataSource = ObjectBL.SelectStateMaster();
        ddlPermenetState.DataTextField = "STATENAME";
        ddlPermenetState.DataValueField = "STATEID";
        ddlPermenetState.DataBind();
    }

    protected void txtadharno_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {

        if (txtapplicationno.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Application.No')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtapplicationno.Focus();
        }

        else if (txtemployeename.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Employee Name')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtemployeename.Focus();
        }

        else if (txtDOBdate.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Date Of Birth')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtDOBdate.Focus();
        }

        else if (ddlgender.SelectedItem.Text == "-----Select Gender-----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Gender')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlgender.Focus();
        }

        else if (txtfathername.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the FatherName')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtfathername.Focus();
        }

        else if (ddlmartialstatus.SelectedItem.Text == "-----Select Status-----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the MartialStatus')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlmartialstatus.Focus();
        }

        else if (ddleducategory.SelectedItem.Text == "--- Select Education ---")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Education')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddleducategory.Focus();
        }

        else if (ddlqualification.SelectedItem.Text == "--- Select Qualification ---")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Qualification')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlqualification.Focus();
        }

        else if (ddlcourse.SelectedItem.Text == "------ Select Course -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Course')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlcourse.Focus();
        }

        else if (txtadharno.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Aadhar.No')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtadharno.Focus();
        }

        else if (txtpanno.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Pan.No')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtpanno.Focus();
        }

        else if (txtprenoandstreet.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the No And Street')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtprenoandstreet.Focus();
        }

        else if (txtpretownarea.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Town Area')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtpretownarea.Focus();
        }

        else if (ddlPresentState.SelectedItem.Text == "----- Select State -------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Present State')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlPresentState.Focus();
        }

        else if (ddlpresentCity.SelectedItem.Text == "------ Select City -----")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Present City')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlpresentCity.Focus();
        }

        else if (txtprepincode.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the PinCode')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtprepincode.Focus();
        }

        else if (txtpranoandstreet.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the  No and Street')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtpranoandstreet.Focus();
        }

        else if (txtpratownarea.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Town Area')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtpratownarea.Focus();
        }

        else if (ddlPermenetState.SelectedItem.Text == "----- Select State -------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the State')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlPermenetState.Focus();
        }

        else if (ddlPermenetCity.SelectedItem.Text == "------ Select City ------")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the City')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            ddlPermenetCity.Focus();
        }

        else if (txtpraPin.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Enter the Pincode')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            txtpraPin.Focus();
        }

        else if (chkterm.Text == "")
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('Select Term and Condition')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            chkterm.Focus();
        }


        else
        {
            string Applidate = DateTime.Now.ToString();
            checkExsit();
            if (btnupdate.Text == "Save")
            {
                if (Error == "0")
                {
                    ObjectBL.InsertApplicationDetail(txtapplicationno.Text, Applidate, txtemployeename.Text, ddlgender.Text, Convert.ToDateTime(txtDOBdate.Text).ToShortDateString(), 
                        txtfathername.Text, txtmothername.Text, txtGard.Text, ddlmartialstatus.Text, txtspousename.Text, txtpranoandstreet.Text, txtpratownarea.Text, 
                        ddlPermenetCity.SelectedValue, ddlPermenetState.SelectedValue, txtpraPin.Text, txtprenoandstreet.Text, txtpretownarea.Text, ddlpresentCity.SelectedValue,
                        ddlPresentState.SelectedValue, txtprepincode.Text, ddleducategory.Text, ddlqualification.Text, ddlcourse.Text, txtbloodgroup.Text, txtmobile.Text, 
                        txtmobilewhatsapp.Text, txtadharno.Text, txtpanno.Text, txtemailid.Text);
                    EmployeeApplicationImage();

                    System.Threading.Thread.Sleep(100);
                    string message = "alert('Data Save')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                }
                else
                {
                    System.Threading.Thread.Sleep(100);
                    string messagealready = "alert('Same Data Already Here')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", messagealready, true);
                }
            }
            else
            {
                ObjectBL.UpdateApplicationDetail(TypeID.Text, txtapplicationno.Text, Applidate, txtemployeename.Text, ddlgender.Text, Convert.ToDateTime(txtDOBdate.Text).ToShortDateString(),
                        txtfathername.Text, txtmothername.Text, txtGard.Text, ddlmartialstatus.Text, txtspousename.Text, txtpranoandstreet.Text, txtpratownarea.Text,
                        ddlPermenetCity.SelectedValue, ddlPermenetState.SelectedValue, txtpraPin.Text, txtprenoandstreet.Text, txtpretownarea.Text, ddlpresentCity.SelectedValue,
                        ddlPresentState.SelectedValue, txtprepincode.Text, ddleducategory.Text, ddlqualification.Text, ddlcourse.Text, txtbloodgroup.Text, txtmobile.Text,
                        txtmobilewhatsapp.Text, txtadharno.Text, txtpanno.Text, txtemailid.Text);
                EmployeeApplicationImage();

                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            }
            DgApplicationLoad();
            Clearnew();
        }
    }
    private void checkExsit()
    {       
        dt = new DataTable();
        dt = ObjectBL.SelectApplicationNoCheck(txtemployeename.Text.Trim(),txtadharno.Text.Trim());
        if (dt.Rows.Count > 0)
        {
            Error = "1";
        }
        else
        {
            Error = "0";
        }
        con.Close();
    }

    private void EmployeeApplicationImage()
    {
        if (SelectFiles.PostedFile != null)
        {
            UploadImages(SelectFiles.PostedFile);
        }
        
       
        if (imageData != null)
        {

            con.Open();

            dt = new DataTable();
            dt = ObjectBL.SelectApplicationIDMax();
            if (dt.Rows.Count > 0)
            {
                string AppliNo = dt.Rows[0]["APPLICATIONID"].ToString();
                string Update = @"Update EmployeeApplication set EMPPHOTO = @EMPPHOTO where APPLICATIONID=@APPLICATIONID";
                SqlCommand cmd = new SqlCommand(Update, con);
                cmd.Parameters.AddWithValue("@EMPPHOTO", imageData);
                cmd.Parameters.AddWithValue("@APPLICATIONID", AppliNo);
                cmd.ExecuteNonQuery();

            }
            con.Close();
        }

        if (ResumeFiles.PostedFile != null)
        {
            DocumentFileUpload(ResumeFiles.PostedFile);
        }


        if (imageData != null)
        {
            con.Open();

            dt = new DataTable();
            dt = ObjectBL.SelectApplicationIDMax();
            if (dt.Rows.Count > 0)
            {
                string AppliNo = dt.Rows[0]["APPLICATIONID"].ToString();
                string Update = @"Update EmployeeApplication set DOCUMENTS = @DOCUMENTS where APPLICATIONID=@APPLICATIONID";
                SqlCommand cmd = new SqlCommand(Update, con);
                cmd.Parameters.AddWithValue("@DOCUMENTS", Document);
                cmd.Parameters.AddWithValue("@APPLICATIONID", AppliNo);
                cmd.ExecuteNonQuery();

            }
            con.Close();
        }
    }

    private void DocumentFileUpload(HttpPostedFile postedFile)
    {
        if (postedFile.ContentLength > 0)
        {
            Document = null;
            using (var binaryReader = new BinaryReader(postedFile.InputStream))
            {
                Document = binaryReader.ReadBytes(postedFile.ContentLength);
                contentType = postedFile.ContentType;
            }
        }
    }

    protected void ddlprestate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlPresentState.SelectedValue== "------ Select State ------")
        {
        }
        else
        {
            ddlprecityLoad();
        }              
    }

    private void ddlpracityLoad()
    {
        ddlPermenetCity.Items.Clear();
        ddlPermenetCity.Items.Add("------ Select City -----");
        ddlPermenetCity.DataSource = ObjectBL.SelectCityOnStateData(ddlPermenetState.SelectedValue);
        ddlPermenetCity.DataTextField = "CITYNAME";
        ddlPermenetCity.DataValueField = "CITYID";
        ddlPermenetCity.DataBind();
    }
    protected void ddlprastate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPermenetState.SelectedValue == "----- Select State -------")
        {
        }
        else
        {
            ddlpracityLoad();
        }
    }
    private void ddlprecityLoad()
    {
        ddlpresentCity.Items.Clear();
        ddlpresentCity.Items.Add("------ Select City ------");
        ddlpresentCity.DataSource = ObjectBL.SelectCityOnStateData(ddlPresentState.SelectedValue);
        ddlpresentCity.DataTextField = "CITYNAME";
        ddlpresentCity.DataValueField = "CITYID";
        ddlpresentCity.DataBind();
    }

    protected void ddleducategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlqualificationLoad();
    }
    
    private void ddlqualificationLoad()
    {
        ddlqualification.Items.Clear();
        ddlqualification.Items.Add("--- Select Qualification ---");
        ddlqualification.DataSource = ObjectBL.SelectCategoryDetail(ddleducategory.Text);
        ddlqualification.DataTextField = "QUALIFICATION";
        ddlqualification.DataBind();
    }

    protected void ddlqualification_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlcourseLoad();
    }

    private void ddlcourseLoad()
    {
        ddlcourse.Items.Clear();
        ddlcourse.Items.Add("------ Select Course -----");
        ddlcourse.DataSource = ObjectBL.SelectCourseDetail(ddleducategory.Text, ddlqualification.Text);
        ddlcourse.DataTextField = "COURSE";
        ddlcourse.DataBind();
    }
    protected void DgApplication_SelectedIndexChanged(object sender, EventArgs e)
    {

        Label epdapplicationid = DgApplication.SelectedRow.FindControl("lblepdapplicationid") as Label;
        Label epdapplicationno = DgApplication.SelectedRow.FindControl("lblepdapplicationno") as Label;
        Label epdapplicationdate = DgApplication.SelectedRow.FindControl("lblepdapplicationdate") as Label;
        Label epdemployeename = DgApplication.SelectedRow.FindControl("lblepdemployeename") as Label;
        Label epdgender = DgApplication.SelectedRow.FindControl("lblepdgender") as Label;
        Label epddob = DgApplication.SelectedRow.FindControl("lblepddob") as Label;
        Label epdfathername = DgApplication.SelectedRow.FindControl("lblepdfathername") as Label;
        Label epdmothername = DgApplication.SelectedRow.FindControl("lblepdmothername") as Label;
        Label epdguardianname = DgApplication.SelectedRow.FindControl("lblepdguardianname") as Label;
        Label epdmartialstatus = DgApplication.SelectedRow.FindControl("lblepdmartialstatus") as Label;
        Label epdspousename = DgApplication.SelectedRow.FindControl("lblepdspousename") as Label;

        Label epdpermantnoandstreet = DgApplication.SelectedRow.FindControl("lblepdpermantnoandstreet") as Label;
        Label epdpermanttown = DgApplication.SelectedRow.FindControl("lblepdpermanttown") as Label;
        Label epdpermanentstateid = DgApplication.SelectedRow.FindControl("lblepdpermanentstateid") as Label;
        Label epdpermanentstatename = DgApplication.SelectedRow.FindControl("lblepdpermanentstatename") as Label;
        Label epdpermanentcityid = DgApplication.SelectedRow.FindControl("lblepdpermanentcityid") as Label;
        Label epdpermanentcityname = DgApplication.SelectedRow.FindControl("lblepdpermanentcityname") as Label;
        Label epdpermanentpincode = DgApplication.SelectedRow.FindControl("lblepdpermanentpincode") as Label;

        Label epdpresentnoandstreet = DgApplication.SelectedRow.FindControl("lblepdpresentnoandstreet") as Label;
        Label epdpresenttown = DgApplication.SelectedRow.FindControl("lblepdpresenttown") as Label;
        Label epdpresentstateid = DgApplication.SelectedRow.FindControl("lblepdpresentstateid") as Label;
        Label epdpresentstate = DgApplication.SelectedRow.FindControl("lblepdpresentstate") as Label;
        Label epdpresentcityid = DgApplication.SelectedRow.FindControl("lblepdpresentcityid") as Label;
        Label epdpresentcity = DgApplication.SelectedRow.FindControl("lblepdpresentcity") as Label;
        Label epdpresentpincode = DgApplication.SelectedRow.FindControl("lblepdpresentpincode") as Label;

        Label epdeducation = DgApplication.SelectedRow.FindControl("lblepdeducation") as Label;
        Label epdqualification = DgApplication.SelectedRow.FindControl("lblepdqualification") as Label;
        Label epdcourse = DgApplication.SelectedRow.FindControl("lblepdcourse") as Label;
        Label epdbloodgroup = DgApplication.SelectedRow.FindControl("lblepdbloodgroup") as Label;
        Label epdmobileno = DgApplication.SelectedRow.FindControl("lblepdmobileno") as Label;
        Label epdmobilewhatsappno = DgApplication.SelectedRow.FindControl("lblepdmobilewhatsappno") as Label;
        Label epdadharno = DgApplication.SelectedRow.FindControl("lblepdadharno") as Label;
        Label epdpanno = DgApplication.SelectedRow.FindControl("lblepdpanno") as Label;
        Label epdemailid = DgApplication.SelectedRow.FindControl("lblepdemailid") as Label;

        TypeID.Text = epdapplicationid.Text;
        txtapplicationno.Text = epdapplicationno.Text;
        txtemployeename.Text = epdemployeename.Text;
        txtDOBdate.Text = epddob.Text;
        ddlgender.Text = epdgender.Text;
        txtfathername.Text = epdfathername.Text;
        txtmothername.Text = epdmothername.Text;
        txtGard.Text = epdguardianname.Text;
        ddlmartialstatus.Text = epdmartialstatus.Text;
        txtspousename.Text = epdspousename.Text;
        ddleducategory.Text = epdeducation.Text;
        ddlqualificationLoad();
        ddlqualification.Text = epdqualification.Text;
        ddlcourseLoad();
        ddlcourse.Text = epdcourse.Text;
        txtbloodgroup.Text = epdbloodgroup.Text;
        txtmobile.Text = epdmobileno.Text;
        txtmobilewhatsapp.Text = epdmobilewhatsappno.Text;
        txtadharno.Text = epdadharno.Text;
        txtpanno.Text = epdpanno.Text;
        txtemailid.Text = epdemailid.Text;
        txtprenoandstreet.Text = epdpresentnoandstreet.Text;
        txtpretownarea.Text = epdpresenttown.Text;

        ddlPresentState.SelectedValue = epdpresentstateid.Text;        
        ddlprecityLoad();
        ddlpresentCity.SelectedValue = epdpresentcityid.Text;

        txtprepincode.Text = epdpresentpincode.Text;
        txtpranoandstreet.Text = epdpermantnoandstreet.Text;
        txtpratownarea.Text = epdpermanttown.Text;

        ddlPermenetState.SelectedValue = epdpermanentstateid.Text;
        ddlpracityLoad();
        ddlPermenetCity.SelectedValue = epdpermanentcityid.Text;

        txtpraPin.Text = epdpermanentpincode.Text;
        btnupdate.Text = "Update";        
    }

    protected void lnksetphoto_Click(object sender, EventArgs e)
    {
        //FileInfo fi = new FileInfo(@"D:\DummyFile.txt");
        //FileStream fs = fi.Open(FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.ReadWrite);      

    }

    private void UploadImages(HttpPostedFile uploadedImage)
    {
        if (uploadedImage.ContentLength > 0)
        {
            //byte[] imageData;
            //string contentType;
            imageData = null;
            using (var binaryReader = new BinaryReader(uploadedImage.InputStream))
            {
                imageData = binaryReader.ReadBytes(uploadedImage.ContentLength);
                contentType = uploadedImage.ContentType;
            }
        }
    }

    protected void txtpanno_TextChanged(object sender, EventArgs e)
    {
        txtpanno.Text = txtpanno.Text.ToUpper();
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        EmployeeApplicationImage();
        Clearnew();
    }

    public void Clearnew()
    {
        ddlprastateLoad();
        ddlprestateLoad();
        ddleducategoryLoad();
        ddlpresentCity.Items.Clear();
        ddlpresentCity.Items.Add("------ Select City -----");
        ddlPermenetCity.Items.Clear();
        ddlPermenetCity.Items.Add("------ Select City ------");
        ddlgender.Items.Clear();
        ddlgender.Items.Add("-----Select Gender-----");
        ddlmartialstatus.Items.Clear();
        ddlmartialstatus.Items.Add("-----Select Status-----");

        txtemployeename.Text = "";
        txtDOBdate.Text = "";
        ddlqualification.Items.Clear();
        ddlcourse.Items.Clear();
        txtfathername.Text = "";
        txtmothername.Text = "";
        txtGard.Text = "";
      
        txtspousename.Text = "";

        txtapplicationnoLoad();

        txtbloodgroup.Text = "";
        txtmobile.Text = "";
        txtmobilewhatsapp.Text = "";
        txtadharno.Text = "";
        txtpanno.Text = "";
        txtemailid.Text = "";
        txtprenoandstreet.Text = "";
        txtpretownarea.Text = "";

        txtprepincode.Text = "";
        txtpranoandstreet.Text = "";
        txtpratownarea.Text = "";
        txtpraPin.Text = "";

        btnupdate.Text = "Save";

    }

    protected void CheckBox1per_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1per.Checked == true)
        {
            txtpranoandstreet.Text = txtprenoandstreet.Text;
            txtpratownarea.Text = txtpretownarea.Text;
            txtpraPin.Text = txtprepincode.Text;
            ddlPermenetState.SelectedValue = ddlPresentState.SelectedValue;
            ddlpracityLoad();
            ddlPermenetCity.SelectedValue = ddlpresentCity.SelectedValue;
        }
        else
        {
            txtpranoandstreet.Text = "";
            txtpratownarea.Text = "";
            txtpraPin.Text = "";
            ddlprastateLoad();
            ddlPermenetCity.Items.Clear();
        }
    }

    protected void txtprenoandstreet_TextChanged(object sender, EventArgs e)
    {
        txtprenoandstreet.Text = txtprenoandstreet.Text.ToUpper();
    }

    protected void txtpretownarea_TextChanged(object sender, EventArgs e)
    {
        txtpretownarea.Text = txtpretownarea.Text.ToUpper();
    }

    protected void txtpranoandstreet_TextChanged(object sender, EventArgs e)
    {
        txtpranoandstreet.Text = txtpranoandstreet.Text.ToUpper();
    }

    protected void txtpratownarea_TextChanged(object sender, EventArgs e)
    {
        txtpratownarea.Text = txtpratownarea.Text.ToUpper();
    }

    protected void txtemployeename_TextChanged(object sender, EventArgs e)
    {
        txtemployeename.Text = txtemployeename.Text.ToUpper();
    }

    protected void txtfathername_TextChanged(object sender, EventArgs e)
    {
        txtfathername.Text = txtfathername.Text.ToUpper();
    }

    protected void txtmothername_TextChanged(object sender, EventArgs e)
    {
        txtmothername.Text = txtmothername.Text.ToUpper();
    }

    protected void txtGard_TextChanged(object sender, EventArgs e)
    {
        txtGard.Text = txtGard.Text.ToUpper();
    }

    protected void txtspousename_TextChanged(object sender, EventArgs e)
    {
        txtspousename.Text = txtspousename.Text.ToUpper();
    }

    protected void txtbloodgroup_TextChanged(object sender, EventArgs e)
    {
        txtbloodgroup.Text = txtbloodgroup.Text.ToUpper();
    }

    protected void ddlmartialstatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlmartialstatus.Text== "UnMarried")
        {
            txtspousename.ReadOnly = true;
        }
        else
        {
            txtspousename.ReadOnly = false;
        }
    }

    protected void ddlprecity_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void txtDOBdate_TextChanged(object sender, EventArgs e)
    {

    }

    protected void ddlgender_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        hidcurrenttab.Value = "2";       
    }


    protected void chkterm_CheckedChanged(object sender, EventArgs e)
    {
        if(chkterm.Checked==true)
        {
            btnupdate.Enabled = false;
        }
        else
        {
            btnupdate.Enabled = true;
        }
    }
}