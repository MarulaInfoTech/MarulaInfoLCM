<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgPayReport-EmployeeDetails.aspx.cs" Inherits="PayrollForms_PayrollReports_PgPayReport_EmployeeDetails" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <h5 class="card-title">Employee Details</h5>
    </div>
    <br />

    <div class="row">
        <div id="ED-EmployeeDetails" class=" col-lg-2 col-xl-2 ">

            <asp:Label ID="lblfromdate" runat="server" CssClass="label-conrol" Text="From Date"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:TextBox ID="txtfromdate" runat="server" CssClass="form-control"></asp:TextBox>
                    <script type="text/javascript">
                        $(function () {
                            $('[id*= txtfromdate]').datepicker({
                                changeMonth: true,
                                changeYear: true,
                                format: "dd/mm/yyyy",
                                language: "tr"
                            });
                        });
                    </script>
                </div>
            </div>

            <asp:Label ID="lbltodate" runat="server" CssClass="label-conrol" Text="To Date"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:TextBox ID="txttodate" runat="server" CssClass="form-control"></asp:TextBox>
                    <script type="text/javascript">
                        $(function () {
                            $('[id*= txttodate]').datepicker({
                                changeMonth: true,
                                changeYear: true,
                                format: "dd/mm/yyyy",
                                language: "tr"
                            });
                        });
                    </script>
                </div>
            </div>

        </div>

        <div id="ED-Empployee1" class=" col-lg-4 col-xl-4 ">

            <asp:Label ID="lblclientname" runat="server" CssClass="label-conrol" Text="Client Name"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:DropDownList ID="ddlclientname" CssClass="form-control" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlclientname_SelectedIndexChanged">
                        <asp:ListItem>------ Select Client Name -------</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <asp:Label ID="lbldepartment" runat="server" CssClass="label-conrol" Text="Department"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:DropDownList ID="ddldepartment" CssClass="form-control" runat="server" AppendDataBoundItems="True">
                        <asp:ListItem>------ Select Department -------</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

        </div>

        <div id="ED-Empployee2" class=" col-lg-4 col-xl-4 ">

            <asp:Label ID="lbldesignation" runat="server" CssClass="label-conrol" Text="Designation"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:DropDownList ID="ddldesignation" CssClass="form-control" runat="server" AppendDataBoundItems="True">
                        <asp:ListItem>------ Select Designation -------</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <br />
            <div class="form-group">
                <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="120" OnClick="btnview_Click" />
            </div>

        </div>

    </div>

    <br />

    <div class="row">
        <div class=" col-lg-12 col-xl-12 ">

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

            <rsweb:ReportViewer ID="EmployeeDetailReport" runat="server" Height="500px" Width="1100px" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" BackColor="#CCCCB3"  BorderColor="#999999" BorderStyle="Groove">
                <LocalReport ReportPath="PayrollForms\PayrollReports\EmployeeDetail.rdlc">
                </LocalReport>
            </rsweb:ReportViewer>

        </div>

    </div>






</asp:Content>

