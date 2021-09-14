<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="PgMasterAccountYearMaster.aspx.cs" Inherits="PageAccountYearMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-clientdetail-tab" data-toggle="pill" href="#pills-clientdetail" role="tab" aria-controls="pills-clientdetail" Style="font-size: smaller" aria-selected="true">Client Details</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" aria-controls="pills-view" Style="font-size: smaller" aria-selected="false">Views</a>
                </li>

            </ul>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-clientdetail" role="tabpanel" aria-labelledby="pills-clientdetail-tab">

                    <div>
                        <h6 class="card-title">Account Year Master</h6>
                    </div>

                    <div class="row col-lg-12 col-xl-12">

                        <div id="AYM-Account-Year-Master" class=" col-lg-6 col-xl-6 ">
                            <br />

                            <asp:Label ID="lblaccountfromdate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Account From Date *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtaccountfromdate" runat="server" CssClass="form-control form-control-sm txtnew" AutoPostBack="True" OnTextChanged="txtaccountfromdate_TextChanged2"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblaccounttodate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Account To Date *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtaccounttodate" runat="server" CssClass="form-control form-control-sm txtnew" AutoPostBack="True" OnTextChanged="txtaccounttodate_TextChanged1"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblnewname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Account Year *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtnewname" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Account Year"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row">

                        <div id="AYM-btn" class=" col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 ">

                            <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>

                            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" OnClick="btnsave_Click" Style="font-size: smaller"/>

                            <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary " Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller"/>

                            <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary " Text="Close" PostBackUrl="~/PayrollForms/submenumaster.aspx" Width="120" Style="font-size: smaller"/>

                        </div>
                    </div>

                </div>

                <div class="tab-pane fade" id="pills-view" role="tabpanel" aria-labelledby="pills-view-tab">
                    <br />
                     <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />
                    <div class="row">
                        <br />
                        <div id="tableview-endview" class=" col-lg-12 col-xl-12">

                            <asp:GridView ID="DgAccount" runat="server" CssClass="table table-hover table-secondary" HeaderStyle-CssClass="GVFixedHeader" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" OnSelectedIndexChanged="DgAccount_SelectedIndexChanged" AutoGenerateColumns="false" Font-Size="10pt">
                                <Columns>

                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" />

                                    <asp:TemplateField HeaderText="ACCYEARID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblaccyearid" runat="server" Text='<%# Bind("ACCYEARID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="FROM DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblaccfromdate" runat="server" Text='<%# Bind("FROMDATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="170px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TO DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblacctodate" runat="server" Text='<%# Bind("TODATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="170px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ACCOUNT YEAR">
                                        <ItemTemplate>
                                            <asp:Label ID="lblaccyear" runat="server" Text='<%# Bind("ACCOUNTYEAR") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="170px"></ControlStyle>
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgMasterAccountYearMaster.aspx" Width="120" Style="font-size: smaller"/>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/submenumaster.aspx" Width="120" Style="font-size: smaller"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <%--/*-------------------------------------------*/--%>

    <%--/*---Page Reload----*/--%>

    <script type="text/javascript">
        function pageLoad() {
            if ($('#ContentPlaceHolder1_hidcurrenttab').val() == "2") {
                $('#pills-view-tab').tab('show');
            }
        };
    </script>
    <%--/*--------------------*/--%>

    <%--/*---Date Picker----*/--%>

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtaccountfromdate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtaccounttodate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        }

    </script>

</asp:Content>

