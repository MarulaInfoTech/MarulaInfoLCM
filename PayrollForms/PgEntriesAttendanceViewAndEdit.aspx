<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgEntriesAttendanceViewAndEdit.aspx.cs" Inherits="PayrollForms_PgEntriesAtt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="scripts/jquery.blockUI.js"></script>
<script type="text/javascript">
    $(function () {
        BlockUI("GDAttViewandEdit");
        $.blockUI.defaults.css = {};
    });
    function BlockUI(elementID) {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(function () {
            $("#" + elementID).block({
                message: '<div align = "center">' + '<img src="Photos/Icon.gif.gif"/></div>',
                css: {},
                overlayCSS: { backgroundColor: '#000000', opacity: 0.6, border: '3px solid #63B2EB' }
            });
        });
        prm.add_endRequest(function () {
            $("#" + elementID).unblock();
        });
    };
</script>--%>

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <div>
                <h6 class="card-title">Attendance View And Edit</h6>
            </div>
            <br />
            <div class="row col-lg-12 col-xl-12">

                <div id="DAE-Daily Attendance Entry" class="col-lg-2 col-xl-2">

                    <asp:Label ID="lblfromdate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="From Date"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:TextBox ID="txtfromdate" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>

                    <asp:Label ID="lbltodate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="To Date"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:TextBox ID="txttodate" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-xl-3">

                    <asp:Label ID="lblclientname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:DropDownList ID="ddlclientname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlclientname_SelectedIndexChanged">
                                <asp:ListItem>---Select Client Name---</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <asp:Label ID="lbldepartmentname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Department Name"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:DropDownList ID="ddldepartmentname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="ddldepartmentname_SelectedIndexChanged">
                                <asp:ListItem>---Select Department Name---</asp:ListItem>
                                <asp:ListItem>ALL Department</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                </div>

                <div class="col-lg-2 col-xl-2">

                    <asp:Label ID="lblemployeecode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Employee Code"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:TextBox ID="txtemployeecode" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Emp Code" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>

                    <asp:Label ID="lbltype" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Type"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:DropDownList ID="ddltype" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem>Select Type</asp:ListItem>
                                <asp:ListItem>LABOUR</asp:ListItem>
                                <asp:ListItem>STAFF</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                </div>

                <table class="table col-lg-4 col-xl-4">
                    <tbody>
                        <tr>
                            <td>
                                <asp:Label ID="lblstatus" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Status"></asp:Label>
                                <asp:DropDownList ID="ddlstatus" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True">
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
                            </td>
                            <td>
                                <asp:Label ID="lbltotalnoofemployees" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="No Emply"></asp:Label>
                                <asp:TextBox ID="txttotalnoofemployees" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="No Emply" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="100" OnClick="btnview_Click" Style="font-size: smaller" />
                            </td>
                            <td>
                                <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="100" OnClick="btnnew_Click" Style="font-size: smaller" />
                            </td>
                            <td>
                                <asp:Button ID="btnclose" runat="server" ValidationGroup="txtDivi" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/SubmenuEntries.aspx" Width="100" Style="font-size: smaller" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

            <div class="row">
                <div id="tableview-frontview" class="col-lg-12 col-xl-12">

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>

                            <asp:GridView ID="GDAttViewandEdit" runat="server" CssClass="table table-hover table-secondary" AutoGenerateColumns="False" EnablePartialRendering="true"
                                HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" HorizontalAlign="Center" ForeColor="Black"
                                OnRowDataBound="GDAttViewandEdit_RowDataBound" OnRowEditing="GDAttViewandEdit_RowEditing" OnPageIndexChanging="GDAttViewandEdit_PageIndexChanging"
                                OnRowUpdated="GDAttViewandEdit_RowUpdated" OnRowCancelingEdit="GDAttViewandEdit_RowCancelingEdit" OnRowUpdating="GDAttViewandEdit_RowUpdating" Font-Size="10pt" OnSelectedIndexChanged="GDAttViewandEdit_SelectedIndexChanged">

                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="btn_Edit" runat="server" CssClass="btn btn-primary" Text="Edit" CommandName="Edit" Width="100" Style="font-size: smaller" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Button ID="btn_Update" runat="server" CssClass="btn btn-primary" Text="Update" CommandName="Update" Width="100" Style="font-size: smaller" />
                                            <%--<asp:Button ID="btn_Cancel" runat="server" CssClass="btn btn-primary" Text="Cancel" CommandName="Cancel" Width="100" Style="font-size: smaller" />--%>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Date">
                                        <%-- <EditItemTemplate>  
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("APPLICATIONID") %>'></asp:TextBox>  
                    </EditItemTemplate>  --%>
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" runat="server" Text='<%# Bind("DATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Employee ID" Visible="False">
                                        <%-- <EditItemTemplate>  
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("APPLICATIONID") %>'></asp:TextBox>  
                    </EditItemTemplate>  --%>
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpID" runat="server" Text='<%# Bind("EMPLOYEEID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="1500px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DepartmentID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpDptID" runat="server" Text='<%# Bind("DEPARTMENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Emloyee Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpNo" runat="server" Text='<%# Bind("EMPLOYEECODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Employee Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpName" runat="server" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Department Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpDpt" runat="server" Text='<%# Bind("DEPARTMENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Division" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDivi" runat="server" Text='<%# Bind("DIVISIONID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="BasicDA" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbasicDA" runat="server" Text='<%# Bind("BASICDA") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="HRA" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHra" runat="server" Text='<%# Bind("HRA") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Conveyance" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblConve" runat="server" Text='<%# Bind("CONVEYANCE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Washing" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblWahing" runat="server" Text='<%# Bind("WASHING") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Other" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblOther" runat="server" Text='<%# Bind("OTHER") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="OT Amount" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("OTAMOUNT") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="OT Amount" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmount2" runat="server" Text='<%# Bind("OTAMOUNT2") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="OT Amount" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmount3" runat="server" Text='<%# Bind("OTAMOUNT3") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PFID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpfid" runat="server" Text='<%# Bind("PFID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ESIID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblesiid" runat="server" Text='<%# Bind("ESIID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlStatus" CssClass="form-control" runat="server" with="130" AppendDataBoundItems="True">
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
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("STATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblStatusID" runat="server" Text='<%# Bind("STATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle Width="100px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ET1">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtET1" runat="server" CssClass="form-control" Text='<%# Bind("OT1") %>' 
                                                Width="100"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblET1" runat="server" CssClass="form-control" Text='<%# Bind("OT1") %>' 
                                                Width="100"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ET2">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtET2" runat="server" CssClass="form-control" Text='<%# Bind("OT2") %>' 
                                                Width="100"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblET2" runat="server" CssClass="form-control" Text='<%# Bind("OT2") %>' 
                                                Width="100"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ET3">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtET3" runat="server" CssClass="form-control" Text='<%# Bind("OT3") %>' 
                                                Width="100"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblET3" runat="server" CssClass="form-control" Text='<%# Bind("OT3") %>' 
                                                Width="100"></asp:Label>
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

                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnview" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>

                </div>
            </div>

            <br />

            <div id="tableview-frontview2" class="col-lg-12 col-xl-12">

                <asp:GridView ID="AttendanceCount" runat="server" CssClass="table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6"
                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Font-Size="10pt" AutoGenerateColumns="false" ShowFooter="True">

                    <Columns>
                        <asp:TemplateField HeaderText="EMPLOYEE ID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="lblEMPLOYEEID" runat="server" Text='<%# Bind("EMPLOYEEID") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="200px"></ControlStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="DEPARTMENTID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="lblDEPARTMENTID" runat="server" Text='<%# Bind("DEPARTMENTID") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="200px"></ControlStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="DESIGNATIONID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="lblDESIGNATIONID" runat="server" Text='<%# Bind("DESIGNATIONID") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="200px"></ControlStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="CLIENTID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="lblCLIENTID" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="200px"></ControlStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="APPLICATIONAME">
                            <ItemTemplate>
                                <asp:Label ID="lblAPPLICATIONAME" runat="server" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="250px"></ControlStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="EMPLOYEECODE">
                            <ItemTemplate>
                                <asp:Label ID="lblEMPLOYEECODE" runat="server" Text='<%# Bind("EMPLOYEECODE") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="150px"></ControlStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="PRESENT">
                            <ItemTemplate>
                                <asp:Label ID="lblPresent" runat="server" Text='<%# Bind("Present") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="85px"></ControlStyle>

                            <FooterTemplate>
                                <asp:Label ID="lblTotPresent" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                    ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ABSENT">
                            <ItemTemplate>
                                <asp:Label ID="lblAbsent" runat="server" Text='<%# Bind("Absent") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="85px"></ControlStyle>

                            <FooterTemplate>
                                <asp:Label ID="lblTotAbsent" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                    ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="CL">
                            <ItemTemplate>
                                <asp:Label ID="lblCL" runat="server" Text='<%# Bind("CL") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="85px"></ControlStyle>

                            <FooterTemplate>
                                <asp:Label ID="lblTotCL" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                    ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="EL">
                            <ItemTemplate>
                                <asp:Label ID="lblEL" runat="server" Text='<%# Bind("EL") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="85px"></ControlStyle>

                            <FooterTemplate>
                                <asp:Label ID="lblTotEL" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                    ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                            </FooterTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="PH">
                            <ItemTemplate>
                                <asp:Label ID="lblPH" runat="server" Text='<%# Bind("PH") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="85px"></ControlStyle>

                            <FooterTemplate>
                                <asp:Label ID="lblTotPH" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                    ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="NH">
                            <ItemTemplate>
                                <asp:Label ID="lblNH" runat="server" Text='<%# Bind("NH") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="85px"></ControlStyle>

                            <FooterTemplate>
                                <asp:Label ID="lblTotNH" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                    ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="COFF">
                            <ItemTemplate>
                                <asp:Label ID="lblCOFF" runat="server" Text='<%# Bind("COFF") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="85px"></ControlStyle>

                            <FooterTemplate>
                                <asp:Label ID="lblTotCOFF" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                    ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="SL">
                            <ItemTemplate>
                                <asp:Label ID="lblSL" runat="server" Text='<%# Bind("SL") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="85px"></ControlStyle>

                            <FooterTemplate>
                                <asp:Label ID="lblTotSL" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                    ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="LOP">
                            <ItemTemplate>
                                <asp:Label ID="lblLOP" runat="server" Text='<%# Bind("LOP") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="85px"></ControlStyle>

                            <FooterTemplate>
                                <asp:Label ID="lblTotLOP" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                    ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="MAN DAYS">
                            <ItemTemplate>
                                <asp:Label ID="lblSalaryDay" runat="server" Text=''></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="85px"></ControlStyle>

                            <FooterTemplate>
                                <asp:Label ID="lblTotSalaryDay" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                    ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="TOTAL OT">
                            <ItemTemplate>
                                <asp:Label ID="lblET1" runat="server" Text='<%# Bind("OT1") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="85px"></ControlStyle>

                            <FooterTemplate>
                                <asp:Label ID="lblTotET1" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                    ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="TOTAL OT2" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblET2" runat="server" Text='<%# Bind("OT2") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="85px"></ControlStyle>

                            <FooterTemplate>
                                <asp:Label ID="lblTotET2" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                    ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="TOTAL OT3" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblET3" runat="server" Text='<%# Bind("OT3") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ControlStyle Height="12px" Width="85px"></ControlStyle>

                            <FooterTemplate>
                                <asp:Label ID="lblTotET3" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase"
                                    ReadOnly="true" Width="75" Text='' placeholder="0"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>

                    </Columns>

                    <FooterStyle HorizontalAlign="Left" />
                    <HeaderStyle HorizontalAlign="Left" />
                    <RowStyle BackColor="#f5f5ef" />
                </asp:GridView>
            </div>


    <%--/*---Date Picker----*/--%>

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtfromdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        }

    </script>

    <%--/*-----------------*/--%>

    <style>
        #tableview-frontview2 {
            overflow-x: auto;
            overflow-y: scroll;
            height: 400px;
            width: 1080px;
        }
    </style>




</asp:Content>

