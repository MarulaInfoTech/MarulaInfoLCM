<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgLCMInvoiceDepartmentValueSetting.aspx.cs" Inherits="PayrollForms_DepartmentValue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-companymaster-tab" data-toggle="pill" href="#pills-companymaster" role="tab" aria-controls="pills-companymaster" style="font-size: smaller" aria-selected="true">Department Value</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark " id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" style="font-size: smaller" aria-selected="true" aria-controls="pills-view">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">

                <div class="tab-pane fade active show" id="pills-companymaster" role="tabpanel" aria-labelledby="pills-companymaster-tab">

                    <h6>Department Value</h6>
                    <br />
                   
                        <div id="departmentvalue1" class="col-lg-4 col-xl-4">

                            <div class="form-group row">
                                <asp:Label ID="lblclientname" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Client Name"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlclientname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlclientname_SelectedIndexChanged">
                                        <asp:ListItem>---Select Clinet Name---</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="lbldepartment" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Department"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddldepartment" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True">
                                        <asp:ListItem>---Select Department---</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group row ">
                                <asp:Label ID="lbldayrate" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Day Rate"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtdayrate" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row ">
                                <asp:Label ID="lblotrate" runat="server" CssClass="label-control col-sm-12 lblnew" Text="OT Rate"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtotrate" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        
                        <br />
                        
                            <div class="row">
                                <div class=" col-lg-12 col-xl-12">                                  
                                    <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>

                                    <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" style="font-size: smaller" Text="Save" Width="120" OnClick="btnsave_Click" OnClientClick="return validate()" />

                                    <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" style="font-size: smaller" Text="New" Width="120" OnClick="btnnew_Click" />

                                    <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" style="font-size: smaller" Text="Close" Width="120" PostBackUrl="~/PayrollForms/SubmenuInvoices.aspx"/>

                                </div>
                            </div>                                        
                </div>

                <%-------------------------------view--------------------------------%>

                <div class="tab-pane fade" id="pills-view" role="tabpanel">

                    <div class="row">
                        <div id="departmentvalueview1" class="col-lg-4 col-xl-4">
                            <div class="form-group row">
                                <asp:Label ID="lblclientnameview" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Client Name"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlclientnameview" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server">
                                        <asp:ListItem>---Select Clicent Name---</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group row">
                                <asp:Label ID="lbldepartmentview" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Department"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddldepaartmentview" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server">
                                        <asp:ListItem>---Select Department---</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div id="departmentvalueview2" class="col-lg-2 col-xl-2">
                            <br />
                            <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary form-control-sm" Text="View" Width="120" OnClick="btnview_Click" />

                             <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <br />
                        <div id="tableview-endview" class=" col-lg-12 col-xl-12">

                            <asp:GridView ID="Dgbankview" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="Dgbankview_SelectedIndexChanged" CssClass="table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Font-Size="10pt">
                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" />

                                    <asp:TemplateField HeaderText="COMPANY ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCOMPANYID" runat="server" Text='<%# Bind("COMPANYID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENT ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCLIENTID" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEPARTMENT ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDEPARTMENTID" runat="server" Text='<%# Bind("DEPARTMENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCLIENTNAME" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEPARTMENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDEPARTMENTNAME" runat="server" Text='<%# Bind("DEPARTMENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DAY RATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDAYRATE" runat="server" Text='<%# Bind("DAYRATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="OT RATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblOTRATE" runat="server" Text='<%# Bind("OTRATE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DPTVAL ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDPTVALID" runat="server" Text='<%# Bind("DPTVALID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" style="font-size: smaller" Text="Back" PostBackUrl="~/PayrollForms/PgLCMInvoiceDepartmentValueSetting.aspx" Width="120" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" style="font-size: smaller" Text="Master Menu" PostBackUrl="~/PayrollForms/SubmenuInvoices.aspx" Width="120" />
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


    <%--/*---Message Validation----*/--%>


    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=ddlclientname.ClientID%>").value == "") {
                alert("Enter The Client Name");
                document.getElementById("<%=ddlclientname.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>

<%--/*-------------------------------------------*/--%>

</asp:Content>

