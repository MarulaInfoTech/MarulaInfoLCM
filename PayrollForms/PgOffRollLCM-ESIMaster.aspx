<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgOffRollLCM-ESIMaster.aspx.cs" Inherits="PayrollForms_PgOffRollLCM_ESIMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-companymaster-tab" data-toggle="pill" href="#pills-companymaster" role="tab" aria-controls="pills-companymaster" style="font-size: smaller" aria-selected="true">ESI Master</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" style="font-size: smaller" aria-selected="true" aria-controls="pills-view">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">

                <div class="tab-pane fade active show" id="pills-companymaster" role="tabpanel" aria-labelledby="pills-companymaster-tab">
                    <h6>ESI Master</h6>
                    <br /><br />
                    <div class="row justify-content-center col-lg-12 col-xl-12">

                        <div id="invoiceformat2" class="col-lg-5 col-xl-5">

                            <div class="form-group row ">
                                <asp:Label ID="lblesiname" runat="server" CssClass="label-conrol col-sm-6 lblnew" Style="font-size: smaller" Text="ESI Name"></asp:Label>
                                <asp:TextBox ID="txtesiname" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-5" autocomplete="off" runat="server" AutoPostBack="True"></asp:TextBox>                           
                            </div>

                            <div class="form-group row ">
                                <asp:Label ID="lblemployeecontribution" runat="server" CssClass="label-conrol col-sm-6 lblnew" Style="font-size: smaller" Text="Employee Contribution"></asp:Label>
                                <asp:TextBox ID="txtemployeecontribution" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-5" autocomplete="off" runat="server" AutoPostBack="True"></asp:TextBox>                           
                            </div>

                            <div class="form-group row ">
                                <asp:Label ID="lblemployercontribution" runat="server" CssClass="label-conrol col-sm-6 lblnew" Style="font-size: smaller" Text="Employer Contribution"></asp:Label>
                                <asp:TextBox ID="txtemployercontribution" CssClass="form-control form-control-sm text-uppercase txtnew col-sm-5" autocomplete="off" runat="server" AutoPostBack="True"></asp:TextBox>                           
                            </div>

                        </div>
                    </div>

                    <div class="container">
                        <div class="text-center">
                            <br />

                            <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>

                            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" Text="Save" Width="120" OnClientClick="return validate()" Style="font-size: smaller" OnClick="btnsave_Click" />

                            <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" Style="font-size: smaller" OnClick="btnnew_Click" />

                            <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/SubmenuoffrollLcm-PF-ESIMaster.aspx" Width="120" Style="font-size: smaller" />

                        </div>
                    </div>

                </div>

                <%-------------------------------view--------------------------------%>

                <div class="tab-pane fade" id="pills-view" role="tabpanel">

                    <br />

                    <div class="row">
                        <div id="tableview-endview" class=" col-lg-12 col-xl-12">

                            <asp:GridView ID="GgESIMaster" runat="server" AutoGenerateColumns="false" CssClass="table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Font-Size="10pt" OnSelectedIndexChanged="GgESIMaster_SelectedIndexChanged">
                                <Columns>

                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" />

                                    <asp:TemplateField HeaderText="ESIID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblESIID" runat="server" Text='<%# Bind("ESIID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ESI NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblesiname" runat="server" Text='<%# Bind("ESINAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="120px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Employee Contribution">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmployeeContribution" runat="server" Text='<%# Bind("ESIEMPLOYEES") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="120px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Employer Contribution">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmployerContribution" runat="server" Text='<%# Bind("ESIEMPLOYERS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="120px"></ControlStyle>
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgOffRollLCM-ESIMaster.aspx" Width="120" Style="font-size: smaller" />
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

    </asp:UpdatePanel>


</asp:Content>

