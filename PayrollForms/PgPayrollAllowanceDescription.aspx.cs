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

public partial class PayrollForms_AllowanceDescription : System.Web.UI.Page
{
    ClsBusnssLayer objectBL = new ClsBusnssLayer();   
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();
    string Error = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlClntIDLoad();
            DGdescriptionLoad();
            TypeId.Text = "0";

        }
        
    }

    private void DGdescriptionLoad()
    {
        DGdescription.DataSource = objectBL.SelectAllowanceDescription();
        DGdescription.DataBind();
    }

    private void ddlClntIDLoad()
    {
        ddlClntID.Items.Clear();
        ddlClntID.Items.Add("---- Select Client -------");
        ddlClntID.DataSource = objectBL.SelectClinet();
        ddlClntID.DataTextField = "CLIENTNAME";
        ddlClntID.DataValueField = "CLIENTID";
        ddlClntID.DataBind();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        ExChaeck();
        if (Error == "0")
        {
            if (TypeId.Text == "0")
            {
                objectBL.InsertAllowanceDescription(ddlClntID.SelectedValue, txtDescrip.Text, ddlType.Text, ddlDeductType.SelectedValue);
                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                DGdescriptionLoad();
                LoadForNew();

            }
            else
            {
                objectBL.UpdateAllowanceDescription(TypeId.Text, ddlClntID.SelectedValue, txtDescrip.Text, ddlType.Text, ddlDeductType.SelectedValue);
                System.Threading.Thread.Sleep(100);
                string message = "alert('Data Save')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                DGdescriptionLoad();
                LoadForNew();
            }
        }
        else
        {
            System.Threading.Thread.Sleep(100);
            string message = "alert('This Code Already in Used')";
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            
        }
    }

    private void LoadForNew()
    {
        ddlType.SelectedValue = "Select Type";
        txtDescrip.Text = "";
        ddlClntIDLoad();
    }

    private void ExChaeck()
    {
        if (TypeId.Text == "0")
        {
            dt = objectBL.AllowanceDescriptionCodeSelect(ddlClntID.SelectedValue, ddlType.SelectedValue);
            if (dt.Rows.Count > 0)
            {
                Error = "1";
            }
            else
            {
                Error = "0";
            }
        }
    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        LoadForNew();
    }

    protected void DGdescription_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblAlldesID = DGdescription.SelectedRow.FindControl("lblAlldesID") as Label;
        Label lblClntId = DGdescription.SelectedRow.FindControl("lblClntId") as Label;
        Label lblCode = DGdescription.SelectedRow.FindControl("lblCode") as Label;
        Label lbldesName = DGdescription.SelectedRow.FindControl("lbldesName") as Label;
        Label lblType = DGdescription.SelectedRow.FindControl("lblType") as Label;

        TypeId.Text = lblAlldesID.Text;
        ddlClntID.SelectedValue = lblClntId.Text;
        ddlType.SelectedValue = lblCode.Text;
        txtDescrip.Text = lbldesName.Text;
        ddlDeductType.SelectedValue= lblType.Text;
        btnsave.Text = "Update";
    }
}