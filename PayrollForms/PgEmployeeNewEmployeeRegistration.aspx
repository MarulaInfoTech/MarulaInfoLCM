<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="PgEmployeeNewEmployeeRegistration.aspx.cs" Inherits="PgEmployeeNewEmployeeRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Grid row -->
<div class="row accordion-gradient-bcg d-flex justify-content-center">
  <!-- Grid column -->
  <div class="col-lg-12 col-xl-12"">
    <!--Accordion wrapper-->
    <div class="accordion lg-accordion accordion-2" id="accordionEx7" role="tablist"
      aria-multiselectable="true">

      <!-- Accordion card -->
      <div class="card">

        <!-- Card header -->
        <div class="card-header rgba-stylish-strong z-depth-1 mb-1" role="tab" id="heading1">
          <a data-toggle="collapse" data-parent="#accordionEx7" href="#collapse1" aria-expanded="true"
            aria-controls="collapse1">
            <h6 class="mb-0 white-text font-italic" Style="font-size:large">
              Employee Offical Details <i class="fas fa-angle-down rotate-icon"></i>
            </h6>
          </a>
        </div>

        <!-- Card body -->
        <div id="collapse1" class="collapse show" role="tabpanel" aria-labelledby="heading1"
          data-parent="#accordionEx7">
       
              <%-----------------------------%>
                  <div class="row col-lg-12 col-xl-12" id="ENER-Pgx">

                                    <div id="Employees-Profession-Details" class=" col-lg-4 col-xl-4">

                                        <asp:Label ID="lblapplication" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Application No *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:DropDownList ID="ddlapplicationno" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlapplicationno_SelectedIndexChanged">
                                                    <asp:ListItem>---Select Application---</asp:ListItem>
                                                    <asp:ListItem></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblemployeename" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Employee Name *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:TextBox ID="txtemployeename" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Employee Name" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblemployeeno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Employee No "></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:TextBox ID="txtemployeeno" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Employee No"></asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepddateofbirth" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Date of Join *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12">
                                                <asp:TextBox ID="txtepddate" runat="server" CssClass="form-control form-control-sm text-uppercase txtnew" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdjobtype" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Job Type *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:DropDownList ID="ddlepdjobtype" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server">
                                                    <asp:ListItem>----- Select Jobtype ------</asp:ListItem>
                                                    <asp:ListItem>Permanent</asp:ListItem>
                                                    <asp:ListItem>Part Time</asp:ListItem>
                                                    <asp:ListItem>Temporary</asp:ListItem>
                                                    <asp:ListItem>Casual Labour</asp:ListItem>
                                                    <asp:ListItem>Apprenties</asp:ListItem>
                                                    <asp:ListItem>Company Apprenties</asp:ListItem>
                                                    <asp:ListItem>Contract Workers</asp:ListItem>
                                                    <asp:ListItem>Trainees</asp:ListItem>
                                                    <asp:ListItem>Hamalies</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdjobcategory" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Job Category *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:DropDownList ID="ddlepdjobcategory" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server">
                                                    <asp:ListItem>------- Select Job Category -----</asp:ListItem>
                                                    <asp:ListItem>Staff</asp:ListItem>
                                                    <asp:ListItem>Labour</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdjobunit" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Job Unit *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:DropDownList ID="ddlepdjobunit" CssClass="form-control form-control-sm text-uppercase txtnew" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlepdjobunit_SelectedIndexChanged" AppendDataBoundItems="True">
                                                    <asp:ListItem>------ Select Job Unit -----</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepddepartment" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Department *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:DropDownList ID="ddlepddepartment" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True">
                                                    <asp:ListItem>-------- Select Department -----</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepddesignation" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Designation *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:DropDownList ID="ddlepddesignation" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True">
                                                    <asp:ListItem>------- Select Designation ------</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdcontractors" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Contract"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:DropDownList ID="ddlepdcontractors" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server">
                                                    <asp:ListItem>---Contract---</asp:ListItem>
                                                    <asp:ListItem>No</asp:ListItem>
                                                    <asp:ListItem>Yes</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <asp:Label ID="Label4" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="EPF-Member ID:No"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:TextBox ID="txtpfno" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdesino" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="ESI-Employee ID:No"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:TextBox ID="txtepdesino" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" autocomplete="off" onkeydown='Number(this.value,event);' onKeyPress="if(this.value.length==20) return false;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdtaday" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="TA / Day"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:TextBox ID="txtepdtaday" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" autocomplete="off" OnTextChanged="txtepdtaday_TextChanged">0</asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdadharno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="EMP.Adhar No."></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:TextBox ID="txtepdadharno" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="EMP.Adhar No." autocomplete="off" onkeydown='Number(this.value,event);' onKeyPress="if(this.value.length==12) return false;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepduanno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="EMP.UAN No."></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:TextBox ID="txtepduanno" CssClass="form-control form-control-sm txtnew" runat="server" autocomplete="off" onkeydown='Number(this.value,event);' onKeyPress="if(this.value.length==12) return false;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdsalarytype" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Salary Type *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:DropDownList ID="ddlepdsalarytype" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" OnSelectedIndexChanged="ddlepdsalarytype_SelectedIndexChanged">
                                                    <asp:ListItem>------- Select Salary Type ------</asp:ListItem>
                                                    <asp:ListItem>DR-Monthly</asp:ListItem>
                                                    <asp:ListItem>MR-Monthly</asp:ListItem>
                                                    <asp:ListItem>Daily Wage</asp:ListItem>
                                                    <asp:ListItem>Daily Hamali</asp:ListItem>
                                                    <asp:ListItem>Weekly</asp:ListItem>
                                                    <asp:ListItem>Half Month (15days)</asp:ListItem>
                                                    <asp:ListItem>Hours Wage</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                    </div>

                                    <%--</div>--%>

                                    <div id="" class=" col-lg-4 col-xl-4">

                                        <asp:Label ID="lblepdwageday" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Wage / Day *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:TextBox ID="txtepdwageday" CssClass="form-control form-control-sm txtnew" autocomplete="off" runat="server">0</asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdpunchdevice" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Salary Grade *"></asp:Label>
                                        <div class="form-group">
                                            <div class="col-lg-12 col-xl-12 ">
                                                <asp:DropDownList ID="ddlGrade" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlGrade_SelectedIndexChanged" AppendDataBoundItems="True">
                                                    <asp:ListItem>------- Select Grade -------</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdbasicda" runat="server" CssClass="label-conrol col-sm-12 lblnew" autocomplete="off" Text="Basic + DA *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:TextBox ID="txtepdbasicda" CssClass="form-control form-control-sm txtnew" autocomplete="off" runat="server">0</asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdhra" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="HRA *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:TextBox ID="txtepdhra" CssClass="form-control form-control-sm txtnew" autocomplete="off" runat="server">0</asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdexgratia" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Conveyance *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:TextBox ID="txtconvey" CssClass="form-control form-control-sm txtnew" autocomplete="off" runat="server">0</asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblwashing" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Washing *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:TextBox ID="txtWashing" CssClass="form-control form-control-sm txtnew" autocomplete="off" runat="server">0</asp:TextBox>
                                            </div>
                                        </div>

                                    </div>

                                     <%-----------------------------%>

                                    <div id="" class=" col-lg-4 col-xl-4">

                                        <asp:Label ID="lblother" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Other *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:TextBox ID="txtOther" CssClass="form-control form-control-sm txtnew" autocomplete="off" runat="server">0</asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdwagehour" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Wage / Hour *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:TextBox ID="txtepdwagehour" CssClass="form-control form-control-sm txtnew" autocomplete="off" runat="server">0</asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdotperhour" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="OT Per Hour *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:TextBox ID="txtotperhour2" CssClass="form-control form-control-sm txtnew" autocomplete="off" runat="server">0</asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdpfeligible" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Employee PF Eligible *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:DropDownList ID="ddlepdpfeligible" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True">
                                                    <asp:ListItem>------ Select EPF --------</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdesieligible" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Employee ESI Eligible *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:DropDownList ID="ddlepdesieligible" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True">
                                                    <asp:ListItem>-------- Select ESI ------</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdsalaryissuetype" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Salary Issue Type *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-12 col-xl-12 ">
                                                <asp:DropDownList ID="ddlepdsalaryissuetype" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlepdsalaryissuetype_SelectedIndexChanged">
                                                    <asp:ListItem>------ Select  Salary Issuetype -----</asp:ListItem>
                                                    <asp:ListItem>Bank</asp:ListItem>
                                                    <asp:ListItem>Cash</asp:ListItem>
                                                    <asp:ListItem>DD (Demand Draft)</asp:ListItem>
                                                    <asp:ListItem>Cheque</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>

                                     <%-----------------------------%>

                                    <div id="EPD-Bank-Detailsx" class="col-lg-8 col-xl-8">
                                        <h6>Bank Details</h6>

                                        <asp:Label ID="lblepdbankname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Bank Name *"></asp:Label>
                                        <div class="form-group">
                                            <div class=" col-lg-10 col-xl-10">
                                                <asp:TextBox ID="txtepdbankname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Bank Name" OnTextChanged="txtepdbankname_TextChanged" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdbranch" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Branch *"></asp:Label>
                                        <div class="form-group">
                                            <div class="col-lg-10 col-xl-10">
                                                <asp:TextBox ID="txtbranch" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Branch" OnTextChanged="txtbranch_TextChanged" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdifsccode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="IFSC Code *"></asp:Label>
                                        <div class="form-group">
                                            <div class="col-lg-10 col-xl-10">
                                                <asp:TextBox ID="txtepdifsc" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="IFSC Code" OnTextChanged="txtepdifsc_TextChanged" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdaccountno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Account No. *"></asp:Label>
                                        <div class="form-group">
                                            <div class="col-lg-10 col-xl-10">
                                                <asp:TextBox ID="txtepdaccountno" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Account No" OnTextChanged="txtepdaccountno_TextChanged" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblpanno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="PAN No. *"></asp:Label>
                                        <div class="form-group">
                                            <div class="col-lg-10 col-xl-10">
                                                <asp:TextBox ID="txtpanno" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="PAN No" autocomplete="off" OnTextChanged="txtpanno_TextChanged"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>
                                      <%-----------------------------%>

                                    <div id="EPD-Emergency-Contact" class="col-lg-8 col-xl-8">
                                        <h6>Emergency Contact</h6>

                                        <asp:Label ID="lblepdpersonname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Person's Name *"></asp:Label>
                                        <div class="form-group">
                                            <div class="col-lg-10 col-xl-10">
                                                <asp:TextBox ID="txtepdpersonname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Person's Name" OnTextChanged="txtepdpersonname_TextChanged" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdrelationship" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Relationship *"></asp:Label>
                                        <div class="form-group">
                                            <div class="col-lg-10 col-xl-10">
                                                <asp:TextBox ID="txtepdrelationship" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Relationship" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdmobile" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Mobile No *"></asp:Label>
                                        <div class="form-group">
                                            <div class="col-lg-10 col-xl-10">
                                                <asp:TextBox ID="txtepdmobile" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Mobile No" autocomplete="off" onkeydown='Number(this.value,event);' onKeyPress="if(this.value.length==10) return false;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblepdhomenumber" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Home Number *"></asp:Label>
                                        <div class="form-group">
                                            <div class="col-lg-10 col-xl-10">
                                                <asp:TextBox ID="txtepdhomenumber" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Home Number" onkeydown='Number(this.value,event);' autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblidentitymarks" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Identity Marks "></asp:Label>
                                        <div class="form-group col-lg-10 col-xl-10">                                            
                                            <asp:TextBox ID="txtidentitymarks" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Identity Marks" Height="50" autocomplete="off" OnTextChanged="txtidentitymarks_TextChanged"></asp:TextBox>                                      
                                        </div>
                                    </div>

                                      <%--<div id="EPD-marks" class="col-lg-8 col-xl-8">
                                        <asp:Label ID="lblidentitymarks" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Identity Marks "></asp:Label>
                                        <div class="form-group">
                                            <div class="col-lg-10 col-xl-10">
                                                <asp:TextBox ID="txtidentitymarks" CssClass="form-control form-control-sm text-uppercase txtnew " runat="server" placeholder="Identity Marks" TextMode="MultiLine" autocomplete="off" OnTextChanged="txtidentitymarks_TextChanged"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>--%>
                            </div>
                      
                       </div>
                     </div>
    
              <%------------------------------------%>
    
      <!-- Accordion card -->
      <div class="card">

        <!-- Card header -->
        <div class="card-header rgba-stylish-strong z-depth-1 mb-1" role="tab" id="heading2">
          <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx7" href="#collapse2"
            aria-expanded="false" aria-controls="collapse2">
            <h6 class="mb-0 white-text font-italic" Style="font-size:large">
              Employee Nominee Details <i class="fas fa-angle-down rotate-icon"></i>
            </h6>
          </a>
        </div>

        <!-- Card body -->
        <div id="collapse2" class="collapse" role="tabpanel" aria-labelledby="heading2"
          data-parent="#accordionEx7">
      
              <%----------------------------%>                                         
                  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>
      <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">
        <ContentTemplate>

                         <div id="ENER-Pg2">
                           <div class="row justify-content-center">
                            <div id="PF-Nominee-Details" class="col-lg-5 col-xl-5">
                                <br />
                                <h6>PF Nominee Details</h6>
                                  <br />   

                                 <%--<asp:HiddenField ID="HiddenField1" Value="1" runat="server" />--%>
                                                                                     
                                <asp:Label ID="lblpfnomineename" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Nominee's Name"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtpfnomineename" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Nominee's Name" OnTextChanged="txtpfnomineename_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblpfdateofbirthage" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Date of Birth"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtpfdateofbirthage" runat="server" CssClass="form-control form-control-sm txtnew" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblpfrelationship" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Relationship"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtpfrelationship" CssClass="form-control form-control-sm text-uppercase txtnew " runat="server" placeholder="Relationship" OnTextChanged="txtpfrelationship_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblpfnoandstreet" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="No.and Street"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtpfnoandstreet" CssClass="form-control form-control-sm text-uppercase txtnew " runat="server" placeholder="No.and Street" OnTextChanged="txtpfnoandstreet_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblpftownarea" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Town/Area"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtpftownarea" CssClass="form-control form-control-sm text-uppercase txtnew " runat="server" placeholder="Town/Area" OnTextChanged="txtpftownarea_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblpfstate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="State"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:DropDownList ID="ddlpfstate" CssClass="form-control form-control-sm txtnew" runat="server" OnSelectedIndexChanged="ddlpfstate_SelectedIndexChanged" AutoPostBack="True" AppendDataBoundItems="True">
                                            <asp:ListItem>------- Select State --------</asp:ListItem>
                                        </asp:DropDownList>

                                        <%--<asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />--%>

                                    </div>
                                </div>

                                <asp:Label ID="lblpfcity" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="City"></asp:Label>
                                <div class="form-group ">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:DropDownList ID="ddlpfcity" CssClass="form-control form-control-sm txtnew" runat="server" OnSelectedIndexChanged="ddlpfcity_SelectedIndexChanged" AppendDataBoundItems="True">
                                            <asp:ListItem>--------- Select City -------</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <asp:Label ID="lblpfpincode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Pincode"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtpfpincode" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Pincode" onkeydown='Number(this.value,event);' autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblpfmobile" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Mobile"></asp:Label>
                                <div class="form-group ">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtpfmobile" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Mobile" autocomplete="off" onkeydown='Number(this.value,event);' onKeyPress="if(this.value.length==10) return false;"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblpfhomenumber" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Home Number"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtpfhomenumber" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Home Number" onkeydown='Number(this.value,event);' autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                              <%-----------------------------%>

                            <div id="ESI-Nominee-Details" class="col-lg-5 col-xl-5">
                                <br />
                                <h6>ESI Nominee Details</h6>
                                                              
                                    <h6><asp:CheckBox ID="CheckBox1esi" runat="server" Text="_Sames as PF Nominee " AutoPostBack="True" OnCheckedChanged="CheckBox1esi_CheckedChanged" /></h6>
                             
                                <asp:Label ID="lblesinomineename" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Nominee's Name"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtesinomineename" CssClass="form-control form-control-sm text-uppercase txtnew " runat="server" placeholder="Nominee's Name" OnTextChanged="txtesinomineename_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblesidateofbirthage" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Date of Birth"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtesidate" runat="server" CssClass="form-control form-control-sm txtnew" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblesirelationship" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Relationship"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtesirelationship" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Relationship" OnTextChanged="txtesirelationship_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblesinoandstreet" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="No.and Street"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtesinoandstreet" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="No.and Street" OnTextChanged="txtesinoandstreet_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblesitownarea" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Town/Area"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtesitownarea" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Town/Area" OnTextChanged="txtesitownarea_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblesistate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="State"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:DropDownList ID="ddlesistate" CssClass="form-control form-control-sm txtnew" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlesistate_SelectedIndexChanged1" AppendDataBoundItems="True">
                                            <asp:ListItem>--------- Select State ----</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <asp:Label ID="lblesicity" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="City"></asp:Label>
                                <div class="form-group ">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:DropDownList ID="ddlesicity" CssClass="form-control form-control-sm txtnew" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlesicity_SelectedIndexChanged">
                                            <asp:ListItem>------ Select City ----</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <asp:Label ID="lblesipincode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Pincode"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtesipincode" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Pincode" onkeydown='Number(this.value,event);' autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblesimobile" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Mobile"></asp:Label>
                                <div class="form-group ">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtesimobile" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Mobile" autocomplete="off" onkeydown='Number(this.value,event);' onKeyPress="if(this.value.length==10) return false;"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblesihomenumber" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Home Number"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtesihomenumber" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Home Number" onkeydown='Number(this.value,event);' autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                              </div>
                                <%-----------------------------%>

                            <div class="row" id="Detailslast">

                                <div id="PF-References-Details" class=" col-lg-12 col-xl-12">
                                    <h6>References Details</h6>

                                    <div class="container">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        <asp:Label ID="lblpersonname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Person's Name" Font-Bold="False" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label ID="lbldesignationrelationship" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Designation/Relationship" Font-Bold="False" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label ID="lblcontactnumber" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Contact Number" Font-Bold="False" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label ID="lblpfemployeestatus" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Employee's Status" Font-Bold="False" Font-Size="Smaller" ></asp:Label></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtRefName1" CssClass="form-control form-control-sm text-uppercase txtnew " runat="server" placeholder="Person's Name 1" OnTextChanged="txtRefName1_TextChanged" autocomplete="off"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="txtdesgRelation1" CssClass="form-control form-control-sm text-uppercase txtnew " runat="server" placeholder="Designation/Relationship" OnTextChanged="txtdesgRelation1_TextChanged" autocomplete="off"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="txtCntNumber1" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Contact Number" onkeydown='Number(this.value,event);' autocomplete="off"></asp:TextBox></td>
                                                    <td>
                                                          <asp:TextBox ID="txtpfemployeestatus" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Status"></asp:TextBox> </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtRefName2" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Person's Name 2" OnTextChanged="txtRefName2_TextChanged" autocomplete="off"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="txtdesgRelation2" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Designation/Relationship" OnTextChanged="txtdesgRelation2_TextChanged" autocomplete="off"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="txtCntNumber2" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Contact Number" onkeydown='Number(this.value,event);' autocomplete="off"></asp:TextBox></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                                <%--<div id="PF-Employee-status" class=" col-lg-2 col-xl-2">
                                    <br />
                                    <br />
                                    <asp:Label ID="lblpfemployeestatus" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Employee's Status"></asp:Label>
                                    <div class="form-group ">
                                        <div class=" col-lg-12 col-xl-12 ">
                                            <asp:TextBox ID="txtpfemployeestatus" CssClass="form-control form-control-sm" runat="server" placeholder="Status"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>--%>
                                <br />
                                
                       <div id="FD-btn" class=" col-lg-12 col-xl-12">
         
                     <%--<asp:Label ID="MessageBox" class="alert alert-secondary" role="alert" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>--%>
        
                         <asp:Button ID="btnupdate" runat="server" CssClass="btn btn-primary" Text="Save" Width="120" OnClick="btnupdate_Click" Style="font-size: smaller" />
                         <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller" />
                         <asp:Button ID="btnclose" runat="server" ValidationGroup="txtemployeeno" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/SubmenuDataMaster.aspx" Width="120" Style="font-size: smaller" />
                      </div>
                      </div>
                      </div>  
                        
                         </ContentTemplate>
            </asp:UpdatePanel>
                          
             </div>
            </div>
       </div>
      </div>
    </div>

       <%---------------------------------------------------------%>
 
        <%------------only Allow Number----------%>

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

    <%--/*---Date Picker----*/--%>

    <script>

        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtepddate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtpfdateofbirthage.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtesidate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        }
    </script>

    <%--/*-----------------*/--%>

    <%--/*---Page Reload----*/--%>

    <script type="text/javascript">
        function pageLoad() {
            if ($('#ContentPlaceHolder1_hidcurrenttab').val() == "2") {
                $('#collapse2').tabpanel('show');
            }
        };
    </script>
    <%--/*--------------------*/--%>

    <%--/*---Message Hide Code----*/--%>

<%--    <script type="text/javascript">
        window.onload = function () {
            var seconds = 2;
            setTimeout(function () {
                document.getElementById("<%=MessageBox.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>--%>

    <%--/*-----------------*/--%>


</asp:Content>

