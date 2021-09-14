<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgPettyCashCashOutEntry.aspx.cs" Inherits="PayrollForms_Cashout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-companymaster-tab" data-toggle="pill" href="#pills-companymaster" role="tab" aria-controls="pills-companymaster" style="font-size: smaller" aria-selected="true">Cash Out</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" style="font-size: smaller" aria-selected="true" aria-controls="pills-view">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">

                <div class="tab-pane fade active show" id="pills-companymaster" role="tabpanel" aria-labelledby="pills-companymaster-tab">

                    <div>
                        <h6 class="card-title">Cash Out Entry</h6>
                    </div>

                    <div class="row">
                        <div id="cashout1" class="col-lg-4 col-xl-4">

                            <div class="form-group">
                                <asp:Label ID="lbltransactionid" runat="server" CssClass="label-control col-sm-7 lblnew" Text="Transaction Id"></asp:Label>
                                <div class="col-lg-8 col-xl-8">
                                    <asp:TextBox ID="txttransactionid" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txttransactionid_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblcashoutdate" runat="server" CssClass="label-control col-sm-7 lblnew" Text="Cash Out Date"></asp:Label>
                                <div class="col-lg-7 col-xl-7">
                                    <asp:TextBox ID="txtcashoutdate" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblcashto" runat="server" CssClass="label-control col-sm-7 lblnew" Text="Cash To"></asp:Label>
                                <div class="col-lg-7 col-xl-7">
                                    <asp:TextBox ID="txtcashto" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtcashto_TextChanged"></asp:TextBox>
                                </div>
                            </div>


                            <div class="form-group">
                                <asp:Label ID="lblclientname" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Client Name"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtclientname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtclientname_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbldepartment" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Department"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtdepartment" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtdepartment_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblcashoutnreason" runat="server" CssClass="label-control col-sm-11 lblnew" Text="Cash Out Reason"></asp:Label>
                                <div class="col-lg-11 col-xl-11">
                                    <asp:DropDownList ID="ddlcashoutreason" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True" AutoPostBack="true">
                                        <asp:ListItem>----SELECT REASON----</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Button ID="btnadd" runat="server" CssClass="btn btn-primary" style="font-size: smaller" Text="Add" Width="75" PostBackUrl="~/PayrollForms/PgPettyCashAddForms.aspx" />
                        </div>

                        <div id="cashout3" class="col-lg-4 col-xl-4">
                            <div class="form-group ">
                                <asp:CheckBox ID="chkgetfrom" Text="" runat="server" OnCheckedChanged="chkgetfrom_CheckedChanged" AutoPostBack="true" />
                                <asp:Label ID="lblgetfrom" runat="server" CssClass="label-conrol lblnew" Text="Get From Advance Request"></asp:Label>
                                <asp:Panel ID="pnlgetfrom" runat="server" Visible="false">
                                    <asp:Label ID="lblselfadvancecode" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Self Advance Code"></asp:Label>
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtselfadvancecode" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtselfadvancecode_TextChanged"></asp:TextBox>
                                    </div>
                                </asp:Panel>
                            </div>

                            <div class="form-group ">
                                <asp:CheckBox ID="chktoemp" Text="" runat="server" OnCheckedChanged="chktoemployee_CheckedChanged" AutoPostBack="true" />
                                <asp:Label ID="lbltoemp" runat="server" CssClass="label-conrol lblnew" Text="To Employee"></asp:Label>
                                <asp:Panel ID="pnltoemp" runat="server" Visible="false">
                                    <asp:Label ID="lblempname" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Employee Name"></asp:Label>
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtempname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtempname_TextChanged"></asp:TextBox>
                                    </div>
                                </asp:Panel>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbldivisionname" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Division Name"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtdivisionname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtdivisionname_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblempcode" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Employee Code"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtempcode" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtempcode_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group ">
                                <asp:CheckBox ID="chktick" Text="" runat="server" OnCheckedChanged="chktick_CheckedChanged" AutoPostBack="true" />
                                <asp:Label ID="lbltick" runat="server" CssClass="label-conrol lblnew" Text="Tick If Bill Necessary"></asp:Label>
                                <asp:Panel ID="pnltick" runat="server" Visible="false">
                                    <asp:Label ID="lblbillno" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Bill.No"></asp:Label>
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtbillno" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtbillno_TextChanged"></asp:TextBox>
                                    </div>
                                </asp:Panel>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblamount" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Amount"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtamount" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblremarks" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Remarks"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtremarks" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" Height="75px" AutoComplete="off" OnTextChanged="txtremarks_TextChanged" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row">

                        <div id="cashout4" class="col-lg-2 col-xl-2">

                            <h6>Cash On Hand</h6>

                            <div class="form-group">
                                <asp:Label ID="lblh2000s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="2000s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txth2000s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" OnTextChanged="txth2000s_TextChanged"></asp:TextBox>

                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblh20s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="20s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txth20s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txth20s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="cashout5" class="col-lg-2 col-xl-2">
                            <br />
                            <div class="form-group">

                                <asp:Label ID="lblh500s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="500s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txth500s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txth500s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblh10s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="10s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txth10s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txth10s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="cashout6" class="col-lg-2 col-xl-2">
                            <br />
                            <div class="form-group">
                                <asp:Label ID="lblh200s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="200s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txth200s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txth200s_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblh5s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="5s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txth5s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txth5s_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div id="cashout7" class="col-lg-2 col-xl-2">
                            <br />
                            <div class="form-group">
                                <asp:Label ID="lblh100s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="100s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txth100s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txth100s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblh2s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="2s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txth2s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txth2s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="cashout8" class="col-lg-2 col-xl-2">
                            <br />
                            <div class="form-group">
                                <asp:Label ID="lblh50s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="50s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txth50s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txth50s_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblh1s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="1s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txth1s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txth1s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div id="cashout9" class="col-lg-2 col-xl-2">
                            <br />
                            <br />
                            <br />

                            <div class="form-group">
                                <asp:Label ID="lblhtotalamount" runat="server" CssClass="label-control col-sm-12 lblnew" Text="TotalAmount"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txthtotalamount" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div id="cashout10" class="col-lg-2 col-xl-2">
                            <h6>Dinomination</h6>

                            <div class="form-group">
                                <asp:Label ID="lbld2000s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="2000s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtd2000s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txtd2000s_TextChanged"></asp:TextBox>

                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbld20ss" runat="server" CssClass="label-control col-sm-10 lblnew" Text="20s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtd20s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txtd20s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="cashout11" class="col-lg-2 col-xl-2">
                            <br />
                            <div class="form-group">

                                <asp:Label ID="lbld500s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="500s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtd500s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txtd500s_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbld10s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="10s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtd10s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txtd10s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="cashout12" class="col-lg-2 col-xl-2">
                            <br />
                            <div class="form-group">
                                <asp:Label ID="lbld200s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="200s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtd200s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txtd200s_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbld5s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="5s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtd5s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txtd5s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="cashout13" class="col-lg-2 col-xl-2">
                            <br />
                            <div class="form-group">
                                <asp:Label ID="lbld100s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="100s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtd100s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txtd100s_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbld2s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="2s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtd2s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txtd2s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="cashout14" class="col-lg-2 col-xl-2">
                            <br />
                            <div class="form-group">
                                <asp:Label ID="lbld50s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="50s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtd50s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txtd50s_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbld1s" runat="server" CssClass="label-control col-sm-10l lblnew" Text="1s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtd1s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txtd1s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div id="cashout15" class="col-lg-2 col-xl-2">
                            <br />
                            <br />
                            <br />

                            <div class="form-group">
                                <asp:Label ID="lbldtotalamount" runat="server" CssClass="label-control col-sm-12 lblnew" Text="TotalAmount"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtdtotalamount" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                      

                        <div id="CM-btn" class=" col-lg-12 col-xl-12">
                            <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>
                            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" style="font-size: smaller" Text="Save" Width="120" OnClick="btnsave_Click" OnClientClick="return validate()" />

                            <asp:Button ID="btnneww" runat="server" CssClass="btn btn-primary" style="font-size: smaller" Text="New" Width="120" OnClick="btnneww_Click" />

                            <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" style="font-size: smaller" Text="Close" Width="120" PostBackUrl="~/PayrollForms/SubmenuPettyCash.aspx"/>

                            <asp:Button ID="btnprint" runat="server" CssClass="btn btn-primary" style="font-size: smaller" Text="Print" Width="120" />

                            <asp:Button ID="btnvocherreport" runat="server" CssClass="btn btn-primary" style="font-size: smaller" Text="Voucher Report" Width="130" />
                        </div>
                    </div>

                </div>

                <%-------------------------------view--------------------------------%>

                <div class="tab-pane fade" id="pills-view" role="tabpanel">

                    <div class="row">
                        <div id="cashoutview1" class="col-lg-2 col-xl-2">
                            <div class="form-group">
                                <asp:Label ID="lblfromdateview" runat="server" CssClass="label-control col-sm-12 lblnew" Text="From Date"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtfromdateview" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbltodateview" runat="server" CssClass="label-control col-sm-12 lblnew" Text="To Date"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttodateview" CssClass="form-control form-control-sm fo txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div id="cashoutview2" class="col-lg-4 col-xl-4">
                            <div class="form-group">
                                <asp:Label ID="lblnameview" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Name"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtnameview" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" OnTextChanged="txtnameview_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblcashoutreasonview" runat="server" CssClass="label-control col-sm-11 lblnew" Text="Cash Out Reason"></asp:Label>
                                <div class="col-lg-11 col-xl-11">
                                    <asp:DropDownList ID="ddlcashoutreasonview" CssClass="form-control form-control-sm txtnew" runat="server">
                                        <asp:ListItem>----Reason----</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>
                        </div>

                        <div id="cashoutview3" class="col-lg-2 col-xl-2">
                            <br />
                            <asp:Button ID="btnview" CssClass="btn btn-primary form-control-sm" runat="server" style="font-size: smaller" Text="View" Width="120px" OnClick="btnview_Click" />
                            <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />
                        </div>
                    </div>

                    <div class="row">
                    
                        <div id="tableview-endview" class=" col-lg-12 col-xl-12">

                            <asp:GridView ID="Dgcashoutview" runat="server" AutoGenerateColumns="false" CssClass="table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Font-Size="10pt" OnSelectedIndexChanged="Dgcashoutview_SelectedIndexChanged">
                                <Columns>

                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" />

                                    <asp:TemplateField HeaderText="CASHOUT ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCashOutId" runat="server" Text='<%# Bind("CASHOUTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TRANSACTION ID">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTransactionId" runat="server" Text='<%# Bind("TRANSACTIONID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CASH DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCashDate" runat="server" Text='<%# Bind("CASHDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CASH TO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCashTo" runat="server" Text='<%# Bind("CASHTO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblClientname" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEPARTMENT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDepartment" runat="server" Text='<%# Bind("DEPARTMENT") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CASH OUT REASION">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCashOutReasion" runat="server" Text='<%# Bind("CASHOUTREASON") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="REMARK">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("REMARK") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ADVANCE CODE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAdvanceCode" runat="server" Text='<%# Bind("ADVANCECODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="	EMPLOYEE NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("EMPLOYEENAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="	DIVISION NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDivisionName" runat="server" Text='<%# Bind("DIVISIONNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="	EMPLOYEECODE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmployeeCode" runat="server" Text='<%# Bind("EMPLOYEECODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="	BILLNO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBillNo" runat="server" Text='<%# Bind("BILLNO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="	AMOUNT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("AMOUNT") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="	HAND 2000">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHAND2000" runat="server" Text='<%# Bind("HAND2000") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="	HAND 500">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHAND500" runat="server" Text='<%# Bind("HAND500") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="HAND 200">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHAND200" runat="server" Text='<%# Bind("HAND200") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="HAND 100">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHAND100" runat="server" Text='<%# Bind("HAND100") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>
                                   
                                    <asp:TemplateField HeaderText="HAND 50">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHAND50" runat="server" Text='<%# Bind("HAND50") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="HAND 20">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHAND20" runat="server" Text='<%# Bind("HAND20") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="HAND 10">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHAND10" runat="server" Text='<%# Bind("HAND10") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="HAND5">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHAND5" runat="server" Text='<%# Bind("HAND5") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="HAND2">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHAND2" runat="server" Text='<%# Bind("HAND2") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="HAND1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHAND1" runat="server" Text='<%# Bind("HAND1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="HAND TOTAL">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHANDTOTAL" runat="server" Text='<%# Bind("HANDTOTAL") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>
                                                                        
                                    <asp:TemplateField HeaderText="	DINO 2000">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDINO2000" runat="server" Text='<%# Bind("DINO2000") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="	DINO 500	">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDINO500" runat="server" Text='<%# Bind("DINO500") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="DINO 200">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDINO200" runat="server" Text='<%# Bind("DINO200") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DINO 100">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDINO100" runat="server" Text='<%# Bind("DINO100") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DINO 50">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDINO50" runat="server" Text='<%# Bind("DINO50") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>
                                  
                                    <asp:TemplateField HeaderText="DINO 20">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDINO20" runat="server" Text='<%# Bind("DINO20") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DINO 10">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDINO10" runat="server" Text='<%# Bind("DINO10") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DINO 5">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDINO5" runat="server" Text='<%# Bind("DINO5") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DINO 2">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDINO2" runat="server" Text='<%# Bind("DINO2") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DINO 1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDINO1" runat="server" Text='<%# Bind("DINO1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DINO TOTAL">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDINOTOTAL" runat="server" Text='<%# Bind("DINOTOTAL") %>'></asp:Label>
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" style="font-size: smaller" Text="Back" PostBackUrl="~/PayrollForms/PgPettyCashCashOutEntry.aspx" Width="120" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" style="font-size: smaller" Text="Master Menu" PostBackUrl="~/PayrollForms/SubmenuPettyCash.aspx" Width="120" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

 <%--/*----------------------------------------*/--%>

    <%--/*---Date Picker----*/--%>

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtcashoutdate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtfromdateview.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodateview.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
        }
    </script>

    <%--/*-----------------*/--%>

    <%--/*---Page Reload----*/--%>

    <script type="text/javascript">

        function pageLoad() {
            if ($('#ContentPlaceHolder1_hidcurrenttab').val() == "2") {
                $('#pills-view-tab').tab('show');
            }
        };

    </script>

    <%--/*-----------------*/--%>

     
    <%--/*---Message Validation----*/--%>


    <script type="text/javascript">
        function validate()
        {
            if (document.getElementById("<%=txttransactionid.ClientID%>").value == "") {
              alert("Enter The Transaction Id");
              document.getElementById("<%=txttransactionid.ClientID%>").focus();
              return false;
          }

             return true;
      }
    </script>





</asp:Content>

