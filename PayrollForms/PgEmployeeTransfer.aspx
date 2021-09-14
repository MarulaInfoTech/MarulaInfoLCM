<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgEmployeeTransfer.aspx.cs" Inherits="PgMasterEmployeeTransfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-companymaster-tab" data-toggle="pill" href="#pills-companymaster" role="tab" aria-controls="pills-companymaster" Style="font-size: smaller" aria-selected="true">Employee Transfer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" Style="font-size: smaller" aria-selected="false">Views</a>
                </li>

            </ul>

            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-companymaster" role="tabpanel" aria-labelledby="pills-companymaster-tab">

                    <div>
                        <h6 class="card-title">Employee Transfer</h6>
                    </div>

                    <div class="row col-lg-12 col-xl-12">

                        <div id="ET-EmployeeTransfer" class="col-lg-5 col-xl-5">

                            <asp:Label ID="lbldate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Date"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-5 col-xl-5">
                                    <asp:TextBox ID="txtdate" runat="server" CssClass="form-control form-control-sm txtnew" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblemployeecode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Employee Code"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtemployeecode" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" placeholder="Employee Code"
                                        OnTextChanged="txtemployeecode_TextChanged" AutoPostBack="True"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblemployeename" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Employee Name"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtemployeename" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" placeholder="Employee Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row">

                        <div id="ET-CurrentStatus" class=" col-lg-5 col-xl-5 ">

                            <div>
                                <h6 class="card-title">Current Status</h6>
                            </div>

                            <asp:Label ID="lblcsclientname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtcsclientname" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" placeholder="Clinet Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblcsdepartment" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Department"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtcsdepartment" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" placeholder="Department" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lbldesignation" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Designation"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtdesignation" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" placeholder="Designation" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblcsjobtype" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Job Type"></asp:Label>
                            <div class="form-group">
                                <div class="col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtcsjobtype" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" placeholder="Job Type" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div id="ET-UpdatedStatus" class=" col-lg-5 col-xl-5">

                            <div>
                                <h6 class="card-title">Updated Status</h6>
                            </div>

                            <asp:Label ID="lblusclientname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlusclientname" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlusclientname_SelectedIndexChanged">
                                        <asp:ListItem>------ Select Client -----</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lblusdepartment" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Department"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:DropDownList ID="ddlusdepartment" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AppendDataBoundItems="True">
                                        <asp:ListItem>-------- Select Department -----</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lbldesignationup" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Designation"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:DropDownList ID="ddldesignation" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                                        <asp:ListItem>------Select Designation -------</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lblusjobtype" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Job Type"></asp:Label>
                            <div class="form-group">
                                <div class="col-lg-12 col-xl-12 ">
                                    <asp:DropDownList ID="ddlusjobtype" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server">
                                        <asp:ListItem>----- Select Jobtype ------</asp:ListItem>
                                        <asp:ListItem>Permanent</asp:ListItem>
                                        <asp:ListItem>Part Time</asp:ListItem>
                                        <asp:ListItem>Temporary</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row">

                        <div id="RFT" class="col-lg-7 col-xl-7">

                            <asp:Label ID="lblreasonfortransfer" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Reason For Transfer"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-10 col-xl-10 ">
                                    <asp:TextBox ID="txtreasonfortransfer" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" TextMode="MultiLine" placeholder="Reason For Transfer" Height="75px"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="container">

                            <div id="ET-btn" class=" text-center col-lg-12 col-xl-12 ">

                                <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" OnClick="btnsave_Click" OnClientClick="return validate()" Style="font-size: smaller"/>

                                <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary  " Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller"/>

                                <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary  " Text="Close" PostBackUrl="~/PayrollForms/SubmenuDataMaster.aspx" Width="120" Style="font-size: smaller"/>

                                <asp:Label ID="EmpID" runat="server" Text="Label" Visible="false"></asp:Label>
                                <asp:Label ID="DptID" runat="server" Text="Label" Visible="false"></asp:Label>
                                <asp:Label ID="ClntID" runat="server" Text="Label" Visible="false"></asp:Label>
                                <asp:Label ID="DesgID" runat="server" Text="Label" Visible="false"></asp:Label>
                                <asp:Label ID="TypeID" runat="server" Text="Label" Visible="false"></asp:Label>

                            </div>
                        </div>
                    </div>

                </div>

                <%-------------------------------view--------------------------------%>

                <div class="tab-pane fade" id="pills-view" role="tabpanel">

                    <div class="row">
                        <div id="view" class=" col-lg-2 col-xl-2">

                            <asp:Label ID="lblcontractfrom" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Contract From"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtcfdate" runat="server" CssClass="form-control form-control-sm txtnew" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblto" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="To"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttodate" runat="server" CssClass="form-control form-control-sm txtnew" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div id="vdsd" class=" col-lg-4 col-xl-4 ">

                            <asp:Label ID="lblclientnameview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtcompanynameview" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" placeholder="Client Name"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="120" OnClick="btnview_Click" Style="font-size: smaller"/>

                            <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />

                        </div>
                    </div>

                    <br />
                    <div class="row">

                        <div id="tableview-endview" class=" col-lg-12 col-xl-12 ">

                            <asp:GridView ID="DgTransfer" runat="server" CssClass="table table-hover table-secondary" HeaderStyle-BackColor="#a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Font-Size="10pt"
                                OnSelectedIndexChanged="DgTransfer_SelectedIndexChanged" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" />

                                    <asp:TemplateField HeaderText="EMPTRANSFERID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblemptransid" runat="server" Text='<%# Bind("EMPTRANSFERID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblempdate" runat="server" Text='<%# Bind("DATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EMPLOYEE ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletemployeeid" runat="server" Text='<%# Bind("EMPLOYEEID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EMPLOYEE CODE">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletemployeecode" runat="server" Text='<%# Bind("EMPLOYEECODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="170px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EMPLOYEE NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletapplicationname" runat="server" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CURRENT CLIENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletcurrentclientname" runat="server" Text='<%# Bind("CURRENTCLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CURRENT DEPARTMENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletcurrentdepartmentname" runat="server" Text='<%# Bind("CURRENTDEPARTMENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CURRENT DESIGNATION NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletcurrentdesignationname" runat="server" Text='<%# Bind("CURRENTDESIGNATIONNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CURRENT JOBTYPE">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletcurrentjobtype" runat="server" Text='<%# Bind("CURRENTJOBTYPE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CHANGE CLIENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletchangeclientname" runat="server" Text='<%# Bind("CHANGECLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CHANGE DESIGNATION NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletchangedesignationname" runat="server" Text='<%# Bind("CHANGEDESIGNATIONNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CURRENT DEPARTMENT ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletcurrentdepartmentid" runat="server" Text='<%# Bind("CURRENTDEPARTMENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CURRENT CLIENT ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletcurrentclientid" runat="server" Text='<%# Bind("CURRENTCLIENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CHANGE CLIENT ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletchangeclientid" runat="server" Text='<%# Bind("CHANGECLIENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CHANGE DEPARTMENT ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletchangedepartmentid" runat="server" Text='<%# Bind("CHANGEDEPARTMENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CURRENT DESIGNATION ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletcurrentdesignationid" runat="server" Text='<%# Bind("CURRENTDESIGNATIONID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CHANGE DESIGNATION ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletchangedesignationid" runat="server" Text='<%# Bind("CHANGEDESIGNATIONID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CHANGE DEPARTMENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletchangedepartmentname" runat="server" Text='<%# Bind("CHANGEDEPARTMENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CHANGE JOBTYPE">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletchangejobtype" runat="server" Text='<%# Bind("CHANGEJOBTYPE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="REASON">
                                        <ItemTemplate>
                                            <asp:Label ID="lbletreason" runat="server" Text='<%# Bind("REASON") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgEmployeeReleavingForm.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/SubmenuDataMaster.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                    </div>

                </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
    <%---------------------------%>

    <%--/*---Message Validation----*/--%>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtdate.ClientID%>").value == "") {
                alert("Enter The Date");
                document.getElementById("<%=txtdate.ClientID%>").focus();
                return false;
            }

            return true;
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

    <%--/*---Date Picker----*/--%>

    <script>

        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtcfdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        }

    </script>

    <%--/*-----------------------------------------*/--%>
</asp:Content>

