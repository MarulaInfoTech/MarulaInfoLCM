<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="PgMasterCompanyMaster.aspx.cs" Inherits="CompanyMasterPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-companymaster-tab" data-toggle="pill" href="#pills-companymaster" role="tab" aria-controls="pills-companymaster" style="font-size: smaller" aria-selected="true">Company Master</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" style="font-size: smaller" aria-selected="true" aria-controls="pills-view">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">

                <div class="tab-pane fade active show" id="pills-companymaster" role="tabpanel" aria-labelledby="pills-companymaster-tab">

                    <div>
                        <h6 class="card-title">Company Master</h6>
                    </div>

                    <%--<div id="divWait" style="position: absolute; left: 50%; top: 50%; margin: -100px 0 0 -150px; display: inline;">
                        <div style="text-align: center; width: 300px; height: 70px;">
                            <br />
                            <!--Your GIF image here-->
                            <img src="../Photos/Icon.gif" />

                        </div>
                    </div>--%>

                    <%-- <div class="loading">
                            <img src="../Photos/Ajux_loader.gif" alt="" height="400" width="400" />
                        </div>--%>

                    <div class="col-lg-12 col-xl-12" id="divHolder">

                        <div class="row">

                            <div id="cmf1-company-master" class="col-lg-6 col-xl-6">

                                <asp:Label ID="lblcompanycode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Company Code"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtcompanycode" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Company Code" ReadOnly="True" OnTextChanged="txtcompanycode_TextChanged"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblcompanyname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Company Name *"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtcompanyname" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off" runat="server" placeholder="Company Name" OnTextChanged="txtcompanyname_TextChanged"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblsector" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Sector"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtsector" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Sector" OnTextChanged="txtsector_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblnoandstreet" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Street And No"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtnoandstreet" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Street And No" OnTextChanged="txtnoandstreet_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lbltownarea" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Town / Area"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txttownarea" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Town / Area" OnTextChanged="txttownarea_TextChanged1" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblcityname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="City"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtcityname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="City" autocomplete="off" OnTextChanged="txtcityname_TextChanged"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblstate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="State"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtstate" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="State" OnTextChanged="txtstate_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblcitypin" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="City-Pincode"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtcitypin" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="City-Pincode" TextMode="Number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==8) return false;"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblemailid" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="E-Mail ID *"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtemailid" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="E-Mail ID" TextMode="Email" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblwebsite" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Website"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtwebsite" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Website" OnTextChanged="txtwebsite_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblofficeph1" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Office Ph 1"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtofficeph1" CssClass="form-control form-control-sm txtnew" runat="server" autocomplete="off" placeholder="Office Ph 1" TextMode="Number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==15) return false;"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div id="cmf2-company-master" class="col-lg-6 col-xl-6">

                                <asp:Label ID="lblofficeph2" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Office Ph 2"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtofficeph2" CssClass="form-control form-control-sm txtnew" runat="server" autocomplete="off" placeholder="Office Ph 2" TextMode="Number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==15) return false;"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblmobileno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Mobile No *"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtmobileno" CssClass="form-control form-control-sm txtnew" runat="server" autocomplete="off" placeholder="Mobile No" TextMode="Number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==10) return false;"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblfaxno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="PAN No"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtfaxno" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="PAN No" OnTextChanged="txtfaxno_TextChanged" autocomplete="off" TextMode="Number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==12) return false;"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblgstno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="GST Registration No"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtgstno" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="GST Registration No" OnTextChanged="txtgstno_TextChanged" autocomplete="off" MaxLength="15"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblcstno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="CIN No"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtcstno" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="CIN No" OnTextChanged="txtcstno_TextChanged" autocomplete="off" MaxLength="21"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lbleccno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="FIRM/Company Registration No"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txteccno" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="FIRM/Company Registration No" OnTextChanged="txteccno_TextChanged" autocomplete="off" MaxLength="21"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblsacno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="SAC Code No"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtsacno" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="SAC Code No" OnTextChanged="txtsacno_TextChanged" autocomplete="off" TextMode="Number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==6) return false;"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblpfno" runat="server" CssClass="label-conrol col-sm-12 text-uppercase lblnew" Text="EPF Establishment Code No"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtpfno" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="EPF Establishment Code No" OnTextChanged="txtpfno_TextChanged" autocomplete="off" MaxLength="21"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblesino" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="ESI Establishment Code No"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtesino" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="ESI Establishment Code No" OnTextChanged="txtesino_TextChanged" autocomplete="off" MaxLength="17"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblenrolldate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Enroll Date"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtenrolldate" runat="server" CssClass="form-control form-control-sm txtnew" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <br />
                        <div class="row">
                            <div id="CM-btn" class="col-lg-12 col-xl-12">
                                <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>

                                <asp:Button ID="btnupdate" runat="server" CssClass="btn btn-primary btnupdate" AutoPostback="True" Text="Save" Width="120" OnClick="btnupdate_Click" OnClientClick=" return validate()" Style="font-size: smaller" />

                                <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller" />

                                <asp:Button ID="btnclose" runat="server" ValidationGroup="txtcompanycode" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/submenumaster.aspx" Width="120" Style="font-size: smaller" />
                            </div>
                        </div>

                    </div>
                </div>

                <%---------------------view-------------------------%>


                <div class="tab-pane fade" id="pills-view" role="tabpanel">

                    <div class="row">

                        <div id="view" class="col-lg-4 col-xl-4 ">

                            <asp:Label ID="lblcompanynameview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Company Name"></asp:Label>
                            <div class="form-group">
                                <div class="col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtcompanynameview" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off" runat="server" placeholder="Company Name" OnTextChanged="txtcompanynameview_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="" class=" col-lg-4 col-xl-4 ">
                            <br />
                            <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="120" OnClick="btnview_Click" Style="font-size: smaller" />

                            <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />
                        </div>

                    </div>
                    <br />

                    <div class="row">

                        <div id="tableview-endview" class=" col-lg-12 col-xl-12">
                            <%-- Grid table table-hover table-secondary--%>

                            <asp:GridView ID="DgCompany" runat="server" CssClass="table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                                OnSelectedIndexChanged="DgCompany_SelectedIndexChanged" AutoGenerateColumns="False" Font-Size="10pt" OnDataBound="Item_Bound">

                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True">

                                        <ItemStyle Wrap="False" />
                                    </asp:CommandField>

                                    <asp:TemplateField HeaderText="COMPANY ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmcompanid" runat="server" Text='<%# Bind("COMPANYID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="COMPANY CODE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmcompanycode" runat="server" Text='<%# Bind("COMPANYCODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="COMPANY NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmcompanyname" runat="server" Text='<%# Bind("COMPANYNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SECTOR">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmsector" runat="server" Text='<%# Bind("SECTOR") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="270px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="STREET AND NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmstreetno" runat="server" Text='<%# Bind("ADDRESS1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOWN AND AREA">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmtownandarea" runat="server" Text='<%# Bind("ADDRESS2") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CITY">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmcity" runat="server" Text='<%# Bind("ADDRESS3") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="STATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmstate" runat="server" Text='<%# Bind("ADDRESS4") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CITY-PINCODE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmpincode" runat="server" Text='<%# Bind("PINCODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="E-MAIL ID">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmemail" runat="server" Text='<%# Bind("EMAIL") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="WEBSITE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmweb" runat="server" Text='<%# Bind("WEB") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="OFFICE PH1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmoffice1" runat="server" Text='<%# Bind("OFFICENO1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="OFFICE PH2">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmoffice2" runat="server" Text='<%# Bind("OFFICENO2") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="MOBILE NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmmobileno" runat="server" Text='<%# Bind("MOBILENO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PAN NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmfaxno" runat="server" Text='<%# Bind("FAXNO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="GST REGISTRATION NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmgstno" runat="server" Text='<%# Bind("GSTNO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CIN NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmcinno" runat="server" Text='<%# Bind("CSTNO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="FIRM/COMPANY REGISTRATION NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmregno" runat="server" Text='<%# Bind("ECCNO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SAC CODE NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmsaccodeno" runat="server" Text='<%# Bind("CODENO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EPF ESTABLISHMENT CODE NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmepfno" runat="server" Text='<%# Bind("PF") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ESI ESTABLISHMENT CODE NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmesino" runat="server" Text='<%# Bind("ESI") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ENROLL DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcmdate" runat="server" Text='<%# Bind("DATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                </Columns>
                                <FooterStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgMasterCompanyMaster.aspx" Width="120" Style="font-size: smaller" />
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

        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="DgCompany" />
        </Triggers>
    </asp:UpdatePanel>

   <%--/*---------------------*/--%>


    <%--/*---------------------DgCompany----------------------*/--%>

    <%-- <script type="text/javascript">
        $(".btnupdate").live("click", function () {
            $("#divHolder").attr('disabled', true);
            $("#divWait").css({ 'display': 'block' });
        });
    </script>--%>

    <%--/*---Page Reload----*/--%>

    <script type="text/javascript">

        function pageLoad() {
            if ($('#ContentPlaceHolder1_hidcurrenttab').val() == "2") {
                $('#pills-update-tab').tab('show');
            }
        };

    </script>

    <%--/*-----------------*/--%>

    <%--------------only Allow Number--------------------%>

    <%--    <script type='text/javascript'>
        function Number(src, event) {
            //Get key pressed
            var key = event.which || event.keyCode || event.charCode;
            //Ignore any backspaces or deletes that might affect the first three values
            if ((key == 49 || key == 50 || key == 51 || key == 52 || key == 53 || key == 54 || key == 55
                || key == 56 || key == 57 || key == 48 || key == 97 || key == 98 || key == 99 || key == 100 || key == 101
                || key == 102 || key == 103 || key == 104 || key == 105 || key == 96 || key == 9 || key == 8 || key == 190 || key == 110)) {

            }
            else {
                event.preventDefault(); return false;
            }
        }
    </script>--%>

    <%----------------------------------%>

    <%--/*---Date Picker----*/--%>

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtenrolldate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
        }
    </script>

    <%--/*----------------------*/--%>

    <%--/*---Message Validation----*/--%>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtcompanyname.ClientID%>").value == "") {
                alert("Enter Company Name");
                document.getElementById("<%=txtcompanyname.ClientID%>").focus();
                return false;
            }
            return true;
        }
    </script>

    <%-------------------------------------------------------%>
</asp:Content>

