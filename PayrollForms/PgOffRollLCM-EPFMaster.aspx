<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgOffRollLCM-EPFMaster.aspx.cs" Inherits="PayrollForms_PgOffRollLCM_EPFMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">


    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-companymaster-tab" data-toggle="pill" href="#pills-companymaster" role="tab" aria-controls="pills-companymaster" style="font-size: smaller" aria-selected="true">EPF Master</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" style="font-size: smaller" aria-selected="true" aria-controls="pills-view">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">

                <div class="tab-pane fade active show" id="pills-companymaster" role="tabpanel" aria-labelledby="pills-companymaster-tab">

                    <div>
                        <h6 class="card-title">EPF-Master</h6>
                    </div>
                    <br />

                    <div class="col-lg-12 col-xl-12" id="divHolder">

                        <div class="row">

                            <div>

                                <asp:Label ID="lblesi" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="PF Name"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-6 col-xl-6">
                                        <asp:TextBox ID="txtesi" CssClass="form-control form-control-sm txtnew" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lbltotalepfcontribution" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Total EPF Contribution A/C 1"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtTotalEPFContributionAC1" CssClass="form-control form-control-sm txtnew" runat="server" TextMode="Number" autocomplete="off" AutoPostBack="True" OnTextChanged="txtTotalEPFContributionAC1_TextChanged"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lbltotalepscontribution" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Total EPS Contribution A/C 10"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtTotalEPSContributionAC10" CssClass="form-control form-control-sm text-uppercase txtnew" TextMode="Number" autocomplete="off" runat="server" AutoPostBack="True" OnTextChanged="txtTotalEPSContributionAC10_TextChanged"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblTotalDifferenceBetweenepfepsac1" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Total Difference Between EPF & EPS A/C1"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtTotalDifferenceBetweenEPFEPSAC1" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" TextMode="Number" autocomplete="off" AutoPostBack="True" OnTextChanged="txtTotalDifferenceBetweenEPFEPSAC1_TextChanged"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblTotalEdlicontributionershareac21" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Total EDLI Contribution Share A/C 21"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtTotalEDLIContributionERShareAC21" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" TextMode="Number" autocomplete="off" AutoPostBack="True" OnTextChanged="txtTotalEDLIContributionERShareAC21_TextChanged"></asp:TextBox>
                                    </div>
                                </div>

                            </div>

                            <div>

                                <asp:Label ID="o" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text=""></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-12 col-xl-12">
                                    </div>
                                </div>
                                <br />


                                <asp:Label ID="lblTotalEPFChargesAdministrationAC2" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Total EPF Charges (Administration) A/C 2"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtTotalEPFChargesAdministrationAC2" CssClass="form-control form-control-sm txtnew" runat="server" autocomplete="off" TextMode="Number" AutoPostBack="True" OnTextChanged="txtTotalEPFChargesAdministrationAC2_TextChanged"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblTotalEDLIChargesAdministrationAC22" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Total EDLI Charges (Administration) A/C 22"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtTotalEDLIChargesAdministrationAC22" CssClass="form-control form-control-sm txtnew" runat="server" autocomplete="off" TextMode="Number" AutoPostBack="True" OnTextChanged="txtTotalEDLIChargesAdministrationAC22_TextChanged"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblTotalRefundofAdvanceAC1" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Total Refund of Advance A/C 1"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtTotalRefundofAdvanceAC1" CssClass="form-control form-control-sm txtnew" runat="server" autocomplete="off" TextMode="Number" AutoPostBack="True" OnTextChanged="txtTotalRefundofAdvanceAC1_TextChanged"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lblAllTotal" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="All Total"></asp:Label>
                                <div class="form-group">
                                    <div class="col-lg-12 col-xl-12">
                                        <asp:TextBox ID="txtAllTotal" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Total" TextMode="Number" autocomplete="off" AutoPostBack="True" OnTextChanged="txtAllTotal_TextChanged"></asp:TextBox>
                                    </div>
                                </div>

                            </div>

                        </div>

                        <br />
                        <div class="row">
                            <div id="CM-btn" class="col-lg-12 col-xl-12">
                                <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>

                                <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary btnupdate" AutoPostback="True" Text="Save" Width="120" OnClientClick=" return validate()" Style="font-size: smaller" OnClick="btnsave_Click" />

                                <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" Style="font-size: smaller" OnClick="btnnew_Click" />

                                <asp:Button ID="btnclose" runat="server" ValidationGroup="txtcompanycode" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/SubmenuoffrollLcm-PF-ESIMaster.aspx" Width="120" Style="font-size: smaller" />
                            </div>
                        </div>

                    </div>
                </div>

                <%---------------------view-------------------------%>


                <div class="tab-pane fade" id="pills-view" role="tabpanel">

                    <br />

                    <div class="row">

                        <div id="tableview-endview" class=" col-lg-12 col-xl-12">
                            <%-- Grid table table-hover table-secondary--%>

                            <asp:GridView ID="GgEPFMaster" runat="server" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CssClass="table table-hover table-secondary" Width="500px" Font-Size="10pt" AutoGenerateColumns="false" OnSelectedIndexChanged="GgEPFMaster_SelectedIndexChanged">

                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" CausesValidation="False" />

                                    <asp:TemplateField HeaderText="PFID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPFID" runat="server" Text='<%# Bind("PFID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PF Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPFNAME" runat="server" Text='<%# Bind("PFNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="120px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total EPF Contribution A/C 1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAC0" runat="server" Text='<%# Bind("PFEMPLOYEESEPF") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total EPS Contribution A/C 10">
                                        <ItemTemplate>
                                            <asp:Label ID="lblac10" runat="server" Text='<%# Bind("PFEMPLOYERSEPF") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total Difference Between EPF & EPS A/C1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAC1" runat="server" Text='<%# Bind("PFEMPLOYERSEPS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="170px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total EDLI Contribution Share A/C 21">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAC21" runat="server" Text='<%# Bind("ADMINCHARGES") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total EPF Charges (Administration) A/C 2">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAC2" runat="server" Text='<%# Bind("PFACCOUNT") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total EDLI Charges (Administration) A/C 22">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAC22" runat="server" Text='<%# Bind("EDLI") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total Refund of Advance A/C 1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRefund" runat="server" Text='<%# Bind("REFUND") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="All Total">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotal" runat="server" Text='<%# Bind("TOTAL") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                </Columns>

                                <RowStyle BackColor="#f5f5ef" />
                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgOffRollLCM-EPFMaster.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/SubmenuoffrollLcm-PF-ESIMaster.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </ContentTemplate>

        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="GgEPFMaster" />
        </Triggers>
    </asp:UpdatePanel>


</asp:Content>

