<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgMasterInvoiceFormat.aspx.cs" Inherits="PayrollForms_InvoiceFormat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-companymaster-tab" data-toggle="pill" href="#pills-companymaster" role="tab" aria-controls="pills-companymaster" style="font-size: smaller" aria-selected="true">Invoice Values</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" style="font-size: smaller" aria-selected="true" aria-controls="pills-view">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">

                <div class="tab-pane fade active show" id="pills-companymaster" role="tabpanel" aria-labelledby="pills-companymaster-tab">
                    <h6>Invoice Values Format</h6>

                    <div class="row">

                        <div id="DM-DepartmentMaster" class=" col-lg-6 col-xl-6">
                            <div class="form-group" style="padding-left: 160px">
                                <asp:Label ID="lblclientname" runat="server" CssClass="label-control col-sm-12 lblnew" Style="text-align: center" Text="Client Name *"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlclientname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlclientname_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem>---Select Client---</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group" style="padding-left: 160px">
                                <asp:Label ID="lbldivision" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Division"></asp:Label>
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtdivision" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" ReadOnly="true" autocomplete="off" OnTextChanged="Dginvoiceview3_SelectedIndexChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <h6>Principle Employer Contribution Details & Service Charges</h6>
                    <h6 style="margin-left:700px;">Tax Details</h6>

                    <div class="row justify-content-center col-lg-12 col-xl-12">

                        <div id="invoiceformat2" class="col-lg-5 col-xl-5">
                            <div class="form-group row ">
                                <asp:Label ID="lblpfwages" runat="server" CssClass="col-lg-8 col-xl-8" Style="font-size: smaller" Text="EPF On EPF Wages *"></asp:Label>
                                <asp:TextBox ID="txtpfwages" CssClass="form-control form-control-sm col-lg-2 col-xl-2 txtnew" autocomplete="off" runat="server" AutoPostBack="True" OnTextChanged="txtpfwages_TextChanged"></asp:TextBox>
                                <asp:Label ID="Label10" runat="server" CssClass="label-conrol col-1" Style="font-size: smaller" Text="%"></asp:Label>
                            </div>

                            <div class="form-group row ">
                                <asp:Label ID="lblesitotalwages" runat="server" CssClass="col-lg-8 col-xl-8" Style="font-size: smaller" Text="ESI On ESI Wages *"></asp:Label>
                                <asp:TextBox ID="txtesitotalwages" CssClass="form-control form-control-sm col-lg-2 col-xl-2 txtnew" autocomplete="off" runat="server" AutoPostBack="True" OnTextChanged="txtesitotalwages_TextChanged"></asp:TextBox>
                                <asp:Label ID="Label6" runat="server" CssClass="label-conrol col-1" Style="font-size: smaller" Text="%"></asp:Label>
                            </div>

                            <div class="form-group row ">
                                <asp:Label ID="lblbonusonwages" runat="server" CssClass="col-lg-8 col-xl-8" Style="font-size: smaller" Text="Bonus On Earned Basic + DA *"></asp:Label>
                                <asp:TextBox ID="txtbonusonwages" CssClass="form-control form-control-sm col-lg-2 col-xl-2 txtnew" autocomplete="off" runat="server" AutoPostBack="True" OnTextChanged="txtbonusonwages_TextChanged"></asp:TextBox>
                                <asp:Label ID="Label12" runat="server" CssClass="label-conrol col-1" Style="font-size: smaller" Text="%"></asp:Label>
                            </div>

                            <div class="form-group row ">
                                <asp:Label ID="lblgratuityonwages" runat="server" CssClass="col-lg-8 col-xl-8" Style="font-size: smaller" Text="Gratuity On Earned Basic + DA *"></asp:Label>
                                <asp:TextBox ID="txtgratuityonwages" CssClass="form-control form-control-sm col-lg-2 col-xl-2 txtnew" autocomplete="off" runat="server" AutoPostBack="True" OnTextChanged="txtgratuityonwages_TextChanged"></asp:TextBox>
                                <asp:Label ID="Label2" runat="server" CssClass="label-conrol col-1" Style="font-size: smaller" Text="%"></asp:Label>
                            </div>

                            <div class="form-group row ">
                                <asp:Label ID="lblleavewithwages" runat="server" CssClass="col-lg-8 col-xl-8" Style="font-size: smaller" Text="Leave With Wages on Total Wages *"></asp:Label>
                                <asp:TextBox ID="txtleavewithwages" CssClass="form-control form-control-sm col-lg-2 col-xl-2 txtnew" autocomplete="off" runat="server" AutoPostBack="True" OnTextChanged="txtleavewithwages_TextChanged"></asp:TextBox>
                                <asp:Label ID="Label4" runat="server" CssClass="label-conrol col-1" Style="font-size: smaller" Text="%"></asp:Label>
                            </div>


                            <div class="form-group row ">
                                <asp:Label ID="lbllwf" runat="server" CssClass="col-lg-8 col-xl-8" Style="font-size: smaller" Text="LTA On Earned Basic + DA *"></asp:Label>
                                <asp:TextBox ID="txtlwf" CssClass="form-control form-control-sm col-lg-2 col-xl-2 txtnew" autocomplete="off" runat="server" AutoPostBack="True" OnTextChanged="txtlwf_TextChanged"></asp:TextBox>
                                <asp:Label ID="Label8" runat="server" CssClass="label-conrol col-1" Style="font-size: smaller" Text="%"></asp:Label>
                            </div>

                            <div class="form-group row ">
                                <asp:Label ID="lblservicechargewithwages" runat="server" CssClass="col-lg-8 col-xl-8" Style="font-size: smaller" Text="Service Charge"></asp:Label>
                                <asp:TextBox ID="txtservicechargewithwages" CssClass="form-control form-control-sm col-lg-2 col-xl-2 txtnew" autocomplete="off" runat="server" AutoPostBack="True" OnTextChanged="txtservicechargewithwages_TextChanged"></asp:TextBox>
                                <asp:Label ID="Label15" runat="server" CssClass="label-conrol col-1" Style="font-size: smaller" Text="%"></asp:Label>
                            </div>

                            <div class="form-group row ">
                                <asp:Label ID="lbltotalservicecharge" runat="server" CssClass="col-lg-8 col-xl-8" Style="font-size: small" Text="Total Statutory & Service Charge"></asp:Label>
                                <asp:TextBox ID="txttotcharg" CssClass="form-control form-control-sm col-lg-2 col-xl-2 txtnew" autocomplete="off" runat="server" OnTextChanged="txttotcharg_TextChanged"></asp:TextBox>
                                <asp:Label ID="Label17" runat="server" CssClass="label-conrol col-1" Style="font-size: smaller" Text="%"></asp:Label>
                            </div>
                        </div>

                        <div id="invoiceformat3" class="col-lg-4 col-xl-4">

                            <div class="form-group row ">
                                <asp:Label ID="lblcgst" runat="server" CssClass="col-lg-7 col-xl-7" Style="font-size: smaller" Text="CGST(0005) *"></asp:Label>
                                <asp:TextBox ID="txtcgst" CssClass="form-control form-control-sm col-lg-3 col-xl-3 txtnew" autocomplete="off" runat="server" AutoPostBack="True" OnTextChanged="txtcgst_TextChanged"></asp:TextBox>
                                <asp:Label ID="Label3" runat="server" CssClass="label-conrol col-2" Style="font-size: smaller" Text="%"></asp:Label>
                            </div>

                            <div class="form-group row ">
                                <asp:Label ID="lblsgst" runat="server" CssClass="col-lg-7 col-xl-7" Style="font-size: smaller" Text="SGST(0006) *"></asp:Label>
                                <asp:TextBox ID="txtsgst" CssClass="form-control form-control-sm col-lg-3 col-xl-3 txtnew" autocomplete="off" runat="server" AutoPostBack="True" OnTextChanged="txtsgst_TextChanged"></asp:TextBox>
                                <asp:Label ID="Label5" runat="server" CssClass="label-conrol col-2" Style="font-size: smaller" Text="%"></asp:Label>
                            </div>

                            <div class="form-group row ">
                                <asp:Label ID="lbligst" runat="server" CssClass="col-lg-7 col-xl-7" Style="font-size: smaller" Text="IGST(0008) *"></asp:Label>
                                <asp:TextBox ID="txtigst" CssClass="form-control form-control-sm col-lg-3 col-xl-3 txtnew" autocomplete="off" runat="server" AutoPostBack="True" OnTextChanged="txtigst_TextChanged"></asp:TextBox>
                                <asp:Label ID="Label9" runat="server" CssClass="label-conrol col-2" Style="font-size: smaller" Text="%"></asp:Label>
                            </div>

                            <div class="form-group row ">
                                <asp:Label ID="lblcess" runat="server" CssClass="col-lg-7 col-xl-7" Style="font-size: smaller" Text="CESS(0009) *"></asp:Label>
                                <asp:TextBox ID="txtcess" CssClass="form-control form-control-sm col-lg-3 col-xl-3 txtnew" autocomplete="off" runat="server" AutoPostBack="True" OnTextChanged="txtcess_TextChanged"></asp:TextBox>
                                <asp:Label ID="Label7" runat="server" CssClass="label-conrol col-2" Style="font-size: smaller" Text="%"></asp:Label>
                            </div>

                            <div class="form-group row ">
                                <asp:Label ID="lbltotal" runat="server" CssClass="col-lg-7 col-xl-7" Style="font-size: smaller" Text="Total Tax"></asp:Label>
                                <asp:TextBox ID="txttotaltax" CssClass="form-control form-control-sm col-lg-3 col-xl-3 txtnew" runat="server" AutoPostBack="True" OnTextChanged="txttotaltax_TextChanged"></asp:TextBox>
                                <asp:Label ID="lbl" runat="server" CssClass="label-conrol col-2" Style="font-size: smaller" Text=""></asp:Label>
                            </div>

                        </div>

                    </div>

                    <div class="container">
                        <div class="text-center">
                            <br />

                            <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>

                            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" Text="Save" Width="120" OnClick="btnsave_Click" OnClientClick="return validate()" Style="font-size: smaller" />

                            <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller" />

                            <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/submenumaster.aspx" Width="120" Style="font-size: smaller" />

                        </div>
                    </div>

                </div>

                <%-------------------------------view--------------------------------%>

                <div class="tab-pane fade" id="pills-view" role="tabpanel">

                    <div class="row">
                        <div id="invoiceformatview1" class="col-lg-4 col-xl-4">
                            <div class="form-group">
                                <asp:Label ID="lblclientnameview" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Client Name"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlclientnameview" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server">
                                        <asp:ListItem>---Select Client---</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                        </div>
                        <div id="invoiceformatview2" class="col-lg-2 col-xl-2">
                            <br />
                            <asp:Button ID="btnview" CssClass="btn btn-primary form-control-sm" runat="server" Text="View" Width="120px" OnClick="btnview_Click" />
                            <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />
                        </div>

                    </div>
                    <br />

                    <div class="row">
                        <div id="tableview-endview" class=" col-lg-12 col-xl-12">

                            <asp:GridView ID="Dginvoiceview3" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="Dginvoiceview3_SelectedIndexChanged" CssClass="table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Font-Size="10pt">
                                <Columns>

                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" />

                                    <asp:TemplateField HeaderText="INVOICEDT ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblINVOICEDTID" runat="server" Text='<%# Bind("INVOICEDTID") %>'></asp:Label>
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

                                    <asp:TemplateField HeaderText="CLIENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCLIENTNAME" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PF WAGES">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPFWAGES" runat="server" Text='<%# Bind("PFWAGES") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ESI WAGES">
                                        <ItemTemplate>
                                            <asp:Label ID="lblESIWAGES" runat="server" Text='<%# Bind("ESIWAGES") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="BONUS WAGE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBONUSWAGE" runat="server" Text='<%# Bind("BONUSWAGE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="GRATUITY WAGE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGRATUITYWAGE" runat="server" Text='<%# Bind("GRATUITYWAGE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="LEAVE WAGE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLEAVEWAGE" runat="server" Text='<%# Bind("LEAVEWAGE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="LWF">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllwf" runat="server" Text='<%# Bind("LWF") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SERVICE CHARGE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSERVICECHARGE" runat="server" Text='<%# Bind("SERVICECHARGE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CGST">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCGST" runat="server" Text='<%# Bind("CGST") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="IGST">
                                        <ItemTemplate>
                                            <asp:Label ID="lblIGST" runat="server" Text='<%# Bind("IGST") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SGST">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSGST" runat="server" Text='<%# Bind("SGST") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CESS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCESS" runat="server" Text='<%# Bind("CESS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL CHARGE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTOTALCHARGE" runat="server" Text='<%# Bind("TOTALCHARGE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgMasterInvoiceFormat.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/submenumaster.aspx" Width="120" Style="font-size: smaller" />
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

    <%--/*---Message Validation----*/--%>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=ddlclientname.ClientID%>").value == "") {
                alert("Enter The Client Name");
                document.getElementById("<%=ddlclientname.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>

    <%--/*-------------------------------------------*/--%>
</asp:Content>

