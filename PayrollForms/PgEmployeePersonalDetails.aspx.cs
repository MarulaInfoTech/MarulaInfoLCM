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

public partial class PgEmployeePersonalDetails : System.Web.UI.Page
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
            ddlapplicationnoLoad();
            //txtemployeeno.Text = "Dont Entry";
            //txtemployeeno.ReadOnly = true;

        }
    }

    private void ddlapplicationnoLoad()
    {
        //ddlapplicationno.DataSource = ObjectBA.SelectApplicationNoDetail();
        //ddlapplicationno.DataTextField = "APPLICATIONNO";
        //ddlapplicationno.DataValueField = "APPLICATIONID";
        //ddlapplicationno.DataBind();
    }

    protected void ddlapplicationno_SelectedIndexChanged(object sender, EventArgs e)
    {
        //con.Close();
        //con.Open();
        //string str = @"select * from EmployeeApplication where APPLICATIONID='" + ddlapplicationno.SelectedValue + "'";
        //da = new SqlDataAdapter(str, con);
        //dt = new DataTable();
        //da.Fill(dt);
        //if (dt.Rows.Count > 0)
        //{
        //    txtemployeeno.Text = dt.Rows[0]["APPLICATIONNO"].ToString();
        //    txtemployeeno.ReadOnly = true;
        //}
        //con.Close();
    }
}