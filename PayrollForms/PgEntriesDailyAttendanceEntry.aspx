<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgEntriesDailyAttendanceEntry.aspx.cs" Inherits="PayrollForms_PgEntriesDailyAttendanceEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>
            <div>
                <h6 class="card-title">Daily Attendance Entry</h6>
            </div>
            <br />
            <div class="row">

                <div id="DAE-Daily Attendance Entry" class=" col-lg-3 col-xl-3">

                    <asp:Label ID="lblattendancedate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Attendance Date"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:TextBox ID="txtattendancedate" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class=" col-lg-4 col-xl-4">

                    <asp:Label ID="lblclientname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:DropDownList ID="ddlclientname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" OnSelectedIndexChanged="ddlclientname_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                                <asp:ListItem>---Select Client Name---</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class=" col-lg-4 col-xl-4">

                    <asp:Label ID="lbldivisionname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Division Name"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:TextBox ID="txtDivi" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Division Name" OnTextChanged="txtDivi_TextChanged" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>

                    <asp:Button ID="btngetemployees" runat="server" CssClass="btn btn-primary " Text="Get Eemployees" Width="140" OnClick="btngetemployees_Click" style="font-size: smaller"/>
                    <br />
                    <asp:Label ID="MessageBox" class="alert alert-secondary" role="alert" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>
                </div>

            </div>
            <br />
            <div class="row">

                <div id="tableview-frontview" class="col-lg-12 col-xl-12">

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" CssClass="table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Font-Size="10pt">
                        <Columns>
                            <%-- <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btn_Edit" runat="server" CssClass="btn btn-primary" Text="Edit" CommandName="Edit" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button ID="btn_Update" runat="server" CssClass="btn btn-primary" Text="Update" CommandName="Update" />
                                    <asp:Button ID="btn_Cancel" runat="server" CssClass="btn btn-primary" Text="Cancel" CommandName="Cancel" />
                                </EditItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Employee ID" Visible="False">
                                <%-- <EditItemTemplate>  
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("APPLICATIONID") %>'></asp:TextBox>  
                    </EditItemTemplate>  --%>

                                <ItemTemplate>
                                    <asp:Label ID="lblEmpID" runat="server" Text='<%# Bind("EMPLOYEEID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Emloyee Code">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmpNo" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text='<%# Bind("EMPLOYEECODE") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Employee Name">
                                <%-- <EditItemTemplate>  
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("APPLICATIONAME") %>'></asp:TextBox>  
                    </EditItemTemplate>  --%>
                                <ItemTemplate>
                                    <asp:Label ID="lblEmpName" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DepartmentID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmpDptID" runat="server" Text='<%# Bind("DEPARTMENTID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Department Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmpDpt" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text='<%# Bind("DEPARTMENTNAME") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="BasicDA" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblbasicDA" runat="server" Text='<%# Bind("BASICDA") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="HRA" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblHra" runat="server" Text='<%# Bind("HRA") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Conveyance" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblConve" runat="server" Text='<%# Bind("CONVEYANCE") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Washing" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblWahing" runat="server" Text='<%# Bind("WASHING") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Other" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblOther" runat="server" Text='<%# Bind("OTHER") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="OT Amount" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("OTAMOUNT") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="OT Amount2" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblAmount2" runat="server" Text='<%# Bind("OTAMOUNT2") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="OT Amount3" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblAmount3" runat="server" Text='<%# Bind("OTAMOUNT3") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PFID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblpfid" runat="server" Text='<%# Bind("PFID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ESIID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblesiid" runat="server" Text='<%# Bind("ESIID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Status">
                                <EditItemTemplate>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlStatus" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" with="130">
                                        <asp:ListItem>Status</asp:ListItem>
                                        <asp:ListItem>XX</asp:ListItem>
                                        <asp:ListItem>XA</asp:ListItem>
                                        <asp:ListItem>AX</asp:ListItem>
                                        <asp:ListItem>AA</asp:ListItem>
                                        <asp:ListItem>CL</asp:ListItem>
                                        <asp:ListItem>EL</asp:ListItem>
                                        <asp:ListItem>PH</asp:ListItem>
                                        <asp:ListItem>NH</asp:ListItem>
                                        <asp:ListItem>COFF</asp:ListItem>
                                        <asp:ListItem>LOP</asp:ListItem>
                                        <asp:ListItem>SL</asp:ListItem>
                                        <asp:ListItem>WH</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ET1">
                                <EditItemTemplate>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="txtET1" runat="server" CssClass="form-control form-control-sm txtnew" Text="" Width="100" MaxLength='4' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ET2">
                                <EditItemTemplate>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="txtET2" runat="server" CssClass="form-control form-control-sm txtnew" Text="" Width="100" MaxLength='4' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ET3">
                                <EditItemTemplate>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="txtET3" runat="server" CssClass="form-control form-control-sm txtnew" Text="" Width="100" MaxLength='4' onkeydown='Number(this.value,event);' placeholder="0"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:TemplateField HeaderText="Total ET">  
                    <ItemTemplate>                                                               
                        <asp:Label ID="txttotET" runat="server"></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  --%>
                        </Columns>
                                <FooterStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                                <RowStyle BackColor="#f5f5ef" />
                    </asp:GridView>
                </div>

            </div>
            <div class="row">

                <div id="AYM-btn" class="col-lg-12 col-xl-12 ">

                    <asp:Label ID="lbltotalnoofemployees" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Total No OF Employees"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-3 col-xl-3">
                            <asp:TextBox ID="txttotalnoofemployees" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Total No OF Employees" Width="200"></asp:TextBox>
                        </div>
                    </div>

                    <%--<asp:Label ID="MessageBox2" class="alert alert-secondary" role="alert" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>--%>

                    <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" OnClick="btnsave_Click" style="font-size: smaller" />

                    <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary " Text="New" Width="120" OnClick="btnnew_Click" style="font-size: smaller" />

                    <asp:Button ID="btnclose" runat="server" ValidationGroup="txtDivi" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/SubmenuEntries.aspx" Width="120" style="font-size: smaller" />

                </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>


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


    <%--/*---Date Picker----*/--%>

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtattendancedate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        }

    </script>

    <%--/*-----------------*/--%>

    <script type='text/javascript'>
        function Number(src, event) {
            //Get key pressed
            var key = event.which || event.keyCode || event.charCode;
            //Ignore any backspaces or deletes that might affect the first three values
            if (src.length <= 8 && (key == 49 || key == 50 || key == 51 || key == 52 || key == 53 || key == 54 || key == 55
                || key == 56 || key == 57 || key == 48 || key == 97 || key == 98 || key == 99 || key == 100 || key == 101
                || key == 102 || key == 103 || key == 104 || key == 105 || key == 96 || key == 9 || key == 8 || key == 190 || key == 110))
            {

            }
            else
            {
                event.preventDefault(); return false;
            }
        }


    <%--/*---Message Hide Code----*/--%>

    <script type="text/javascript">
        window.onload = function () {
            var seconds = 2;
            setTimeout(function () {
                document.getElementById("<%=MessageBox.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>

    <%--/*-----------------*/--%>



    <%--/*-----------------*/--%>
</asp:Content>

