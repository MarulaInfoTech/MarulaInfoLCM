<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="PgEmployeeViewAndEdit.aspx.cs" Inherits="PayrollForms_PgEmployeeViewAndEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>
            <div>
                <h6 class="card-title">Employee View And Edit</h6>
            </div>
            <br />
            <div class="row col-lg-12 col-xl-12">

                <div id="EVE-Employee-View" class="col-lg-2 col-xl-2">

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

                <div class=" col-lg-4 col-xl-4">

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

                <div class=" col-lg-2 col-xl-2">

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

                <div class=" col-lg-2 col-xl-2">
                    <br />
                    <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary " Text="View" Width="120" OnClick="btnview_Click" Style="font-size: smaller" />
                    <br />
                    <%--<asp:Label ID="lblMessageBox" class="alert alert-secondary" role="alert" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>--%>
                    <br />
                    <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary " Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller" />
                </div>

                <div class=" col-lg-2 col-xl-2">
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnclose" runat="server" ValidationGroup="txtcompanycode" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/SubmenuDataMaster.aspx" Width="120" Style="font-size: smaller" />
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

            <div class="row">

                <div id="tableview-frontview" class="col-lg-12 col-xl-12">

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>

                    <asp:GridView ID="GDEmpViewandEdit" runat="server" CssClass="table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6" 
                        BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" OnPageIndexChanging="GDEmpViewandEdit_PageIndexChanging" 
                        OnRowCancelingEdit="GDEmpViewandEdit_RowCancelingEdit" OnRowEditing="GDEmpViewandEdit_RowEditing1"
                        OnRowUpdated="GDEmpViewandEdit_RowUpdated" OnRowUpdating="GDEmpViewandEdit_RowUpdating" 
                        OnRowDataBound="GDEmpViewandEdit_RowDataBound" OnSelectedIndexChanged="GDEmpViewandEdit_SelectedIndexChanged" 
                        AutoGenerateColumns="False" Font-Size="10pt" HeaderStyle-Wrap="False">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btn_Edit" runat="server" CssClass="btn btn-primary" Text="Edit" CommandName="Edit" Width="100" Style="font-size: smaller" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button ID="btn_Update" runat="server" CssClass="btn btn-primary" Text="Update" CommandName="Update" Width="100" Style="font-size: smaller" />
                                    <asp:Button ID="btn_Cancel" runat="server" CssClass="btn btn-primary" Text="Cancel" CommandName="Cancel" Width="100" Visible="false" Style="font-size: smaller" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="APPLICATION ID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lbleveapplicationid" runat="server" Text='<%# Bind("APPLICATIONID") %>' class="G"></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="EMPLOYEE ID" Visible="False">

                                <ItemTemplate>
                                    <asp:Label ID="lbleveemployeeid" runat="server" Text='<%# Bind("EMPLOYEEID") %>' class="G"></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="EMPLOYEE CODE">

                                <ItemTemplate>
                                    <asp:Label ID="lbleveemployeeno" runat="server" Text='<%# Bind("EMPLOYEECODE") %>' class="G"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle></HeaderStyle>
                                <ControlStyle Width="150"></ControlStyle>                               
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="EMPLOYEE NAME">
                                <%--<EditItemTemplate>
                                    <asp:TextBox ID="txteveemployeename" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" class="G" Text='<%# Bind("APPLICATIONAME") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>--%>
                                <%--<HeaderStyle></HeaderStyle>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveemployeename" runat="server" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DATE OF JOIN">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtevedateofjoin" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" MaxLength="10" Text='<%# Bind("DATEOFJOIN", "{0:dd/MM/yyyy}") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevedateofjoin" runat="server" Text='<%# Bind("DATEOFJOIN", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle></HeaderStyle>

                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="JOB TYPE">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlevejobtype" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server"
                                        SelectedValue='<%# Bind("JOBTYPE") %>'>
                                        <asp:ListItem>-----Jobtype ------</asp:ListItem>
                                        <asp:ListItem>Permanent</asp:ListItem>
                                        <asp:ListItem>Part Time</asp:ListItem>
                                        <asp:ListItem>Temporary</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevejobtype" runat="server" Text='<%# Bind("JOBTYPE") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="175px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="JOB CATEGORY">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlevejobcategory" SelectedValue='<%# Bind("JOBCATEGORY") %>' CssClass="form-control form-control-sm text-uppercase txtnew" runat="server">
                                        <asp:ListItem>-------Job Category -----</asp:ListItem>
                                        <asp:ListItem>Staff</asp:ListItem>
                                        <asp:ListItem>Labour</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevejobcategory" runat="server" Text='<%# Bind("JOBCATEGORY") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="CLIENT ID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lbleveclientid" runat="server" Text='<%# Bind("CLIENTID") %>' class="G"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DEPARTMENT ID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblevedepartmentid" runat="server" Text='<%# Bind("DEPARTMENTID") %>' class="G"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DESIGNATION ID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblevedesignationid" runat="server" Text='<%# Bind("DESIGNATIONID") %>' class="G"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <%---------------------%>
                            <asp:TemplateField HeaderText="JOB UNIT">
                                <%--<EditItemTemplate>
                         <asp:DropDownList ID="ddlevejobunit" CssClass="form-control form-control-sm text-uppercase txtnew" AutoPostBack="true" runat="server" AppendDataBoundItems="True" class="G">
                             <asp:ListItem>---JobUnit ---</asp:ListItem>
                         </asp:DropDownList>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lblevejobunit" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="250px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DEPARTMENT">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlevedepartmentname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True">
                                        <asp:ListItem>--------Department-----</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevedepartmentname" runat="server" Text='<%# Bind("DEPARTMENTNAME") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="220px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DESIGNATION">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlevedesignationname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True">
                                        <asp:ListItem>-------Designation ------</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevedesignationname" runat="server" Text='<%# Bind("DESIGNATIONNAME") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="220px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="SALARYID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblevesalaryid" runat="server" Text='<%# Bind("SALARYID") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="SALARY TYPE">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlevesalarytype" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server"
                                        SelectedValue='<%# Bind("SALARYTYPE") %>'>
                                        <asp:ListItem>-------Salary Type ------</asp:ListItem>
                                        <asp:ListItem>Monthly</asp:ListItem>
                                        <asp:ListItem>Weekly</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevesalarytype" runat="server" Text='<%# Bind("SALARYTYPE") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="TOTAL WAGE">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteveWgPerDay" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew"
                                        Text='<%# Bind("WAGEPERDAY") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveWgPerDay" runat="server" Text='<%# Bind("WAGEPERDAY") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="GRADE">
                                <EditItemTemplate>
                                    <%--<asp:TextBox ID="txtevegrade" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("GRADE") %>' Width="100" class="G"></asp:TextBox>--%>

                                    <asp:DropDownList ID="ddlevegrade" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server"
                                        AppendDataBoundItems="True" OnSelectedIndexChanged="ddlevegrade_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem>---GRADE---</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevegrade" runat="server" Text='<%# Bind("GRADE") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="BASIC DA">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtevebasicda" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("BASICDA") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevebasicda" runat="server" Text='<%# Bind("BASICDA") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="HRA">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtevehra" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("HRA") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevehra" runat="server" Text='<%# Bind("HRA") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="CONVEYANCE">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteveconveyance" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("CONVEYANCE") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveconveyance" runat="server" Text='<%# Bind("CONVEYANCE") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="WASHING">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtevewashing" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("WASHING") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevewashing" runat="server" Text='<%# Bind("WASHING") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="OTHER">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteveother" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("OTHER") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveother" runat="server" Text='<%# Bind("OTHER") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="TOTAL PERHOUR">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtevetotalperhour" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("TOTALPERHOUR") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevetotalperhour" runat="server" Text='<%# Bind("TOTALPERHOUR") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="OT AMOUNT">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteveotamount" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("OTAMOUNT") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveotamount" runat="server" Text='<%# Bind("OTAMOUNT") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="CONTRACTORS">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlevecontractors" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server"
                                        SelectedValue='<%# Bind("CONTRACTORS") %>'>
                                        <asp:ListItem>---Contractorts---</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                        <asp:ListItem>Yes</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevecontractors" runat="server" Text='<%# Bind("CONTRACTORS") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PF ID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblevepfid" runat="server" Text='<%# Bind("PFID") %>' CssClass="form-control form-control-sm text-uppercase txtnew"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PF NO">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlpfname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" Width="100" AppendDataBoundItems="True">
                                        <asp:ListItem>---Select PF---</asp:ListItem>
                                    </asp:DropDownList>
                                    <%--  <asp:TextBox ID="txtevepfname" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("PFNAME") %>' Width="100"></asp:TextBox>--%>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevepfname" runat="server" Text='<%# Bind("PFNAME") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ESI ID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lbleveesiid" runat="server" Text='<%# Bind("ESIID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ESI NO">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlesino" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" Width="100" AppendDataBoundItems="True">
                                        <asp:ListItem>---Select ESI---</asp:ListItem>
                                    </asp:DropDownList>
                                    <%--<asp:TextBox ID="txteveesiname" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("ESINAME") %>' Width="100"></asp:TextBox>--%>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveesiname" runat="server" Text='<%# Bind("ESINAME") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="TA / Day">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteveta" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("TA") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveta" runat="server" Text='<%# Bind("TA") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="AADHAR NO">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteveempaadhar" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("EMPAADHAR") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveempaadhar" runat="server" Text='<%# Bind("EMPAADHAR") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="180px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="UAN NO">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteveuanno" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("UANNO") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveuanno" runat="server" Text='<%# Bind("UANNO") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="180px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PF NO">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtevepfno" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("PFNO") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevepfno" runat="server" Text='<%# Bind("PFNO") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="180px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ESI NO">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteveesino" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("ESINO") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveesino" runat="server" Text='<%# Bind("ESINO") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="SALARY ISSUETYPE">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlevesalaryissuetype" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                        SelectedValue='<%# Bind("SALARYISSUETYPE") %>'>
                                        <asp:ListItem>---Salary Issuetype---</asp:ListItem>
                                        <asp:ListItem>Bank</asp:ListItem>
                                        <asp:ListItem>Cash</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevesalaryissuetype" runat="server" Text='<%# Bind("SALARYISSUETYPE") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="BANK NAME">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtevebankname" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("BANKNAME") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevebankname" runat="server" Text='<%# Bind("BANKNAME") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="250px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="BRANCH">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtevebranch" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("BRANCH") %>' Width="100"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevebranch" runat="server" Text='<%# Bind("BRANCH") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="IFSC CODE">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteveifsccode" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("IFSCCODE") %>' Width="100" class="G"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveifsccode" runat="server" Text='<%# Bind("IFSCCODE") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="170px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ACCOUNT NO">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteveaccountno" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("ACCOUNTNO") %>' Width="100" class="G"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveaccountno" runat="server" Text='<%# Bind("ACCOUNTNO") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="220px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PAN NO">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtevepanno" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("PANNO") %>' Width="100" class="G"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblevepanno" runat="server" Text='<%# Bind("PANNO") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="220px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="EMG NAME">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteveemgname" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("EMGNAME") %>' Width="100" class="G"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveemgname" runat="server" Text='<%# Bind("EMGNAME") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="EMG RELATIONSHIP">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteveemgrelationship" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("EMGRELATIONSHIP") %>' Width="100" class="G"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveemgrelationship" runat="server" Text='<%# Bind("EMGRELATIONSHIP") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="170px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="EMG MOBILE NO">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteveemgmobilenumber" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("EMGMOBILENUMBER") %>' Width="100" class="G"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveemgmobilenumber" runat="server" Text='<%# Bind("EMGMOBILENUMBER") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="EMG HOME NO">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteveemgnomineehomenumber" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("EMGNOMINEEHOMENUMBER") %>' Width="100" class="G"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveemgnomineehomenumber" runat="server" Text='<%# Bind("EMGNOMINEEHOMENUMBER") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="180px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="EMP IDMARK">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteveempidmark" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("EMPIDMARK") %>' Width="100" class="G"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveempidmark" runat="server" Text='<%# Bind("EMPIDMARK") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PF NOMINEE NAME" Visible="False">
                                <%-- <EditItemTemplate>
                         <asp:TextBox ID="txtevepfnomineename" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("PFNOMINEENAME") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lblevepfnomineename" runat="server" Text='<%# Bind("PFNOMINEENAME") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PF NOMINEE DOB" Visible="False">
                                <%-- <EditItemTemplate>
                         <asp:TextBox ID="txtevepfnomineedob" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("PFNOMINEEDOB") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lblevepfnomineedob" runat="server" Text='<%# Bind("PFNOMINEEDOB") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PF NOMINEE RELATIONSHIP" Visible="False">
                                <%-- <EditItemTemplate>
                         <asp:TextBox ID="txtevepfnomineerelationship" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("PFNOMINEERELATIONSHIP") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lblevepfnomineerelationship" runat="server" Text='<%# Bind("PFNOMINEERELATIONSHIP") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PF NOMINEE NO,STREET" Visible="False">
                                <%--<EditItemTemplate>
                         <asp:TextBox ID="txtevepfnomineenoandstreet" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("PFNOMINEENOANDSTREET") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lblevepfnomineenoandstreet" runat="server" Text='<%# Bind("PFNOMINEENOANDSTREET") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="230px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PF NOMINEE TOWN" Visible="False">
                                <%-- <EditItemTemplate>
                         <asp:TextBox ID="txtevepfnomineetown" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("PFNOMINEETOWN") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lblevepfnomineetown" runat="server" Text='<%# Bind("PFNOMINEETOWN") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PF NOMINEE CITY" Visible="False">
                                <%--<EditItemTemplate>
                         <asp:DropDownList ID="ddlpfcity" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True" class="G">
                             <asp:ListItem>--- Select City ---</asp:ListItem>
                         </asp:DropDownList>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lblevepfnomineecity" runat="server" Text='<%# Bind("PFNOMINEECITY") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PF NOMINEE STATE" Visible="False">
                                <%--<EditItemTemplate>
                         <asp:DropDownList ID="ddlpfstate" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoPostBack="True" AppendDataBoundItems="True"
                             onselectedindexchanged="ddlpfstate_SelectedIndexChanged" class="G">
                             <asp:ListItem>--- Select State ---</asp:ListItem>
                         </asp:DropDownList>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lblevepfnomineestate" runat="server" Text='<%# Bind("PFNOMINEESTATE") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PF NOMINEE PINCODE" Visible="False">
                                <%-- <EditItemTemplate>
                         <asp:TextBox ID="txtevepfnomineepincode" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("PFNOMINEEPINCODE") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lblevepfnomineepincode" runat="server" Text='<%# Bind("PFNOMINEEPINCODE") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PF NOMINEE MOBILE NO" Visible="False">
                                <%--<EditItemTemplate>
                         <asp:TextBox ID="txtevepfnomineemobilenumber" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("PFNOMINEEMOBILENUMBER") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lblevepfnomineemobilenumber" runat="server" Text='<%# Bind("PFNOMINEEMOBILENUMBER") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PF NOMINEE HOME NO" Visible="False">
                                <%--<EditItemTemplate>
                         <asp:TextBox ID="txtevepfnomineehomenumber" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("PFNOMINEEHOMENUMBER") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lblevepfnomineehomenumber" runat="server" Text='<%# Bind("PFNOMINEEHOMENUMBER") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ESI NOMINEE NAME" Visible="False">
                                <%-- <EditItemTemplate>
                         <asp:TextBox ID="txteveesinomineename" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("ESINOMINEENAME") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveesinomineename" runat="server" Text='<%# Bind("ESINOMINEENAME") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ESI NOMINEE DOB" Visible="False">
                                <%-- <EditItemTemplate>
                         <asp:TextBox ID="txteveesinomineedob" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("ESINOMINEEDOB") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveesinomineedob" runat="server" Text='<%# Bind("ESINOMINEEDOB") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ESI NOMINEE RELATIONSHIP" Visible="False">
                                <%-- <EditItemTemplate>
                         <asp:TextBox ID="txteveesinomineerelationship" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("ESINOMINEERELATIONSHIP") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveesinomineerelationship" runat="server" Text='<%# Bind("ESINOMINEERELATIONSHIP") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ESI NOMINEE NO,STREET" Visible="False">
                                <%-- <EditItemTemplate>
                         <asp:TextBox ID="txteveesinomineenoandstreet" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("ESINOMINEENOANDSTREET") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveesinomineenoandstreet" runat="server" Text='<%# Bind("ESINOMINEENOANDSTREET") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="250px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ESI NOMINEE TOWN" Visible="False">
                                <%-- <EditItemTemplate>
                         <asp:TextBox ID="txteveesinomineetown" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("ESINOMINEETOWN") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveesinomineetown" runat="server" Text='<%# Bind("ESINOMINEETOWN") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ESI NOMINEE CITY" Visible="False">
                                <%--  <EditItemTemplate>
                         <asp:DropDownList ID="ddleveesinomineecity" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True" class="G">
                             <asp:ListItem>--- Select City ---</asp:ListItem>
                         </asp:DropDownList>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveesinomineecity" runat="server" Text='<%# Bind("ESINOMINEECITY") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ESI NOMINEE STATE" Visible="False">
                                <%-- <EditItemTemplate>
                         <asp:DropDownList ID="ddlesistate" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoPostBack="True" AppendDataBoundItems="True"
                             onselectedindexchanged="ddlesistate_SelectedIndexChanged" class="G">
                             <asp:ListItem>---- Select State ----</asp:ListItem>
                         </asp:DropDownList>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveesinomineestate" runat="server" Text='<%# Bind("ESINOMINEESTATE") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ESI NOMINEE PINCODE" Visible="False">
                                <%-- <EditItemTemplate>
                         <asp:TextBox ID="txtesipincode" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("ESINOMINEEPINCODE") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveesinomineepincode" runat="server" Text='<%# Bind("ESINOMINEEPINCODE") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="150px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ESI MOBILE NUMBER" Visible="False">
                                <%-- <EditItemTemplate>
                         <asp:TextBox ID="txteveesinomineemobilenumber" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("ESINOMINEEMOBILENUMBER") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveesinomineemobilenumber" runat="server" Text='<%# Bind("ESINOMINEEMOBILENUMBER") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="180px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ESI HOME NUMBER" Visible="False">
                                <%-- <EditItemTemplate>
                         <asp:TextBox ID="txteveesinomineehomenumber" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("ESINOMINEEHOMENUMBER") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveesinomineehomenumber" runat="server" Text='<%# Bind("ESINOMINEEHOMENUMBER") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="180px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="REFERENCES NAME1">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteverefname1" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("REFNAME1") %>' Width="100" class="G"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleverefname1" runat="server" Text='<%# Bind("REFNAME1") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="REFERENCES DESIGNATION 1">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteverefdesignation1" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("REFDESIGNATION1") %>' Width="100" class="G"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleverefdesignation1" runat="server" Text='<%# Bind("REFDESIGNATION1") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="300px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="REFERENCES CONTACT NO 1">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteverefcontactnumber1" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("REFCONTACTNUMBER1") %>' Width="100" class="G"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleverefcontactnumber1" runat="server" Text='<%# Bind("REFCONTACTNUMBER1") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="300px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="REFERENCES NAME 2">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteverefname2" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("REFNAME2") %>' Width="100" class="G"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleverefname2" runat="server" Text='<%# Bind("REFNAME2") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="300px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="REFERENCES DESIGNATION 2">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteverefdesignation2" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("REFDESIGNATION2") %>' Width="100" class="G"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleverefdesignation2" runat="server" Text='<%# Bind("REFDESIGNATION2") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="300px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="REFERENCES CONTACT NO 2">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteverefcontactnumber2" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("REFCONTACTNUMBER2") %>' Width="100" class="G"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbleverefcontactnumber2" runat="server" Text='<%# Bind("REFCONTACTNUMBER2") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="300px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="EMPLOYEE STATUS">
                                <%--<EditItemTemplate>
                         <asp:TextBox ID="txteveemployeestatus" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" Text='<%# Bind("EMPLOYEESTATUS") %>' Width="100" class="G"></asp:TextBox>
                     </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Label ID="lbleveemployeestatus" runat="server" Text='<%# Bind("EMPLOYEESTATUS") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="180px"></ControlStyle>
                            </asp:TemplateField>

                        </Columns>

                        <FooterStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                        <RowStyle BackColor="#f5f5ef" />
                    </asp:GridView>

                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnview" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                                       
                </div>
            </div>

    <%----------------------------------%>

    <%--/*---Date Picker----*/--%>

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });
        function bindDatePickers(sender, args) {
            $('#<%= txtfromdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
          <%-- $('#<%= txtevedateofjoin.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });--%>
        }
    </script>

    <%--/*--------------------------------*/--%>
</asp:Content>

