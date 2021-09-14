<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgPettyCashCashInEntry.aspx.cs" Inherits="PayrollForms_CashIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-companymaster-tab" data-toggle="pill" href="#pills-companymaster" role="tab" aria-controls="pills-companymaster" style="font-size: smaller" aria-selected="true">Cash In</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" style="font-size: smaller" aria-selected="true" aria-controls="pills-view">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">

                <div class="tab-pane fade active show" id="pills-companymaster" role="tabpanel" aria-labelledby="pills-companymaster-tab">

                    <div>
                        <h6 class="card-title">Cash In Entry</h6>
                    </div>

                    <div class="row">

                        <div id="cashin1" class="col-lg-4 col-xl-4">
                            <div class="form-group">
                                <asp:Label ID="lblcashindate" runat="server" CssClass="label-control col-sm-7 lblnew" Text="Cash In Date"></asp:Label>
                                <div class="col-lg-7 col-xl-7">
                                    <asp:TextBox ID="txtcashindatedate" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblcashfrom" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Cash From"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtcashfrom" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtcashfrom_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <%--<div class="form-group">
                                <asp:Label ID="lblclientname" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Client Name"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtclientname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtclientname_TextChanged"></asp:TextBox>
                                </div>
                            </div>--%>

                            <div class="form-group">
                                <asp:Label ID="lblclientname" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Clinet Name"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlclientname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" OnSelectedIndexChanged="ddlclientname_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="true">
                                        <asp:ListItem>----Select Client Name----</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbldivisionname" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Division Name"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtdivisionname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server"  OnTextChanged="txtdivisionname_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblcashinreason" runat="server" CssClass="label-control col-sm-11 lblnew" Text="Cash In Reason"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlcashinreason" CssClass="form-control form-control-sm text-uppercase col-lg-9 col-xl-9 txtnew" runat="server" AppendDataBoundItems="True" AutoPostBack="true">
                                        <asp:ListItem>----SELECT REASON----</asp:ListItem>                                        
                                    </asp:DropDownList>
                                </div><br />
                            <asp:Button ID="btnadd" runat="server" CssClass="btn btn-primary ml-3" style="font-size: smaller" Text="Add" Width="75" PostBackUrl="~/PayrollForms/PgPettyCashAddForms.aspx" />
                            </div>
                        </div>

                        <div id="cashin3" class="col-lg-4 col-xl-4">

                            <div class="form-group ">
                                <asp:CheckBox ID="chkfromemp" Text="" runat="server" OnCheckedChanged="chkfromemployee_CheckedChanged" AutoPostBack="true" />
                                <asp:Label ID="lblfromemp" runat="server" CssClass="label-conrol lblnew" Text="From Employee"></asp:Label>
                                <asp:Panel ID="pnlfromemp" runat="server" Visible="false">
                                    <asp:Label ID="lblempname" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Employee Name"></asp:Label>
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtempname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtempname_TextChanged"></asp:TextBox>
                                    </div>
                                </asp:Panel>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblempcode" runat="server" CssClass="label-control col-sm-7 lblnew" Text="Employee Code"></asp:Label>
                                <div class="col-lg-7 col-xl-7">
                                    <asp:TextBox ID="txtempcode" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtempcode_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbldepartment" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Department"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtdepartment" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtdepartment_TextChanged"></asp:TextBox>
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
                        <div id="cashin4" class="col-lg-2 col-xl-2">
                            <h6>Dinominations</h6>

                            <div class="form-group">
                                <asp:Label ID="lbl2000s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="2000s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txt2000s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txt2000s_TextChanged"></asp:TextBox>

                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbl20s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="20s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txt20s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txt20s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="cashin5" class="col-lg-2 col-xl-2">
                            <br />
                            <div class="form-group">
                                <asp:Label ID="lbl500s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="500s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txt500s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txt500s_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbl10s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="10s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txt10s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" OnTextChanged="txt10s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="cashin6" class="col-lg-2 col-xl-2">
                            <br />
                            <div class="form-group">
                                <asp:Label ID="lbl200s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="200s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txt200s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txt200s_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbl5s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="5s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txt5s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txt5s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="cashin7" class="col-lg-2 col-xl-2">
                            <br />
                            <div class="form-group">
                                <asp:Label ID="lbl100s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="100s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txt100s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txt100s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbl2s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="2s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txt2s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txt2s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="cashin8" class="col-lg-2 col-xl-2">
                            <br />
                            <div class="form-group">
                                <asp:Label ID="lbl50s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="50s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txt50s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txt50s_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbl1s" runat="server" CssClass="label-control col-sm-10 lblnew" Text="1s"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txt1s" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" AutoPostBack="True" OnTextChanged="txt1s_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="cashin9" class="col-lg-2 col-xl-2">
                            <br />                            
                            <br />
                            <div class="form-group">
                                <asp:Label ID="lbltotalamount" runat="server" CssClass="label-control col-sm-12 lblnew" Text="TotalAmount"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttotalamount" CssClass="form-control form-control-sm txtnew" runat="server" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        

                        <div id="CM-btn" class=" col-lg-8 col-xl-8">
                            <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>

                            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" OnClick="btnsave_Click" style="font-size: smaller" OnClientClick="return validate()" />

                            <asp:Button ID="btnneww" runat="server" CssClass="btn btn-primary" Text="New" Width="120" OnClick="btnneww_Click" style="font-size: smaller" />

                            <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" Text="Close" Width="120" style="font-size: smaller" PostBackUrl="~/PayrollForms/SubmenuPettyCash.aspx" />
                        </div>
                    </div>

                </div>

                <%-------------------------------view--------------------------------%>

                <div class="tab-pane fade" id="pills-view" role="tabpanel">

                    <div class="row">
                        <div id="cashinview1" class="col-lg-2 col-xl-2">
                            <div class="form-group">
                                <asp:Label ID="lblfromdateview" runat="server" CssClass="label-control col-sm-12 lblnew" Text="From Date"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtfromdateview" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbltodateview" runat="server" CssClass="label-control col-sm-12 lblnew" Text="To Date"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttodateview" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div id="cashinview3" class="col-lg-4 col-xl-4">
                            <div class="form-group">
                                <asp:Label ID="lblcashfromview" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Cash From"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtcashfromview" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtcashfromview_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="cashinview4" class="col-lg-2 col-xl-2">
                            <br />
                            <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="120" style="font-size: smaller" OnClick="btnview_Click" />

                            <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />
                        </div>
                    </div>

                    <div class="row">
                        
                        <div id="tableview-endview" class=" col-lg-12 col-xl-12">
                            <asp:GridView ID="Dgcashinview" runat="server" AutoGenerateColumns="false" CssClass="table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Font-Size="10pt" OnSelectedIndexChanged="Dgcashinview_SelectedIndexChanged">
                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" />

                                    <asp:TemplateField HeaderText="CASH ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCashId" runat="server" Text='<%# Bind("CASHID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CASH DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCashDate" runat="server" Text='<%# Bind("CASHDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CASH FROM">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCashForm" runat="server" Text='<%# Bind("CASHFROM") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <%--<asp:TemplateField HeaderText="CLIENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCashName" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="270px"></ControlStyle>
                                    </asp:TemplateField>--%>

                                    <asp:TemplateField HeaderText="CLIENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCashName" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DIVISION NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDivisionName" runat="server" Text='<%# Bind("DIVISIONNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="270px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="REASON">
                                        <ItemTemplate>
                                            <asp:Label ID="lblReason" runat="server" Text='<%# Bind("REASON") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EMPLOYEE CODE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmployeeCode" runat="server" Text='<%# Bind("EMPLOYEECODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="180px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEPARTMENT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDepartment" runat="server" Text='<%# Bind("DEPARTMENT") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="REMARK">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("REMARK") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="2000">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRs2000" runat="server" Text='<%# Bind("2000") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="500">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRs500" runat="server" Text='<%# Bind("500") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="200">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRs200" runat="server" Text='<%# Bind("200") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="100">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRs100" runat="server" Text='<%# Bind("100") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="50">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRs50" runat="server" Text='<%# Bind("50") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="20">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRs20" runat="server" Text='<%# Bind("20") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="10">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRs10" runat="server" Text='<%# Bind("10") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="5">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRs5" runat="server" Text='<%# Bind("5") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="2">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRs2" runat="server" Text='<%# Bind("2") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRs1" runat="server" Text='<%# Bind("1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotal" runat="server" Text='<%# Bind("TOTAL") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="180px"></ControlStyle>
                                    </asp:TemplateField>

                                </Columns>
                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <RowStyle BackColor="#f5f5ef" />
                            </asp:GridView>

                        </div>
                    </div>
            
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" style="font-size: smaller" PostBackUrl="~/PayrollForms/PgPettyCashCashInEntry.aspx" Width="120"  />
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

    <%--/*------------------------------------------*/--%>

    <%--/*---Date Picker----*/--%>

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtcashindatedate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
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
            if (document.getElementById("<%=txtcashindatedate.ClientID%>").value == "") {
              alert("Enter The Cash In Date");
              document.getElementById("<%=txtcashindatedate.ClientID%>").focus();
              return false;
          }

             return true;
      }
    </script>



</asp:Content>

