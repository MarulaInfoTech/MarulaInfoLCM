<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgReport-C-WagesPaySlip.aspx.cs" Inherits="PayrollForms_APForm_PgReport_C_WagesPaySlip" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>


    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <br />
    <div>
        <h5 class="card-title">Wage PaySlip</h5>
    </div>

    <div class="row">

        <div id="WPS-WagePaySlip" class="col-lg-2 col-xl-2">
            <br />
            <asp:Label ID="lblfromdate" runat="server" CssClass="label-conrol" Text="From Date"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:TextBox ID="txtfromdate" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <asp:Label ID="lbltodate" runat="server" CssClass="label-conrol" Text="To Date"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:TextBox ID="txttodate" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <asp:Label ID="lblpaymonth" runat="server" CssClass="label-conrol" Text="Pay Month"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:TextBox ID="txtpaymonth" CssClass="form-control" runat="server" placeholder="Pay Month"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="col-lg-4 col-xl-4">
            <br />
            <asp:Label ID="lblCompanyname" runat="server" CssClass="label-conrol" Text="Company Name"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:DropDownList ID="ddlcompanyname" CssClass="form-control" runat="server" AppendDataBoundItems="True">
                        <asp:ListItem>--Select Company Name--</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <asp:Label ID="lbldivisionname" runat="server" CssClass="label-conrol" Text="Division Name"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:TextBox ID="txtdivisionname" CssClass="form-control" runat="server" placeholder="Division Name"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:CheckBox ID="ChkDept" runat="server" Text="" AutoPostBack="True" OnCheckedChanged="Chbx1_CheckedChanged" />
                    <asp:Label ID="lbldepartment" runat="server" CssClass="label-conrol" Text="Department"></asp:Label>
                    <asp:DropDownList ID="ddldepartment" CssClass="form-control" runat="server" AppendDataBoundItems="True">
                        <asp:ListItem>---Department---</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <div class="col-lg-4 col-xl-4">
            <br />

            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:CheckBox ID="chkEmpCode" runat="server" Text="" AutoPostBack="True" OnCheckedChanged="chkEmpCode_CheckedChanged" />
                    <asp:Label ID="lblemployeecode" runat="server" CssClass="label-conrol" Text="Employee Code"></asp:Label>
                    <asp:DropDownList ID="ddlemployeecode" CssClass="form-control" runat="server" AppendDataBoundItems="True">
                        <asp:ListItem>--Employee Code--</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <asp:Label ID="lblemployeename" runat="server" CssClass="label-conrol" Text="Employee Name"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                   <asp:TextBox ID="txtemployeename" CssClass="form-control" runat="server" placeholder="Employee Name"></asp:TextBox>
                </div>
            </div>

            <asp:Label ID="lblorderby" runat="server" CssClass="label-conrol" Text="Order By"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:DropDownList ID="ddlorderby" CssClass="form-control" runat="server" AppendDataBoundItems="True">
                        <asp:ListItem>---OrderBy---</asp:ListItem>
                        <asp:ListItem>Emp Code</asp:ListItem>
                        <asp:ListItem>Emp Name</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

        </div>

        <div class="col-lg-2 col-xl-2">
            <br />
            <%--/*---Message Hide Code----*/--%>
            <%--/*-----------------*/--%>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="btnreport" runat="server" CssClass="btn btn-primary" Text="Report" Width="120" OnClick="btnreport_Click" />
            <br />
            <asp:Label ID="lblMessageBox" class="alert alert-secondary" role="alert" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/SubmenuReports-C.aspx" Width="120" />

        </div>
    </div>
    <br />

    <div class="row">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <rsweb:ReportViewer ID="PaySlipReportViewer" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" BackColor=" #d6d6c2" BorderColor="#999999" BorderStyle="Groove" Height="40px" Width="1100">
            <LocalReport ReportPath="PayrollForms\PayrollReports\PaySlip.rdlc">
            </LocalReport>
        </rsweb:ReportViewer>

    </div>

        </ContentTemplate>
    </asp:UpdatePanel>



<%--/*---------------------------------------------------------*/--%>

    <%--/*---Date Picker----*/--%>

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtfromdate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        }
    </script>


    <%--/*----------------------*/--%>

    <%--/*---Message Validation----*/--%>

    <script type="text/javascript">
        function validate()
        {
            if (document.getElementById("<%=txtfromdate.ClientID%>").value == "") {
              alert("Enter From Date");
              document.getElementById("<%=txtfromdate.ClientID%>").focus();
              return false;
            }

          return true;
      }
    </script>

   <%--/*-----------------------*/--%>


<%--/*------------------------------------------------------*/--%>

</asp:Content>

