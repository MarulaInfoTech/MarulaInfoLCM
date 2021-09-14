<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgEmployeeReleavingForm.aspx.cs" Inherits="PgEmployeeReleavingForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

     <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-companymaster-tab" data-toggle="pill" href="#pills-companymaster" role="tab" aria-controls="pills-companymaster" style="font-size: smaller" aria-selected="true">Employee Releaveing</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" style="font-size: smaller" aria-selected="false">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-companymaster" role="tabpanel" aria-labelledby="pills-companymaster-tab">
                    <div>
                        <h6 class="card-title">Employee Releaving Form</h6>
                    </div>
                    <br />
                    <div class="row col-lg-12 col-xl-12">

                        <div id="Emodn" class="col-lg-5 col-xl-5">

                            <asp:Label ID="lblentrydate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Entry Date"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtentrydate" runat="server" CssClass="form-control form-control-sm txtnew" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblemployeecode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Employee Code"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtemployeecode" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server"
                                        placeholder="Employee Code" AutoPostBack="True" OnTextChanged="txtemployeecode_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblemployeename" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Employee Name"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtemployeename" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" placeholder="Employee Name" OnTextChanged="txtemployeename_TextChanged" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lbldateofjoining" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Date Of Join"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtdateofjoining" CssClass="form-control form-control-sm txtnew" autocomplete="off" runat="server" placeholder="Date Of Join" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div id="" class=" col-lg-5 col-xl-5 ">

                            <asp:Label ID="lblclientname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtclientname" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" placeholder="Client Name" OnTextChanged="txtclientname_TextChanged" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lbldepartment" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Department"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtdepartment" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" placeholder="Department" OnTextChanged="txtdepartment_TextChanged" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblreleavingdate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Releaving Date"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtreleavingdate" runat="server" CssClass="form-control form-control-sm txtnew" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblreleavingreasonel" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Releaving Reason"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtreleavingreason" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" Height="75px" TextMode="MultiLine" placeholder="Releaving Reason" OnTextChanged="txtreleavingreason_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:Label ID="lblrelemployeeid" runat="server" Text="" Visible="False">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">

                        <div id="ET-btn" class=" col-lg-12 col-xl-12 ">

                            <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>

                            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" OnClick="btnsave_Click" OnClientClick="return validate()" style="font-size: smaller"/>

                            <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary  " Text="New" Width="120" OnClick="btnnew_Click" style="font-size: smaller"/>

                            <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary  " Text="Close" PostBackUrl="~/PayrollForms/SubmenuDataMaster.aspx" Width="120" style="font-size: smaller"/>

                        </div>
                    </div>

                </div>

                <%-------------------------------view--------------------------------%>

                <div class="tab-pane fade" id="pills-view" role="tabpanel">

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
                            <asp:Label ID="lblclientnameview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtcompanynameview" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" placeholder="Client Name"></asp:TextBox>
                                </div>
                            </div>
                            <br />

                            <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="120" OnClick="btnview_Click" style="font-size: smaller"/>

                            <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div id="tableview-endview" class=" col-lg-12 col-xl-12 ">

                            <asp:GridView ID="DgEmployeeReleave" runat="server" CssClass="table table-hover table-secondary" HeaderStyle-BackColor="#a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" OnSelectedIndexChanged="DgEmployeeReleave_SelectedIndexChanged" AutoGenerateColumns="False" Font-Size="10pt">
                                <Columns>
                                    <asp:CommandField HeaderText="Select" ShowHeader="True" ShowSelectButton="True" />

                                    <asp:TemplateField HeaderText="EMPRELEAV ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblerfempreleavid" runat="server" Text='<%# Bind("EMPRELEAVID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ENTRY DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblerfentrydate" runat="server" Text='<%# Bind("ENTDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EMPLOYEE CODE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblerfemployeecode" runat="server" Text='<%# Bind("EMPLOYEECODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="180px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EMPLOYEE NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblerfapplicationname" runat="server" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DATE OF JOIN">
                                        <ItemTemplate>
                                            <asp:Label ID="lblerfdateofjoin" runat="server" Text='<%# Bind("DATEOFJOIN") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblerfclientname" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="270px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEPARTMENT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblerfdepartmentname" runat="server" Text='<%# Bind("DEPARTMENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="270px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="RELEAVING DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblerfreleavingdate" runat="server" Text='<%# Bind("RELEAVINGDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="RELEAVING REASON">
                                        <ItemTemplate>
                                            <asp:Label ID="lblerfreson" runat="server" Text='<%# Bind("REASON") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="270px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EMPLOYEE ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblerfemployeeid" runat="server" Text='<%# Bind("EMPLOYEEID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="APPLICATION ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblerfapplicationid" runat="server" Text='<%# Bind("APPLICATIONID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENT ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblerfclientid" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEPARTMENT ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblerfdepartmentid" runat="server" Text='<%# Bind("DEPARTMENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgEmployeeReleavingForm.aspx" Width="120" style="font-size: smaller"/>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/SubmenuDataMaster.aspx" Width="120" style="font-size: smaller"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <%----------------------------------------%>

    <%--/*---Message Validation----*/--%>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtemployeecode.ClientID%>").value == "") {
                alert("Enter The EmployeeCode");
                document.getElementById("<%=txtemployeecode.ClientID%>").focus();
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
            $('#<%= txtentrydate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtreleavingdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtfromdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        }

    </script>

    <%--/*-----------------*/--%>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=txtemployeecode.ClientID%>').prop('maxlength', 10);

        });
    </script>

  <%--/*---------------------------------------------*/--%>
</asp:Content>

