<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="PgMasterQualificationMaster.aspx.cs" Inherits="PageQualificationMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-qualification-tab" data-toggle="pill" href="#pills-qualification" role="tab" aria-controls="pills-qualification" Style="font-size: smaller" aria-selected="true">Qualification</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-update-tab" data-toggle="pill" href="#pills-update" role="tab" aria-controls="pills-update" Style="font-size: smaller" aria-selected="false">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-qualification" role="tabpanel" aria-labelledby="pills-qualification-tab">

                    <div class="container-fluid">

                        <h6 class="card-title">Qualification Master</h6>
                        <br />
                        <div class="row col-lg-12 col-xl-12">

                            <div id="DM-DepartmentMaster1" class=" col-lg-8 col-xl-8">

                                <asp:Label ID="lblcategory" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Category *"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <div class="row">
                                            <div class="col-6">
                                                <asp:DropDownList ID="ddlcategory" CssClass="form-control form-control-sm txtnew" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlcategory_SelectedIndexChanged">
                                                    <asp:ListItem>------ Select Category -----</asp:ListItem>
                                                    <asp:ListItem>Other</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-6 ">
                                                <asp:TextBox ID="txtcategory" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="Category" Enabled="False" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <asp:Label ID="lblqualification" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Qualification *"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <div class="row">
                                            <div class="col-6">
                                                <asp:DropDownList ID="ddlqualification" CssClass="form-control form-control-sm txtnew" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlqualification_SelectedIndexChanged">
                                                    <asp:ListItem>------ Select Qualification -----</asp:ListItem>
                                                    <asp:ListItem>Other</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-6 ">
                                                <asp:TextBox ID="txtqualification" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="Qualification" Enabled="False" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <asp:Label ID="lblnewcoursename" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="New Course Name *"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-11 col-xl-11">
                                        <asp:TextBox ID="txtnewcoursename" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="New Course Name" autocomplete="off" OnTextChanged="txtnewcoursename_TextChanged"></asp:TextBox>
                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="row">

                            <asp:Label ID="MessageBox" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria" Visible="False"></asp:Label>

                            <div id="QM-btn" class="col-lg-12 col-xl-12">

                                <asp:Label ID="Typeid" runat="server" Text="" Visible="false"></asp:Label>

                                <asp:Button ID="btnsave" runat="server" OnClientClick="myJSfunction(); return false" CssClass="btn btn-primary " Text="Save" Width="120" OnClick="btnsave_Click" style="font-size:smaller" />

                                <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary" Text="New" Width="120" OnClick="btnnew_Click" style="font-size:smaller"/>

                                <asp:Button ID="btncancel" runat="server" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/submenumaster.aspx" Width="120" style="font-size:smaller"/>

                            </div>

                        </div>

                    </div>
                </div>

                <div class="tab-pane fade" id="pills-update" role="tabpanel" aria-labelledby="pills-update-tab">

                    <div class="row">

                        <div id="view" class=" col-lg-4 col-xl-4 ">

                            <asp:Label ID="lblcategoryview" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Category"></asp:Label>
                            <div class="form-group">
                                <div class=" col-md-12 col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtcategoryview" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Category" autocomplete="off"></asp:TextBox>
                                    <asp:HiddenField ID="hidcurrenttab" Value="1" runat="server" />
                                </div>
                            </div>
                        </div>

                        <div id="" class=" col-lg-4 col-xl-4 ">
                            <br />
                            <asp:Button ID="btnview" runat="server" CssClass="btn btn-primary" Text="View" Width="120" OnClick="btnview_Click" style="font-size:smaller" />

                        </div>
                    </div>

                    <div class="row">

                        <div id="tableview-endview" class=" col-lg-12 col-xl-12 ">
                            <br />
                            <asp:GridView ID="DgQualy" runat="server" HeaderStyle-BackColor="#a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CssClass="table table-hover table-secondary" OnSelectedIndexChanged="DgQualy_SelectedIndexChanged" AutoGenerateColumns="False" Font-Size="10pt">
                                <Columns>
                                    <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" CausesValidation="False" />

                                    <asp:TemplateField HeaderText="QUALIFICATION ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblqmqualificationid" runat="server" Text='<%# Bind("QUALIFICATIONID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CATEGORY">
                                        <ItemTemplate>
                                            <asp:Label ID="lblqmcategory" runat="server" Text='<%# Bind("CATEGORY") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="QUALIFICATION">
                                        <ItemTemplate>
                                            <asp:Label ID="lblqmqualification" runat="server" Text='<%# Bind("QUALIFICATION") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="COURSE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblqmcourse" runat="server" Text='<%# Bind("COURSE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="COMPANY ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblqmcompanyid" runat="server" Text='<%# Bind("COMPANYID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ControlStyle Height="12px" Width="250px"></ControlStyle>
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgMasterQualificationMaster.aspx" Width="120" style="font-size:smaller" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/submenumaster.aspx" Width="120" style="font-size:smaller" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <%--------------------------------------------------------%>

    <%--/*---Message Validation----*/--%>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=ddlcategory.ClientID%>").value == "") {
                alert("Enter The Category");
                document.getElementById("<%=ddlcategory.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>
 <%--/*-------------------*/--%>

    <%--/*---Page Reload----*/--%>

    <script type="text/javascript">

        function pageLoad() {
            if ($('#ContentPlaceHolder1_hidcurrenttab').val() == "2") {
                $('#pills-update-tab').tab('show');
            }
        };

    </script>

    <%--/*-----------------*/--%>

    <%--/*---Message Hide Code----*/--%>

    <script type="text/javascript">
        window.onload = function () {
            var seconds = 2;
            setTimeout(function () {
                document.getElementById("<%=MessageBox.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>

    <%--/*------------------------------------------*/--%>
</asp:Content>

