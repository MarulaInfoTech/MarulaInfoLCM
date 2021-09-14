<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgPayrollMonthlyWageGenerate.aspx.cs" Inherits="PayrollForms_PgPayrollMonthlyWageGenerate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <div class="tab-pane" id="Detail">
                <div>
                    <h6 class="card-title">Monthly Wage Generate</h6>
                </div>

                <div class="row col-lg-12 col-xl-12">

                    <div id="DE-Deductions" class=" col-lg-2 col-xl-2">

                        <asp:Label ID="lblfromdate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="From Date"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:TextBox ID="txtfromdate" runat="server" CssClass="form-control form-control-sm txtnew" autocomplete="off" OnTextChanged="txtfromdate_TextChanged" TextMode="Date" Width="150"></asp:TextBox>
                            </div>
                        </div>

                        <asp:Label ID="lbltodate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="To Date"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:TextBox ID="txttodate" runat="server" CssClass="form-control form-control-sm txtnew " autocomplete="off" AutoPostBack="True" OnTextChanged="txttodate_TextChanged" TextMode="Date" Width="150"></asp:TextBox>
                            </div>
                        </div>

                        <asp:Label ID="lbltotaldays" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Total Days"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:TextBox ID="txttotaldays" CssClass="form-control form-control-sm txtnew" autocomplete="off" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>

                    </div>

                    <div class=" col-lg-4 col-xl-4">

                        <asp:Label ID="lblcompanyname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Company Name *"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:DropDownList ID="ddlcompanyname" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlcompanyname_SelectedIndexChanged">
                                    <asp:ListItem>------- Select Client -------</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <asp:Label ID="lbldivisionname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Division Name *"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:TextBox ID="txtdivisionname" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <table id="Passport-Image">
                            <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td>
                                        <asp:Label ID="lblnoofworkingdays" runat="server" CssClass="label-conrol col-sm-12 lblnew" 
                                            Text="Working Days"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12">
                                                <asp:TextBox ID="txtnoofworkingdays" 
                                                    CssClass="form-control form-control-sm txtnew text-uppercase" 
                                                    autocomplete="off" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblpflimit" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="PF Limits"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12">
                                                <asp:DropDownList ID="ddlpflimit" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" Width="100" AppendDataBoundItems="True">
                                                    <asp:ListItem>Select</asp:ListItem>
                                                    <asp:ListItem Value="No">No (BasicDA)</asp:ListItem>
                                                    <asp:ListItem Value="Yes">Yes(Fixed 15)</asp:ListItem>
                                                </asp:DropDownList>
                                            </div><br />
                                            <asp:Label ID="Label1" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Genarate Type"></asp:Label>
                                             <div class=" col-lg-12 col-xl-12">
                                                <asp:DropDownList ID="ddlGenarate" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" Width="100" AppendDataBoundItems="True">
                                                    <asp:ListItem>Select</asp:ListItem>
                                                    <asp:ListItem Value="C">Report-C</asp:ListItem>
                                                    <asp:ListItem Value="J">Report-J</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </div>

                    <div id="DE-Deductionstxt" class="col-xl-offset-2">
                        <br />

                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:CheckBox ID="CheckBox1" runat="server" Text="_Incentive" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:CheckBox ID="CheckBox2" runat="server" Text="_Canteen" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:CheckBox ID="CheckBox3" runat="server" Text="_Basic + DA" />
                            </div>
                        </div>
                    </div>

                    <div id="DE-Dayworked" class="">

                        <asp:Label ID="lbldaysworked" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Days Worked /"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:TextBox ID="txtdaysworked1" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" Width="65"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:TextBox ID="txtdaysworked2" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" Width="65"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:TextBox ID="txtdaysworked3" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" Width="65"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div id="DE-Inc-Amt" class="">

                        <asp:Label ID="lblincamt" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text=". Inc Amt"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:TextBox ID="txtincamt1" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" Width="75"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:TextBox ID="txtincamt2" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" Width="75"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class=" col-lg-2 col-xl-2">

                        <asp:Label ID="lblincentive" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Esic Incentive Limit"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:DropDownList ID="ddlincentive" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Incentive-ESI</asp:ListItem>
                                    <asp:ListItem>No</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <asp:Label ID="lblallowances" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Esic Allowances Limit"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:DropDownList ID="ddlallowances" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Allowance-ESI</asp:ListItem>
                                    <asp:ListItem>No</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:Button ID="btnpayrollgenrate" runat="server" CssClass="btn btn-primary" Text="Payroll Genrate" Width="150" OnClick="btnpayrollgenrate_Click" Style="font-size: smaller" />
                            </div>
                        </div>
                    </div>

                    <%--<div id="MlyWageMessage" class=" col-lg-4 col-xl-4">
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:Label ID="lblMessageBox" class="alert alert-secondary" role="alert" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>
                            </div>
                        </div>
                    </div>--%>
                </div>
                <div class="row">

                    <div id="tableview-endview" class="col-lg-12 col-xl-12">

                        <asp:GridView ID="DgPayroll" runat="server" CssClass="table table-hover table-secondary"
                             BorderColor="#999999" BorderStyle="Solid"
                            BorderWidth="3px" AutoGenerateColumns="False" Font-Size="10pt" ShowFooter="True">
                            <Columns>

                                    <asp:TemplateField HeaderText="Employee ID" Visible="False">
                                        <ItemTemplate>
                                        <asp:Label ID="lblEmpID" runat="server" Text='<%# Bind("EMPLOYEEID") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EMPLOYEE CODE" HeaderStyle-BackColor="#ff9999">
                                        <ItemTemplate>
                                        <asp:Label ID="lblEmpCode" runat="server" Text='<%# Bind("EMPLOYEECODE") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EMPLOYEE NAME" HeaderStyle-BackColor="#ff9999">
                                        <ItemTemplate>
                                        <asp:Label ID="lblpyremployeename" runat="server" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="250px"></controlstyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEPARTMENT NAME" HeaderStyle-BackColor="#ff9999">
                                        <ItemTemplate>
                                        <asp:Label ID="lblpyrdepartmentname" runat="server" Text='<%# Bind("DEPARTMENTNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="250px"></controlstyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="WAGE TYPE" HeaderStyle-BackColor="#ff9999">
                                        <ItemTemplate>
                                        <asp:Label ID="lblwageType" runat="server" Text='<%# Bind("SALARYTYPE") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="FIXED GRADE" HeaderStyle-BackColor="#ff9999">
                                        <ItemTemplate>
                                        <asp:Label ID="lblGrade" runat="server" Text='<%# Bind("GRADE") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="WAGE/DAY" HeaderStyle-BackColor="#ff9999">
                                        <ItemTemplate>
                                        <asp:Label ID="lblwageday" runat="server" Text='<%# Bind("WAGEPERDAY") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EPF WAGE/DAY" HeaderStyle-BackColor="#ff9999">
                                        <ItemTemplate>
                                        <asp:Label ID="lblepfwageday" runat="server" Text='0'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="WORK DAYS" HeaderStyle-BackColor="#cccc00">
                                        <ItemTemplate>
                                        <asp:Label ID="lblWrkDay" runat="server" Text='<%# Bind("STATUS") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotWrkDay" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ET1" HeaderStyle-BackColor="#cccc00">
                                        <ItemTemplate>
                                        <asp:Label ID="lblOT1" runat="server" Text='<%# Bind("OT1") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="75px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotOT1" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>


                                <asp:TemplateField HeaderText="ET2" HeaderStyle-BackColor="#cccc00">
                                        <ItemTemplate>
                                        <asp:Label ID="lblOT2" runat="server" Text='<%# Bind("OT2") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="75px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotOT2" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                
                                <asp:TemplateField HeaderText="ET3" HeaderStyle-BackColor="#cccc00">
                                        <ItemTemplate>
                                        <asp:Label ID="lblOT3" runat="server" Text='<%# Bind("OT3") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="75px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotOT3" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EARNED BASIC DA" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                        <asp:Label ID="lblBasicDA" runat="server" Text='<%# Bind("BASICDA") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="90px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotBasicDA" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EARNED HRA" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                        <asp:Label ID="lblHRA" runat="server" Text='<%# Bind("HRA") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="80px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotHRA" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EARNED CONVEYANCE" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                        <asp:Label ID="lblConvey" runat="server" Text='<%# Bind("CONVEYANCE") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="90px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotConvey" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EARNED WASHING" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                        <asp:Label ID="lblWashing" runat="server" Text='<%# Bind("WASHING") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="90px"></controlstyle>
                                        <FooterTemplate>
                                            <asp:Label ID="lblTotWashing" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                   

                                    <%--------%>                                

                                    <asp:TemplateField HeaderText="A1" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                        <asp:Label ID="lblA1" runat="server" Text='<%# Bind("A1") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="90px"></controlstyle>
                                         <FooterTemplate>
                                            <asp:Label ID="lblTotA1" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="A2" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                        <asp:Label ID="lblA2" runat="server" Text='<%# Bind("A2") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="100px"></controlstyle>
                                        <FooterTemplate>
                                            <asp:Label ID="lblTotA2" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="A3" HeaderStyle-BackColor="#66ff66">
                                        <ItemTemplate>
                                        <asp:Label ID="lblA3" runat="server" Text='<%# Bind("A3") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="100px"></controlstyle>
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
                                    <ControlStyle Height="12px" Width="100px"></ControlStyle>

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
                                    <ControlStyle Height="12px" Width="100px"></ControlStyle>

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
                                        <asp:Label ID="lblTotWage" runat="server" Text='<%# Bind("WAGEPERDAY") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblFootTotWage" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="ET AMOUNT1" HeaderStyle-BackColor="#ff9966">
                                        <ItemTemplate>
                                        <asp:Label ID="lblETAmount1" runat="server" Text='<%# Bind("OTAMOUNT") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotETAmount1" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                <asp:TemplateField HeaderText="ET AMOUNT2" HeaderStyle-BackColor="#ff9966">
                                        <ItemTemplate>
                                        <asp:Label ID="lblETAmount2" runat="server" Text='<%# Bind("OTAMOUNT2") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotETAmount2" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                <asp:TemplateField HeaderText="ET AMOUNT3" HeaderStyle-BackColor="#ff9966">
                                        <ItemTemplate>
                                        <asp:Label ID="lblETAmount3" runat="server" Text='<%# Bind("OTAMOUNT3") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotETAmount3" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>



                                    <asp:TemplateField HeaderText="EARNED EXTRA WAGES" HeaderStyle-BackColor="#ff9966">
                                        <ItemTemplate>
                                        <asp:Label ID="lblEarnExtra" runat="server" Text='<%# Bind("OTAMOUNT") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotEarnExtra" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EARNED GROSS WAGES" HeaderStyle-BackColor="#cc9900">
                                        <ItemTemplate>
                                        <asp:Label ID="lblEarnGross" runat="server" Text='0'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotEarnGross" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EE-EPF WAGES" HeaderStyle-BackColor="#6699ff">
                                        <ItemTemplate>
                                        <asp:Label ID="lblEpfWage" runat="server" Text='0'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="200px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotEpfWage" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EE-ESI WAGES" HeaderStyle-BackColor="#6699ff">
                                        <ItemTemplate>
                                        <asp:Label ID="lblEsiWage" runat="server" Text='0'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotEsiWage" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEDUCTION EE-EPF" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                        <asp:Label ID="lblEpf" runat="server" Text='<%# Bind("PFEMPLOYEESEPF") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="90px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotEpf" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEDUCTION EE-ESI" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                        <asp:Label ID="lblEsi" runat="server" Text='<%# Bind("ESIEMPLOYEES") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="90px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotEsi" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <%-----------%>

                                    <asp:TemplateField HeaderText=" DEDUCTION ADVANCE" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                        <asp:Label ID="lblAdvance" runat="server" Text='<%# Bind("ADVANCE") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="100px"></controlstyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotAdvance" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D1" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                        <asp:Label ID="lblD1" runat="server" Text='<%# Bind("D1") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="100px"></controlstyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotD1" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D2" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                        <asp:Label ID="lblD2" runat="server" Text='<%# Bind("D2") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="90px"></controlstyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotD2" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D3" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                        <asp:Label ID="lblD3" runat="server" Text='<%# Bind("D3") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="100px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotD3" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D4" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                        <asp:Label ID="lblD4" runat="server" Text='<%# Bind("D4") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="100px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotD4" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D5" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                        <asp:Label ID="lblD5" runat="server" Text='<%# Bind("D5") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="100px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotD5" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D6" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                        <asp:Label ID="lblD6" runat="server" Text='<%# Bind("D6") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="100px"></controlstyle>

                                         <FooterTemplate>
                                            <asp:Label ID="lblTotD6" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D7" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                        <asp:Label ID="lblD7" runat="server" Text='<%# Bind("D7") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="90px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotD7" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D8" HeaderStyle-BackColor="#ff9933">
                                        <ItemTemplate>
                                        <asp:Label ID="lblD8" runat="server" Text='<%# Bind("D8") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="90px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotD8" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL DEDUCTION" HeaderStyle-BackColor="#ffcc66">
                                        <ItemTemplate>
                                        <asp:Label ID="lblTotDeduction" runat="server" Text='0'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblOvTotDeduction" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="NETWAGE" HeaderStyle-BackColor="#99ccff">
                                        <ItemTemplate>
                                        <asp:Label ID="lblNetwage" runat="server" Text='<%# Bind("NETWAGE") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>

                                        <FooterTemplate>
                                            <asp:Label ID="lblTotNetwage" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEPARTMENTID" Visible="false">
                                        <ItemTemplate>
                                        <asp:Label ID="lblDptId" runat="server" Text='<%# Bind("DEPARTMENTID") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DESIGNATIONID" Visible="false">
                                        <ItemTemplate>
                                        <asp:Label ID="lblDesgID" runat="server" Text='<%# Bind("DESIGNATIONID") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="150px"></controlstyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SUNDAY" Visible="false">
                                        <ItemTemplate>
                                        <asp:Label ID="lblSunDay" runat="server" Text='<%# Bind("SUNDAY") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="100px"></controlstyle>
                                    </asp:TemplateField>

                                <%--<asp:TemplateField HeaderText="OTPER" Visible="false">
                                        <ItemTemplate>
                                        <asp:Label ID="lblOTper" runat="server" Text='<%# Bind("SALOTAMOUNT") %>'></asp:Label>
                                    </ItemTemplate>
                                        <headerstyle horizontalalign="Center" verticalalign="Middle" />
                                        <controlstyle height="12px" width="100px"></controlstyle>
                                    </asp:TemplateField>--%>
                            </Columns>
                            <FooterStyle HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <RowStyle BackColor="#f5f5ef" />
                        </asp:GridView>
                    </div>
                </div>

                <br />


                <div class="row">

                    <div id="" class=" col-lg-2 col-xl-2">
                        <asp:Label ID="lblnoofemployees" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="No of Employees"></asp:Label>
                        <div class="form-group">
                            <div class=" col-md-12 col-lg-12 col-xl-12">
                                <asp:TextBox ID="txtnoofemployees" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <%--<div id="" class=" col-lg-2 col-xl-2">
                        <br />
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:Button ID="btnexport" runat="server" CssClass="btn btn-primary" Text="Export" Width="150" />
                            </div>
                        </div>
                    </div>--%>

                    <div id="" class=" col-lg-2 col-xl-2">

                        <asp:Label ID="lbltotalgrossamount" runat="server" CssClass="label-conrol" Text="Total Gross Amount"></asp:Label>
                        <div class="form-group">
                            <div class=" col-md-12 col-lg-12 col-xl-12">
                                <asp:TextBox ID="txttotalgrossamount" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server"></asp:TextBox>
                            </div>
                        </div>

                    </div>

                    <div id="" class=" col-lg-2 col-xl-2">

                        <asp:Label ID="lbltotalnetamount" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Total Net Amount"></asp:Label>
                        <div class="form-group">
                            <div class=" col-md-12 col-lg-12 col-xl-12">
                                <asp:TextBox ID="txttotalnetamount" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server"></asp:TextBox>
                            </div>
                        </div>

                    </div>

                    <%--<div id="" class="col-lg-2 col-xl-2">
                        <br />
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12">
                                <asp:Button ID="btnsummary" runat="server" CssClass="btn btn-primary" Text="Summary" Width="150" />
                            </div>
                        </div>
                    </div>--%>
                </div>

                <div class="row">

                    <div id="AYM-btn" class=" col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 ">

                        <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" OnClick="btnsave_Click" OnClientClick="return validate()" Style="font-size: smaller" />

                        <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary " Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller" />

                        <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" ValidationGroup="txttotaldays" Text="Close" PostBackUrl="~/PayrollForms/SubmenuPayroll.aspx" Width="120" Style="font-size: smaller" />

                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <%---------------------------%>

    <%--/*---Message Validation----*/--%>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtfromdate.ClientID%>").value == "") {
                alert("Enter The From Date");
                document.getElementById("<%=txtfromdate.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>


    <%--<script>
        var doStuff = function () {
            //UI enhancements here...
        };
        //Shorthand for $(document).ready(doStuff);
        $(doStuff);
        //trigger the function again when an UpdatePanel finishes replacing its contents
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(doStuff);
    </script>--%>



    <%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script> 
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script> 
    <script type="text/javascript" src="gridviewScroll.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            gridviewScroll();
        });

        function gridviewScroll() {
            $('#<%=DgPayroll.ClientID%>').gridviewScroll({
                width: 660,
                height: 200,
                freezesize: 2
            });
        }
    </script>--%>

    <%--/*-------------------------------*/--%>



    <%--<script type="text/javascript"      src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="gridviewScroll.min.js"></script>
<link href="GridviewScroll.css" rel="stylesheet" />

    <script type="text/javascript">
        function pageLoad(sender, args) {
            gridviewScroll();
        }

        function gridviewScroll() {
            gridView1 = $('#DgPayroll').gridviewScroll({
                width: 915,
                height: 449,
                railcolor: "#F0F0F0",
                barcolor: "#CDCDCD",
                barhovercolor: "#606060",
                bgcolor: "#F0F0F0",
                freezesize: 5,
                arrowsize: 30,
                varrowtopimg: "../../../images/arrowvt.png",
                varrowbottomimg: "../../../images/arrowvb.png",
                harrowleftimg: "../../../images/arrowhl.png",
                harrowrightimg: "../../../images/arrowhr.png",
                headerrowcount: 1,
                onScrollVertical: function (delta) {
                    // store the scroll offset outside of this function in a hidden field and restore if you want to maintain vertical scroll position
                },
                onScrollHorizontal: function (delta) {
                    //store the scroll offset outside of this function in a hidden field and restore if you want to maintain horizontal scroll position
                }
            });
        }
    </script>--%>
</asp:Content>

