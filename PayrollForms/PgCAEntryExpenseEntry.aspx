<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgCAEntryExpenseEntry.aspx.cs" Inherits="PayrollForms_ExpenseEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-companymaster-tab" data-toggle="pill" href="#pills-companymaster" role="tab" aria-controls="pills-companymaster" Style="font-size: smaller" aria-selected="true">Expenses Entry</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" Style="font-size: smaller" aria-selected="true" aria-controls="pills-view">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">

                <div class="tab-pane fade active show" id="pills-companymaster" role="tabpanel" aria-labelledby="pills-companymaster-tab">

                    <h6>Expense Entry</h6>
                    <div class="row">
                        <div id="expensesentry1" class="col-lg-5 col-xl-5">

                            <div class="form-group ">
                                <asp:CheckBox ID="chkexpense" Text="" runat="server" OnCheckedChanged="chkexpense_CheckedChanged" AutoPostBack="true" />
                                <asp:Label ID="lblexpense" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Exp.Under Client"></asp:Label>
                                <asp:Panel ID="pnlexpense" runat="server" Visible="false">

                                    <div class="col-lg-8 col-xl-8">
                                        <asp:DropDownList ID="ddlexpense" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True">
                                            <asp:ListItem>----Select Client----</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </asp:Panel>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblavailablebl" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Available Balance"></asp:Label>
                                <div class="col-lg-6 col-xl-6">
                                    <asp:TextBox ID="txtavailablelbl" CssClass="form-control form-control-sm txtnew" placeholder="Available Balance" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblexpensesmonth" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Expense Month"></asp:Label>
                                <div class="col-lg-6 col-xl-6">
                                    <asp:DropDownList ID="ddlexpensesmonth" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server">
                                        <asp:ListItem>----Select Month----</asp:ListItem>
                                        <asp:ListItem>January</asp:ListItem>
                                        <asp:ListItem>February</asp:ListItem>
                                        <asp:ListItem>March</asp:ListItem>
                                        <asp:ListItem>April</asp:ListItem>
                                        <asp:ListItem>May</asp:ListItem>
                                        <asp:ListItem>June</asp:ListItem>
                                        <asp:ListItem>July</asp:ListItem>
                                        <asp:ListItem>August</asp:ListItem>
                                        <asp:ListItem>September</asp:ListItem>
                                        <asp:ListItem>October</asp:ListItem>
                                        <asp:ListItem>November</asp:ListItem>
                                        <asp:ListItem>December</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblcompanyname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Company Name"></asp:Label>
                                <div class="col-lg-10 col-xl-10">
                                    <asp:TextBox ID="txtcompanyname" CssClass="form-control form-control-sm txtnew text-uppercase" placeholder="Company Name" runat="server" AutoComplete="off" OnTextChanged="txtcompanyname_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbladdress" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Address"></asp:Label>
                                <div class="col-lg-10 col-xl-10">
                                    <asp:TextBox ID="txtaddress1" CssClass="form-control form-control-sm txtnew text-uppercase" placeholder="No and Street" runat="server" AutoComplete="off" OnTextChanged="txtaddress1_TextChanged"></asp:TextBox>
                                    <br />
                                    <asp:TextBox ID="txtaddress2" CssClass="form-control form-control-sm txtnew text-uppercase" placeholder="Area" runat="server" AutoComplete="off" OnTextChanged="txtaddress2_TextChanged"></asp:TextBox>
                                    <br />
                                    <asp:TextBox ID="txtaddress3" CssClass="form-control form-control-sm txtnew text-uppercase" placeholder="City" runat="server" AutoComplete="off" OnTextChanged="txtaddress3_TextChanged"></asp:TextBox>
                                </div>

                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblcontactno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Contact.No"></asp:Label>
                                <div class="col-lg-7 col-xl-7">
                                    <asp:TextBox ID="txtcontactno" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="expensesentry2" class="col-lg-6 col-xl-6">

                            <div class="form-group">
                                <asp:Label ID="lblbillno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Bill.No"></asp:Label>
                                <div class="col-lg-6 col-xl-6">
                                    <asp:TextBox ID="txtbillno" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblbilldescription" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Bill Description(2000 char)"></asp:Label>
                                <div class="col-lg-8 col-xl-8">
                                    <asp:TextBox ID="txtbilldescription" CssClass="form-control form-control-sm txtnew text-uppercase" placeholder="Bill Description" runat="server" Height="100px" AutoComplete="off" TextMode="MultiLine" OnTextChanged="txtbilldescription_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblbillamount" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Bill Amount"></asp:Label>
                                <div class="col-lg-8 col-xl-8">
                                    <asp:TextBox ID="txtbillamount" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblpaymentmode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Payment Mode"></asp:Label>
                                <div class="col-lg-6 col-xl-6">
                                    <asp:DropDownList ID="ddlpaymentmode" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server">
                                        <asp:ListItem>----Payment Mode----</asp:ListItem>
                                        <asp:ListItem>Cash</asp:ListItem>
                                        <asp:ListItem>Cheque</asp:ListItem>
                                        <asp:ListItem>Others</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lblcheque" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Cheque/Other.No"></asp:Label>
                            <div class="form-group">
                                <div class="col-lg-12 col-xl-12 ">
                                    <div class="row">
                                        <div class="col-5">
                                            <asp:TextBox ID="txtcheque" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                        </div>
                                        <div class="">
                                        </div>
                                        <div class="col-4">
                                            <asp:TextBox ID="txtdate" CssClass="form-control form-control-sm txtnew" placeholder="Date" runat="server" AutoComplete="off"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>

                            </div>

                            <div class="form-group">
                                <br />
                                <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>

                                <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" Text="Save" Width="120" OnClick="btnsave_Click" OnClientClick="return validate()" Style="font-size: smaller" />

                                <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller" />

                                <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" Text="Close" Width="120" PostBackUrl="~/PayrollForms/SubmenuCaEntry.aspx" Style="font-size: smaller" />

                            </div>
                        </div>
                    </div>

                </div>
                <%-------------------------------view--------------------------------%>

                <div class="tab-pane fade" id="pills-view" role="tabpanel">

                    <div class="row">
                        <div id="invoiceformatview1" class="col-lg-4 col-xl-4">
                            <div class="form-group">
                                <asp:Label ID="lblclientnameview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlclientnameview" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server">
                                        <asp:ListItem>---Select Client---</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                        </div>
                        <div id="invoiceformatview2" class="col-lg-2 col-xl-2">
                            <br />
                            <asp:Button ID="btnview" CssClass="btn btn-primary form-control-sm" runat="server" Text="View" Width="120px" OnClick="btnview_Click" Style="font-size: smaller" />
                            <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />
                        </div>

                    </div>
                    <br />

                    <div class="row">

                        <div id="tableview-endview" class=" col-lg-12 col-xl-12">

                            <asp:GridView ID="Dgexpensesentryview" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="Dgexpensesentryview_SelectedIndexChanged" CssClass="table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Font-Size="10pt">
                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" />

                                    <asp:TemplateField HeaderText="EXPENSES ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEXPENSESID" runat="server" Text='<%# Bind("EXPENSESID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENT ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCLIENTID" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <%--<asp:TemplateField HeaderText="CLIENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCLIENTNAME" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>--%>

                                    <asp:TemplateField HeaderText="EXPENSES MONTH">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEXPENSESMONTH" runat="server" Text='<%# Bind("EXPENSESMONTH") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="AVBBALANCE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAVBBALANCE" runat="server" Text='<%# Bind("AVBBALANCE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="COMPANY NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCOMPANYNAME" runat="server" Text='<%# Bind("COMPANYNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ADDRESS 1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblADDRESS1" runat="server" Text='<%# Bind("ADDRESS1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ADDRESS 2">
                                        <ItemTemplate>
                                            <asp:Label ID="lblADDRESS2" runat="server" Text='<%# Bind("ADDRESS2") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ADDRESS 3">
                                        <ItemTemplate>
                                            <asp:Label ID="lblADDRESS3" runat="server" Text='<%# Bind("ADDRESS3") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CONTACT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCONTACT" runat="server" Text='<%# Bind("CONTACT") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="BILL NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBILLNO" runat="server" Text='<%# Bind("BILLNO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="BILL DESCRIP">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBILLDESCRIP" runat="server" Text='<%# Bind("BILLDESCRIP") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="BILL AMOUNT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBILLAMOUNT" runat="server" Text='<%# Bind("BILLAMOUNT") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PAYMENT MODE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPAYMENTMODE" runat="server" Text='<%# Bind("PAYMENTMODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CHEQUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCHEQUE" runat="server" Text='<%# Bind("CHEQUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDATE" runat="server" Text='<%# Bind("DATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                </Columns>
                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <RowStyle BackColor="#f5f5ef" />
                            </asp:GridView>

                        </div>
                    </div>
                    <br />

                    <div class="container-fluid">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col"></th>
                                    <th scope="col">
                                        <h4>Menu</h4>
                                    </th>
                                    <th scope="col"></th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td>
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgCAEntryExpenseEntry.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/SubmenuCaEntry.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                    </div>

                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <%--/*-------------------------------------------*/--%>

    <%--/*---Page Reload----*/--%>

    <script type="text/javascript">

        function pageLoad() {
            if ($('#ContentPlaceHolder1_hidcurrenttab').val() == "2") {
                $('#pills-view-tab').tab('show');
            }
        };

    </script>

    <%--/*--------------------*/--%>

    <%--/*---Date Picker----*/--%>

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtdate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });

        }
    </script>

    <%--/*-----------------*/--%>

    <%--/*---Message Validation----*/--%>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=ddlexpensesmonth.ClientID%>").value == "") {
                alert("Enter The Expenses Month");
                document.getElementById("<%=ddlexpensesmonth.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>

    <%--/*-------------------------------------------*/--%>
</asp:Content>

