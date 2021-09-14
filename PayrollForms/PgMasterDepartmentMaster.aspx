<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="PgMasterDepartmentMaster.aspx.cs" Inherits="PageDepartmentMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-departmentmaster-tab" data-toggle="pill" href="#pills-departmentmaster" role="tab" aria-controls="pills-departmentmaster" Style="font-size: smaller" aria-selected="true">Department Master</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-update-tab" data-toggle="pill" href="#pills-update" role="tab" aria-controls="pills-update" Style="font-size: smaller" aria-selected="false">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-departmentmaster" role="tabpanel" aria-labelledby="pills-departmentmaster-tab">

                    <div class="container-fluid">

                        <h6 class="card-title">Department Master</h6>

                        <div class="row col-lg-12 col-xl-12"> <%--justify-content-center--%>

                            <div id="DM-DepartmentMaster" class=" col-lg-6 col-xl-6 ">
                                <br />

                                <asp:Label ID="lblclientname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name *"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:DropDownList ID="ddlclientname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" OnSelectedIndexChanged="ddlclientname_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                                            <asp:ListItem>---- Select Client -------</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <asp:Label ID="lblDivi" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Division"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtdivi" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Division" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lbldepartmentcode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Department Code"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtdepartmentcode" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Department Code" ReadOnly="True" OnTextChanged="txtdepartmentcode_TextChanged"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Label ID="lbldepartmentname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Department Name *"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtdepartmentname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Department Name" OnTextChanged="txtdepartmentname_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="row">

                            <div id="CA-btn" class="col-lg-12 col-xl-12">

                                <asp:Label ID="TypeID" runat="server" Text="Label" Visible="false"></asp:Label>

                                <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" Autopostback="True" Text="Save" Width="120" OnClick="btnsave_Click" OnClientClick="return validate()" Style="font-size: smaller"/>

                                <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller"/>

                                <asp:Button ID="btncancel" runat="server" ValidationGroup="txtdepartmentname" CssClass="btn btn-primary  " Text="Close" PostBackUrl="~/PayrollForms/submenumaster.aspx" Width="120" Style="font-size: smaller"/>

                            </div>

                        </div>

                    </div>
                </div>

                <%-------------------------------view--------------------------------%>

                <div class="tab-pane fade" id="pills-update" role="tabpanel" aria-labelledby="pills-update-tab">

                    <div class="row">

                        <div id="view" class=" col-lg-4 col-xl-4 ">

                            <asp:Label ID="lblclientnameview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:DropDownList ID="ddlclientnameview" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server"></asp:DropDownList>
                                </div>
                            </div>

                        </div>

                        <div id="" class=" col-lg-4 col-xl-4 ">
                            <br />
                            <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="120" OnClick="btnview_Click" Style="font-size: smaller"/>

                            <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />
                        </div>
                    </div>

                    <br />
                    <div class="row">

                        <div id="tableview-endview" class=" col-lg-12 col-xl-12 ">
                            <br />
                            <asp:GridView ID="DgDepartment" runat="server" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CssClass="table table-hover table-secondary" OnSelectedIndexChanged="DgDepartment_SelectedIndexChanged" AutoGenerateColumns="false" Width="289px" Font-Size="10pt">
                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" CausesValidation="False" />
                                    <asp:TemplateField HeaderText="Employee ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDptID" runat="server" Text='<%# Bind("DEPARTMENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblClntName" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="350px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DIVISION">
                                        <ItemTemplate>
                                            <asp:Label ID="lblClntdivision" runat="server" Text='<%# Bind("DIVISION") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEPARTMENT CODE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDptCode" runat="server" Text='<%# Bind("DEPARTMENTCODE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="DEPARTMENT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDptName" runat="server" Text='<%# Bind("DEPARTMENTNAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="350px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CLIENTID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblClntID" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                </Columns>
                                <HeaderStyle HorizontalAlign="Center" />
                                <RowStyle BackColor="#f5f5ef" HorizontalAlign="Center" />
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgMasterDepartmentMaster.aspx" Width="120" Style="font-size: smaller"/>
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

    <%---------------------------------------------------%>

    <%--/*---Page Reload----*/--%>

    <script type="text/javascript">

        function pageLoad() {
            if ($('#ContentPlaceHolder1_hidcurrenttab').val() == "2") {
                $('#pills-update-tab').tab('show');
            }
        };

    </script>

    <%--/*-----------------*/--%>

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

    <%--/*-------------------------------------------------*/--%>
</asp:Content>

