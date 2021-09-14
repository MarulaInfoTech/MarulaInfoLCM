<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgPettyCashAdvanceRequest.aspx.cs" Inherits="PayrollForms_AdvanceRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-companymaster-tab" data-toggle="pill" href="#pills-companymaster" role="tab" aria-controls="pills-companymaster" style="font-size: smaller" aria-selected="true">Advance Request</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" style="font-size: smaller" aria-selected="true" aria-controls="pills-view">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">

                <div class="tab-pane fade active show" id="pills-companymaster" role="tabpanel" aria-labelledby="pills-companymaster-tab">

                    <div>
                        <h6 class="card-title">Advance Request</h6>
                    </div>

                    <div class="row col-lg-12 col-xl-12">

                        <div id="advancerequest1" class=" col-lg-6 col-xl-6">
                            <div class="form-group">
                                <asp:Label ID="lblrequestdate" runat="server" CssClass="label-control col-sm-4 lblnew" Text="Request Date"></asp:Label>
                                <div class="col-lg-4 col-xl-4">
                                    <asp:TextBox ID="txtrequestdate" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblclientname" runat="server" CssClass="label-control col-sm-9 lblnew" Text="Client Name"></asp:Label>
                                <div class="col-lg-10 col-xl-10">
                                    <asp:DropDownList ID="ddlclientname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" OnSelectedIndexChanged="ddlclientname_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                                        <asp:ListItem>----Client Name----</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblempname1" runat="server" CssClass="label-control col-sm-9 lblnew" Text="Employee Name"></asp:Label>
                                <div class="col-lg-10 col-xl-10">
                                    <asp:DropDownList ID="ddlempname1" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlempname1_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem>----Employee Name----</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                           
                            <div class="form-group">
                                <asp:Label ID="lbldepartment" runat="server" CssClass="label-control col-sm-9 lblnew" Text="Department"></asp:Label>
                                <div class="col-lg-10 col-xl-10">
                                    <asp:TextBox ID="txtdepartment" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtdepartment_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblremarks" runat="server" CssClass="label-control col-sm-9 lblnew" Text="Remarks If Any"></asp:Label>
                                <div class="col-lg-10 col-xl-10">
                                    <asp:TextBox ID="txtremarks" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" Height="80px" OnTextChanged="txtremarks_TextChanged" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="advancerequest2" class="col-lg-6 col-xl-6">
                            <br /><br /><br />
                            <div class="form-group">
                                <asp:Label ID="lbladvancerequestcode" runat="server" CssClass="label-control col-sm-9 lblnew" Text=" Advance Request Code"></asp:Label>
                                <div class="col-lg-10 col-xl-10">
                                    <asp:TextBox ID="txtadvancerequestcode" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblempcode" runat="server" CssClass="label-control col-sm-9 lblnew" Text="Employee Code"></asp:Label>
                                <div class="col-lg-10 col-xl-10">
                                    <asp:TextBox ID="txtempcode" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtempcode_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <%--<div class="form-group">
                                <asp:Label ID="lbldivisionname" runat="server" CssClass="label-control col-sm-9 lblnew" Text="Division Name"></asp:Label>
                                <div class="col-lg-10 col-xl-10">
                                    <asp:TextBox ID="txtdivisionname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>--%>


                            <div class="form-group">
                                <asp:Label ID="lblamount" runat="server" CssClass="label-control col-sm-9 lblnew" Text="Amount"></asp:Label>
                                <div class="col-lg-10 col-xl-10">
                                    <asp:TextBox ID="txtamount" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Rs." AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblstatus1" runat="server" CssClass="label-control col-sm-9 lblnew" Text="Status"></asp:Label>
                                <div class="col-lg-6 col-xl-6">
                                    <asp:DropDownList ID="ddlstatus1" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server">
                                        <asp:ListItem>----Select Status----</asp:ListItem>
                                        <asp:ListItem>Request</asp:ListItem>
                                        <asp:ListItem>Canceled</asp:ListItem>
                                        <asp:ListItem>Approved</asp:ListItem>
                                        <asp:ListItem>Paid</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <br />
                            <div class="form-group">
           
                                <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>

                                <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" Text="Save" Width="120" style="font-size: smaller" OnClick="btnsave_Click" OnClientClick="return validate()" />

                                <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" style="font-size: smaller" OnClick="btnnew_Click" />

                                <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" ValidationGroup="txtrequestdate" Text="Close" Width="120" style="font-size: smaller" PostBackUrl="~/PayrollForms/SubmenuPettyCash.aspx"/>

                            </div>
                        </div>
                    </div>

                </div>

                <%-------------------------------------View------------------------------%>

                <div class="tab-pane fade" id="pills-view" role="tabpanel">

                    <div class="row">

                        <div id="" class="col-lg-2 col-xl-2">

                            <div class="form-group">
                                <asp:Label ID="lblfromdate" runat="server" CssClass="label-control col-sm-12 lblnew" Text="From Date"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtfromdate" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbltodate" runat="server" CssClass="label-control col-sm-9 lblnew" Text="To Date"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttodate" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox><br />
                                </div>
                            </div>

                        </div>
                        <div id="advancerequest3" class="col-lg-4 col-xl-4">

                            <div class="form-group">
                                <asp:Label ID="lblempname2" CssClass="label-control col-sm-12 lblnew" runat="server" Text="Employee Name"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtempname2" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off" OnTextChanged="txtempname2_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblstatus" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Status"></asp:Label>
                                <div class="col-lg-10 col-xl-10">
                                    <asp:DropDownList ID="ddlstatus" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off">
                                        <asp:ListItem>----Select Status----</asp:ListItem>
                                        <asp:ListItem>Request</asp:ListItem>
                                        <asp:ListItem>Canceled</asp:ListItem>
                                        <asp:ListItem>Approved</asp:ListItem>
                                        <asp:ListItem>Paid</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div id="advancerequest4" class="col-lg-2 col-xl-2">
                            <br />
                            <asp:Button ID="btnview" CssClass="btn btn-primary form-control-sm" runat="server" Text="View" Width="120px" OnClick="btnview_Click" style="font-size: smaller"/><br />
                            <br />                         
                             <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server"/>
                        </div>
                    </div>

                    <div class="row">                     
                        <div id="tableview-endview" class=" col-lg-12 col-xl-12">

                            <asp:GridView ID="Dgadvancerequestview" runat="server" CssClass="table table-hover table-secondary" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" HeaderStyle-BackColor="#a6a6a6" BackColor="White" CellPadding="3" Font-Size="10pt" CellSpacing="1" AutoGenerateColumns="False" OnSelectedIndexChanged="Dgadvancerequestview_SelectedIndexChanged">
                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" />

                                    <asp:TemplateField HeaderText="ADVANCE ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAdvanceID" runat="server" Text='<%# Bind("ADVANCEID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" runat="server" Text='<%# Bind("DATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENTNAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblClientName" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EMPLOYEE CODE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmployeeCode" runat="server" Text='<%# Bind("EMPLOYEECODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="APPLICATIO NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblApllicationName" runat="server" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEPARTMENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDepartmentName" runat="server" Text='<%# Bind("DEPARTMENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ADVANCE CODE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAdvanceCode" runat="server" Text='<%# Bind("ADVANCECODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="AMOUNT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("AMOUNT") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("STATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="REMARK">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("REMARK") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EMPLOYEE ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="EmployeeId" runat="server" Text='<%# Bind("EMPLOYEEID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENT ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblClientId" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" Width="120" PostBackUrl="~/PayrollForms/PgPettyCashAdvanceRequest.aspx" style="font-size: smaller"/>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/SubmenuPettyCash.aspx" Width="120" style="font-size: smaller"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

<%--/*----------------------------------------------*/--%>

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
            $('#<%= txtfromdate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtrequestdate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
        }
    </script>


    <%--/*-----------------*/--%>



    <%--/*---Message Validation----*/--%>

    <script type="text/javascript">
        function validate()
        {
            if (document.getElementById("<%=txtrequestdate.ClientID%>").value == "") {
              alert("Enter The Request Date");
              document.getElementById("<%=txtrequestdate.ClientID%>").focus();
              return false;
          }

             return true;
      }
    </script>



</asp:Content>

