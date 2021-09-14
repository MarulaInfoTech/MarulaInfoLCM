<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" 
    CodeFile="PgPayrollAllowances.aspx.cs" Inherits="PayrollForms_PgEntriesAllowances" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--<asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">--%>

       <%-- <ContentTemplate>--%>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-clientdetail-tab" data-toggle="pill" href="#pills-clientdetail" role="tab" aria-controls="pills-clientdetail" Style="font-size: smaller" aria-selected="true">Allowances</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" aria-controls="pills-view" Style="font-size: smaller" aria-selected="false">Views</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-clientdetail" role="tabpanel" aria-labelledby="pills-clientdetail-tab">

                    <div>
                        <h4 class="card-title">Allowances</h4>
                    </div>

                    <div class="row col-lg-12 col-xl-12">

                        <div id="EA-Allowances" class=" col-lg-2 col-xl-2">
                            <asp:Label ID="lblallowancedate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Allowance Date"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtallowancedate" runat="server" CssClass="form-control form-control-sm txtnew" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class=" col-lg-3 col-xl-3">
                            <asp:Label ID="lblcompanyname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Company Name *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlCliant" CssClass="form-control form-control-sm txtnew text-uppercase" 
                                        runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlCliant_SelectedIndexChanged">
                                        <asp:ListItem>------Select Company------</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lbldivisionname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Division Name *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtdivisionname" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" OnTextChanged="txtdivisionname_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div id="EA-Allowancesdrop" class=" col-lg-3 col-xl-3">
                            <asp:Label ID="lbldepartment" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Department"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddldepartment" CssClass="form-control form-control-sm txtnew text-uppercase" 
                                        runat="server" AppendDataBoundItems="True">
                                        <asp:ListItem>-Select Department-</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lblempcode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Employee Code"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtempcode" CssClass="form-control form-control-sm txtnew text-uppercase" placeholder="Employee Code" autocomplete="off" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="" class=" col-lg-2 col-xl-2">
                            <asp:Label ID="lbldescription" runat="server" CssClass="label-conrol col-sm-12 lblnew"
                                 Text="Description" Visible="false"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <%--<asp:DropDownList ID="ddldescription" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="ddldescription_SelectedIndexChanged">
                                        <asp:ListItem>---Select Description---</asp:ListItem>
                                    </asp:DropDownList>--%>
                                    <asp:Button ID="btnCalc" runat="server" CssClass="btn btn-primary" Text="Calculation" 
                                        OnClick="btnacalculation_Click" Style="font-size: smaller" Visible="false" /> 
                                </div>
                            </div>

                            
                            <asp:Button ID="btnGet" runat="server" CssClass="btn btn-primary" Text="Get Employee" 
                                Width="120" OnClick="btnGet_Click" Style="font-size: smaller" />
                        </div>

                        <div id="" class="col-lg-2 col-xl-2">
                           <br />                               
                                     <asp:Button ID="btnadd" runat="server" CssClass="btn btn-primary" Text="Description" Width="150" 
                                PostBackUrl="~/PayrollForms/PgPayrollAllowanceDescription.aspx" Style="font-size: smaller" />                           
                        </div>

                    </div>
                    <div class="row">

                        <div id="tableview-frontview" class="col-lg-12 col-xl-12">

                            <asp:GridView ID="DgAllowances" runat="server" AutoGenerateColumns="False"
                                BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black"
                                CssClass="table table-hover table-secondary" HeaderStyle-BackColor="#a6a6a6" HorizontalAlign="Center" Font-Size="10pt" ShowFooter="True">
                                <Columns>
                                    <asp:TemplateField HeaderText="Employee ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpID" runat="server" Text='<%# Bind("EMPLOYEEID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Emloyee Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpNo" runat="server" Text='<%# Bind("EMPLOYEECODE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Employee Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpName" runat="server" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Department ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDpt" runat="server" Text='<%# Bind("DEPARTMENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="A1">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtA1" runat="server" Text='<%# Bind("A1") %>' onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0"  autocomplete="off" ></asp:TextBox>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFootA1" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="A2">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtA2" runat="server" Text='<%# Bind("A2") %>' onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0"  autocomplete="off" ></asp:TextBox>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFootA2" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="A3">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtA3" runat="server" Text='<%# Bind("A3") %>' onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0"  autocomplete="off" ></asp:TextBox>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFootA3" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="A4">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtA4" runat="server" Text='<%# Bind("A4") %>' onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0"  autocomplete="off" ></asp:TextBox>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFootA4" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                      <asp:TemplateField HeaderText="A5">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtA5" runat="server" Text='<%# Bind("A5") %>' onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0"  autocomplete="off" ></asp:TextBox>
                                        </ItemTemplate>
                                          <FooterTemplate>
                                            <asp:TextBox ID="txtFootA5" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                      <asp:TemplateField HeaderText="A6">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtA6" runat="server" Text='<%# Bind("A6") %>' onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0"  autocomplete="off" ></asp:TextBox>
                                        </ItemTemplate>
                                          <FooterTemplate>
                                            <asp:TextBox ID="txtFootA6" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                      <asp:TemplateField HeaderText="A7">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtA7" runat="server" Text='<%# Bind("A7") %>' onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0"  autocomplete="off" ></asp:TextBox>
                                        </ItemTemplate>
                                          <FooterTemplate>
                                            <asp:TextBox ID="txtFootA7" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                      <asp:TemplateField HeaderText="A8">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtA8" runat="server" Text='<%# Bind("A8") %>' onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0"  autocomplete="off" ></asp:TextBox>
                                        </ItemTemplate>
                                          <FooterTemplate>
                                            <asp:TextBox ID="txtFootA8" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="A9">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtA9" runat="server" Text='<%# Bind("A9") %>' onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0"  autocomplete="off" ></asp:TextBox>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFootA9" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Total">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtTotal" runat="server" Text='0' onkeydown='Number(this.value,event);' 
                                                CssClass="form-control form-control-sm txtnew" placeholder="0"  autocomplete="off" ></asp:TextBox>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtTotal" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" 
                                                ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                               <%--     <asp:TemplateField HeaderText="Allowances Description" Visible="false">
                                        <ItemTemplate>   
                                            <asp:DropDownList ID="ddldescription" CssClass="form-control form-control-sm txtnew" runat="server" with="130" AppendDataBoundItems="True">
                                                <asp:ListItem>---Select Description---</asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>


                                   <%-- <asp:TemplateField HeaderText="Employee ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDesID" runat="server" Text='<%# Bind("DESCRIPTION") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>

                                </Columns>
                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <RowStyle BackColor="#f5f5ef" />
                            </asp:GridView>
                        </div>
                    </div>
                    <br />
                    <div class="row col-lg-12 col-xl-12">
                        
                            Total Amount
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txttotalamountallowance" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Total Amount"></asp:TextBox>
                                    </div>
                                </div>
                            <asp:Button ID="btnacalculation" runat="server" CssClass="btn btn-primary" Text="Calculation" OnClick="btnacalculation_Click" Style="font-size: smaller" />                       
                    </div>

                    <br />

                    <div class="row">

                        <div id="btn-Allowances" class=" col-lg-12 col-xl-12 ">

                            <%--<asp:Label ID="MessageBox2" class="alert alert-secondary" role="alert" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>--%>

                            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" OnClick="btnsave_Click" OnClientClick="return validate()" Style="font-size: smaller" />

                            <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary " Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller" />

                            <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary " Text="Close" PostBackUrl="~/PayrollForms/SubmenuPayroll.aspx" Width="120" Style="font-size: smaller" />

                        </div>
                    </div>
                </div>

                <%-------------------------------view--------------------------------%>

                <div class="tab-pane fade" id="pills-view" role="tabpanel" aria-labelledby="pills-view-tab">

                    <div class="row" id=" Daily-Header-Style">

                        <div id="Allowances" class=" col-lg-2 col-xl-2">

                            <asp:Label ID="lblfromdateview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="From Date"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtfromdateview" runat="server" CssClass="form-control form-control-sm txtnew"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lbltodateview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="To Date"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttodateview" runat="server" CssClass="form-control form-control-sm txtnew"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class=" col-lg-4 col-xl-4">

                            <asp:Label ID="lblcompanyname1" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Company Name"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlcompanynameview" CssClass="form-control form-control-sm txtnew" runat="server"></asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lbldivisionnamee" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Division Name"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtdivisionnameview" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Division Name"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div id="btn-monthlyAttendanceEntry2" class=" col-lg-2 col-xl-2">
                            <br />

                            <asp:Button ID="btnImportview" runat="server" CssClass="btn btn-primary " Text="View" Width="130" OnClick="btnImportview_Click" />

                            <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />

                        </div>

                    </div>

                    <div class="row">

                        <div id="tableview-endview" class="col-lg-12 col-xl-12">

                            <asp:GridView ID="DgAlowancesDetail" runat="server" OnSelectedIndexChanged="DgAlowancesDetail_SelectedIndexChanged" 
                                CssClass="table table-hover table-secondary" HeaderStyle-BackColor="#a6a6a6" BackColor="#CCCCCC" BorderColor="#999999" 
                                BorderStyle="Solid" BorderWidth="3px" AutoGenerateColumns="False" Font-Size="10pt">
                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True"></asp:CommandField>

                                    <asp:TemplateField HeaderText="ALLOWANCES DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblalwcurrentdate" runat="server"  Text='<%# Bind("CURRENTDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENT ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblalwclientid" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DIVISION">
                                        <ItemTemplate>
                                            <asp:Label ID="lblalwdivision" runat="server" Text='<%# Bind("DIVISION") %>'></asp:Label>
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgPayrollAllowances.aspx" Width="120" Style="font-size: smaller" />
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

<%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
    <%-------------------------------------------%>

    <%--/*---Message Validation----*/--%>

    <%--    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtallowancedate.ClientID%>").value == "") {
                alert("Enter The Client Name");
                document.getElementById("<%=txtallowancedate.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>--%>
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
            $('#<%= txtallowancedate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtfromdateview.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodateview.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodateview.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodateview.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        }
    </script>


    <%--/*--------------------------------*/--%>
</asp:Content>

