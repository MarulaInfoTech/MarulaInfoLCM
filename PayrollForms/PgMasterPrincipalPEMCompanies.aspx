<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="PgMasterPrincipalPEMCompanies.aspx.cs" Inherits="PgMasterPrincipalPEMCompanies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager2" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-clientdetail-tab" data-toggle="pill" href="#pills-clientdetail" role="tab" aria-controls="pills-clientdetail" Style="font-size: smaller" aria-selected="true">Client Details</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" aria-controls="pills-view" Style="font-size: smaller" aria-selected="false">Views</a>
                </li>

            </ul>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-clientdetail" role="tabpanel" aria-labelledby="pills-clientdetail-tab">

                    <div>
                        <h6 class="card-title">Principal PEM Companies</h6>
                    </div>

                    <div class="row col-lg-12 col-xl-12">

                        <div id="CDE1-Client-Division-Entry" class=" col-lg-4 col-xl-4 ">

                            <asp:Label ID="lblpemcompaniesname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="PEM Client Name *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlpemcompaniesname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlpemcompaniesname_SelectedIndexChanged">
                                        <asp:ListItem>------ Select PEM Client Name -------</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lbldivisionname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Division Name"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtcompanyname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Division Name" OnTextChanged="txtcompanyname_TextChanged" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lbllcmcompanyname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="LCM Company Name *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlCompany" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged">
                                        <asp:ListItem>------ Select PEM Company -------</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lblsector" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Sector"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtsector" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Sector" OnTextChanged="txtsector_TextChanged" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lbladdressnoandstreet" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Address"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtprenoandstreet" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="No.and Street" OnTextChanged="txtprenoandstreet_TextChanged" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblpretownarea" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Town/Area"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtpretownarea" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Town/Area" OnTextChanged="txtpretownarea_TextChanged" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblprestate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="State *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlprestate" CssClass="form-control form-control-sm text-uppercase txtnew" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlprestate_SelectedIndexChanged" AppendDataBoundItems="True">
                                        <asp:ListItem>------ Select State ------</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lblprecity" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="City *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlprecity" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True">
                                        <asp:ListItem>------ Select City ------</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lblcontractfrom" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Contract Form"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtcfdate" runat="server" CssClass="form-control form-control-sm classTarget txtnew" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblto" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Contract To"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttodate" runat="server" CssClass="form-control form-control-sm txtnew" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>


                            <asp:Label ID="lblenrolldate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Enroll Date"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtenrolldate" runat="server" CssClass="form-control form-control-sm txtnew" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblpanno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="PAN No"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtpanno" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="PAN No" autocomplete="off" MaxLength="15"></asp:TextBox>
                                </div>
                            </div>


                        </div>

                        <div id="CDE-Button" class=" col-lg-2 col-xl-2">

                            <br />

                            <div class="form-group">
                                <asp:Button ID="btnaddcompanies" runat="server" CssClass="btn btn-primary" ValidationGroup="txtsector" Text="Add Companies" PostBackUrl="~/PayrollForms/PgMasterSubClientAdd.aspx" Width="130" Style="font-size: smaller"/>
                            </div>

                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            
                            <div class="form-group">
                                <asp:Button ID="btnaddstate" runat="server" CssClass="btn btn-primary" ValidationGroup="txtprenoandstreet" Text="Add State" PostBackUrl="~/PayrollForms/PgMasterSubAddState.aspx" Width="120" Style="font-size: smaller"/>
                            </div>
                            <br />

                            <div class="form-group">
                                <asp:Button ID="btnaddcity" runat="server" CssClass="btn btn-primary" ValidationGroup="txtpretownarea" Text="Add City" PostBackUrl="~/PayrollForms/PgMasterSubAddCity.aspx" Width="120" Style="font-size: smaller"/>
                            </div>

                        </div>

                        <div id="CDE2-Client-Division-Entry" class=" col-lg-4 col-xl-4">

                            <asp:Label ID="lblgstnumber" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="GST Registration No *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtgstnumber" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="GST Registration No" OnTextChanged="txtgstnumber_TextChanged" autocomplete="off" MaxLength="15"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblcstno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="CIN No"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtcstno" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="CIN No" OnTextChanged="txtcstno_TextChanged" autocomplete="off" MaxLength="21"></asp:TextBox>

                                </div>
                            </div>

                            <asp:Label ID="lbleccno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="FIRM/Company Registration No"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txteccno" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="FIRM/Company Registration No" OnTextChanged="txteccno_TextChanged" autocomplete="off" MaxLength="21"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblsacno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="SAC Code No"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtsacno" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="SAC Code No" OnTextChanged="txtsacno_TextChanged" autocomplete="off" TextMode="Number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==6) return false;"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblpfno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="EPF Establishment Code No"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtpfno" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="EPF Establishment Code No" OnTextChanged="txtpfno_TextChanged" autocomplete="off" MaxLength="21"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblesino" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="ESI Establishment Code No"></asp:Label>
                            <div class="form-group">
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtesino" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="ESI Establishment Code No" autocomplete="off" MaxLength="17"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblphoneno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Phone No *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtphoneno" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Phone No" autocomplete="off" TextMode="Number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==15) return false;"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblmobileno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Mobile No *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtmobileno" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="+91" autocomplete="off" TextMode="Number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==10) return false;"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblhrnumber" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="HR Number"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txthrnumber" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="HR Number" OnTextChanged="txthrnumber_TextChanged" autocomplete="off" TextMode="Number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==15) return false;"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblaccountantnumber" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Accountant Number"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtaccountantnumber" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Accountant Number" OnTextChanged="txtaccountantnumber_TextChanged" autocomplete="off" MaxLength="15"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblemailid" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Email ID"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtemailid" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Email ID" TextMode="Email" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblwebsite" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Website"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtwebsite" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Website" OnTextChanged="txtwebsite_TextChanged" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                       <%-- <div class="form-group">
                            <div class=" col-lg-12 col-xl-12 ">
                                <asp:Label ID="lblmessagebox" runat="server" ForeColor="#006600"></asp:Label>
                            </div>
                        </div>--%>
                    </div>

                    <div class="row">
                        <div id="CM-btn" class="col-lg-12 col-xl-12 ">
                            <asp:Label ID="TypeID" runat="server" Visible="False"></asp:Label>

                            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" OnClick="btnsave_Click" OnClientClick="return validate()" Style="font-size: smaller"/>

                            <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary " Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller"/>

                            <asp:Button ID="btncancel" runat="server" CssClass="btn btn-primary " ValidationGroup="txtsector" Text="Close" PostBackUrl="~/PayrollForms/submenumaster.aspx" Width="120" Style="font-size: smaller"/>
                        </div>
                    </div>

                </div>

                <div class="tab-pane fade" id="pills-view" role="tabpanel" aria-labelledby="pills-view-tab">

                    <div class="row">
                        <div id="view" class=" col-lg-4 col-xl-4 ">
                            <asp:Label ID="lblclientnameview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtcompanynameview" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Client Name" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="" class=" col-lg-4 col-xl-4 ">
                            <br />
                            <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="120" OnClick="btnview_Click" Style="font-size: smaller"/>
                            <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />
                        </div>

                    </div>

                    <div class="row">

                        <div id="tableview-endview" class=" col-lg-12 col-xl-12 ">
                            <br />
                            <asp:GridView ID="DgPEMClinet" runat="server" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CssClass="table table-hover table-secondary" OnSelectedIndexChanged="DgPEMClinet_SelectedIndexChanged" AutoGenerateColumns="false" Font-Size="10pt">
                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" CausesValidation="False" />

                                    <asp:TemplateField HeaderText="CLIENTID" HeaderStyle-Width="200px" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemclientid" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PEM CLIENT NAME" HeaderStyle-Width="200px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemclientname" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DIVISION NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemdivision" runat="server" Text='<%# Bind("DIVISION") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="COMPANYID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemcompanyid" runat="server" Text='<%# Bind("COMPANYID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="LCM COMPANY NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemcompanyname" runat="server" Text='<%# Bind("COMPANYNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SECTOR">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemsector" runat="server" Text='<%# Bind("SECTOR") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ADDRESS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemaddress" runat="server" Text='<%# Bind("ADDRESS1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOWN AND AREA">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemtown" runat="server" Text='<%# Bind("TOWN") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="STATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemstatename" runat="server" Text='<%# Bind("STATENAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CITY">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemcityname" runat="server" Text='<%# Bind("CITYNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CONTRACT FROM">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemcontractfrom" runat="server" Text='<%# Bind("CONTRACTFROM") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CONTRACT TO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemcontractto" runat="server" Text='<%# Bind("CONTRACTTO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ENROLL DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemenrolldate" runat="server" Text='<%# Bind("ENDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="GST REGISTRATION NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemgstno" runat="server" Text='<%# Bind("GSTNO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CIN NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemcinno" runat="server" Text='<%# Bind("CSTNO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="FIRM/COMPANY REGISTRATION NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemregno" runat="server" Text='<%# Bind("ECCNO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SAC CODE NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemsaccodeno" runat="server" Text='<%# Bind("CODENO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EPF ESTABLISHMENT CODE NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemepfno" runat="server" Text='<%# Bind("PFNO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ESI ESTABLISHMENT CODE NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemesino" runat="server" Text='<%# Bind("ESINO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PHONE NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemphoneno" runat="server" Text='<%# Bind("PHONENO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="MOBILE NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemmobileno" runat="server" Text='<%# Bind("MOBILENO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="HR NUMBER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemhrno" runat="server" Text='<%# Bind("HRNO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ACCOUNTANT NUMBER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemaccountantno" runat="server" Text='<%# Bind("ACCOUNTANTNO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EMAIL ID">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpememailid" runat="server" Text='<%# Bind("EMAILID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="WEBSITE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemwebsite" runat="server" Text='<%# Bind("WEBSITE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>                           

                                    <asp:TemplateField HeaderText="STATE ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemstateid" runat="server" Text='<%# Bind("STATEID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CITY ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpemcityid" runat="server" Text='<%# Bind("CITYID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PEM ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpempemid" runat="server" Text='<%# Bind("PEMID") %>'></asp:Label>
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgMasterPrincipalPEMCompanies.aspx" Width="120" Style="font-size: smaller"/>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/submenumaster.aspx" Width="120" Style="font-size: smaller"/>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <%-----------------------------------------------------------------%>

    <%--/*---Page Reload----*/--%>
    <script type="text/javascript">

        function pageLoad() {
            if ($('#ContentPlaceHolder1_hidcurrenttab').val() == "2") {
                $('#pills-view-tab').tab('show');
            }
        };

    </script>

    <%--/*------------------*/--%>
        
    <%--/*---Date Picker----*/--%>

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });
        function bindDatePickers(sender, args) {
            $('#<%= txtcfdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtenrolldate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        }

    </script>

    <%--/*---------------------*/--%>

    <%--/*---Message Validation----*/--%>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtgstnumber.ClientID%>").value == "") {
                alert("Enter The GST Number");
                document.getElementById("<%=txtgstnumber.ClientID%>").focus();
              return false;
          }

          return true;
      }
    </script>

    <%---------------------------------------------------------------%>
</asp:Content>

