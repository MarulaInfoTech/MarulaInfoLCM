<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgOffRollLCM-PFGenerate.aspx.cs" Inherits="PayrollForms_PF_Generate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>


            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-departmentmaster-tab" data-toggle="pill" href="#pills-departmentmaster" role="tab" aria-controls="pills-departmentmaster" style="font-size: smaller" aria-selected="true">PF Generate</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-update-tab" data-toggle="pill" href="#pills-update" role="tab" aria-controls="pills-update" style="font-size: smaller" aria-selected="false">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-departmentmaster" role="tabpanel" aria-labelledby="pills-departmentmaster-tab">

                    <div class="container-fluid">

                        <h6 class="card-title">PF Generate</h6>

                        <div class="row col-lg-12 col-xl-12">

                            <div id="" class=" col-lg-3 col-xl-3">

                                <asp:Label ID="lblcurrentpfmonth" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Current PF Month"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:DropDownList ID="ddlcurrentpfmonth" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlcurrentpfmonth_SelectedIndexChanged" AppendDataBoundItems="True">
                                            <asp:ListItem>---- Select PF Month -------</asp:ListItem>
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

                            </div>

                            <div id="" class=" col-lg-2 col-xl-2">

                                <asp:Label ID="lblcurrentpfdate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Current PF Date"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtcurrentpfdate" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                            </div>


                            <%-- <div id="" class=" col-lg-4 col-xl-4">

                        <asp:Label ID="lblclientname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name" Visible="false"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12 ">
                                <asp:DropDownList ID="ddlclientname" CssClass="form-control form-control-sm text-uppercase txtnew" 
                                    runat="server" AutoPostBack="True" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlclientname_SelectedIndexChanged" Visible="false">
                                    <asp:ListItem>--- Select Company Name ---</asp:ListItem>
                                    <asp:ListItem>--- ALL Company Name ---</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <asp:Label ID="lbldivision" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Division" Visible="false"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12 ">
                                <asp:TextBox ID="txtdivision" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" Visible="false"></asp:TextBox>
                            </div>
                        </div>

                    </div>--%>

                            <div id="" class=" col-lg-3 col-xl-3">

                                <asp:Label ID="lblselectoption" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Select Type"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-10 col-xl-10">
                                        <asp:DropDownList ID="ddlselect" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server">
                                            <asp:ListItem>---Select Type---</asp:ListItem>
                                            <asp:ListItem>J</asp:ListItem>
                                            <asp:ListItem>C</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                            </div>

                            <div id="" class=" col-lg-2 col-xl-2">

                                <asp:Label ID="lblb" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text=""></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="Generate" Width="120" Style="font-size: smaller" OnClick="btnview_Click" />
                                    </div>
                                </div>

                            </div>
                        </div>
                        <br />

                        <div class="row">

                            <div id="" class=" col-lg-3 col-xl-3">
                                <asp:Label ID="lblPreviousEPFStrength" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Previous EPF Strength"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtPreviousEPFStrength" CssClass="form-control form-control-sm text-uppercase txtnew" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div id="" class=" col-lg-2 col-xl-2">
                                <asp:Label ID="lblMemberAddition" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Member Addition"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtMemberAddition" CssClass="form-control form-control-sm text-uppercase txtnew" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div id="" class=" col-lg-2 col-xl-2">
                                <asp:Label ID="lblMemberDeletion" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Member Deletion"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtMemberDeletion" CssClass="form-control form-control-sm text-uppercase txtnew" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div id="" class=" col-lg-2 col-xl-2">
                                <asp:Label ID="lblCurrentStrength" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Current Strength"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtCurrentStrength" CssClass="form-control form-control-sm text-uppercase txtnew" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div id="" class=" col-lg-3 col-xl-3">
                                <asp:Label ID="lblTotalActionStrength" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Total Action Strength"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtTotalActionStrength" CssClass="form-control form-control-sm text-uppercase txtnew" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <br />

                        <div class="row">

                            <div id="tableview-frontview" class="col-lg-12 col-xl-12">

                                <asp:GridView ID="DgPFGenerate" runat="server" CssClass="table table-hover table-secondary"
                                    HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px"
                                    Font-Size="10pt" AutoGenerateColumns="false">

                                    <Columns>

                                        <asp:TemplateField HeaderText="CLIENT ID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblClntId" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="EMPLOYEE ID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEmpid" runat="server" Text='<%# Bind("EMPLOYEEID") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="SL.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblslno" runat="server" Text='0'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Member ID">
                                            <ItemTemplate>
                                                <asp:Label ID="lblmemberid" runat="server" Text='<%# Bind("PFNO") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <%--<asp:TemplateField HeaderText="UAN No">
                                    <ItemTemplate>
                                        <asp:Label ID="lbluanno" runat="server"  Text='<%# Bind("UANNO") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="210px"></ControlStyle>
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>--%>

                                        <asp:TemplateField HeaderText="Employee Code" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblemployeecode" runat="server" Text='<%# Bind("EMPLOYEECODE") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Employee Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblemployeename" runat="server" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Working Unit / Company Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcompanyname" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Division">
                                            <ItemTemplate>
                                                <asp:Label ID="lbldivisionname" runat="server" Text='<%# Bind("DIVISION") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Previous EPF Strength" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblperviousepfstrenght" runat="server" Text='<%# Bind("LASTEMP") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Member Addition" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblmemberaddition" runat="server" Text='<%# Bind("JOINEMP") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Member Deletion" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblmemberdeletion" runat="server" Text='<%# Bind("RELEVEPM") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Current Strength" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcurrentstrength" runat="server" Text='0'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Total Action Strength" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lbltotalactionstrength" runat="server" Text='<%# Bind("CURRENTEMP") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Total EPF WAGES">
                                            <ItemTemplate>
                                                <asp:Label ID="lblpfwages" runat="server" Text='<%# Bind("PFWAGES") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="NCP Days">
                                            <ItemTemplate>
                                                <asp:Label ID="lblncpdays" runat="server" Text='<%# Bind("NCPDAYS") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Total EPF Contribution EE Share A/C 1">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAC0" runat="server" Text='<%# Bind("EMPLOYEESEPF") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Total Difference between A/C 1">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAC1" runat="server" Text='<%# Bind("EMPLOYEESEPF") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Total EPF(Administration Charges) A/C 2">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAC2" runat="server" Text='<%# Bind("EMPLOYERSEPS") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Employer Contribution A/C 10">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAC10" runat="server" Text='<%# Bind("EMPLOYERSEPF") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Total EDLI Contribution(ER Share) A/C 21">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAC21" runat="server" Text='<%# Bind("ADMINCHARGES") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Total EDLI (Administration Charges) A/C 22">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAC22" runat="server" Text='0'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <%--<asp:TemplateField HeaderText="Employer Contribution">
                                    <ItemTemplate>
                                        <asp:Label ID="lblemployercontribution" runat="server" Text='<%# Bind("EMPLOYERSEPS") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Penson">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpenson" runat="server" Text='<%# Bind("EMPLOYERSEPS") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="PF Account">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpfaccount" runat="server" Text='<%# Bind("PFACCOUNT") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>--%>

                                        <%--<asp:TemplateField HeaderText="Admin Charges">
                                    <ItemTemplate>
                                        <asp:Label ID="lbladmincharges" runat="server" Text='<%# Bind("ADMINCHARGES") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>--%>

                                        <%--<asp:TemplateField HeaderText="Inspection Charges">
                                    <ItemTemplate>
                                        <asp:Label ID="lblinspectioncharges" runat="server" Text='<%# Bind("INSPECTIONCHARGES") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>--%>

                                        <asp:TemplateField HeaderText="Total Employer Share">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTotalShare" runat="server" Text='<%# Bind("EMPSHARE") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Total (EE + Employer) Contribution">
                                            <ItemTemplate>
                                                <asp:Label ID="lblContribution" runat="server" Text='<%# Bind("TOTAL") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <%-- <asp:TemplateField HeaderText="WAGES">
                                    <ItemTemplate>
                                        <asp:Label ID="lblWage" runat="server" Text='0'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    <ItemStyle Wrap="False" />
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
                            <div id="CM-btn" class="col-lg-12 col-xl-12">
                                <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>
                                <%--<asp:Label ID="Todate" runat="server" Text="Label" Visible="false"></asp:Label>--%>
                                <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" Text="Save" Width="120" Style="font-size: smaller" OnClick="btnsave_Click" />

                                <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" Style="font-size: smaller" OnClick="btnnew_Click" />

                                <asp:Button ID="btncancel" runat="server" ValidationGroup="txtdepartmentname" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/SubmenuOffRollLCM.aspx" Width="120" Style="font-size: smaller" />
                            </div>
                        </div>
                    </div>
                </div>

                <%-------------------------------view--------------------------------%>

                <div class="tab-pane fade" id="pills-update" role="tabpanel" aria-labelledby="pills-update-tab">
                    <br />
                    <br />
                    <div class="row">
                        <%--<asp:Button ID="But" runat="server" Visible="false" Text="Button" />--%>

                        <%-- <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />--%>

                        <div id="tableview-endview" class=" col-lg-12 col-xl-12 ">
                            <br />
                            <asp:GridView ID="DGPFgenerateBK" runat="server" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CssClass="table table-hover table-secondary" Width="289px" Font-Size="10pt" AutoGenerateColumns="false" OnSelectedIndexChanged="DGPFgenerateBK_SelectedIndexChanged">

                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" CausesValidation="False" />

                                    <asp:TemplateField HeaderText="PFGID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpfgid" runat="server" Text='<%# Bind("PFGID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PF Month">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpfmonth" runat="server" Text='<%# Bind("PFMONTH") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PF Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpfdate" runat="server" Text='<%# Bind("PFDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="120px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Select Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpfType" runat="server" Text='<%# Bind("TYPE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="120px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Previous EPF Strength">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPreEPFStrength" runat="server" Text='<%# Bind("PRESTRENGTH") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="120px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Member Addition">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMemberAddition" runat="server" Text='<%# Bind("MEMADDITION") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="120px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Member Deletion">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMemberDelection" runat="server" Text='<%# Bind("MEMDELETION") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="120px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Current Strength">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCurrentStrength" runat="server" Text='<%# Bind("CURRSTRENGTH") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="120px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total Action Srength">
                                        <ItemTemplate>
                                            <asp:Label ID="lblActionStrength" runat="server" Text='<%# Bind("TOTACTSTRENGTH") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="120px"></ControlStyle>
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgOffRollLCM-PFGenerate.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/SubmenuOffRollLCM.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

        </ContentTemplate>

        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="DGPFgenerateBK" />
        </Triggers>
    </asp:UpdatePanel>



    <%----------------------------------%>

    <%--/*---Page Reload----*/--%>

    <%--<script type="text/javascript">

        function pageLoad() {
            if ($('#ContentPlaceHolder1_hidcurrenttab').val() == "2") {
                $('#pills-update-tab').tab('show');
            }
        };

    </script>--%>


    <%--/*---Date Picker----*/--%>

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtcurrentpfdate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
        }
    </script>

    <%--/*----------------------*/--%>
</asp:Content>

