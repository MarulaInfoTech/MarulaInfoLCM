<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgReport26Report.aspx.cs" Inherits="PayrollForms_PayrollReports_PgPayReport_Form_26" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <br />
    <div>
        <h5 class="card-title">Forms</h5>
    </div>

    <div class="row">
        <div id="Form-26" class="col-lg-2 col-xl-2">

            <asp:Label ID="lblfromdate" runat="server" CssClass="label-conrol" Text="From Date"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:TextBox ID="txtfromdate" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>                    
                </div>
            </div>

            <asp:Label ID="lbltodate" runat="server" CssClass="label-conrol" Text="To Date"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:TextBox ID="txttodate" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>                    
                </div>
            </div>

            <asp:Label ID="lblnoofdays" runat="server" CssClass="label-conrol col-sm-12" Text="No.of Days" Visible="true"></asp:Label>
            <div class="form-group">
                <div class=" col-md-12 col-lg-12 col-xl-12">
                    <asp:DropDownList ID="ddlType" CssClass="form-control form-control-sm text-uppercase" runat="server">
                        <asp:ListItem>Report-26</asp:ListItem>
                        <asp:ListItem>Report-27</asp:ListItem>
                        <asp:ListItem>Report-23</asp:ListItem>
                        <asp:ListItem>Report-29</asp:ListItem>
                        <asp:ListItem>Report-28</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

        </div>

        <div id="form-26" class=" col-lg-4 col-xl-4 ">

            <asp:Label ID="lblcompanyname" runat="server" CssClass="label-conrol col-sm-12" Text="Company Name"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:DropDownList ID="ddlcompanyname" CssClass="form-control form-control-sm text-uppercase" runat="server" AppendDataBoundItems="True" 
                        AutoPostBack="True" OnSelectedIndexChanged="ddlcompanyname_SelectedIndexChanged">
                        <asp:ListItem>------Select Company Name-------</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <asp:Label ID="lbldivisionname" runat="server" CssClass="label-conrol col-sm-12" Text="Division Name"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:TextBox ID="txtdivisionname" CssClass="form-control form-control-sm" runat="server" 
                        placeholder="Division Name"></asp:TextBox>
                </div>
            </div>

            <asp:Label ID="lblworkingdays" runat="server" CssClass="label-conrol col-sm-12" Text="No.of Working Days" Visible="false"></asp:Label>
            <div class="form-group">
                <div class=" col-md-12 col-lg-12 col-xl-12">
                    <asp:TextBox ID="txtworkingdays" CssClass="form-control text-uppercase" runat="server" 
                        ReadOnly="True" Width="120" Visible="false"></asp:TextBox>
                </div>
            </div>

        </div>

        <%--<div id="ED-Empployee2" class=" col-lg-4 col-xl-4 ">

           <%-- <asp:Label ID="lbldepartment" runat="server" CssClass="label-conrol" Text="Department" Visible="false"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:DropDownList ID="ddldepartment" CssClass="form-control" runat="server" AppendDataBoundItems="True" Visible="false">
                        <asp:ListItem>------Select Department-------</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>--%>

            <%--<asp:Label ID="lblorderby" runat="server" CssClass="label-conrol" Text="Order By" Visible="false"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-8 col-xl-8">
                    <asp:DropDownList ID="ddlorderby" CssClass="form-control" runat="server" 
                        AppendDataBoundItems="True" Visible="false">
                        <asp:ListItem>---Select OrderBy---</asp:ListItem>
                        <asp:ListItem>Employee Code</asp:ListItem>
                        <asp:ListItem>Employee Name</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>--%>

        <%--</div>--%>

        <div id="" class="col-lg-2 col-xl-2">

            <br />
            <div class="form-group">
                <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="120" OnClick="btnview_Click" />
                <%--<asp:Label ID="MessageBox" class="alert alert-secondary" role="alert" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>--%>
            </div>
            <br />            
            <div class="form-group">
                <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" Text="Close" Width="120" />
            </div>

        </div>

    </div>
    <br />
    <div class="row">
        <div class=" col-lg-12 col-xl-12 ">

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

            <rsweb:ReportViewer ID="ReportViewer1" runat="server"  Height="500px" Width="1100px" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" BackColor="#CCCCB3"  BorderColor="#999999" BorderStyle="Groove">
                <LocalReport ReportPath="PayrollForms\PayrollReports\PaySlip.rdlc">
                </LocalReport>
            </rsweb:ReportViewer>
        </div>

    </div>

      <%--/*---Date Picker----*/--%>

    <script>

        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtfromdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });   
        }
    </script>




</asp:Content>

