<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgTaxes-GST.aspx.cs" Inherits="PayrollForms_PgTaxes_GST" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-companymaster-tab" data-toggle="pill" href="#pills-companymaster" role="tab" aria-controls="pills-companymaster" style="font-size: smaller" aria-selected="true">GST Challan</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" style="font-size: smaller" aria-selected="true" aria-controls="pills-view">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">

                <div class="tab-pane fade active show" id="pills-companymaster" role="tabpanel" aria-labelledby="pills-companymaster-tab">
                    <h6>GST Details</h6>

                    <div class="row col-lg-12 col-xl-12">

                        <div id="" class=" col-lg-3 col-xl-3">

                            <asp:Label ID="lblmonth" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Month"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:DropDownList ID="ddlmonth" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoPostBack="True" AppendDataBoundItems="True">
                                        <asp:ListItem>---- Select Month ----</asp:ListItem>
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

                            <asp:Label ID="lblcgdate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Challan Generate Date"></asp:Label>
                            <div class="form-group">
                                <div class="col-lg-7 col-xl-7">
                                    <asp:TextBox ID="txtcgdate" runat="server" CssClass="form-control form-control-sm txtnew" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <%--/*---Date Picker----*/--%>
                        </div>

                        <div id="" class="col-lg-4 col-xl-4">

                            <div class="form-group row">
                                <asp:Label ID="lblcodeno" runat="server" CssClass="label-conrol col-sm-5 lblnew" Style="font-size: smaller" Text="Code No"></asp:Label>
                                <asp:TextBox ID="txtcodeno" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-6" ReadOnly="true" autocomplete="off" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="lblpaymentmode" runat="server" CssClass="label-conrol col-sm-5 lblnew" Style="font-size: smaller" Text="Payment Mode"></asp:Label>
                                <asp:DropDownList ID="ddlpaymentmode" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-6" runat="server">
                                    <asp:ListItem>-- Select Mode --</asp:ListItem>
                                    <asp:ListItem>Check</asp:ListItem>
                                    <asp:ListItem>Online Payment</asp:ListItem>
                                    <asp:ListItem>DD (DEMAND DRAFT)</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="lblbankname" runat="server" CssClass="label-conrol col-sm-4 lblnew" Style="font-size: smaller" Text="Bank Name"></asp:Label>
                                <asp:TextBox ID="txtbankname" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-7" autocomplete="off" runat="server"></asp:TextBox>
                            </div>

                        </div>

                        <div id="" class="col-lg-3 col-xl-3">

                            <div class="form-group row">
                                <asp:Label ID="lblbranchname" runat="server" CssClass="label-conrol col-sm-6 lblnew" Style="font-size: smaller" Text="Branch Name"></asp:Label>
                                <asp:TextBox ID="txtbranchname" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-6" autocomplete="off" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="lblpreparedby" runat="server" CssClass="label-conrol col-sm-6 lblnew" Style="font-size: smaller" Text="Prepared By"></asp:Label>
                                <asp:TextBox ID="txtpreparedby" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-6" autocomplete="off" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="lblpaymentdate" runat="server" CssClass="label-conrol col-sm-6 lblnew" Style="font-size: smaller" Text="Payment Date"></asp:Label>
                                <asp:TextBox ID="txtpaymentdate" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-5" autocomplete="off" runat="server"></asp:TextBox>
                            </div>

                        </div>

                        <div id="" class=" col-lg-2 col-xl-2">
                            <br />
                            <asp:Label ID="lblb" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text=""></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="120" Style="font-size: smaller" OnClick="btnview_Click" />
                                </div>
                            </div>

                        </div>

                    </div>

                    <h6 class="card-title">GST Payment Details</h6>

                    <div class="row col-lg-12 col-xl-12">

                        <div id="" class="col-lg-3 col-xl-3">

                            <div class="form-group row">
                                <asp:Label ID="lblcgst" runat="server" CssClass="label-conrol col-sm-5 lblnew" Style="font-size: smaller" Text="CGST(0005)"></asp:Label>
                                <asp:Label ID="Label7" runat="server" CssClass="label-conrol col-2" Style="font-size: smaller" Text="9%"></asp:Label>
                                <asp:TextBox ID="txtcgst" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-5" autocomplete="off" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="lbligst" runat="server" CssClass="label-conrol col-sm-5 lblnew" Style="font-size: smaller" Text="IGST(0008)"></asp:Label>
                                <asp:Label ID="Label1" runat="server" CssClass="label-conrol col-2" Style="font-size: smaller" Text="9%"></asp:Label>
                                <asp:TextBox ID="txtigst" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-5" autocomplete="off" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="lblcess" runat="server" CssClass="label-conrol col-sm-5 lblnew" Style="font-size: smaller" Text="CESS(0009)"></asp:Label>
                                <asp:Label ID="Label2" runat="server" CssClass="label-conrol col-2" Style="font-size: smaller" Text="%"></asp:Label>
                                <asp:TextBox ID="txtcess" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-5" autocomplete="off" runat="server"></asp:TextBox>
                            </div>

                        </div>

                        <div id="" class="col-lg-3 col-xl-3">

                            <div class="form-group row">
                                <asp:Label ID="lblsgst" runat="server" CssClass="label-conrol col-sm-5 lblnew" Style="font-size: smaller" Text="SGST(0006)"></asp:Label>
                                <asp:Label ID="Label3" runat="server" CssClass="label-conrol col-2" Style="font-size: smaller" Text="9%"></asp:Label>
                                <asp:TextBox ID="txtsgst" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-5" autocomplete="off" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="lbltotalgst" runat="server" CssClass="label-conrol col-sm-5 lblnew" Style="font-size: smaller" Text="Total GST"></asp:Label>
                                <asp:Label ID="Label4" runat="server" CssClass="label-conrol col-2" Style="font-size: smaller" Text="0%"></asp:Label>
                                <asp:TextBox ID="txttotalgst" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-5" autocomplete="off" runat="server" AutoPostBack="true" OnTextChanged="txttotalgst_TextChanged"></asp:TextBox>
                            </div>

                        </div>

                        <div id="" class="col-lg-5 col-xl-5">

                            <div class="form-group row">
                                <asp:Label ID="lblpurchasevalue" runat="server" CssClass="label-conrol col-sm-6 lblnew" Style="font-size: smaller" Text="Purchase Value"></asp:Label>
                                <asp:TextBox ID="txtpurchasevalue" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-6" autocomplete="off" AutoPostBack="true" runat="server" OnTextChanged="txtpurchasevalue_TextChanged"></asp:TextBox>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="lbltotalpayabelgstvalue" runat="server" CssClass="label-conrol col-sm-6 lblnew" Style="font-size: smaller" Text="Total Payabel GST Value"></asp:Label>
                                <asp:TextBox ID="txttotalpayabelgstvalue" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-6" autocomplete="off" runat="server" AutoPostBack="true" OnTextChanged="txttotalpayabelgstvalue_TextChanged"></asp:TextBox>

                            </div>

                            <div class="form-group row">
                                <asp:Label ID="lblpaymentgststatus" runat="server" CssClass="label-conrol col-sm-6 lblnew" Style="font-size: smaller" Text="GST Payment Status"></asp:Label>
                                <asp:DropDownList ID="ddlpaymentgststatus" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-6" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlpaymentgststatus_SelectedIndexChanged">
                                    <asp:ListItem>-- Select Payment Status --</asp:ListItem>
                                    <asp:ListItem>Paid</asp:ListItem>
                                    <asp:ListItem>Not Paid</asp:ListItem>
                                    <asp:ListItem>Pending</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row col-lg-12 col-xl-12">

                            <div id="" class="col-lg-1 col-xl-1">
                                <%-- <asp:CheckBox ID="chkbox" class="custom-checkbox" Text="..Tick to Get All Pending" runat="server" OnCheckedChanged="chkbox_CheckedChanged" />--%>
                                <%--<asp:Label ID="lblchkbox" runat="server" CssClass="label-conrol" Text="Tick to Get All Pending" Font-Size="10pt"></asp:Label>--%>
                            </div>

                            <div id="" class="col-lg-2 col-xl-2">

                                <div class="form-group row">
                                    <asp:Button ID="btncalculat" runat="server" CssClass="btn btn-primary" Text="Calculat" Width="120" Style="font-size: smaller" OnClick="btncalculat_Click" />
                                </div>
                            </div>

                            <div id="" class="col-lg-5 col-xl-5">
                                <div class="form-group row">
                                    <asp:Label ID="lblchallangstpayreceipt" runat="server" CssClass="label-conrol col-sm-5 lblnew" Text="GST Payment Receipt"></asp:Label>
                                    <asp:FileUpload ID="uploadchallangstpayreceipt" CssClass="form-control form-control-sm txtnew col-sm-7" runat="server" />
                                </div>
                            </div>

                            <div id="" class="col-lg-3 col-xl-3">
                                <div class="form-group row">
                                    <asp:Label ID="lblcpinno" runat="server" CssClass="label-conrol col-sm-5 lblnew" Font-Size="10pt" Text="CPIN No"></asp:Label>
                                    <asp:TextBox ID="txtcpinno" runat="server" CssClass="form-control form-control-sm txtnew col-sm-7" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                    </div>

                    <%--/*----------------------*/--%>

                    <br />

                    <div class="row">

                        <div id="tableview-frontview" class="col-lg-12 col-xl-12">

                            <asp:GridView ID="DgGSTFront" runat="server" CssClass="table table-hover table-secondary"
                                HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px"
                                Font-Size="10pt" AutoGenerateColumns="False" ShowFooter="True">

                                <Columns>

                                    <asp:TemplateField HeaderText="Select">

                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkall" class="custom-checkbox" AutoPostBack="true" runat="server" OnCheckedChanged="chkall_CheckedChanged" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkgrid" runat="server" />
                                        </ItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="RGB ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrgbid" runat="server" Text='<%# Bind("RGBID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENT ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblclientid" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Invoice No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblinvoiceno" runat="server" Text='<%# Bind("INVOICENO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="75px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Invoice Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblinvoicedate" runat="server" Text='<%# Bind("INVOICEDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Client Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblclientname" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Client GST No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblclientgstno" runat="server" Text='0'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Division Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldivisionname" runat="server" Text='<%# Bind("DIVISION") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Invoice Grand Total">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgrandtotal" runat="server" Text='<%# Bind("GRANDTOTAL") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CGST Value">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCgstTax" runat="server" Text='<%# Bind("CGSTVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                            <FooterTemplate>
                                                <asp:TextBox ID="txtFoottotalcgstvalue" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="95" Text='' placeholder="0"></asp:TextBox>
                                            </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SGST Value">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSgstTax" runat="server" Text='<%# Bind("SGSTVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                            <FooterTemplate>
                                                <asp:TextBox ID="txtFoottotalsgstvalue" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="95" Text='' placeholder="0"></asp:TextBox>
                                            </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="IGST Value">
                                        <ItemTemplate>
                                            <asp:Label ID="lblIgstTax" runat="server" Text='<%# Bind("IGSTVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                            <FooterTemplate>
                                                <asp:TextBox ID="txtFoottotaligstvalue" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="95" Text='' placeholder="0"></asp:TextBox>
                                            </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CESS Value">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCessTax" runat="server" Text='<%# Bind("CESSVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                            <FooterTemplate>
                                                <asp:TextBox ID="txtFoottotalcessvalue" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="95" Text='' placeholder="0"></asp:TextBox>
                                            </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total GST Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblnetamount" runat="server" Text='<%# Bind("NETAMOUNT") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                            <FooterTemplate>
                                                <asp:TextBox ID="txtFoottotalgstamount" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="95" Text='' placeholder="0"></asp:TextBox>
                                            </FooterTemplate>
                                    </asp:TemplateField>

                                </Columns>
                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <RowStyle BackColor="#f5f5ef" />
                            </asp:GridView>

                        </div>
                    </div>

                    <div class="container">
                        <div class="text-center">
                            <br />

                            <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>

                            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" Text="Save" Width="120" OnClientClick="return validate()" Style="font-size: smaller" OnClick="btnsave_Click" />

                            <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" Style="font-size: smaller" OnClick="btnnew_Click" />

                            <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/SubmenuTaxes.aspx" Width="120" Style="font-size: smaller" />

                            <asp:Button ID="btnprint" runat="server" CssClass="btn btn-primary" Text="Print" Width="120" Style="font-size: smaller" />

                        </div>
                    </div>

                </div>

                <%--/*----------------------*/--%>

                <div class="tab-pane fade" id="pills-view" role="tabpanel">

                    <br />
                    <div class="row">
                        <div id="tableview-endview" class=" col-lg-12 col-xl-12">

                            <asp:GridView ID="DgGSTBack" runat="server" CssClass="table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Font-Size="10pt" OnSelectedIndexChanged="DgGSTBack_SelectedIndexChanged" AutoGenerateColumns="false">
                                <Columns>

                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" />

                                    <asp:TemplateField HeaderText="GST ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgstid" runat="server" Text='<%# Bind("GSTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="GSTMONTH ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgstmonthid" runat="server" Text='<%# Bind("GSTMONTHID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="GST Month">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgstmonth" runat="server" Text='<%# Bind("GSTMONTH") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Challan Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblchallandate" runat="server" Text='<%# Bind("CHALLANDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Code No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcodeno" runat="server" Text='<%# Bind("CODENO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Payment Mode">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpaymentmode" runat="server" Text='<%# Bind("PAYMENTMODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Bank Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbankname" runat="server" Text='<%# Bind("BANKNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="170px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Branch Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbranchname" runat="server" Text='<%# Bind("BRANCHNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Prepared By">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpreparedby" runat="server" Text='<%# Bind("PREPAREDBY") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Payment Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpaymentdate" runat="server" Text='<%# Bind("PAYMENTDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CGST">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcgst" runat="server" Text='<%# Bind("CGST") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="IGST">
                                        <ItemTemplate>
                                            <asp:Label ID="lbligst" runat="server" Text='<%# Bind("IGST") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CESS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcess" runat="server" Text='<%# Bind("CESS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SGST">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsgst" runat="server" Text='<%# Bind("SGST") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total GST">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltotalgst" runat="server" Text='<%# Bind("TOTALGST") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Purchase Value">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpurchasevalue" runat="server" Text='<%# Bind("PURCHASEVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total Payabel GST Value">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotalpayabelgstvalue" runat="server" Text='<%# Bind("TOTALPAYABELGSTVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="GST Payment Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgstpaymentstatus" runat="server" Text='<%# Bind("GSTPAYMENTSTATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CIPN No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcipnno" runat="server" Text='<%# Bind("CIPNNO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgTaxes-GST.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/SubmenuTaxes.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>

                </div>

            </div>

        </ContentTemplate>

        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="DgGSTBack" />
        </Triggers>

    </asp:UpdatePanel>


    <%----------------------------------%>

    <%--/*---Date Picker----*/--%>

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%=txtcgdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%=txtpaymentdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });

           <%-- $('#<%=txtfromdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%=txttodate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%=txtchequedate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });--%>
        }
    </script>

    <%--/*----------------------*/--%>
</asp:Content>

