<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgEmployeeInterviewSchedule.aspx.cs" Inherits="PgEmployeeInterviewSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-interviewdetails-tab" data-toggle="pill" href="#pills-interviewdetails" role="tab" aria-controls="pills-interviewdetails" Style="font-size: smaller" aria-selected="true">Interview Details</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-update-tab" data-toggle="pill" href="#pills-update" role="tab" aria-controls="pills-update" Style="font-size: smaller" aria-selected="false">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-interviewdetails" role="tabpanel" aria-labelledby="pills-interviewdetails-tab">

                    <div>
                        <h6 class="card-title">Interview Feedback</h6>
                    </div>

                    <div class="row col-lg-12 col-xl-12">

                        <div id="IF-Interview-Feedback" class=" col-lg-6 col-xl-6 ">

                            <asp:Label ID="lbldate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Date *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-7 col-xl-7">
                                    <asp:TextBox ID="txtdate" runat="server" CssClass="form-control form-control-sm txtnew" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblresumeid" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Resume ID *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-7 col-xl-7 ">
                                    <asp:DropDownList ID="ddlresumeid" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server"
                                        AutoPostBack="True" OnSelectedIndexChanged="ddlresumeid_SelectedIndexChanged"
                                        AppendDataBoundItems="True">
                                        <asp:ListItem>------- Select Resume ID ----</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lblname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Application Name *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-11 col-xl-11 ">
                                    <asp:TextBox ID="txtname" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="Application Name" OnTextChanged="txtname_TextChanged" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblmobilenumber" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Mobile Number *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-11 col-xl-11 ">
                                    <asp:TextBox ID="txtmobilenumber" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="+91" ReadOnly="True" TextMode="Number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==10) return false;"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblfathername" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Father Name *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-11 col-xl-11 ">
                                    <asp:TextBox ID="txtfathername" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="Father Name" ReadOnly="True" OnTextChanged="txtfathername_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="IF" class=" col-lg-6 col-xl-6 ">
                            <br />
                            <asp:Label ID="lblsendto" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Send To *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-11 col-xl-11">
                                    <asp:DropDownList ID="ddlsendto" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlsendto_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem>----- Sent To ------</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lbldivision" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Division *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-11 col-xl-11">
                                    <asp:TextBox ID="txtdivision" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="Division" OnTextChanged="txtdivision_TextChanged" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lbljobdesignation" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Job Designation *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-11 col-xl-11">
                                    <asp:DropDownList ID="ddljobdesignation" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AppendDataBoundItems="True">
                                        <asp:ListItem>------- Select Designation -----</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lblstatus" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Status *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-11 col-xl-11">
                                    <asp:DropDownList ID="ddlstatus" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" AppendDataBoundItems="True">
                                        <asp:ListItem>---- Select Status -----</asp:ListItem>
                                        <asp:ListItem>Selected</asp:ListItem>
                                        <asp:ListItem>Pending</asp:ListItem>
                                        <asp:ListItem>Reject</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lblfeedback" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Feedback"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-11 col-xl-11">
                                    <asp:TextBox ID="txtfeedback" CssClass="form-control form-control-sm txtnew text-uppercase" Height="70px" runat="server" placeholder="Feedback" TextMode="MultiLine" autocomplete="off" OnTextChanged="txtfeedback_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">

                        <div id="IF-Interview-Feedback-btn" class=" col-lg-12 col-xl-12 ">

                            <asp:Label ID="TypeID" runat="server" Text="Label" Visiable="false" Visible="False"></asp:Label>
                            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" Text="Save" Width="120" OnClick="btnsave_Click" OnClientClick=" return validate()" Style="font-size: smaller"/>

                            <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller"/>

                            <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/SubmenuDataMaster.aspx" Width="120" Style="font-size: smaller"/>

                        </div>
                    </div>
                </div>

                <%-------------------------------view--------------------------------%>

                <div class="tab-pane fade" id="pills-update" role="tabpanel" aria-labelledby="pills-update-tab">

                    <div>
                        <h6 class="card-title">Interview Feedback</h6>
                    </div>

                    <div class="row">

                        <div id="" class=" col-lg-3 col-xl-3">

                            <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />

                            <asp:Label ID="lblformdate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Form Date"></asp:Label>
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

                        <div id="" class=" col-lg-3 col-xl-3 ">
                            <asp:Label ID="lblupdateresumeid" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Resume ID *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:DropDownList ID="ddlupdateresumeid" CssClass="form-control form-control-sm txtnew" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div id="" class=" col-lg-2 col-xl-2 ">
                            <br />
                            <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary " Text="View" Width="120" OnClick="btnview_Click" Style="font-size: smaller"/>
                        </div>

                        <div id="" class=" col-lg-3 col-xl-3 ">
                            <br />
                            <asp:Button ID="btnviewall" runat="server" CssClass="btn btn-primary " Text="View ALL" Width="120" Style="font-size: smaller"/>
                        </div>
                    </div>

                    <div class="row">

                         <div id="tableview-endview" class=" col-lg-12 col-xl-12">
                            
                            <asp:GridView ID="DgInterview" runat="server" CssClass="table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                                OnSelectedIndexChanged="DgInterview_SelectedIndexChanged" 
                                AutoGenerateColumns="false" Font-Size="10pt">
                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" CausesValidation="False" />

                                    <asp:TemplateField HeaderText="DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblintdate" runat="server" Text='<%# Bind("DATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="INTERVIEW ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblintinterviewid" runat="server" Text='<%# Bind("INTERVIEWID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="APPLICATION NAME" HeaderStyle-Width="150px" ItemStyle-Width="150px" ItemStyle-CssClass="Wrap">
                                        <ItemTemplate>
                                            <asp:Label ID="lblintapplicationname" runat="server" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="MOBILE NUMBER">
                                        <ItemTemplate>
                                            <asp:Label ID="lblintmobileno1" runat="server" Text='<%# Bind("MOBILENO1") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="FATHERNAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblintfathername" runat="server" Text='<%# Bind("FATHERNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblintclientname" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DIVISION">
                                        <ItemTemplate>
                                            <asp:Label ID="lblintdivision" runat="server" Text='<%# Bind("DIVISION") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="JOB DESIGNATION">
                                        <ItemTemplate>
                                            <asp:Label ID="lblintdesignationname" runat="server" Text='<%# Bind("DESIGNATIONNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblintstatus" runat="server" Text='<%# Bind("STATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="FEEDBACK">
                                        <ItemTemplate>
                                            <asp:Label ID="lblintfeedback" runat="server" Text='<%# Bind("FEEDBACK") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="APPLICATION ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblintapplicationid" runat="server" Text='<%# Bind("APPLICATIONID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENT ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblintclientid" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DESIGNATION ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblintdesignationid" runat="server" Text='<%# Bind("DESIGNATIONID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                </Columns>

                                <FooterStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                                <RowStyle BackColor="#f5f5ef" />
                            </asp:GridView>
                        </div>
                    </div>
                    <br />
                    <br />

                    <div class="container-fluid">

                        <table class="table table-hover">
                            <thead>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td>
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgEmployeeInterviewSchedule.aspx" Width="120" Style="font-size: smaller"/>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/SubmenuDataMaster.aspx" Width="120" Style="font-size: smaller"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <%----------------------------------------------%>

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
                $('#pills-update-tab').tab('show');
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
            $('#<%= txtfromdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        }
    </script>

    <%--/*-----------------*/--%>

    <%--/*---------------------------------------------*/--%>
</asp:Content>

