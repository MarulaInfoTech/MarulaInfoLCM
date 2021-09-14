<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgOnRollForms-Report.aspx.cs" Inherits="PayrollForms_DumReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>
            <br />
            <div>
                <h5 class="card-title">ON Roll Forms Reports</h5>
            </div>

            <div class="row" id="Daily-Header-Style">

                <div id="" class="col-lg-2 col-xl-2">

                    <asp:Label ID="lblfromdate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="From Date"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:TextBox ID="txtfromdate" runat="server" autocomplete="off" CssClass="form-control form-control-sm txtnew"></asp:TextBox>
                        </div>
                    </div>

                    <asp:Label ID="lbltodate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="To Date"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:TextBox ID="txttodate" runat="server" autocomplete="off" CssClass="form-control form-control-sm txtnew"></asp:TextBox>
                        </div>
                    </div>

                </div>

                <div class="col-lg-3 col-xl-3">

                    <asp:Label ID="lblclientname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name"></asp:Label>
                    <div class="form-group">
                        <div class="col-lg-12 col-xl-12">
                            <asp:DropDownList ID="ddlclientname" CssClass="form-control form-control-sm txtnew" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlclientname_SelectedIndexChanged">
                                <asp:ListItem>--- Select Client Name ---</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <asp:Label ID="lbldivisionname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Division Name"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:TextBox ID="txtdivisionname" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="Division Name" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>

                </div>

                <div class="col-lg-3 col-xl-3">

                    <asp:Label ID="lblselectreport" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Select Report" Visible="true"></asp:Label>
                    <div class="form-group">
                        <div class=" col-md-12 col-lg-12 col-xl-12">
                            <asp:DropDownList ID="ddlselectreport" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server">
                                <asp:ListItem>-- Select Report --</asp:ListItem>
                                <asp:ListItem>Forms-25</asp:ListItem>
                                <asp:ListItem>Forms-B</asp:ListItem>
                                <asp:ListItem>Forms-1</asp:ListItem>
                                <asp:ListItem>Forms-12</asp:ListItem>
                                <asp:ListItem>Forms-25-B</asp:ListItem>
                                <asp:ListItem>Forms-15</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <br />

                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary " Text="View" Width="120" Style="font-size: smaller" OnClick="btnview_Click" />
                        </div>
                    </div>

                </div>

                <div id="" class=" col-lg-2 col-xl-2">
           
                    <asp:Label ID="lblb" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text=""></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" Style="font-size: smaller" OnClick="btnnew_Click" />
                        </div>
                    </div>

                </div>

                <div id="" class=" col-lg-2 col-xl-2">
                  
                    <asp:Label ID="Label1" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text=""></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" Text="Close" Width="120" Style="font-size: smaller" PostBackUrl="~/PayrollForms/SubmenuOnRollPEMReports.aspx" />
                        </div>
                    </div>

                </div>

            </div>

            <div class="row">

                <div id="tableview-frontview" class=" col-lg-12 col-xl-12 ">

                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="500px" Width="1100px" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" BackColor="#CCCCB3" BorderColor="#999999" BorderStyle="Groove">

                        <LocalReport ReportPath="PayrollForms\Form-B Report.rdlc">
                        </LocalReport>

                    </rsweb:ReportViewer>

                </div>
            </div>


        </ContentTemplate>
    </asp:UpdatePanel>


    <%----------------------------------%>

    <%-- /*---Date Picker----*/--%>

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtfromdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        }

    </script>

    <%--/*-----------------*/--%>
</asp:Content>

