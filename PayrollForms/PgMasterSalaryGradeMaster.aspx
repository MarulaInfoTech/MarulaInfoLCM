<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="PgMasterSalaryGradeMaster.aspx.cs" Inherits="PageSalaryGradeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-grade-tab" data-toggle="pill" href="#pills-grade" role="tab" aria-controls="pills-grade" Style="font-size: smaller" aria-selected="true">Grade</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-update-tab" data-toggle="pill" href="#pills-update" role="tab" aria-controls="pills-update" Style="font-size: smaller" aria-selected="false">View</a>
                </li>

            </ul>

            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-grade" role="tabpanel" aria-labelledby="pills-grade-tab">

                    <div class="container-fluid">

                        <h6 class="card-title">Salary Grade Master</h6>

                        <div class="row col-lg-12 col-xl-12">

                            <div id="DM-DepartmentMaster1" class=" col-lg-6 col-xl-6">

                                <asp:Label ID="lblclientname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name *"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-10 col-xl-10">
                                        <asp:DropDownList ID="ddlclientname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlclientname_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem>---Select Client Name---</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <asp:Label ID="lbldivision" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Division"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-10 col-xl-10">
                                        <asp:TextBox ID="txtdivision" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Division" autocomplete="off" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblsalarygradeid" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Salary Grade Id *"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <div class="row">
                                            <div class="col-11">
                                                <asp:TextBox ID="txtsalarygradeid" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Salary Grade Id" autocomplete="off"></asp:TextBox>
                                            </div>
                                            <div class="col-1 ">
                                                <asp:Label ID="Label" runat="server" CssClass="label-conrol lblnew" Style="font-size: smaller" Text="%"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <asp:Label ID="lblbasic" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Basic *"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <div class="row">
                                            <div class="col-11">
                                                <asp:TextBox ID="txtbasic" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Basic" AutoPostBack="True" OnTextChanged="txtbasic_TextChanged" autocomplete="off">0</asp:TextBox>
                                            </div>
                                            <div class="col-1 ">
                                                <asp:Label ID="Label3" runat="server" CssClass="label-conrol lblnew" Style="font-size: smaller" Text="%"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <asp:Label ID="lblda" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="DA"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <div class="row">
                                            <div class="col-11">
                                                <asp:TextBox ID="txtda" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="DA" AutoPostBack="True" autocomplete="off" onkeydown='Number(this.value,event);' OnTextChanged="txtda_TextChanged">0</asp:TextBox>
                                            </div>
                                            <div class="col-1 ">
                                                <asp:Label ID="Label1" runat="server" CssClass="label-conrol lblnew" Style="font-size: smaller" Text="%"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <asp:Label ID="lblconveyance" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Conveyance"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <div class="row">
                                            <div class="col-11">
                                                <asp:TextBox ID="txtconveyance" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Conveyance" AutoPostBack="True" autocomplete="off" OnTextChanged="txtconveyance_TextChanged">0</asp:TextBox>
                                            </div>
                                            <div class="col-1 ">
                                                <asp:Label ID="Label4" runat="server" CssClass="label-conrol lblnew" Style="font-size: smaller" Text="%"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <asp:Label ID="lblwashing" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Washing"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <div class="row">
                                            <div class="col-11">
                                                <asp:TextBox ID="txtwashing" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Washing" AutoPostBack="True" autocomplete="off" OnTextChanged="txtwashing_TextChanged">0</asp:TextBox>
                                            </div>
                                            <div class="col-1 ">
                                                <asp:Label ID="Label5" runat="server" CssClass="label-conrol lblnew" Style="font-size: smaller" Text="%"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <asp:Label ID="lblhra" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="HRA"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <div class="row">
                                            <div class="col-11">
                                                <asp:TextBox ID="txthra" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="HRA" AutoPostBack="True" autocomplete="off" OnTextChanged="txthra_TextChanged">0</asp:TextBox>
                                            </div>
                                            <div class="col-1 ">
                                                <asp:Label ID="Label6" runat="server" CssClass="label-conrol lblnew" Style="font-size: smaller" Text="%"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <asp:Label ID="lblother" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Other"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <div class="row">
                                            <div class="col-11">
                                                <asp:TextBox ID="txtother" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Other" AutoPostBack="True" autocomplete="off" OnTextChanged="txtother_TextChanged">0</asp:TextBox>
                                            </div>
                                            <div class="col-1 ">
                                                <asp:Label ID="Label7" runat="server" CssClass="label-conrol lblnew" Style="font-size: smaller" Text="%"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        <div id="DM-DepartmentMaster2" class=" col-lg-6 col-xl-6 ">

                            <asp:Label ID="lbltotal" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Total"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <div class="row">
                                        <div class="col-11">
                                            <asp:TextBox ID="txttotal" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Total" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-1 ">
                                            <asp:Label ID="Label8" runat="server" CssClass="label-conrol lblnew" Style="font-size: smaller" Text="%"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <asp:Label ID="lblepdotperhour" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="ET1 Amount = (Wage / Day)"></asp:Label>
                            <div class="form-group">
                                <div class="col-lg-12 col-xl-12 ">
                                    <div class="row">
                                        <div class="col-5">
                                            <asp:TextBox ID="txtOt1" CssClass="form-control form-control-sm txtnew" runat="server" 
                                                OnTextChanged="txtOt_TextChanged" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-1 ">
                                            <asp:Label ID="Label2" runat="server" CssClass="label-conrol lblnew" 
                                                Style="font-size: x-large" Text="x"></asp:Label>
                                        </div>
                                        <div class="col-5">
                                            <asp:TextBox ID="txtOtAmount1" CssClass="form-control form-control-sm txtnew" 
                                                runat="server" OnTextChanged="txtOtAmount_TextChanged" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-1 ">
                                            <asp:Label ID="Label9" runat="server" CssClass="label-conrol lblnew" 
                                                Style="font-size: smaller" Text="%"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                             <asp:Label ID="lblET2" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="ET2 Amount = (Wage / Day)"></asp:Label>
                            <div class="form-group">
                                <div class="col-lg-12 col-xl-12 ">
                                    <div class="row">
                                        <div class="col-5">
                                            <asp:TextBox ID="txtOt2" CssClass="form-control form-control-sm txtnew" runat="server" 
                                                autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-1 ">
                                            <asp:Label ID="Label11" runat="server" CssClass="label-conrol lblnew" 
                                                Style="font-size: x-large" Text="x"></asp:Label>
                                        </div>
                                        <div class="col-5">
                                            <asp:TextBox ID="txtOtAmount2" CssClass="form-control form-control-sm txtnew" 
                                                runat="server" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-1 ">
                                            <asp:Label ID="Label13" runat="server" CssClass="label-conrol lblnew" 
                                                Style="font-size: smaller" Text="%"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                             <asp:Label ID="Label10" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="ET3 Fixed Amount )"></asp:Label>
                            <div class="form-group">
                                <div class="col-lg-12 col-xl-12 ">
                                    <div class="row">
                                        <div class="col-5">
                                            <asp:TextBox ID="txtOt3" CssClass="form-control form-control-sm txtnew" runat="server" 
                                                autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-1 ">
                                            <asp:Label ID="Label15" runat="server" CssClass="label-conrol lblnew" 
                                                Style="font-size: x-large" Text="x"></asp:Label>
                                        </div>
                                        <div class="col-5">
                                            <asp:TextBox ID="txtOtAmount3" CssClass="form-control form-control-sm txtnew" 
                                                runat="server" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-1 ">
                                            <asp:Label ID="Label17" runat="server" CssClass="label-conrol lblnew" 
                                                Style="font-size: smaller" Text="%"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <asp:Label ID="lblspecial" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Special"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <div class="row">
                                        <div class="col-11">
                                            <asp:TextBox ID="txtspecial" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Special" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-1 ">
                                            <asp:Label ID="Label12" runat="server" CssClass="label-conrol lblnew" Style="font-size: smaller" Text="%"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <asp:Label ID="lblbonus" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Bonus"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <div class="row">
                                        <div class="col-11">
                                            <asp:TextBox ID="txtbonus" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Bonus" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-1 ">
                                            <asp:Label ID="Label14" runat="server" CssClass="label-conrol lblnew" Style="font-size: smaller" Text="%"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <asp:Label ID="lblpf" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Employee contribution PF"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <div class="row">
                                        <div class="col-11">
                                            <asp:TextBox ID="txtpf" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="PF" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-1 ">
                                            <asp:Label ID="Label16" runat="server" CssClass="label-conrol lblnew" Style="font-size: smaller" Text="%"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <asp:Label ID="lblesi" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Employee contribution ESI"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <div class="row">
                                        <div class="col-11">
                                            <asp:TextBox ID="txtesi" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="ESI" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-1 ">
                                            <asp:Label ID="Label18" runat="server" CssClass="label-conrol lblnew" Style="font-size: smaller" Text="%"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <asp:Label ID="lblgraduity" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Gratuity"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <div class="row">
                                        <div class="col-11">
                                            <asp:TextBox ID="txtgraduity" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Gratuity" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-1 ">
                                            <asp:Label ID="Label20" runat="server" CssClass="label-conrol lblnew" Style="font-size: smaller" Text="%"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <asp:Label ID="lblleavewithwages" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Leave With Wages"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <div class="row">
                                        <div class="col-11">
                                            <asp:TextBox ID="txtleavewithwages" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Leave With Wages" autocomplete="off"></asp:TextBox>
                                        </div>
                                        <div class="col-1 ">
                                            <asp:Label ID="Label22" runat="server" CssClass="label-conrol lblnew" Style="font-size: smaller" Text="%"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div id="SGM-btn" class="col-lg-12 col-xl-12">
                            <asp:Label ID="TypeID" runat="server" Text="Label" Visible="False"></asp:Label>

                            <asp:Button ID="btnsave" runat="server" Autopostback="True" CssClass="btn btn-primary " Text="Save" Width="120" OnClick="btnsave_Click" OnClientClick="return validate()" Style="font-size: smaller"/>

                            <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller"/>

                            <asp:Button ID="btncancel" runat="server" CssClass="btn btn-primary" ValidationGroup="txtgraduity" Text="Close" PostBackUrl="~/PayrollForms/submenumaster.aspx" Width="120" Style="font-size: smaller" />
                        </div>
                    </div>
                </div>
            </div>

            <%-------------------------------view--------------------------------%>

            <div class="tab-pane fade" id="pills-update" role="tabpanel" aria-labelledby="pills-update-tab">

                <div class="row">

                    <div id="view" class=" col-lg-4 col-xl-4 ">
                        <asp:Label ID="lblsalarygradeidview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Salary Grade ID"></asp:Label>
                        <div class="form-group">
                            <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                <asp:TextBox ID="txtsalarygradeidview" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Salary Grade ID" autocomplete="off" OnTextChanged="txtsalarygradeidview_TextChanged"></asp:TextBox>
                                <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />
                            </div>
                        </div>
                    </div>

                    <div id="" class=" col-lg-4 col-xl-4 ">
                        <br />
                        <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="120" OnClick="btnview_Click" Style="font-size: smaller"/>
                    </div>
                </div>

                <div class="row">
                    <div id="tableview-endview" class=" col-lg-12 col-xl-12 ">
                        <br />
                        <asp:GridView ID="DgSalaryDetail" runat="server" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CssClass="table table-hover table-secondary" OnSelectedIndexChanged="DgSalaryDetail_SelectedIndexChanged" AutoGenerateColumns="false" Font-Size="10pt">
                            <Columns>
                                <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" CausesValidation="False" />

                                <asp:TemplateField HeaderText="CLIENT NAME">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslyclientname" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="DIVISION">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldivision" runat="server" Text='<%# Bind("DIVISION") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="270px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="SALARY GRADE ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslygrade" runat="server" Text='<%# Bind("GRADE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="BASIC">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslybasic" runat="server" Text='<%# Bind("BASIC") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="DA">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslyda" runat="server" Text='<%# Bind("DA") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="CONVEYANCE">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslyconveyance" runat="server" Text='<%# Bind("CONVEYANCE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="WASHING">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslywashing" runat="server" Text='<%# Bind("WASHING") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="HRA">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslyhra" runat="server" Text='<%# Bind("HRA") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="OTHER">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslyother" runat="server" Text='<%# Bind("OTHER") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="TOTAL">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslytotal" runat="server" Text='<%# Bind("TOTAL") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="OT-HOUR">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslyothour" runat="server" Text='<%# Bind("OTHOUR") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="OT-AMOUNT">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslyotamount" runat="server" Text='<%# Bind("OTAMOUNT") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>


                                 <asp:TemplateField HeaderText="OT2-HOUR">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslyothour2" runat="server" Text='<%# Bind("OTHOUR2") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="OT2-AMOUNT">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslyotamount2" runat="server" Text='<%# Bind("OTAMOUNT2") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

				                 <asp:TemplateField HeaderText="OT3-HOUR">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslyothour3" runat="server" Text='<%# Bind("OTHOUR3") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="OT3-AMOUNT">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslyotamount3" runat="server" Text='<%# Bind("OTAMOUNT3") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>




                                <asp:TemplateField HeaderText="SPECIAL">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslyspecial" runat="server" Text='<%# Bind("SPECIAL") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="BONUS">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslybonus" runat="server" Text='<%# Bind("BONUS") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="EMPLOYEE CONTRIBUTION PF">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslypf" runat="server" Text='<%# Bind("PF") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="EMPLOYEE CONTRIBUTION ESI">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslyesi" runat="server" Text='<%# Bind("ESI") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="GRATUITY">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslygraduity" runat="server" Text='<%# Bind("GRADUITY") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="LEAVE WITH WAGES">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslyleavewage" runat="server" Text='<%# Bind("LEAVEWAGE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="SALARY ID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslysalaryid" runat="server" Text='<%# Bind("SALARYID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="CLIENT ID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslyclientid" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                            </Columns>
                            <RowStyle BackColor="#f5f5ef" />
                            <FooterStyle HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />

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
                                    <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgMasterSalaryGradeMaster.aspx" Width="120" Style="font-size: smaller"/>
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

    <%---------------------------------%>

    <%--/*---Page Reload----*/--%>

    <script type="text/javascript">

        function pageLoad() {
            if ($('#ContentPlaceHolder1_hidcurrenttab').val() == "2") {
                $('#pills-update-tab').tab('show');
            }
        };

    </script>

    <%--/*-----------------*/--%>

    <%--/*---Message Validation----*/--%>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=ddlclientname.ClientID%>").value == "") {
                alert("Enter The Client Name");
                document.getElementById("<%=ddlclientname.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>

    <%--/*------------------------*/--%>
</asp:Content>

