<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgPayReport-Form-27.aspx.cs" Inherits="PayrollForms_PayrollReports_PgPayReport_Form_27" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <br />
    <div>
        <h5 class="card-title">Form-27</h5>
    </div>

    <div class="row">
        <div id="Form-27" class="col-lg-2 col-xl-2">

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

            <asp:Label ID="lblnoofdays" runat="server" CssClass="label-conrol" Text="No.of Days"></asp:Label>
            <div class="form-group">
                <div class=" col-md-12 col-lg-12 col-xl-12">
                    <asp:TextBox ID="txtnoofdays" CssClass="form-control text-uppercase" runat="server" ReadOnly="True"></asp:TextBox>
                </div>
            </div>

        </div>

        <div id="form-27" class=" col-lg-4 col-xl-4 ">

            <asp:Label ID="lblcompanyname" runat="server" CssClass="label-conrol" Text="Company Name"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:DropDownList ID="ddlcompanyname" CssClass="form-control" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                        <asp:ListItem>------Select Company Name-------</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <asp:Label ID="lbldivisionname" runat="server" CssClass="label-conrol" Text="Division Name"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:TextBox ID="txtdivisionname" CssClass="form-control text-uppercase" runat="server" placeholder="Division Name"></asp:TextBox>
                </div>
            </div>
        </div>

        <div id="ED-Empployee2" class=" col-lg-4 col-xl-4">

            <asp:Label ID="lblorderby" runat="server" CssClass="label-conrol" Text="Order By"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-10 col-xl-10">
                    <asp:DropDownList ID="ddlorderby" CssClass="form-control" runat="server" AppendDataBoundItems="True">
                        <asp:ListItem>---Select OrderBy---</asp:ListItem>
                        <asp:ListItem>Employee Code</asp:ListItem>
                        <asp:ListItem>Employee Name</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <br />
            <div class="form-group">
                <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="160" />
                <asp:Label ID="MessageBox" class="alert alert-secondary" role="alert" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>
            </div>
        </div>

        <div id="" class="col-lg-2 col-xl-2">
            <br />
            <br />
            <br />
            <br />
            <div class="form-group">
                <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" Text="Close" Width="140" />
            </div>
        </div>
    </div>
    <br />

    <div class="row">
        <div class=" col-lg-12 col-xl-12 ">

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="500px" Width="1100px" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" BackColor="#CCCCB3" BorderColor="#999999" BorderStyle="Groove">
            </rsweb:ReportViewer>

        </div>

    </div>

</asp:Content>
