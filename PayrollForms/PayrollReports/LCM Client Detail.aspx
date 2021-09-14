<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LCM Client Detail.aspx.cs" Inherits="PayrollReports_LCM_Client_Detail" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 531px">
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1257px" PageCountMode="Actual">
            <LocalReport ReportPath="PayrollReports\Sample.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="LCMSqlDataSource1" Name="LCMClient" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
    
        <asp:SqlDataSource ID="LCMSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SuryaOnlineConnectionString %>" SelectCommand="SELECT * FROM [LCMClientMaster]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
