<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgPayrollAllowanceDescription.aspx.cs" Inherits="PayrollForms_AllowanceDescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">

    <asp:ScriptManager ID="ScriptManager2" runat="server" EnableHistory="true" EnableSecureHistoryState="false">

    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel3" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-clientadd-tab" data-toggle="pill" href="#pills-clientadd" role="tab" aria-controls="pills-clientadd" style="font-size: smaller" aria-selected="true">Description</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" aria-controls="pills-view" style="font-size: smaller" aria-selected="false">Views</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-clientadd" role="tabpanel" aria-labelledby="pills-clientadd-tab">

                    <div class="container-fluid">

                        <h5 class="card-title">Allowance Description</h5>

                        <div id="" class=" col-lg-6 col-xl-6 ">
                            <br />

                            <asp:Label ID="lblclntID" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:DropDownList ID="ddlClntID" CssClass="form-control form-control-sm txtnew text-uppercase" 
                                        runat="server" autocomplete="off" AppendDataBoundItems="True">
                                        <asp:ListItem>---- Select Client -------</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lblType" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Type"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:DropDownList ID="ddlType" CssClass="form-control form-control-sm txtnew text-uppercase" 
                                        runat="server" autocomplete="off">
                                        <asp:ListItem>Select Type</asp:ListItem>
                                        <asp:ListItem>A1</asp:ListItem>
                                        <asp:ListItem>A2</asp:ListItem>
                                        <asp:ListItem>A3</asp:ListItem>
                                        <asp:ListItem>A4</asp:ListItem>
                                        <asp:ListItem>A5</asp:ListItem>
                                        <asp:ListItem>A6</asp:ListItem>
                                        <asp:ListItem>A7</asp:ListItem>
                                        <asp:ListItem>A8</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <asp:Label ID="lblDescrip" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Description"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtDescrip" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" 
                                        placeholder="Description" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>


                            <asp:Label ID="lblDeduct" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Deduction Type"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:DropDownList ID="ddlDeductType" CssClass="form-control form-control-sm txtnew text-uppercase" 
                                        runat="server" autocomplete="off" AppendDataBoundItems="True">
                                        <asp:ListItem>--Deduction Type--</asp:ListItem>
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>


                            <div class="row">

                                <div id="CA-btn" class="col-lg-12 col-xl-12">

                                    <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>

                                    <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" Style="font-size: smaller" OnClick="btnsave_Click"/>

                                    <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary  " Text="New" Width="120" Style="font-size: smaller" OnClick="btnnew_Click"/>

                                    <asp:Button ID="btncancel" runat="server" ValidationGroup="txtaddstate" CssClass="btn btn-primary" 
                                        Text="Close" PostBackUrl="~/PayrollForms/AllowanceDescription.aspx" Width="120" Style="font-size: smaller"/>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="pills-view" role="tabpanel" aria-labelledby="pills-view-tab">

                    <div id="tableview-endview" class=" col-lg-12 col-xl-12 ">

                        <asp:GridView ID="DGdescription" CssClass="table table-hover table-secondary" HeaderStyle-CssClass="FixedHeader"
                            HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" runat="server"
                            AutoGenerateColumns="false" Font-Size="10pt" OnSelectedIndexChanged="DGdescription_SelectedIndexChanged">

                            <Columns>
                                <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True"
                                    CausesValidation="False" />

                                <asp:TemplateField HeaderText="ALLDESID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAlldesID" runat="server" Text='<%# Bind("ALLDESID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="CLIENTID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblClntId" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="CLIENT NAME">
                                    <ItemTemplate>
                                        <asp:Label ID="lblClntName" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="CODE">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCode" runat="server" Text='<%# Bind("ALLDESCODE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="DESCRIPTION">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldesName" runat="server" Text='<%# Bind("DESCRIPTION") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="TYPE">
                                    <ItemTemplate>
                                        <asp:Label ID="lblType" runat="server" Text='<%# Bind("TYPE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="150px"></ControlStyle>
                                </asp:TemplateField>


                            </Columns>

                            <RowStyle BackColor="#f5f5ef" />
                            <FooterStyle HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:GridView>

                    </div>

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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgPayrollDescription.aspx" Width="120" style="font-size: smaller" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/SubmenuPayroll.aspx" Width="120" style="font-size: smaller" />
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

