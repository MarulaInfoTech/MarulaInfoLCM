<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="PgPayrollDeductions.aspx.cs" Inherits="PayrollForms_PgPayrollDeductions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

   <%-- <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">--%>

        <%--<ContentTemplate>--%>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-clientdetail-tab" data-toggle="pill" href="#pills-clientdetail" role="tab" aria-controls="pills-clientdetail" style="font-size: smaller" aria-selected="true">Deductions</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" aria-controls="pills-view" style="font-size: smaller" aria-selected="false">Views</a>
                </li>
            </ul>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-clientdetail" role="tabpanel" aria-labelledby="pills-clientdetail-tab">

                    <div class="tab-pane" id="Detail">
                        <div>
                            <h6 class="card-title">Deductions Entry</h6>
                        </div>
                        
                        <div class="row col-lg-12 col-xl-12">

                            <div id="DE-Deductions" class=" col-lg-2 col-xl-2">

                                <asp:Label ID="lbldeductiondate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Deduction Date *"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtdeductiondate" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class=" col-lg-4 col-xl-4">
                                <asp:Label ID="lblcompanyname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Company Name *"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:DropDownList ID="ddlcompanyname" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlcompanyname_SelectedIndexChanged">
                                            <asp:ListItem>-Select Company Name-</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <div id="DE-Deductionstxt" class=" col-lg-3 col-xl-3">
                                <asp:Label ID="lbldivisionname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Division Name *"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtdivisionname" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" OnTextChanged="txtdivisionname_TextChanged"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div id="" class=" col-lg-3 col-xl-3">
                                <asp:Label ID="lblnoofemp" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="No of Employees"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtnoofemp" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" ReadOnly="true" Width="200" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <asp:Button ID="btnGet" runat="server" CssClass="btn btn-primary " Text="Get Employee" Width="120" 
                                    OnClick="btnGet_Click" Style="font-size: smaller" />
                                <br />
                                <br />
                                  
                                <asp:Button ID="btnDeductLink" runat="server" CssClass="btn btn-primary " Text="ADD" Width="120" 
                                    PostBackUrl="~/PayrollForms/PgPayrollDescription.aspx" Style="font-size: smaller" />
                             </div>

                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div id="tableview-frontview" class="col-lg-12 col-xl-12">

                            <asp:GridView ID="DgDeduction" runat="server" OnSelectedIndexChanged="DgDeduction_SelectedIndexChanged" OnSelectedIndexChanging="DgDeduction_SelectedIndexChanging" EditIndex="2" OnRowEditing="DgDeduction_RowEditing"
                                BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" ForeColor="Black" HorizontalAlign="Center" CssClass="table table-hover table-secondary" HeaderStyle-BackColor="#a6a6a6" AutoGenerateColumns="False" OnRowCreated="DgDeduction_RowCreated" Font-Size="10pt">
                                <Columns>
                                    <asp:TemplateField HeaderText="Employee ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpID" runat="server" Text='<%# Bind("EMPLOYEEID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Emloyee Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpNo" CssClass="label-conrol col-sm-12 lblnew" runat="server" Text='<%# Bind("EMPLOYEECODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Width="180px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Employee Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpName" CssClass="label-conrol col-sm-12 lblnew" runat="server" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D1">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtD1" runat="server" autocomplete="off" 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0" onkeydown='Number(this.value,event);' 
                                                Text='<%# Bind("D1") %>'></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D2">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtD2" runat="server" autocomplete="off" onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0" Text='<%# Bind("D2") %>'></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D3">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtD3" runat="server" autocomplete="off" onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0" Text='<%# Bind("D3") %>'></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D4">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtD4" runat="server" autocomplete="off" onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0" Text='<%# Bind("D4") %>'></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D5">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtD5" runat="server" autocomplete="off" onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0" Text='<%# Bind("D5") %>'></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D6">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtD6" runat="server" autocomplete="off" onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0" Text='<%# Bind("D6") %>'></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D7">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtD7" runat="server" autocomplete="off" onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0" Text='<%# Bind("D7") %>'></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="D8">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtD8" runat="server" autocomplete="off" 
                                                CssClass="form-control form-control-sm txtnew" Text='<%# Bind("D8") %>'></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtGdtotal" runat="server" onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" Text='<%# Bind("TOTAL") %>'></asp:TextBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Width="170px"></ControlStyle>
                                    </asp:TemplateField>                                    

                                </Columns>

                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <RowStyle BackColor="#f5f5ef" />
                            </asp:GridView>
                        </div>
                    </div>
                   
                    <h4 class="card-title">Summary</h4>
                    <div class="row">
                        <div id="" class=" col-lg-2 col-xl-2">

                            <asp:Label ID="lblTotD1" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="D1"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttotD1" CssClass="form-control form-control-sm text-uppercase txtnew" 
                                        autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <asp:Label ID="lblTotD2" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="D2"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttotD2" CssClass="form-control form-control-sm text-uppercase txtnew" 
                                        autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="" class=" col-lg-2 col-xl-2">
                            <asp:Label ID="lblTotD3" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="D3"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttotD3" CssClass="form-control form-control-sm text-uppercase txtnew" 
                                        autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblTotD4" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="D4"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttotD4" CssClass="form-control form-control-sm text-uppercase txtnew" 
                                        autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="" class=" col-lg-2 col-xl-2">

                            <asp:Label ID="lblTotD5" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="D5"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttotD5" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblTotD6" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="D6"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttotD6" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div id="" class=" col-lg-2 col-xl-2">

                            <asp:Label ID="lblTotD7" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="D7"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttotD7" CssClass="form-control form-control-sm text-uppercase txtnew" 
                                        autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblTotD8" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="D8"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttotD8" CssClass="form-control form-control-sm text-uppercase txtnew" 
                                        autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div id="" class=" col-lg-4 col-xl-4">
                            <asp:Label ID="lblGrandTot" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Total"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttotal" CssClass="form-control form-control-sm text-uppercase txtnew" 
                                        autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <asp:Button ID="btncalculate" runat="server" CssClass="btn btn-primary" Text="Calculate" Width="120" 
                                OnClick="btncalculate_Click" Style="font-size: smaller" />
                            <br />
                        </div>
                    </div>

                    <div class="row">

                        <div id="AYM-btn" class=" col-lg-12 col-xl-12 ">

                            <asp:Label ID="TypeID" runat="server" Text="Label" Visible="False"></asp:Label>

                            <asp:Label ID="MessageBox3" class="alert alert-secondary" role="alert" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>

                            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" OnClick="btnsave_Click" OnClientClick="return validate()" Style="font-size: smaller" />

                            <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary " Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller" />

                            <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary " Text="Close" PostBackUrl="~/PayrollForms/SubmenuPayroll.aspx" Width="120" Style="font-size: smaller" />

                        </div>
                    </div>                  
                </div>

                <%-------------------------------view--------------------------------%>

                <div class="tab-pane fade" id="pills-view" role="tabpanel" aria-labelledby="pills-view-tab">

                    <div class="row" id="Daily-Header-Style">
                        <div id="" class=" col-lg-3 col-xl-3">
                            <asp:Label ID="lblfromdateview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="From Date"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtfromdateview" runat="server" CssClass="form-control form-control-sm" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lbltodateview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="To Date"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttodateview" runat="server" CssClass="form-control form-control-sm" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class=" col-lg-4 col-xl-4">
                            <asp:Label ID="lblcompanyname1" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Company Name"></asp:Label>
                            <div class="form-group">
                                <div class="col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlcompanynameview" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off" runat="server"></asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lbldivisionnamee" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Division Name"></asp:Label>
                            <div class="form-group">
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtdivisionnameview" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off" runat="server" placeholder="Division Name" OnTextChanged="txtdivisionnameview_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="" class=" col-lg-3 col-xl-3">
                            <asp:Label ID="lblempcode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Emp Code"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtempcode" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblempname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Emp Name"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtempname" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off" runat="server" OnTextChanged="txtempname_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="" class=" col-lg-2 col-xl-2">
                            <br />
                            <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="120" OnClick="btnview_Click" Style="font-size: smaller" />
                            <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div id="tableview-endview" class="col-lg-12 col-xl-12">

                            <asp:GridView ID="DgDeductionView" CssClass="table table-hover table-secondary" runat="server" BackColor="#CCCCCC"
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" OnSelectedIndexChanged="DgDeductionView_SelectedIndexChanged"
                                AutoGenerateColumns="False" Font-Size="10pt" OnSelectedIndexChanging="DgDeductionView_SelectedIndexChanging">
                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True"></asp:CommandField>

                                    <asp:TemplateField HeaderText="DEDUCTION DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldedcurrentdate" runat="server" Text='<%# Bind("CURRENTDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DIVISION">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldeddivision" runat="server" Text='<%# Bind("DIVISION") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENT ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldedclientid" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldedclientname" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL CANTEEN">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotD1" runat="server" Text='<%# Bind("TOTALD1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL ATM">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotD2" runat="server" Text='<%# Bind("TOTALD2") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL ADVANCE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotD3" runat="server" Text='<%# Bind("TOTALD3") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL SHOE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotD4" runat="server" Text='<%# Bind("TOTALD4") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL OTHER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotD5" runat="server" Text='<%# Bind("TOTALD5") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL ROOMRENT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotD6" runat="server" Text='<%# Bind("TOTALD6") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL INSURANCE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotD7" runat="server" Text='<%# Bind("TOTALD7") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL INSURANCE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotD8" runat="server" Text='<%# Bind("TOTALD8") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEDUCTION ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldeddeductionid" runat="server" Text='<%# Bind("DEDUCTIONID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TOTAL">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldedtotal" runat="server" Text='<%# Bind("TOTAL") %>'></asp:Label>
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
                  <%--  <div class="row">

                        <div id="" class=" col-lg-2 col-xl-2">
                            <asp:Label ID="lbltotalview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Total"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttotalview" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <h6 class="card-title">Summary</h6>

                        <div id="" class=" col-lg-2 col-xl-2">

                            <asp:Label ID="lbladvanceview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Advance"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtadvanceview" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblinsuranceview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Insurance"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtinsuranceview" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="" class=" col-lg-2 col-xl-2">
                            <asp:Label ID="lblcanteenview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Canteen"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtcanteenview" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblroomrentview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Room Rent"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtroomrentview" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="" class=" col-lg-2 col-xl-2">

                            <asp:Label ID="lblatmview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="ATM"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtatmview" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblothersview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Others"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtothersview" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="" class=" col-lg-2 col-xl-2">
                            <asp:Label ID="lblshoeview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Shoe"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtshoeview" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>--%>

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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgPayrollDeductions.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Payroll" PostBackUrl="~/PayrollForms/SubmenuPayroll.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

       <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
    <%---------------------------%>

         <%--------------GridView Enter Reload Stop--------------------%>


    <script type="text/javascript" src="js/36d/jquery-1.4.2.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("form").bind("keypress", function (e) {
                if (e.keyCode == 13) {
                    return false;
                }
            });
        });
    </script>

      <%----------------------------------%>


        <%--------------only Allow Number--------------------%>

        <script type='text/javascript'>
        function Number(src, event) {
            //Get key pressed
            var key = event.which || event.keyCode || event.charCode;
            //Ignore any backspaces or deletes that might affect the first three values
            if ((key == 49 || key == 50 || key == 51 || key == 52 || key == 53 || key == 54 || key == 55
                || key == 56 || key == 57 || key == 48 || key == 97 || key == 98 || key == 99 || key == 100 || key == 101
                || key == 102 || key == 103 || key == 104 || key == 105 || key == 96 || key == 9 || key == 8 || key == 190 || key == 110))
            {

            }
            else
            {
                event.preventDefault(); return false;
            }
        }
    </script>

      <%----------------------------------%>


    <%--/*---Message Validation----*/--%>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtdeductiondate.ClientID%>").value == "") {
                alert("Enter The Deduction Date");
                document.getElementById("<%=txtdeductiondate.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>

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

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });
        function bindDatePickers(sender, args) {
            $('#<%= txtdeductiondate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtfromdateview.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodateview.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        }
    </script>

    <%--/*-----------------------------------*/--%>
</asp:Content>

