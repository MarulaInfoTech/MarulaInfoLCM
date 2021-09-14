<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="RegularBillWageStatement.aspx.cs" Inherits="PayrollForms_PayrollReports_RegularBillWageStatement" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <h5>Wage Statement</h5>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">
        <ContentTemplate>

            <div class="col-lg-12 col-xl-12">
                <div class="row">
                    <div id="invoice1" class="col-lg-2 col-xl-2">
                        <div class="form-group">
                            <asp:Label ID="lblinvoiceno" CssClass="label-control col-sm-9 lblnew" runat="server" Visible="false" Text="Invoice.No"></asp:Label>
                            <div class="col-lg-12 col-xl-12">
                                <asp:TextBox ID="txtinvoiceno" CssClass="form-control form-control-sm txtnew" runat="server" AutoPostBack="True" Visible="false" OnTextChanged="txtinvoiceno_TextChanged"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblinvoicedate" CssClass="label-control col-sm-9 lblnew" runat="server" Visible="false" Text="Invoice.Date"></asp:Label>
                            <div class="col-lg-12 col-xl-12">
                                <asp:TextBox ID="txtinvoicedate" CssClass="form-control form-control-sm txtnew" runat="server" Visible="false" ></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div id="invoice2" class="col-lg-4 col-xl-4">
                        <div class="form-group">
                            <asp:Label ID="lblclientnamename" CssClass="label-control col-sm-9 lblnew" runat="server" Text="Client Name"></asp:Label>
                            <div class="col-lg-12 col-xl-12">
                                <asp:DropDownList ID="ddlClient" CssClass="form-control form-control-sm txtnew" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlClient_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lbldivisionname" CssClass="label-control col-sm-9 lblnew" runat="server" Text="Division Name"></asp:Label>
                            <div class="col-lg-12 col-xl-12">
                                <asp:TextBox ID="txtdivisionname" CssClass="form-control form-control-sm txtnew" runat="server" ></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div id="invoice8" class="col-lg-2 col-xl-2">
                        <br />
                        <asp:Button ID="btnview" CssClass="btn btn-primary form-control-sm" runat="server" Text="View" Width="120px" Style="font-size: smaller" OnClick="btnview_Click" /><br />
                        <br />
                        <asp:Button ID="btnclose" CssClass="btn btn-primary form-control-sm" runat="server" Text="Close" Width="120px" Style="font-size: smaller" PostBackUrl="~/PayrollForms/SubmenuOffRollLCMReports.aspx" />
                    </div>

                    <div id="invoice4" class="col-lg-2 col-xl-2">
                        <div class="form-group">
                            <asp:Label ID="lblfromdate" CssClass="label-control col-sm-9 lblnew" runat="server" Visible="false" Text="FromDate"></asp:Label>
                            <div class="col-lg-12 col-xl-12">
                                <asp:TextBox ID="txtfromdate" CssClass="form-control form-control-sm txtnew" Visible="false" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lbltodate" CssClass="label-control col-sm-9 lblnew" runat="server" Visible="false" Text="ToDate"></asp:Label>
                            <div class="col-lg-12 col-xl-12">
                                <asp:TextBox ID="txttodate" CssClass="form-control form-control-sm txtnew" runat="server" Visible="false"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-2 col-xl-2">
                        <asp:Button ID="btninvoicebill" CssClass="btn btn-primary form-control-sm" runat="server" Visible="false" Text="invoice Bill" Width="120px" Style="font-size: smaller" />
                        <asp:Button ID="btnannexure" CssClass="btn btn-primary form-control-sm" runat="server" Visible="false" Text="Annexure" Width="120px" Style="font-size: smaller" OnClick="btnannexure_Click" />

                        <asp:Button ID="btnwagedetails" CssClass="btn btn-primary form-control-sm" runat="server" Text="Wage Statement" Width="120px" Style="font-size: smaller" OnClick="btnwagedetails_Click1" />
                        <asp:Button ID="btnattendance" CssClass="btn btn-primary form-control-sm" runat="server" Visible="false" Text="Attendance" Width="120px" Style="font-size: smaller" />
                    </div>
                </div>
            </div>

            <div class="row">
                <div id="tableview-endview" class=" col-lg-12 col-xl-12">
                    <asp:GridView ID="Dg" runat="server" CssClass="Grid table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999"
                        BorderStyle="Solid" BorderWidth="3px" Font-Size="10pt" AutoGenerateColumns="False" OnRowCommand="Dg_RowCommand" BackColor="#f5f5f0">

                        <Columns>

                            <asp:TemplateField HeaderText="RGB ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblpayroolid" runat="server" Text='<%# Bind("RGBID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="FROM DATE">
                                <ItemTemplate>
                                    <asp:Label ID="lblfromdate" runat="server" Text='<%# Bind("FROMDATE") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="TO DATE">
                                <ItemTemplate>
                                    <asp:Label ID="lbltodate" runat="server" Text='<%# Bind("TODATE") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="CLIENT NAME">
                                <ItemTemplate>
                                    <asp:Label ID="lblclientname" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DIVISION">
                                <ItemTemplate>
                                    <asp:Label ID="lbldivision" runat="server" Text='<%# Bind("DIVISION") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="INVOICE NO">
                                <ItemTemplate>
                                    <asp:Label ID="lblInvNo" runat="server" Text='<%# Bind("INVOICENO") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="INVOICE DATE">
                                <ItemTemplate>
                                    <asp:Label ID="lblInvDate" runat="server" Text='<%# Bind("INVOICEDATE") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ACC YEAR">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccYear" runat="server" Text='<%# Bind("ACCYEAR") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="CLIENT CODE">
                                <ItemTemplate>
                                    <asp:Label ID="lblClntCode" runat="server" Text='<%# Bind("CLIENTCODE") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>                            

                            <asp:TemplateField HeaderText="WAGESTATEMENT">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lblwagestatement" CommandName="WageStatement" runat="server" Text='PDF'
                                        CommandArgument='<%# Container.DataItemIndex %>' OnClick="lblwagestatement_Click"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="INVOICE">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lblInvocie" CommandName="Invoice" runat="server" Text='PDF'
                                        CommandArgument='<%# Container.DataItemIndex %>' OnClick="lblwagestatement_Click"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ANNEXUR">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lblAnnexur" CommandName="Annexur" runat="server" Text='PDF'
                                        CommandArgument='<%# Container.DataItemIndex %>' OnClick="lblwagestatement_Click"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>

                        </Columns>
                        <HeaderStyle BackColor="#A6A6A6" />
                    </asp:GridView>
                </div>
            </div>

            <div class="row col-lg-12 col-xl-12 ">
                <rsweb:ReportViewer ID="ReportViwerRegularBillWageStatement" runat="server" Width="1200px" Font-Names="Verdana" Font-Size="10pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" BackColor="#CCCCB3" BorderColor="#999999" BorderStyle="Groove">
                    <LocalReport ReportPath="PayrollForms\RptRgbAnnexur.rdlc">
                    </LocalReport>
                </rsweb:ReportViewer>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>


    <%-- <div class="container-fluid">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col"></th>
                    <th scope="col">
                        <h5>Menu</h5>
                    </th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row"></th>
                    <td>
                       
                    </td>
                    <td>
                        <asp:Button ID="btnclose" CssClass="btn btn-primary form-control-sm" runat="server" Text="Close" Width="120px" Style="font-size: smaller" PostBackUrl="~/PayrollForms/SubmenuOffRollLCMReports.aspx"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>--%>

    <%--/*--------------------------------------*/--%>

    <%-- <%--/*---Date Picker----*/--%>

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtinvoicedate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtfromdate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
        }
    </script>

    <%--/*-----------------*/--%>

    <%--/*---Message Hide Code----*/--%>

    <%--<script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtinvoiceno.ClientID%>").value == "") {
            alert("Enter Invoice No");
            document.getElementById("<%=txtinvoiceno.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>--%>

    <%-------------------------------------------------------%>
</asp:Content>

