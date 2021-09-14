<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgCashRegisterPaymentEntry.aspx.cs" Inherits="PayrollForms_PaymentEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-companymaster-tab" data-toggle="pill" href="#pills-companymaster" role="tab" aria-controls="pills-companymaster" style="font-size: smaller" aria-selected="true">Payment Entry</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" style="font-size: smaller" aria-selected="true" aria-controls="pills-view">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">

                <div class="tab-pane fade active show" id="pills-companymaster" role="tabpanel" aria-labelledby="pills-companymaster-tab">

                    <h6>Payment Entry</h6>

                    <div class="row">
                        <div id="paymentEntry" class="col-lg-4 col-xl-4">
                            <div class="form-group">
                                <asp:Label ID="lblinvoiceno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Invoice.No"></asp:Label>
                                <div class="col-lg-6 col-xl-6">
                                    <asp:TextBox ID="txtinvoiceno" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Invoice.No" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblinvoicedate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Invoice Date"></asp:Label>
                                <div class="col-lg-6 col-xl-6">
                                    <asp:TextBox ID="txtinvoicedate" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Invoice Date" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblclientname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtclientname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Client Name" AutoComplete="off" OnTextChanged="txtclientname_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbldivisionname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Division Name"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtdivisioname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Division Name" AutoComplete="off" OnTextChanged="txtdivisioname_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblgrandtotal" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Grand Total"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtgrandtotal" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblservicetax" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Service Tax"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtservicetax" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblnetamount" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Net Amount"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtnetamount" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbltds" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="TDS 2%"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttds" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblinsurance" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Insurance"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtinsurancce" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblcanteen" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Canteen"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtcanteen" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="payment entry2" class="col-lg-4 col-xl-4">
                            <br/>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <asp:Label ID="lblbillrecover" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Bill to Recover"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtbillcover" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblpaid" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Paid"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtpaid" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblbalance" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Balance"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtbalance" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblstatus" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Status"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtstatus" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off" OnTextChanged="txtstatus_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                          
                            <div class="form-group">
                                <asp:CheckBox ID="chkcheque" Text="..Click Here To Enter The Cheque.No"  runat="server" AutoPostBack="True" OnCheckedChanged="chkcheque_CheckedChanged" Font-Size="10pt" />
                           
                                <asp:Panel ID="pnlcheque" runat="server" Visible="false">
                                    <asp:Label ID="lblcheque" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Cheque.No" AutoComplete="off"></asp:Label>
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtcheque" CssClass="form-control form-control-sm txtnew" runat="server"></asp:TextBox>
                                        <asp:Label ID="lblamount" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Amount"></asp:Label>
                                        <asp:TextBox ID="txtamount" CssClass="form-control form-control-sm txtnew" runat="server"></asp:TextBox>
                                    </div>
                                </asp:Panel>
                                <br />
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblchequedate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="ChequeDate"></asp:Label>
                                <div class="col-lg-6 col-xl-6">
                                    <asp:TextBox ID="txtchequedate" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblclearedondate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Cleared On Date"></asp:Label>
                                <div class="col-lg-6 col-xl-6">
                                    <asp:TextBox ID="txtclearedondate" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <asp:Label ID="MessageBox" class="alert alert-secondary" role="alert" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>

                            <div id="CM-btn" class=" col-lg-12 col-xl-12">

                                <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>
                                <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" OnClick="btnsave_Click1" OnClientClick="return validate()" Style="font-size: smaller" />

                                <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller" />

                                <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" Text="Close" Width="120" PostBackUrl="~/PayrollForms/SubmenuCashRegister.aspx" Style="font-size: smaller" />

                            </div>
                        </div>

                    </div>

                </div>
                <%-------------------------------view--------------------------------%>

                <div class="tab-pane fade" id="pills-view" role="tabpanel">

                    <div class="row" id=" Daily-Header-Style">

                        <div id="Paymentview" class=" col-lg-2 col-xl-2">

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

                            <asp:Label ID="lblclientnameview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlclientnameview" CssClass="form-control form-control-sm txtnew" runat="server"></asp:DropDownList>
                                </div>
                            </div>

                        </div>

                        <div id="btn-monthlyAttendanceEntry2" class=" col-lg-2 col-xl-2">
                            <br />

                            <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary " Text="View" Width="130" OnClick="btnview_Click" Style="font-size: smaller"/>

                            <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />

                        </div>

                    </div>
                           <br />

                    <div class="row">
                        <br />
                        <div id="tableview-endview" class=" col-lg-12 col-xl-12">

                            <asp:GridView ID="Dgpaymententryview" runat="server" OnSelectedIndexChanged="Dgpaymententryview_SelectedIndexChanged" CssClass="table table-hover table-secondary" HeaderStyle-BackColor="#a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" AutoGenerateColumns="false" Font-Size="10pt">
                                <Columns>

                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" />

                                    <asp:TemplateField HeaderText="PAYMENT ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPaymentID" runat="server" Text='<%# Bind("PAYMENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="INVOICE NO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInvoiceNo" runat="server" Text='<%# Bind("INVOICENO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="175px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="INVOICE DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInvoiceDate" runat="server" Text='<%# Bind("INVOICEDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="175px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblClientName" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DIVISION">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDivision" runat="server" Text='<%# Bind("DIVISION") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="GRAND TOTAL">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGrandTotal" runat="server" Text='<%# Bind("GRANDTOTAL") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="175px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SERVICE TAX">
                                        <ItemTemplate>
                                            <asp:Label ID="lblServiceTax" runat="server" Text='<%# Bind("SERVICETAX") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="175px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="NET AMOUNT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNetAmount" runat="server" Text='<%# Bind("NETAMOUNT") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="175px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TDS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTDS" runat="server" Text='<%# Bind("TDS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="175px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="INSURANCE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInsurance" runat="server" Text='<%# Bind("INSURANCE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="175px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CANTEEN">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCanteen" runat="server" Text='<%# Bind("CANTEEN") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="175px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="BILL RECOVER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBillRecover" runat="server" Text='<%# Bind("BILLRECOVER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="175px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PAID">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPaid" runat="server" Text='<%# Bind("PAID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="175px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="BALANCE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBalance" runat="server" Text='<%# Bind("BALANCE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="175px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("STATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="175px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CHEQUENO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblChequeNo" runat="server" Text='<%# Bind("CHEQUENO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="175px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="AMOUNT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("AMOUNT") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="175px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CHEQUEDATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblChequeDate" runat="server" Text='<%# Bind("CHEQUEDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="175px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLEAR DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblClearDate" runat="server" Text='<%# Bind("CLEARDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="175px"></ControlStyle>
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgCashRegisterPaymentEntry.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/SubmenuCashRegister.aspx" Width="120" Style="font-size: smaller" />
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
        function validate()
        {
            if (document.getElementById("<%=txtinvoiceno.ClientID%>").value == "") {
              alert("Enter The Invoice.No");
              document.getElementById("<%=txtinvoiceno.ClientID%>").focus();
              return false;
          }

             return true;
      }
    </script>



<%--/*------------------------------------*/--%>


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
            $('#<%= txtinvoicedate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtchequedate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtclearedondate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtfromdateview.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodateview.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });            
        }
    </script>
    <%--/*-----------------*/--%>


    <%--/*---Message Hide Code----*/--%>

    <script type="text/javascript">
        window.onload = function () {

            var seconds = 2;
            setTimeout(function (sender, args) {
                document.getElementById("<%=MessageBox.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>


</asp:Content>

