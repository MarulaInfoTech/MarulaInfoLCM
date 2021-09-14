<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgReport26Genarate.aspx.cs" Inherits="PayrollForms_PgReport_cAttendanceBreakUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true" >

        <ContentTemplate>

    <br />
    <div>
        <h5 class="card-title">Attendance Breakup</h5>
    </div>
    <br />
    <div class="row">

        <div id="ABU-Attendance-View" class=" col-lg-2 col-xl-2">

            <asp:Label ID="lblfromdate" runat="server" CssClass="label-conrol col-sm-12" Text="From Date"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:TextBox ID="txtfromdate" runat="server" CssClass="form-control form-control-sm" autocomplete="off"></asp:TextBox>
                </div>
            </div>

            <asp:Label ID="lbltodate" runat="server" CssClass="label-conrol col-sm-12" Text="To Date"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:TextBox ID="txttodate" runat="server" CssClass="form-control form-control-sm" autocomplete="off"></asp:TextBox>
                </div>
            </div>


        </div>

        <div class=" col-lg-4 col-xl-4">

            <asp:Label ID="lblCompanyname" runat="server" CssClass="label-conrol col-sm-12" Text="Company Name"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:DropDownList ID="ddlcompanyname" CssClass="form-control form-control-sm text-uppercase" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlcompanyname_SelectedIndexChanged">
                        <asp:ListItem>----Select Company Name----</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <asp:Label ID="lbldivisionname" runat="server" CssClass="label-conrol col-sm-12" Text="Division Name"></asp:Label>
            <div class="form-group">
                <div class=" col-lg-12 col-xl-12">
                    <asp:TextBox ID="txtdivisionname" CssClass="form-control form-control-sm text-uppercase" autocomplete="off" runat="server" placeholder="Division Name"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class=" col-lg-2 col-xl-2">
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="120" OnClick="btnview_Click"/>
            <%--<asp:Label ID="lblMessageBox" class="alert alert-secondary" role="alert" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>--%>
        </div>

        <div class=" col-lg-2 col-xl-2">
            <br />
            <asp:Button ID="btnClac" runat="server" CssClass="btn btn-primary " Text="Calculation" Width="120" OnClick="btnClac_Click" />
            <br />
            <br />
            <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>
            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" Text="Conform" Width="120" OnClick="btnsave_Click"/>
            <%--<asp:Label ID="lblMessageBox2" class="alert alert-secondary" role="alert" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>--%>
        </div>

        <div class=" col-lg-2 col-xl-2">
            <br />
            <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary " Text="New" Width="120" OnClick="btnnew_Click" />
            <br />
            <br />
            <asp:Button ID="btnclose" runat="server" ValidationGroup="txtnoofdays" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/SubmenuReports-C.aspx" Width="120" />
        </div>

    </div>

    <br />
    <br />

    <div class="row">

        <div id="tableview-frontview" class="col-lg-12 col-xl-12">

            <asp:GridView ID="DgMDBreakUp" runat="server" CssClass="table table-hover table-secondary" BorderColor="#999999" 
                BorderStyle="Solid" BorderWidth="3px" AutoGenerateColumns="false">
                    
                <Columns>

                            <asp:TemplateField HeaderText="EMPLOYEECODE">
                                <ItemTemplate>
                                    <asp:Label ID="lblEMPLOYEECODE" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="150" Text='<%# Bind("EMPLOYEECODE") %>'></asp:Label>
                                </ItemTemplate>

                                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="EMPLOYEE NAME">
                                <ItemTemplate>
                                    <asp:Label ID="lblAPPLICATIONAME" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="174" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Width="200px" BorderStyle="None"></ControlStyle>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DEPARTMENT NAME">
                                <ItemTemplate>
                                    <asp:Label ID="lblDEPARTMENTNAME" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="174" Text='<%# Bind("DEPARTMENTNAME") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="TYPE">
                                <ItemTemplate>
                                    <asp:Label ID="lblshift" runat="server" Text="SHIFT" CssClass="form-control-sm text-uppercase"></asp:Label>
                                    <asp:Label ID="lblot" runat="server" Text="OT" CssClass="form-control-sm text-uppercase"></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="50px"></ControlStyle>
                                <FooterTemplate>
                                    <asp:Label ID="lbltoshift" runat="server" CssClass="form-control-sm text-uppercase" Text="TOTAL SHIFT"></asp:Label>
                                    <asp:Label ID="lbltoot" runat="server" CssClass="form-control-sm text-uppercase" Text="TOTAL OT"></asp:Label>
                                </FooterTemplate>
                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY1">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY1" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY1") %>' MaxLength='8' onkeydown='update(this.value,event);' AutoPostBack="true"></asp:TextBox>
                                    <asp:TextBox ID="txtOT1" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT1") %>'  MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY1" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT1" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY2">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY2" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" MaxLength='8' onkeydown='update(this.value,event);' Text='<%# Bind("DAY2") %>'></asp:TextBox>
                                    <asp:TextBox ID="txtOT2" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT2") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0" ></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY2" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT2" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY3">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY3" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" MaxLength='8' onkeydown='update(this.value,event);' Text='<%# Bind("DAY3") %>'></asp:TextBox>
                                    <asp:TextBox ID="txtOT3" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT3") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY3" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT3" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY4">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY4" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" MaxLength='8' onkeydown='update(this.value,event);' Text='<%# Bind("DAY4") %>'></asp:TextBox>
                                    <asp:TextBox ID="txtOT4" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT4") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY4" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT4" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY5">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY5" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" MaxLength='8' onkeydown='update(this.value,event);' Text='<%# Bind("DAY5") %>'></asp:TextBox>
                                    <asp:TextBox ID="txtOT5" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT5") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY5" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT5" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY6">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY6" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY6") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT6" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT6") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY6" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT6" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY7">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY7" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY7") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT7" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT7") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY7" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT7" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY8">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY8" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY8") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT8" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT8") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY8" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT8" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY9">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY9" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY9") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT9" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT9") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY9" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT9" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY10">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY10" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY10") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT10" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT10") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY10" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text=''></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT10" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text=''></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY11">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY11" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY11") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT11" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT11") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY11" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT11" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY12">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY12" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY12") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT12" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT12") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY12" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT12" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY13">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY13" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY13") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT13" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT13") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY13" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT13" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY14">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY14" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY14") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT14" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT14") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY14" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT14" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY15">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY15" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY15") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT15" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT15") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY15" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT15" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY16">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY16" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY16") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT16" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT16") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY16" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT16" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY17">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY17" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY17") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT17" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT17") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY17" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT17" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY18">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY18" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY18") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT18" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT18") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY18" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT18" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY19">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY19" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY19") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT19" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT19") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY19" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT19" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY20">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY20" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY20") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT20" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT20") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY20" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT20" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY21">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY21" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY21") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT21" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT21") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY21" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT21" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY22">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY22" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY22") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT22" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT22") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY22" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT22" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY23">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY23" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY23") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT23" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT23") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY23" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT23" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY24">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY24" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY24") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT24" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT24") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY24" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT24" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY25">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY25" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY25") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT25" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT25") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY25" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT25" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY26">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY26" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY26") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT26" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT26") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY26" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT26" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY27">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY27" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY27") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT27" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT27") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY27" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT27" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY28">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY28" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY28") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT28" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT28") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY28" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT28" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY29">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY29" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY29") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT29" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT29") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY29" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT29" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY30">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY30" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY30") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT30" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT30") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY30" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text=''></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT30" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DAY31">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDAY31" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("DAY31") %>' MaxLength='8' onkeydown='update(this.value,event);'></asp:TextBox>
                                    <asp:TextBox ID="txtOT31" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="74" Text='<%# Bind("OT31") %>' MaxLength='8' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotDAY31" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                    <asp:TextBox ID="txtTotalOT31" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="TOTAL">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtTOTAL" runat="server" CssClass="form-control form-control-sm txtnew" Width="75" Text='<%# Bind("TOTAL") %>'></asp:TextBox>
                                    <asp:TextBox ID="txtOTTOTAL" runat="server" CssClass="form-control form-control-sm txtnew" Width="75" Text='<%# Bind("TOTALOT") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DEPARTMENTID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblDEPARTMENTID" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" Width="174" Text='<%# Bind("DEPARTMENTID") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                        </Columns>
                                    
                 <FooterStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
               <RowStyle BackColor="#f5f5ef" />
            </asp:GridView>

        </div>
    </div>



        </ContentTemplate>
    </asp:UpdatePanel>

    <%-------------------------%>

    <%--/*---Date Picker----*/--%>

    <script>

        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtfromdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });   
        }
    </script>

<%--/*--------------------------------*/--%>

</asp:Content>

