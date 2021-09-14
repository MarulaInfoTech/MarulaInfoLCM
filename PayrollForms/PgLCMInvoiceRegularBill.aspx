<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgLCMInvoiceRegularBill.aspx.cs" Inherits="PayrollForms_Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-companymaster-tab" data-toggle="pill" href="#pills-companymaster" role="tab" aria-controls="pills-companymaster" style="font-size: smaller" aria-selected="true">Invoice</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" style="font-size: smaller" aria-selected="true" aria-controls="pills-view">View</a>
                </li> 
            </ul>

            <div class="tab-content" id="pills-tabContent">

                <div class="tab-pane fade active show" id="pills-companymaster" role="tabpanel" aria-labelledby="pills-companymaster-tab">
                    <h6>Regular Bill</h6>

            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>
              <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">
                 <ContentTemplate>

                    <div class="col-lg-12 col-xl-12">
                        <div class="row">
                            <div id="invoice1" class="col-lg-2 col-xl-2">
                                <div class="form-group">
                                    <asp:Label ID="lblinvoiceno" CssClass="label-control col-sm-9 lblnew" runat="server" Text="Invoice.No"></asp:Label>
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtinvoiceno" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="lblinvoicedate" CssClass="label-control col-sm-9 lblnew" runat="server" Text="Invoice.Date"></asp:Label>
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtinvoicedate" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
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
                                        <asp:TextBox ID="txtdivisionname" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div id="invoice3" class="col-lg-2 col-xl-2">
                                <div class="form-group">
                                    <asp:Label ID="lblworkingday" CssClass="label-control col-sm-9 lblnew" runat="server" Text="WorkingDay"></asp:Label>
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtworkingday" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="lblaccyear" CssClass="label-control col-sm-9 lblnew" runat="server" Text="AccYear"></asp:Label>
                                    <div class="col-lg-12 col-x-12">
                                        <asp:TextBox ID="txtaccyear" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div id="invoice4" class="col-lg-2 col-xl-2">
                                <div class="form-group">
                                    <asp:Label ID="lblfromdate" CssClass="label-control col-sm-9 lblnew" runat="server" Text="FromDate"></asp:Label>
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtfromdate" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="lbltodate" CssClass="label-control col-sm-9 lblnew" runat="server" Text="ToDate"></asp:Label>
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txttodate" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-2 col-xl-2">
                                <br />
                                <asp:Button ID="Button1" CssClass="btn btn-primary form-control-sm" runat="server" Text="Generate" Width="120px" Style="font-size: smaller" OnClick="btngenerate_Click" /><br />
                                <br />
                                <asp:Button ID="Button2" CssClass="btn btn-primary form-control-sm" runat="server" Text="New" Width="120px" Style="font-size: smaller" OnClick="btnnew_Click" />
                            </div>
                        </div>
                    </div>

                </ContentTemplate>
             </asp:UpdatePanel>

                    <div class="row">
                        <div id="tableview-front" class="col-lg-12 col-xl-12">

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>

                            <asp:GridView ID="Dginvoiceview" runat="server" AutoGenerateColumns="false" CssClass="table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Font-Size="10pt" ShowFooter="True">
                                <Columns>

                                    <asp:TemplateField HeaderText="Employee ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpID" runat="server" Text='<%# Bind("EMPLOYEEID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEPARTMENTID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDptId" runat="server" Text='<%# Bind("DEPARTMENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                      <asp:TemplateField HeaderText="DESIGNATIONID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDesgID" runat="server" Text='<%# Bind("DESIGNATIONID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="EMPLOYEE CODE" HeaderStyle-BackColor="#ff9999">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpCode" runat="server" Text='<%# Bind("EMPLOYEECODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EMPLOYEE NAME" HeaderStyle-BackColor="#ff9999">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpyremployeename" runat="server" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEPARTMENT NAME" HeaderStyle-BackColor="#ff9999">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpyrdepartmentname" runat="server" Text='<%# Bind("DEPARTMENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="WAGE TYPE" HeaderStyle-BackColor="#ff9999">
                                        <ItemTemplate>
                                            <asp:Label ID="lblwageType" runat="server" Text='<%# Bind("WAGETYPE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="FIXED GRADE" HeaderStyle-BackColor="#ff9999">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGrade" runat="server" Text='<%# Bind("FIXEDGRADE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="WAGE/DAY" HeaderStyle-BackColor="#ff9999">
                                        <ItemTemplate>
                                            <asp:Label ID="lblwageday" runat="server" Text='<%# Bind("WAGEDAY") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EPF WAGE/DAY" HeaderStyle-BackColor="#ff9999">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepfwageday" runat="server" Text='<%# Bind("EPFWAGEDAY") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="WORKED DAYS" HeaderStyle-BackColor="#cccc00">
                                        <ItemTemplate>
                                            <asp:Label ID="lblWrkDay" runat="server" Text='<%# Bind("WORKDAYS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotWrkDay" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ET1" HeaderStyle-BackColor="#cccc00">
                                        <ItemTemplate>
                                            <asp:Label ID="lblET1" runat="server" Text='<%# Bind("ET1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="75px"></ControlStyle>

                                          <FooterTemplate>
                                            <asp:Label ID="lblTotET1" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ET2" HeaderStyle-BackColor="#cccc00">
                                        <ItemTemplate>
                                            <asp:Label ID="lblET2" runat="server" Text='<%# Bind("ET2") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="75px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotET2" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ET3" HeaderStyle-BackColor="#cccc00">
                                        <ItemTemplate>
                                            <asp:Label ID="lblET3" runat="server" Text='<%# Bind("ET3") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="75px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotET3" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EARNED BASIC + DA" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBasicDA" runat="server" Text='<%# Bind("BASICDA") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="90px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotBasicDA" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EARNED HRA" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHRA" runat="server" Text='<%# Bind("HRA") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="80px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotHRA" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EARNED CONVEYANCE" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                            <asp:Label ID="lblConvey" runat="server" Text='<%# Bind("CONVEYANCE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="90px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotConvey" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EARNED WASHING" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                            <asp:Label ID="lblWashing" runat="server" Text='<%# Bind("WASHING") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="90px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotWashing" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="A1" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                            <asp:Label ID="lblA1" runat="server" Text='<%# Bind("A1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="90px"></ControlStyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotA1" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="A2" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                            <asp:Label ID="lblA2" runat="server" Text='<%# Bind("A2") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="90px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotA2" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="A3" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                            <asp:Label ID="lblA3" runat="server" Text='<%# Bind("A3") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="90px"></ControlStyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotA3" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="A4" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                            <asp:Label ID="lblA4" runat="server" Text='<%# Bind("A4") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="90px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotA4" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="A5" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                            <asp:Label ID="lblA5" runat="server" Text='<%# Bind("A5") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="90px"></ControlStyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotA5" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="A6" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                            <asp:Label ID="lblA6" runat="server" Text='<%# Bind("A6") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotA6" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="A7" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                            <asp:Label ID="lblA7" runat="server" Text='<%# Bind("A7") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotA7" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="A8" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                            <asp:Label ID="lblA8" runat="server" Text='<%# Bind("A8") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotA8" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="A9" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                            <asp:Label ID="lblA9" runat="server" Text='<%# Bind("A9") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotA9" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EARNED WAGES" HeaderStyle-BackColor="#cc99ff">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotWage" runat="server" Text='<%# Bind("TOTALWAGE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblFootTotWage" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EARN ET-1 WAGE" HeaderStyle-BackColor="#ff9966">
                                        <ItemTemplate>
                                            <asp:Label ID="lblETExtra1" runat="server" Text='<%# Bind("TOTALOTAMOUNT1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotETExtra1" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="EARN ET-2 WAGE" HeaderStyle-BackColor="#ff9966">
                                        <ItemTemplate>
                                            <asp:Label ID="lblETExtra2" runat="server" Text='<%# Bind("TOTALOTAMOUNT2") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotETExtra2" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="EARN ET-3 WAGE" HeaderStyle-BackColor="#ff9966">
                                        <ItemTemplate>
                                            <asp:Label ID="lblETExtra3" runat="server" Text='<%# Bind("TOTALOTAMOUNT3") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotETExtra3" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EARNED EXTRA WAGES" HeaderStyle-BackColor="#ff9966">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEarnExtra" runat="server" Text='<%# Bind("TOTALEXTRA") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotEarnExtra" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EARNED GROSS WAGES" HeaderStyle-BackColor="#cc9900">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEarnGross" runat="server" Text='<%# Bind("TOTALGROSS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotEarnGross" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EE-EPF WAGES" HeaderStyle-BackColor="#6699ff">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEpfWage" runat="server" Text='<%# Bind("EPFWAGE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotEpfWage" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='0' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EE-ESI WAGES" HeaderStyle-BackColor="#6699ff">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEsiWage" runat="server" Text='<%# Bind("ESIWAGE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotEsiWage" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='0' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEDUCTION EE-EPF" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEpf" runat="server" Text='<%# Bind("EPF") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="90px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotEpf" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='0' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEDUCTION EE-ESI" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEsi" runat="server" Text='<%# Bind("ESI") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="90px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotEsi" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='0' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText=" DEDUCTION ADVANCE" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAdvance" runat="server" Text='<%# Bind("ADVANCE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotAdvance" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='0' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D1" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                            <asp:Label ID="lblD1" runat="server" Text='<%# Bind("D1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotD1" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='0' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D2" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                            <asp:Label ID="lblD2" runat="server" Text='<%# Bind("D2") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="120px"></ControlStyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotD2" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D3" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                            <asp:Label ID="lblD3" runat="server" Text='<%# Bind("D3") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotD3" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D4" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                            <asp:Label ID="lblD4" runat="server" Text='<%# Bind("D4") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotD4" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D5" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                            <asp:Label ID="lblD5" runat="server" Text='<%# Bind("D5") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotD5" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D6" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                            <asp:Label ID="lblD6" runat="server" Text='<%# Bind("D6") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotD6" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D7" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                            <asp:Label ID="lblD7" runat="server" Text='<%# Bind("D7") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="90px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotD7" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D8" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                            <asp:Label ID="lblD8" runat="server" Text='<%# Bind("D8") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="90px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotD8" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL DEDUCTIONS" HeaderStyle-BackColor="#ffcc66">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotDeduction" runat="server" Text='<%# Bind("TOTALDEDUCTION") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>                                        
                                        
                                        <FooterTemplate>
                                            <asp:Label ID="lblOvTotDeduction" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="NETWAGES" HeaderStyle-BackColor="#99ccff">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNetwage" runat="server" Text='<%# Bind("NETWAGE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotNetwage" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                </Columns>
                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <RowStyle BackColor="#f5f5ef" />
                            </asp:GridView>

                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnsave" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>

                        </div>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>

                    <div class="row col-md-12 col-xl-12">

                        <table class="table table-sm border table-responsive-sm col-lg-6 col-xl-6">
                            <thead>
                                <tr>
                                    <th colspan="5" style="height: 20px; font-size: 12px;">Principle Employer Contribution Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr style="height: 20px; font-size: 15px;">
                                    <td class="small" style="width: 300px;">Statutory</td>
                                    <td class="small" style="width: 150px;">Status For Only Bill Purpose</td>
                                    <td class="small" style="width: 200px;">Percentage</td>
                                    <td style="width: 50px;"></td>
                                    <td class="small" style="width: 200px;">Values</td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="lblpfonwagesper" CssClass="small" runat="server" Text="EPF On EPF Wages"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:DropDownList ID="ddlpfonwagespers" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px" AutoPostBack="True" OnSelectedIndexChanged="ddlpfonwagespers_SelectedIndexChanged">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtpfonwagesper" CssClass="form-control form-control-sm txtnewc"
                                             runat="server" Height="23px" AutoPostBack="True" OnTextChanged="txtpfonwagesper_TextChanged" ReadOnly="True"></asp:TextBox></td>
                                    <td style="width: 50px;">%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtpfonwageesvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="lblesitotalwagesper" runat="server" Text="ESI On ESI Wages" CssClass="small" Height="23px"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:DropDownList ID="ddlesitotalwagesper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px" AutoPostBack="True" OnSelectedIndexChanged="ddlesitotalwagesper_SelectedIndexChanged">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtesitotalwagesper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" AutoPostBack="True" OnTextChanged="txtesitotalwagesper_TextChanged" ReadOnly="True"></asp:TextBox></td>
                                    <td style="width: 50px;">%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtesitotalwagesvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size:12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="lblbonusonwagesper" runat="server" Text="Bonus On Earned Basic & DA" CssClass="small" Height="23px"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:DropDownList ID="ddlbonusonwagesper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px" AutoPostBack="True" OnSelectedIndexChanged="ddlbonusonwagesper_SelectedIndexChanged">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtbonusonwagesper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" AutoPostBack="True" OnTextChanged="txtbonusonwagesper_TextChanged" ReadOnly="True"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtbonusonwagesvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="lblgratuityonwagesper" runat="server" Text="Gratuity On Earned Basic & DA" CssClass="small" Height="23px"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:DropDownList ID="ddlgratuityonwagesper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px" AutoPostBack="True" OnSelectedIndexChanged="ddlgratuityonwagesper_SelectedIndexChanged">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtgratuityonwagesper" CssClass="form-control form-control-sm txtnewc" 
                                            runat="server" Height="23px" AutoPostBack="True" OnTextChanged="txtgratuityonwagesper_TextChanged" ReadOnly="True"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtgratuityonwagesvalue" CssClass="form-control form-control-sm txtnewc" 
                                            runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="lblleavewithwagesper" runat="server" Text="Leave With Wages On Total Wages" CssClass="small" Height="23px"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:DropDownList ID="ddlleavewithwagesper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px" AutoPostBack="True" OnSelectedIndexChanged="ddlleavewithwagesper_SelectedIndexChanged">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtleavewithwagesper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" AutoPostBack="True" OnTextChanged="txtleavewithwagesper_TextChanged" ReadOnly="True"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtleavewithwagesvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="Label25" runat="server" Text="LTA On Earned Basic & DA" CssClass="small" Height="23px"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:DropDownList ID="ddlLTA" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged" OnTextChanged="ddlLTA_TextChanged">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtLTABasicPer" CssClass="form-control form-control-sm txtnewc" runat="server" 
                                            Height="23px" AutoPostBack="True" OnTextChanged="txtLTABasicPer_TextChanged" ReadOnly="True"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtLTABasicVal" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;" colspan="4">
                                        <asp:Label ID="lbllwf" runat="server" Text="LWF" CssClass="small"></asp:Label></td>
                                   <%-- <td style="width: 150px;">
                                        <asp:DropDownList ID="ddllwfoption" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px" AutoPostBack="True" OnSelectedIndexChanged="ddllwfoption_SelectedIndexChanged">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtlwfpercentage" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                    <td>%</td>--%>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtlwfvalues" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" AutoPostBack="True" OnTextChanged="txtlwfvalues_TextChanged"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="lblothers" runat="server" Text="Others" CssClass="small"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:DropDownList ID="ddlotheroption" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px" AutoPostBack="True" OnSelectedIndexChanged="ddlotheroption_SelectedIndexChanged">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtotherpercentage" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" OnTextChanged="txtotherpercentage_TextChanged"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtothervalues" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;" colspan="2">
                                        <asp:Label ID="lbltotalservicechargeper" runat="server" Text="Total Statutory Charges" CssClass="small"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtStatutoryPer" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtStatutoryVal" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>
                            </tbody>
                        </table>


                        <table class="table table-sm border col-lg-6 col-xl-6">
                            <thead>
                                <tr>
                                    <th style="font-size: 12px;">Tax Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 150px;">
                                        <asp:Label ID="lblgsttaxon" CssClass="small" runat="server" Text="GST Tax On"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtGSTtaxOn" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px">100</asp:TextBox></td>
                                    <td style="width: 50px;">%</td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 150px;">
                                        <asp:Label ID="lblCGST" CssClass="small" runat="server" Text="CGST"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtcgstper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                    <td style="width: 50px;">%</td>
                                    <td style="width: 100px;">
                                        <asp:Label ID="lblongrandtotal" CssClass="small" runat="server" Text="On Grand Total"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:DropDownList ID="ddlcgstoption" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px" AutoPostBack="True" OnSelectedIndexChanged="ddlcgstoption_SelectedIndexChanged">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtcgstvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 150px;">
                                        <asp:Label ID="lbligst" CssClass="small" runat="server" Text="IGST"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtigstper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                    <td style="width: 50px;">%</td>
                                    <td style="width: 100px;">
                                        <asp:Label ID="lbligstongrandtotal" CssClass="small" runat="server" Text="On Grand Total"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:DropDownList ID="ddligstoption" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px" AutoPostBack="True" OnSelectedIndexChanged="ddligstoption_SelectedIndexChanged">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width:50px;">%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtigstvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 150px;">
                                        <asp:Label ID="lblcess" CssClass="small" runat="server" Text="CESS"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtcessper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 100px;">
                                        <asp:Label ID="lblcessongrangtotal" CssClass="small" runat="server" Text="On Grand Total"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:DropDownList ID="ddlcessoption" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px" AutoPostBack="True" OnSelectedIndexChanged="ddlcessoption_SelectedIndexChanged">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtcessvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 150px;">
                                        <asp:Label ID="lblsgst" CssClass="small" runat="server" Text="SGST"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtsgstper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 100px;">
                                        <asp:Label ID="lblsgstongrandtotal" CssClass="small" runat="server" Text="On Grand Total"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:DropDownList ID="ddlsgstoption" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px" AutoPostBack="True" OnSelectedIndexChanged="ddlsgstoption_SelectedIndexChanged">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtsgstvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                   <%-------------- <tr style="height: 20px; font-size: 12px;">
                                    <td colspan="3"></td>
                                    <td style="width: 150px;">
                                        <asp:Label ID="Label38" runat="server" Text="Total Tax" CssClass="small"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtDefaultPer" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtDefaultVal" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                </tr>--%>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td colspan="3"></td>
                                    <td style="width: 150px;">
                                        <asp:Label ID="Label39" runat="server" Text="Round Up Value" CssClass="small"></asp:Label></td>
                                    <td style="width: 200px;" colspan="3">
                                        <asp:TextBox ID="txtRoundUp" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="row col-md-12 col-xl-12">
                        <table class="table table-sm border col-lg-6 col-xl-6">
                            <thead>
                                <tr>
                                    <th colspan="5" style="height: 20px; font-size: 12px;">Grand Values Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr style="height: 20px; font-size: 12px;">
                                   
                                    <td style="width: 300px;" colspan="4">
                                        <asp:Label ID="Label29" runat="server" Text="Earned Gross Wages" Font-Size="Smaller"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtgrosswages" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;" colspan="2">
                                        <asp:Label ID="Label21" runat="server" Text="Total Statutory Charges " CssClass="small" Height="23px"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtStatutoryTotPer" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                    <td style="width:50px;">%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtStatutoryTotVal" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="Label31" runat="server" Text="Service Charges" Font-Size="Smaller"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:DropDownList ID="ddlService" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px" AutoPostBack="True" OnSelectedIndexChanged="ddlService_SelectedIndexChanged">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>ALL Grand</asp:ListItem>
                                            <asp:ListItem>Gross</asp:ListItem>
                                            <asp:ListItem>Wages</asp:ListItem>
                                            <asp:ListItem>Standard</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtServicePer" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" AutoPostBack="True" OnTextChanged="txtServicePer_TextChanged" ReadOnly="True"></asp:TextBox></td>
                                    <td style="width: 50px;">%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtServiceVal" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" AutoPostBack="True" OnTextChanged="txtServiceVal_TextChanged"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                   
                                    <td style="width: 150px;" colspan="4">
                                        <asp:Label ID="Label32" runat="server" Text="Grand Total" Font-Size="Smaller"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtGrandTot" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" OnTextChanged="txtGrandTot_TextChanged"></asp:TextBox></td>
                                </tr>
                            </tbody>
                        </table>

                        <table class="table table-sm border col-lg-6 col-xl-6">
                            <thead>
                                <tr>
                                    <th colspan="5" style="height: 20px; font-size: 12px;">Bill Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 100px;" colspan="3">
                                        <asp:Label ID="Label40" runat="server" Text="Grand Total" Font-Size="Smaller"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:TextBox ID="txtBillGrandTot" CssClass="form-control form-control-sm txtnewc" runat="server" Height="20px"></asp:TextBox></td>
                                </tr>

                                
                                <tr style="font-size: 12px;">
                                   
                                    <td style="width: 150px;">
                                        <asp:Label ID="Label38" runat="server" Text="Total Tax" CssClass="small"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtDefaultPer" CssClass="form-control form-control-sm txtnewc" runat="server" Height="20px"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtDefaultVal" CssClass="form-control form-control-sm txtnewc" runat="server" Height="20px"></asp:TextBox></td>
                                </tr>


                              <%--  <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 100px;">
                                        <asp:Label ID="Label41" runat="server" Text="Total Tax " CssClass="small" Height="23px"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtBillTaxPer" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                    <td style="width:40px;">%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtBillTaxVal" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Width="175"></asp:TextBox></td>
                                </tr>--%>

                                <tr>
                                    <td style="width: 100px; text-underline-position:alphabetic;">
                                         <asp:Label ID="Label1" runat="server" Text="Less" Font-Size="Smaller" Height="9px"></asp:Label></td>
                                   
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 100px;" colspan="3">
                                        <asp:Label ID="lblcanteen" runat="server" Text="Canteen" Font-Size="Smaller"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtbdcanteen" CssClass="form-control form-control-sm txtnewc" runat="server" Height="20px" AutoPostBack="True" OnTextChanged="txtbdcanteen_TextChanged"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 100px;" colspan="3">
                                        <asp:Label ID="lblother" runat="server" Text="Other" Font-Size="Smaller"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtbillother" CssClass="form-control form-control-sm txtnewc" runat="server" Height="20px" AutoPostBack="True" OnTextChanged="txtbillother_TextChanged"></asp:TextBox></td>
                                </tr>

                                <%--<tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 100px;" colspan="3">
                                        <asp:Label ID="Label2" runat="server" Text="Round Up Value" Font-Size="Smaller"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtRoundUp" CssClass="form-control form-control-sm txtnewc" runat="server" 
                                            Height="23px" AutoPostBack="True"></asp:TextBox></td>
                                </tr>--%>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td colspan="1"></td>
                                    <td style="width: 100px;">
                                        <asp:Label ID="lbltotalbillvalue" runat="server" Text="Total Bill Value" Font-Size="Smaller"></asp:Label></td>
                                    <td style="width: 200px;" colspan="2">
                                        <asp:TextBox ID="txttotalbillvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="20px"></asp:TextBox></td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <asp:Button ID="btncalculate" runat="server" CssClass="btn btn-primary " Text="Calculate" Width="100" Style="font-size: smaller" />
                                    <td>
                                        <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" Text="Save" Width="100" OnClick="btnsave_Click" Style="font-size: smaller" />

                                    <td>
                                        <%--<asp:Button ID="btnprint" runat="server" CssClass="btn btn-primary" Text="Print" Width="100" Style="font-size: smaller" OnClick="btnprint_Click" />--%>
                                    <td>
                                        <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" Text="Close" Width="100" Style="font-size: smaller" PostBackUrl="~/PayrollForms/SubmenuInvoices.aspx" />
                                </tr>
                            </tbody>
                        </table>
                    </div>
   
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnsave" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
    
              </div>
                                    
                <%-------------------------------------View ------------------------------%>

                <div class="tab-pane fade" id="pills-view" role="tabpanel">

                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>

                    <div class="row">
                        <div id="invoiceview" class="col-lg-2 col-xl-2">
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

                        <div id="invoiceview2" class="col-lg-4 col-xl-4">

                            <div class="form-group">
                                <asp:Label ID="lblclientnameview" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Client Name"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlclientnameview" CssClass="form-control form-control-sm txtnew" runat="server"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="container">
                                <br />
                                <asp:Button ID="btnview" CssClass="btn btn-primary " runat="server" Text="View" Width="120px" Style="font-size: smaller" OnClick="btnview_Click" />
                                 <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />
                            </div>
                        </div>

                    </div>
                    <br>
                    <div class="row">
                        <br />
                        <div id="tableview-endview" class=" col-lg-12 col-xl-12">

                            <asp:GridView ID="Dginvoiceview3" runat="server" CssClass="table table-hover table-secondary" HeaderStyle-CssClass="GVFixedHeader" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Font-Size="10pt" AutoGenerateColumns="false" OnSelectedIndexChanged="Dginvoiceview3_SelectedIndexChanged">
                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" />

                                    <asp:TemplateField HeaderText="RGBID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrgbid" runat="server" Text='<%# Bind("RGBID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENTID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblclientid" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="INVOICE DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblinvoicedate" runat="server" Text='<%# Bind("INVOICEDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="INVOICE NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblinvoiceno" runat="server" Text='<%# Bind("INVOICENO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblclinetname" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DIVISION">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldivision" runat="server" Text='<%# Bind("DIVISION") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="WORKING DAYS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblworkingdays" runat="server" Text='<%# Bind("WORKINGDAYS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="FROM DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfromdate" runat="server" Text='<%# Bind("FROMDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TO DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltodate" runat="server" Text='<%# Bind("TODATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ACC YEAR">
                                        <ItemTemplate>
                                            <asp:Label ID="lblaccyear" runat="server" Text='<%# Bind("ACCYEAR") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PF PER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpfper" runat="server" Text='<%# Bind("PFPER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ESI PER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblesiper" runat="server" Text='<%# Bind("ESIPER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="BONUS PER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbonusper" runat="server" Text='<%# Bind("BONUSPER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="GRATUITY PER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgratuityper" runat="server" Text='<%# Bind("GRATUITYPER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="LEAVE PER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblleaveper" runat="server" Text='<%# Bind("LEAVEPER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="LTA PER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblltaper" runat="server" Text='<%# Bind("LTAPER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="OTHER PER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblotherper" runat="server" Text='<%# Bind("OTHERPER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PF VALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpfvalue" runat="server" Text='<%# Bind("PFVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ESI VALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblesivalue" runat="server" Text='<%# Bind("ESIVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="BONUS VALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbonusvalue" runat="server" Text='<%# Bind("BONUSVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="GRATUITY VALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgratuityvalue" runat="server" Text='<%# Bind("GRATUITYVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="LEAVE VALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblleavevalue" runat="server" Text='<%# Bind("LEAVEVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="LTA VALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblltavalue" runat="server" Text='<%# Bind("LTAVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="LWF VALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllwfvalue" runat="server" Text='<%# Bind("LWFVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="OTHER VALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblothervalue" runat="server" Text='<%# Bind("OTHERVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL SATUTORY PER">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltotalsatutoryper" runat="server" Text='<%# Bind("TOTALSATUTORYPER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL SATUTORY VAL">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltotalsatutoryval" runat="server" Text='<%# Bind("TOTALSATUTORYVAL") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SERVICE PER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblserviceper" runat="server" Text='<%# Bind("SERVICEPER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SERVICE VALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblservicevalue" runat="server" Text='<%# Bind("SERVICEVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="GROSSWAGES">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgrosswages" runat="server" Text='<%# Bind("GROSSWAGES") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="GRAND TOTAL">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgrandtotal" runat="server" Text='<%# Bind("GRANDTOTAL") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CGST PER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcgstper" runat="server" Text='<%# Bind("CGSTPER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SGST PER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsgstper" runat="server" Text='<%# Bind("SGSTPER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="IGST PER">
                                        <ItemTemplate>
                                            <asp:Label ID="lbligstper" runat="server" Text='<%# Bind("IGSTPER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CESS PER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcessper" runat="server" Text='<%# Bind("CESSPER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CGST STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcgststatus" runat="server" Text='<%# Bind("CGSTSTATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SGST STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsgststatus" runat="server" Text='<%# Bind("SGSTSTATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="IGST STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lbligststatus" runat="server" Text='<%# Bind("IGSTSTATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CESS STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcessstatus" runat="server" Text='<%# Bind("CESSSTATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CGST VALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcgstvalue" runat="server" Text='<%# Bind("CGSTVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SGST VALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsgstvalue" runat="server" Text='<%# Bind("SGSTVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="IGST VALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lbligstvalue" runat="server" Text='<%# Bind("IGSTVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CESS VALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcessvalue" runat="server" Text='<%# Bind("CESSVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL TAX">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltotaltax" runat="server" Text='<%# Bind("TOTALTAX") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL VALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltotalvalue" runat="server" Text='<%# Bind("TOTALVALUE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ROUNDUP">
                                        <ItemTemplate>
                                            <asp:Label ID="lblroundup" runat="server" Text='<%# Bind("ROUNDUP") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CANTEEN">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcanteen" runat="server" Text='<%# Bind("CANTEEN") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="OTHER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblother" runat="server" Text='<%# Bind("OTHER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="NET AMOUNT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblnetamount" runat="server" Text='<%# Bind("NETAMOUNT") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PF STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpfstatus" runat="server" Text='<%# Bind("PFSTATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ESI STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblesistatus" runat="server" Text='<%# Bind("ESISTATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="BONU STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbonustatus" runat="server" Text='<%# Bind("BONUSTATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="GRATUI STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgratuistatus" runat="server" Text='<%# Bind("GRATUISTATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="LEAVE STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblleavestatus" runat="server" Text='<%# Bind("LEAVESTATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="LTA STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblltastatus" runat="server" Text='<%# Bind("LTASTATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="OTHE STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblothestatus" runat="server" Text='<%# Bind("OTHESTATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SERVICE STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblservicestatus" runat="server" Text='<%# Bind("SERVICESTATUS") %>'></asp:Label>
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

                        </ContentTemplate>
                        <%--<Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnview" EventName="Click" />
                        </Triggers>--%>
                    </asp:UpdatePanel>

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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgLCMInvoiceRegularBill.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                    <td>
                                        
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/SubmenuInvoices.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                    </div>

                </div>

            </div>
    

    <%--/*-------------------------------------------*/--%>

    <%--/*---Page Reload----*/--%>

    <script type="text/javascript">

        function pageLoad() {
            if ($('#ContentPlaceHolder1_hidcurrenttab').val() == "2") {
                $('#pills-view-tab').tab('show');
            }
        };

    </script>

    <%--/*-----------------*/--%>

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
            $('#<%= txtfromdateview.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodateview.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
        }
    </script>

    <%--/*-----------------*/--%>

    <%--/*---Message Hide Code----*/--%>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtinvoiceno.ClientID%>").value == "") {
            alert("Enter Invoice No");
            document.getElementById("<%=txtinvoiceno.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>

    <%-------------------------------------------------------%>




</asp:Content>

