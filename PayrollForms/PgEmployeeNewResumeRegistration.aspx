<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgEmployeeNewResumeRegistration.aspx.cs" Inherits="PageNewResumeRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true" UpdateMode="Conditional">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-clientdetail-tab" data-toggle="pill" href="#pills-clientdetail" role="tab" aria-controls="pills-clientdetail" style="font-size: smaller" aria-selected="true">Candidate Details</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" aria-controls="pills-view" style="font-size: smaller" aria-selected="false">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-clientdetail" role="tabpanel" aria-labelledby="pills-clientdetail-tab">

                    <div class="col-md-12 col-lg-12 col-xl-12" id="Detail">
                        <div>
                            <h6 class="card-title">Candidate Details</h6>
                        </div>
                        <div class="row">

                            <div id="Register-form1" class=" col-lg-3 col-xl-3">

                                <asp:Label ID="lblapplicationno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Application No"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtapplicationno" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Aplication No"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblemployeename" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Candidate Name *"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtemployeename" CssClass="form-control  form-control-sm txtnew text-uppercase" runat="server" placeholder="Candidate Name" OnTextChanged="txtemployeename_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lbldateofbirth" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Date of Birth"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtDOBdate" runat="server" CssClass="form-control  form-control-sm txtnew" OnTextChanged="txtDOBdate_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblgender" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Gender"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:DropDownList ID="ddlgender" CssClass="form-control  form-control-sm txtnew text-uppercase" runat="server" OnSelectedIndexChanged="ddlgender_SelectedIndexChanged">
                                            <asp:ListItem>-----Select Gender-----</asp:ListItem>
                                            <asp:ListItem>Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                            <asp:ListItem>Other</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <asp:Label ID="lblfathername" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Father Name"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtfathername" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="Father's Name" OnTextChanged="txtfathername_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblmothername" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Mother Name"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtmothername" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="Mother's Name*" OnTextChanged="txtmothername_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblguardianname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Guardian Name"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtGard" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="Guardian Name" OnTextChanged="txtGard_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblmartialstatus" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Martial Status"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:DropDownList ID="ddlmartialstatus" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlmartialstatus_SelectedIndexChanged">
                                            <asp:ListItem>-----Select Status-----</asp:ListItem>
                                            <asp:ListItem>Married</asp:ListItem>
                                            <asp:ListItem>UnMarried</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <asp:Label ID="lblspousename" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Spouse Name"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtspousename" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="Spouse Name" OnTextChanged="txtspousename_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class=" col-lg-3 col-xl-3">

                                <asp:Label ID="lbleducategory" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Edu.Category"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:DropDownList ID="ddleducategory" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddleducategory_SelectedIndexChanged" AppendDataBoundItems="True">
                                            <asp:ListItem Selected="True">--- Select Education ---</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <asp:Label ID="lblqualification" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Qualification"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:DropDownList ID="ddlqualification" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlqualification_SelectedIndexChanged" AppendDataBoundItems="True">
                                            <asp:ListItem>--- Select Qualification ---</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <asp:Label ID="lblcourse" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Course"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:DropDownList ID="ddlcourse" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AppendDataBoundItems="True">
                                            <asp:ListItem>------ Select Course -----</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <asp:Label ID="lblbloodgroup" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Blood Group"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtbloodgroup" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="Blood Group" OnTextChanged="txtbloodgroup_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblmobile" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Mobile No"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtmobile" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Mobile" autocomplete="off" TextMode="Number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==10) return false;"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblmobilewhatsapp" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Mobile WhatsApp"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtmobilewhatsapp" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Mobile WhatsApp" autocomplete="off" TextMode="Number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==10) return false;"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lbladharno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Adhar No *"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtadharno" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Adhar No" OnTextChanged="txtadharno_TextChanged" autocomplete="off" TextMode="Number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==12) return false;"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblpanno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="PAN No"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtpanno" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="PAN No" OnTextChanged="txtpanno_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblemailid" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="E-Mail ID"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtemailid" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="E-Mail ID" TextMode="Email" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                            </div>

                            <div id="" class=" col-lg-3 col-xl-3">

                                <h6>Present Address</h6>
                                <br />
                                <asp:Label ID="lblprenoandstreet" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="No.and Street"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtprenoandstreet" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="No.and Street" OnTextChanged="txtprenoandstreet_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblpretownarea" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Town/Area"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtpretownarea" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="Town/Area" OnTextChanged="txtpretownarea_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblprestate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="State"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:DropDownList ID="ddlPresentState" CssClass="form-control form-control-sm txtnew text-uppercase" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlprestate_SelectedIndexChanged" AppendDataBoundItems="True">
                                            <asp:ListItem>------ Select State ------</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <asp:Label ID="lblprecity" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="City"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:DropDownList ID="ddlpresentCity" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AppendDataBoundItems="True">
                                            <asp:ListItem>------ Select City -----</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <asp:Label ID="lblprepincode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Pincode"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtprepincode" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Pincode" TextMode="Number" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                                <br />

                                <div class=" col-lg-12 col-xl-12">
                                    <h6>Photo Upload</h6>
                                    <asp:FileUpload ID="SelectFiles" CssClass="form-control form-control-sm" runat="server" />
                                </div>
                                <br />
                            </div>
                            <br />

                            <div id="" class=" col-lg-3 col-xl-3">

                                <h6>Permanent Address</h6>
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:CheckBox ID="CheckBox1per" runat="server" CssClass="txtnew" Text="_Tick If Same as Present Addr" AutoPostBack="True" OnCheckedChanged="CheckBox1per_CheckedChanged" Font-Size="10" />
                                </div>

                                <asp:Label ID="lblpernoandstreet" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="No.and Street"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtpranoandstreet" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="No.and Street" OnTextChanged="txtpranoandstreet_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="labpertownarea" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Town/Area"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtpratownarea" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="Town/Area" OnTextChanged="txtpratownarea_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="Labperstate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="State"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:DropDownList ID="ddlPermenetState" CssClass="form-control form-control-sm txtnew text-uppercase" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlprastate_SelectedIndexChanged" AppendDataBoundItems="True">
                                            <asp:ListItem>------ Select State ------</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <asp:Label ID="Labpercity" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="City"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:DropDownList ID="ddlPermenetCity" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AppendDataBoundItems="True">
                                            <asp:ListItem>------ Select City -----</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <asp:Label ID="Labperpincode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Pincode"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtpraPin" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Pincode" TextMode="Number" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <div class=" col-lg-12 col-xl-12">
                                    <h6>Resume Upload</h6>
                                    <asp:FileUpload ID="ResumeFiles" CssClass="form-control form-control-sm" runat="server" />
                                </div>

                            </div>

                        </div>

                        <div class="row">
                            <div id="res-btn" class="col-lg-12 col-xl-12">

                                <asp:checkbox id="chkterm" Text="..I have read and agree to the <a href='PgEmployeeResumeTermCondition.aspx'>Terms and Conditions</a>" runat="Server" OnCheckedChanged="chkterm_CheckedChanged"/>

                               <%--<asp:CheckBox ID="chkterm" CssClass="text-dark custom-control custom-checkbox" runat="server" Text="..I have read and agree to the terms of service " OnCheckedChanged="chkterm_CheckedChanged" />--%>
                                <br />
                                <asp:Label ID="TypeID" runat="server" Text="Label" Visible="False"></asp:Label>

                                <asp:Button ID="btnupdate" runat="server" CssClass="btn btn-primary" Text="Save" Width="120" Enabled="true" OnClick="btnupdate_Click" OnClientClick=" return validate()" Style="font-size: smaller" />
                                <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller" />
                                <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" ValidationGroup="txtemployeeid" Text="Close" PostBackUrl="~/PayrollForms/SubmenuDataMaster.aspx" Width="120" Style="font-size: smaller" />
                            </div>
                        </div>
                    </div>

                </div>

                <%-------------------------------view--------------------------------%>
                <div class="tab-pane fade" id="pills-view" role="tabpanel" aria-labelledby="pills-view-tab">

                    <div class="row">

                        <div id="view" class=" col-lg-2 col-xl-2">
                            <asp:Label ID="lblfromdate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="From Date"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtfromdate" runat="server" CssClass="form-control form-control-sm txtnew" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lbltodate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="To Date"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttodate" runat="server" CssClass="form-control form-control-sm txtnew" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="v" class=" col-lg-4 col-xl-4 ">
                            <asp:Label ID="lblapplicationnoview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Application No"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtapplicationnoview" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Application No" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblemployeenameview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Employee Name"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtemployeenameview" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Employee Name" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="v1" class=" col-lg-4 col-xl-4 ">
                            <br />
                            <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="120" OnClick="btnview_Click" Style="font-size: smaller" />

                            <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />
                        </div>
                    </div>

                    <div class="row">

                        <div id="tableview-endview" class="col-md-12 col-lg-12 col-xl-12">

                            <asp:GridView ID="DgApplication" runat="server" CssClass="table table-hover table-secondary" HeaderStyle-BackColor="#a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" OnSelectedIndexChanged="DgApplication_SelectedIndexChanged" AutoGenerateColumns="False" CellPadding="5" Font-Size="10pt">

                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" CausesValidation="False" />

                                    <asp:TemplateField HeaderText="APPLICATION ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdapplicationid" runat="server" Text='<%# Bind("APPLICATIONID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="APPLICATION NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdapplicationno" runat="server" Text='<%# Bind("APPLICATIONNO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EMPLOYEE NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdemployeename" runat="server" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DATE OF BIRTH">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepddob" runat="server" Text='<%# Bind("DOB") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="GENDER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdgender" runat="server" Text='<%# Bind("GENDER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="FATHER NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdfathername" runat="server" Text='<%# Bind("FATHERNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="MOTHER NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdmothername" runat="server" Text='<%# Bind("MOTHERNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="GUARDIAN NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdguardianname" runat="server" Text='<%# Bind("GUARDIANNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="MARTIAL STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdmartialstatus" runat="server" Text='<%# Bind("MARTIALSTATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SPOUSE NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdspousename" runat="server" Text='<%# Bind("SPOUSENAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EDUCATION CATEGORY">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdeducation" runat="server" Text='<%# Bind("EDUCATIONCAT") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="QUALIFICATION">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdqualification" runat="server" Text='<%# Bind("QUALIFICATION") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="COURSE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdcourse" runat="server" Text='<%# Bind("COURSE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="350px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="BLOOD GROUP">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdbloodgroup" runat="server" Text='<%# Bind("BLOODGROUP") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="MOBILE NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdmobileno" runat="server" Text='<%# Bind("MOBILENO1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="MOBILE WHATSAPP">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdmobilewhatsappno" runat="server" Text='<%# Bind("MOBILENO2") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ADHAR NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdadharno" runat="server" Text='<%# Bind("ADHARNO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="160px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PAN NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdpanno" runat="server" Text='<%# Bind("PANNO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="E-MAIL ID">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdemailid" runat="server" Text='<%# Bind("EMAIL") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PRESENT NO AND STREET">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdpresentnoandstreet" runat="server" Text='<%# Bind("PRESENTNOANDSTREET") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PRESENT TOWN/AREA">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdpresenttown" runat="server" Text='<%# Bind("PRESENTTOWN") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PRESENT STATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdpresentstate" runat="server" Text='<%# Bind("PRESENTSTATENAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PRESENT CITY">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdpresentcity" runat="server" Text='<%# Bind("PRESENTCITYNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PRESENT PINCODE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdpresentpincode" runat="server" Text='<%# Bind("PRESENTPINCODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PERMANENT NO AND STREET">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdpermantnoandstreet" runat="server" Text='<%# Bind("PERMANENTNOANDSTREET") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PERMANENT TOWN/AREA">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdpermanttown" runat="server" Text='<%# Bind("PERMANENTTOWN") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PERMANENT STATE ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdpermanentstateid" runat="server" Text='<%# Bind("PERMANENTSTATEID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PERMANENT STATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdpermanentstatename" runat="server" Text='<%# Bind("PERMANENTSTATENAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PERMANENT CITY ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdpermanentcityid" runat="server" Text='<%# Bind("PERMANENTCITY") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PERMANENT CITY">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdpermanentcityname" runat="server" Text='<%# Bind("PERMANENTCITYNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PERMANENT PINCODE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdpermanentpincode" runat="server" Text='<%# Bind("PERMANENTPINCODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PRESENT STATE ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdpresentstateid" runat="server" Text='<%# Bind("PRESENTSTATEID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PRESENT CITY ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdpresentcityid" runat="server" Text='<%# Bind("PRESENTCITY") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblepdapplicationdate" runat="server" Text='<%# Bind("APPLICATIONDATE") %>'></asp:Label>
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgEmployeeNewResumeRegistration.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Employee Master" PostBackUrl="~/PayrollForms/SubmenuDataMaster.aspx" Width="150" Style="font-size: smaller" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnupdate" />
        </Triggers>
    </asp:UpdatePanel>

    <%----------------------------------------------%>

    <%--/*---Message Validation----*/--%>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtapplicationno.ClientID%>").value == "") {
                alert("Enter The Application.No");
                document.getElementById("<%=txtapplicationno.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>
    <%----------------------------------%>

    <%--/*---Page Reload----*/--%>
    <script type="text/javascript">

        function pageLoad() {
            if ($('#ContentPlaceHolder1_hidcurrenttab').val() == "2") {
                $('#pills-view-tab').tab('show');
            }
        };

    </script>

    <%--/*-----------------*/--%>

    <%--/*---Date Picker----*/--%>

    <script>

        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {

            $('#<%= txtDOBdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtfromdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        }
    </script>

    <%--/*----------------------------------*/--%>
</asp:Content>

