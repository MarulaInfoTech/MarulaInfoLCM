<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgReport-C-MonthlyWageStatement.aspx.cs" Inherits="PayrollForms_APForm_PgReport_C_MonthlyWageStatement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <br />
    <div>
        <h5 class="card-title">Wage Statement</h5>
    </div>
    <br />
    <div class="row">

        <div id="WS-WageStatement" class="col-lg-2 col-xl-2">
            <br />
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

        <div class="col-lg-3 col-xl-3">
            <br />
            <asp:Label ID="lblCompanyname" runat="server" CssClass="label-conrol" Text="Company Name"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:DropDownList ID="ddlcompanyname" CssClass="form-control" runat="server" AppendDataBoundItems="True">
                        <asp:ListItem>--Select Company Name--</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <asp:Label ID="lbldivisionname" runat="server" CssClass="label-conrol" Text="Division Name"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:TextBox ID="txtdivisionname" CssClass="form-control" runat="server" placeholder="Division Name"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-xl-3">
            <br />
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <div class="row">
                        <div class="col-2">
                            <asp:CheckBox ID="Chbx1" runat="server" Text="" />
                        </div>
                        <div class="col-10">
                            <asp:Label ID="lbldepartment" runat="server" CssClass="label-conrol" Text="Department"></asp:Label>
                            <asp:DropDownList ID="ddldepartment" CssClass="form-control" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem>--Department--</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>

            <asp:Label ID="lblissuetype" runat="server" CssClass="label-conrol" Text="Issue Type"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:DropDownList ID="ddlissuetype" CssClass="form-control" runat="server" AppendDataBoundItems="True">
                        <asp:ListItem>---Issue Type---</asp:ListItem>
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>ATM</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

        </div>

        <div class="col-lg-2 col-xl-2">
            <br />
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
            <br />
            <asp:Button ID="btnreport" runat="server" CssClass="btn btn-primary" Text="Report" Width="120" />
            <br />
            <asp:Label ID="lblMessageBox" class="alert alert-secondary" role="alert" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>
        </div>

        <div class="col-lg-2 col-xl-2">
            <br />
            <br />
            <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary " Text="New" Width="120" />
            <br />
            <br />
            <br />
            <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/SubmenuReports-C.aspx" Width="120" />
        </div>

    </div>
    <br />

    <div class="row">

        <div id="tableview-Report" class="col-lg-12 col-xl-12">
        </div>

    </div>



    <%--/*---Message Hide Code----*/--%>

    <script type="text/javascript">
        window.onload = function () {
            var seconds = 2;
            setTimeout(function () {
                document.getElementById("<%=lblMessageBox.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>

    <%--/*-----------------*/--%>
</asp:Content>

