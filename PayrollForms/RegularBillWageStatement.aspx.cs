using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.Reporting.WebForms;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Data.Sql;
using BLL;
using System.IO;


public partial class PayrollForms_PayrollReports_RegularBillWageStatement : System.Web.UI.Page
{
    ClsBusnssLayer ObjectBA = new ClsBusnssLayer();

    SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings.Get("SuryaOnlineConnectionString"));
    //SqlConnection con = new SqlConnection("Server=WHYNOT;Database=SuryaOnline;user=sa;password=Whynot@94896;");
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlclientnameviewLoad();
        }
    }

    private void ReportViwerRegularBillWageStatementLoad()
    {
        GetStatementDetail();        
    }

    private void GetStatementDetail()
    {
        //string Fromdate = "2020-12-29", Todate = "2021-01-28", ClntId = "3019";
        ds = new DataSet();
        ds = ObjectBA.SelectRegularBillCalcReport(Convert.ToDateTime(txtfromdate.Text).ToShortDateString(), Convert.ToDateTime(txttodate.Text).ToShortDateString(), ddlClient.SelectedValue, txtinvoiceno.Text, txtinvoicedate.Text);
    }

    private void GetEmployeeDetail()
    {
        DataTable ds = new DataTable();
        ds = ObjectBA.SelectPayrollMonthly(ddlClient.SelectedValue);
        Dg.DataSource = ds;
        Dg.DataBind();
    }
  

    private void ddlclientnameviewLoad()
    {
        ddlClient.Items.Clear();
        ddlClient.Items.Add("------ Select Client Name -----");
        ddlClient.DataSource = ObjectBA.SelectClinet();
        ddlClient.DataValueField = "CLIENTID";
        ddlClient.DataTextField = "CLIENTNAME";
        ddlClient.DataBind();
    }

    protected void btnwagedetails_Click1(object sender, EventArgs e)
    {
        ReportViwerRegularBillWageStatementLoad();
    }

    protected void ddlClient_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = ObjectBA.SelectClientDetailID(ddlClient.SelectedValue);
        txtdivisionname.Text = dt.Rows[0]["DIVISION"].ToString();
    }

    protected void txtinvoiceno_TextChanged(object sender, EventArgs e)
    {
        if (txtinvoiceno.Text.Trim() == "")
        {
            
        }
        else
        {
            dt = ObjectBA.SelectRegularBillHdrNo(txtinvoiceno.Text);
            txtfromdate.Text = dt.Rows[0]["FROMDATE"].ToString();
            txttodate.Text = dt.Rows[0]["TODATE"].ToString();
            ddlClient.SelectedValue = dt.Rows[0]["CLIENTID"].ToString();
            txtdivisionname.Text = dt.Rows[0]["DIVISION"].ToString();
            txtinvoicedate.Text = dt.Rows[0]["INVOICEDATE"].ToString();
        }
    }

    protected void btnannexure_Click(object sender, EventArgs e)
    {
        GetEmployeeDetail();
    }

    //public void SavePDF(ReportViewer viewer, string savePath)
    //{
    //    byte[] Bytes = viewer.LocalReport.Render(format: "PDF", deviceInfo: "");
    //    using (FileStream stream = new FileStream(savePath, FileMode.Create))
    //    {
    //        stream.Write(Bytes, 0, Bytes.Length);
    //    }
    //}

    protected void btnview_Click(object sender, EventArgs e)
    {
        GetEmployeeDetail();
        
    }

    protected void lblwagestatement_Click(object sender, EventArgs e)
    {
        
    }

    protected void Dg_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "WageStatement")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            GridViewRow row = Dg.Rows[id];
            string ID = (row.FindControl("lblpayroolid") as Label).Text;

            DataSet ds = new DataSet();
            ds = ObjectBA.SelectRegularBillId(ID);

            ReportViwerRegularBillWageStatement.ProcessingMode = ProcessingMode.Local;
            ReportViwerRegularBillWageStatement.LocalReport.ReportPath = Server.MapPath("RptRgbWageStatement.rdlc");
            ReportDataSource datasource = new ReportDataSource("RegularBillForWageStatment", ds.Tables[0]);
            ReportDataSource datasource1 = new ReportDataSource("CompanyDataset", ds.Tables[0]);
            ReportDataSource datasource2 = new ReportDataSource("ClientDataSet", ds.Tables[0]);
            ReportViwerRegularBillWageStatement.LocalReport.DataSources.Clear();
            ReportViwerRegularBillWageStatement.LocalReport.DataSources.Add(datasource);
            ReportViwerRegularBillWageStatement.LocalReport.DataSources.Add(datasource1);
            ReportViwerRegularBillWageStatement.LocalReport.DataSources.Add(datasource2);
            ReportViwerRegularBillWageStatement.DataBind();

            Warning[] warnings;
            string[] streamids;
            string mimeType;
            string encoding;
            string filenameExtension;

            byte[] bytes = ReportViwerRegularBillWageStatement.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);
            string FilePath = Server.MapPath("~/Download/");
            FilePath += "WageStatement.pdf";
            using (FileStream fs = new FileStream(FilePath, FileMode.Create))
            {
                fs.Write(bytes, 0, bytes.Length);

                System.Threading.Thread.Sleep(100);
                string messagealready = "alert('Wages Statment Download Successfully')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", messagealready, true);

            }
        }

        if (e.CommandName == "Invoice")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            GridViewRow row = Dg.Rows[id];
            string ID = (row.FindControl("lblpayroolid") as Label).Text;

            DataSet ds = new DataSet();
            ds = ObjectBA.SelectRegularBillId(ID);

            ReportViwerRegularBillWageStatement.ProcessingMode = ProcessingMode.Local;
            ReportViwerRegularBillWageStatement.LocalReport.ReportPath = Server.MapPath("RptRgbInvoiceBill.rdlc");
            ReportDataSource datasource = new ReportDataSource("AnnexurDataSet", ds.Tables[0]);
            ReportDataSource datasource1 = new ReportDataSource("Company", ds.Tables[0]);
            ReportDataSource datasource2 = new ReportDataSource("CustomerDataSet", ds.Tables[0]);
            ReportDataSource datasource3 = new ReportDataSource("LCMDataSet", ds.Tables[0]);

            ReportViwerRegularBillWageStatement.LocalReport.DataSources.Clear();
            ReportViwerRegularBillWageStatement.LocalReport.DataSources.Add(datasource);
            ReportViwerRegularBillWageStatement.LocalReport.DataSources.Add(datasource1);
            ReportViwerRegularBillWageStatement.LocalReport.DataSources.Add(datasource2);
            ReportViwerRegularBillWageStatement.LocalReport.DataSources.Add(datasource3);

            Warning[] warnings;
            string[] streamids;
            string mimeType;
            string encoding;
            string filenameExtension;

            byte[] bytes = ReportViwerRegularBillWageStatement.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);
            string FilePath = Server.MapPath("~/Download/");
            FilePath += "InvoiceBill.pdf";
            using (FileStream fs = new FileStream(FilePath, FileMode.Create))
            {
                fs.Write(bytes, 0, bytes.Length);

                System.Threading.Thread.Sleep(100);
                string messagealready = "alert('Invoice Bill Download Successfully')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", messagealready, true);

            }
        }

        if (e.CommandName == "Annexur")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            GridViewRow row = Dg.Rows[id];
            string ID = (row.FindControl("lblpayroolid") as Label).Text;

            DataSet ds = new DataSet();
            ds = ObjectBA.SelectRegularBillId(ID);

            ReportViwerRegularBillWageStatement.ProcessingMode = ProcessingMode.Local;
            ReportViwerRegularBillWageStatement.LocalReport.ReportPath = Server.MapPath("RptRgbAnnexur.rdlc");
            ReportDataSource datasource = new ReportDataSource("AnnexurDataSet", ds.Tables[0]);
            ReportDataSource datasource1 = new ReportDataSource("Company", ds.Tables[0]);
            ReportDataSource datasource2 = new ReportDataSource("ClientDataSet", ds.Tables[0]);
            ReportViwerRegularBillWageStatement.LocalReport.DataSources.Clear();
            ReportViwerRegularBillWageStatement.LocalReport.DataSources.Add(datasource);
            ReportViwerRegularBillWageStatement.LocalReport.DataSources.Add(datasource1);
            ReportViwerRegularBillWageStatement.LocalReport.DataSources.Add(datasource2);

            Warning[] warnings;
            string[] streamids;
            string mimeType;
            string encoding;
            string filenameExtension;

            byte[] bytes = ReportViwerRegularBillWageStatement.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);
            string FilePath = Server.MapPath("~/Download/");
            FilePath += "Annexur.pdf";
            using (FileStream fs = new FileStream(FilePath, FileMode.Create))
            {
                fs.Write(bytes, 0, bytes.Length);

                System.Threading.Thread.Sleep(100);
                string messagealready = "alert('Annexur Download Successfully')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", messagealready, true);

            }
        }
    }
}