<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgOffRollLCM-ESIGenerate.aspx.cs" Inherits="PayrollForms_PgOffRollLCM_ESIGenerate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-departmentmaster-tab" data-toggle="pill" href="#pills-departmentmaster" role="tab" aria-controls="pills-departmentmaster" style="font-size: smaller" aria-selected="true">ESI Generate</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-update-tab" data-toggle="pill" href="#pills-update" role="tab" aria-controls="pills-update" style="font-size: smaller" aria-selected="false">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-departmentmaster" role="tabpanel" aria-labelledby="pills-departmentmaster-tab">

                    <div class="container-fluid">

                        <h6 class="card-title">ESI Generate</h6>

                        <div class="row col-lg-12 col-xl-12">

                            <div id="" class=" col-lg-3 col-xl-3">
                                <asp:Label ID="lblesimonth" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Select ESI Month"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:DropDownList ID="ddlesimonth" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoPostBack="True" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlesimonth_SelectedIndexChanged">
                                            <asp:ListItem>---- Select ESI Month -------</asp:ListItem>
                                            <asp:ListItem>January</asp:ListItem>
                                            <asp:ListItem>February</asp:ListItem>
                                            <asp:ListItem>March</asp:ListItem>
                                            <asp:ListItem>April</asp:ListItem>
                                            <asp:ListItem>May</asp:ListItem>
                                            <asp:ListItem>June</asp:ListItem>
                                            <asp:ListItem>July</asp:ListItem>
                                            <asp:ListItem>August</asp:ListItem>
                                            <asp:ListItem>September</asp:ListItem>
                                            <asp:ListItem>October</asp:ListItem>
                                            <asp:ListItem>November</asp:ListItem>
                                            <asp:ListItem>December</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                            </div>

                            <div id="" class=" col-lg-2 col-xl-2">

                                <asp:Label ID="lblesigeneratedate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="ESI Generate Date"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtesigeneratedate" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                            </div>

                            <div id="" class=" col-lg-3 col-xl-3">

                                <asp:Label ID="lblselectoption" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Select Type"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-10 col-xl-10">
                                        <asp:DropDownList ID="ddlselect" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server">
                                            <asp:ListItem>---Select Type---</asp:ListItem>
                                            <asp:ListItem>J</asp:ListItem>
                                            <asp:ListItem>C</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                            </div>

                            <div id="" class=" col-lg-2 col-xl-2">

                                <asp:Label ID="lblb" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text=""></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12">
                                        <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="Generate" Width="120" Style="font-size: smaller" OnClick="btnview_Click" />
                                    </div>
                                </div>
                            </div>

                        </div>

                        <h6 class="card-title">ESI Contribution Details</h6>

                        <div class="row">

                            <div id="" class="col-lg-5 col-xl-5">

                                <div class="form-group row">
                                    <asp:Label ID="lbltotalemployercontribution" runat="server" CssClass="label-conrol col-sm-6 lblnew" Style="font-size: smaller" Text="Total Employer Contribution"></asp:Label>
                                    <asp:Label ID="Label1" runat="server" CssClass="label-conrol  col-sm-3 " Style="font-size: smaller" Text="3.25 %"></asp:Label>
                                    <asp:TextBox ID="txttotalemployercontribution" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-3" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group row">
                                    <asp:Label ID="lbltotalemployeecontribution" runat="server" CssClass="label-conrol col-sm-6 lblnew" Style="font-size: smaller" Text="Total Employee Contribution"></asp:Label>
                                    <asp:Label ID="Label3" runat="server" CssClass="label-conrol  col-sm-3 " Style="font-size: smaller" Text="0.75 %"></asp:Label>
                                    <asp:TextBox ID="txttotalemployeecontribution" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-3" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group row">
                                    <asp:Label ID="Label2" runat="server" CssClass="label-conrol col-sm-6 lblnew" Style="font-size: smaller" Text="Total ESI Contribution"></asp:Label>
                                    <asp:Label ID="Label4" runat="server" CssClass="label-conrol  col-sm-3 " Style="font-size: smaller" Text="4 %"></asp:Label>
                                    <asp:TextBox ID="txttotalesicontribution" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-3" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>

                            </div>

                            <div id="" class="col-lg-4 col-xl-4">

                                <div class="form-group row">
                                    <asp:Label ID="lblPreviousESIStrength" runat="server" CssClass="label-conrol col-sm-6 lblnew" Style="font-size: smaller" Text="Previous ESI Strength"></asp:Label>
                                    <asp:TextBox ID="txtPreviousESIStrength" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-5" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group row">
                                    <asp:Label ID="lblMemberAddition" runat="server" CssClass="label-conrol col-sm-6 lblnew" Style="font-size: smaller" Text="Member Addition"></asp:Label>
                                    <asp:TextBox ID="txtMemberAddition" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-5" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group row">
                                    <asp:Label ID="lblMemberDeletion" runat="server" CssClass="label-conrol col-sm-6 lblnew" Style="font-size: smaller" Text="Member Deletion"></asp:Label>
                                    <asp:TextBox ID="txtMemberDeletion" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-5" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>

                            </div>

                            <div id="" class="col-lg-3 col-xl-3">

                                <div class="form-group row">
                                    <asp:Label ID="lblCurrentStrength" runat="server" CssClass="label-conrol col-sm-7 lblnew" Style="font-size: smaller" Text="Current Strength"></asp:Label>
                                    <asp:TextBox ID="txtCurrentStrength" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-5" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group row">
                                    <asp:Label ID="lblTotalActionStrength" runat="server" CssClass="label-conrol col-sm-7 lblnew" Style="font-size: smaller" Text="Total Action Strength"></asp:Label>
                                    <asp:TextBox ID="txtTotalActionStrength" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-5" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>


                                <div class="form-group row">
                                    <asp:Label ID="lblcurrentesiStrength" runat="server" CssClass="label-conrol col-sm-7 lblnew" Style="font-size: smaller" Text="Current ESI Strength"></asp:Label>
                                    <asp:TextBox ID="txtcurrentesiStrength" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-5" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>

                            </div>

                        </div>

                        <div class="row">

                            <div id="tableview-frontview" class="col-lg-12 col-xl-12">

                                <asp:GridView ID="DgESIGenerate" runat="server" CssClass="table table-hover table-secondary"
                                    HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px"
                                    Font-Size="10pt" AutoGenerateColumns="false" ShowFooter="True">

                                    <Columns>

                                        <asp:TemplateField HeaderText="EMPLOYEE ID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblempid" runat="server" Text='<%# Bind("EMPLOYEEID") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="CLIENT ID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblclientid" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="EMP.ID No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblempidno" runat="server" Text='<%# Bind("EMPLOYEECODE") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="130px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="IP Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblIpnumber" runat="server" Text='<%# Bind("ESINO") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="IP Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblipname" runat="server" Text='<%# Bind("APPLICATIONAME") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="No of Work Days">
                                            <ItemTemplate>
                                                <asp:Label ID="lblnoofdays" runat="server" Text='<%# Bind("WORKDAYS") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Total Monthly ESI Wages">
                                            <ItemTemplate>
                                                <asp:Label ID="lbltotalmonthlyesiwages" runat="server" Text='<%# Bind("ESIWAGES") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Client Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblclientname" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Division">
                                            <ItemTemplate>
                                                <asp:Label ID="lbldivision" runat="server" Text='<%# Bind("DIVISION") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Employee Contribution">
                                            <ItemTemplate>
                                                <asp:Label ID="lblemployeecontribution" runat="server" Text='<%# Bind("ESIEMPLOYEES") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                            <FooterTemplate>
                                                <asp:TextBox ID="txtFootemployeecontribution" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Employer Contribution">
                                            <ItemTemplate>
                                                <asp:Label ID="lblemployercontribution" runat="server" Text='<%# Bind("ESIEMPLOYERS") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                            <FooterTemplate>
                                                <asp:TextBox ID="txtFootemployercontribution" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Total ESI Contribution">
                                            <ItemTemplate>
                                                <asp:Label ID="lbltotalesicontribution" runat="server" Text='<%# Bind("TOTAL") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="100px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                            <FooterTemplate>
                                                <asp:TextBox ID="txtFoottotalesicontribution" runat="server" CssClass="form-control form-control-sm txtnew text-uppercase" ReadOnly="true" Width="75" Text='' placeholder="0"></asp:TextBox>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Previous ESI Strength" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblperviousesistrenght" runat="server" Text='<%# Bind("LASTEMP") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Member Addition" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblmemberaddition" runat="server" Text='<%# Bind("JOINEMP") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Member Deletion" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblmemberdeletion" runat="server" Text='<%# Bind("RELEVEPM") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Current Strength" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcurrentstrength" runat="server" Text='<%# Bind("CURRENTEMP") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Total Action Strength" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lbltotalactionstrength" runat="server" Text='<%# Bind("TOTACTSTRENGTH") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                    </Columns>

                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <RowStyle BackColor="#f5f5ef" />
                                </asp:GridView>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div id="CM-btn" class="col-lg-12 col-xl-12">
                                <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>

                                <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" Text="Save" Width="120" Style="font-size: smaller" OnClick="btnsave_Click" />

                                <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" Style="font-size: smaller" OnClick="btnnew_Click" />

                                <asp:Button ID="btncancel" runat="server" ValidationGroup="txtdepartmentname" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/SubmenuOffRollLCM.aspx" Width="120" Style="font-size: smaller" />

                            </div>

                        </div>

                    </div>
                </div>

                <%-------------------------------view--------------------------------%>

                <div class="tab-pane fade" id="pills-update" role="tabpanel" aria-labelledby="pills-update-tab">
                    <br />
                    <br />
                    <div class="row">

                        <div id="tableview-endview" class=" col-lg-12 col-xl-12 ">
                            <br />
                            <asp:GridView ID="DGESIgenerateBS" runat="server" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CssClass="table table-hover table-secondary" Width="289px" Font-Size="10pt" AutoGenerateColumns="false" OnSelectedIndexChanged="DGESIgenerateBS_SelectedIndexChanged">
                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" CausesValidation="False" />

                                    <asp:TemplateField HeaderText="ESIG ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblesigid" runat="server" Text='<%# Bind("ESIGID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ESI Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblesidate" runat="server" Text='<%# Bind("ESIDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltype" runat="server" Text='<%# Bind("TYPE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ESI Month">
                                        <ItemTemplate>
                                            <asp:Label ID="lblesimonth" runat="server" Text='<%# Bind("ESIMONTH") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Pre Strength">
                                        <ItemTemplate>
                                            <asp:Label ID="lblesiprestrength" runat="server" Text='<%# Bind("PRESTRENGTH") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Member Addition">
                                        <ItemTemplate>
                                            <asp:Label ID="lblmemberaddition" runat="server" Text='<%# Bind("MEMADDITION") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Member Deletion">
                                        <ItemTemplate>
                                            <asp:Label ID="lblmemberdeletion" runat="server" Text='<%# Bind("MEMDELETION") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Current Strength">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcurrentstrength" runat="server" Text='<%# Bind("CURRSTRENGTH") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total Action Strength">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltotalactionstrength" runat="server" Text='<%# Bind("TOTACTSTRENGTH") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                        <ItemStyle Wrap="False" />
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgOffRollLCM-ESIGenerate.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/SubmenuOffRollLCM.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

        </ContentTemplate>

        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="DGESIgenerateBS" />
        </Triggers>
    </asp:UpdatePanel>

    <%--/*--------------------------------------------*/--%>

    <%--/*---Date Picker----*/--%>

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtesigeneratedate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
        }
    </script>

    <%--/*----------------------*/--%>
</asp:Content>

