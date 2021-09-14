<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="CashInReport.aspx.cs" Inherits="PayrollForms_Account_CashInReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

     <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">
         <ContentTemplate>
             <div class="col-lg-12 col-xl-12">
                <div class="row">
                    

                    <div id="invoice8" class="col-lg-2 col-xl-2">
                        <br />
                        <asp:Button ID="btnview" CssClass="btn btn-primary form-control-sm" runat="server" Text="View" Width="120px" Style="font-size: smaller" OnClick="btnview_Click"/>                      
                    </div>

                    <div>
                        <br />
                        <asp:Button ID="btnclose" CssClass="btn btn-primary form-control-sm" runat="server" Text="Close" Width="120px" Style="font-size: smaller" PostBackUrl="~/PayrollForms/SubmenuPettyCash.aspx" />
                    </div>
                </div>
            </div>

             <div class="row">
                <div id="tableview-endview" class=" col-lg-12 col-xl-12">
                   
                    <rsweb:ReportViewer ID="ReportViewerCashInReport" runat="server" Width="1200px">

                    </rsweb:ReportViewer>
                        
                    
                    
                    </div>
            </div>


         </ContentTemplate>
     </asp:UpdatePanel>
        


</asp:Content>


