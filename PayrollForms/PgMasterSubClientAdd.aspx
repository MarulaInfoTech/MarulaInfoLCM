<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="PgMasterSubClientAdd.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">
        <ContentTemplate>
            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-clientadd-tab" data-toggle="pill" href="#pills-clientadd" role="tab" aria-controls="pills-clientadd" Style="font-size: smaller" aria-selected="true">Client Add</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" aria-controls="pills-view" Style="font-size: smaller" aria-selected="false">Views</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-clientadd" role="tabpanel" aria-labelledby="pills-clientadd-tab">

                    <div class="container-fluid col-lg-12 col-xl-12">

                        <h6 class="card-title">New Add Client</h6>

                        <div id="CA-Client-Add" class=" col-lg-6 col-xl-6 ">
                            <br />

                            <asp:Label ID="lblclientcode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Code"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtclientcode" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Client Code"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lblclientname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtclientname" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="Client Name" OnTextChanged="txtclientname_TextChanged" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Label ID="lbldivision" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Division *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:TextBox ID="txtdivision" CssClass="form-control form-control-sm txtnew text-uppercase" runat="server" placeholder="Division" OnTextChanged="txtdivision_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        
                            <div class="row">

                                <div id="CA-btn" class="col-lg-12 col-xl-12">
                                    <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>

                                    <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" OnClick="btnsave_Click" OnClientClick="return validate()" Style="font-size: smaller" />

                                    <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary  " Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller" />

                                    <asp:Button ID="btncancel" runat="server" ValidationGroup="txtclientname" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgMasterClientEntry.aspx" Width="120" Style="font-size: smaller"/>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="pills-view" role="tabpanel" aria-labelledby="pills-view-tab">
         
                <br />

                <div class="row">
                    <br />
                    <div id="tableview-endview" class=" col-lg-12 col-xl-12">
                        <asp:GridView ID="DgClinet" runat="server" BorderColor="#999999" HeaderStyle-BackColor="#a6a6a6" BorderStyle="Solid" BorderWidth="3px" CssClass="table table-hover table-secondary" OnSelectedIndexChanged="DgClinet_SelectedIndexChanged" AutoGenerateColumns="False" Font-Size="10pt">
                            <Columns>
                                <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" CausesValidation="False" />

                                <asp:TemplateField HeaderText="CLIENT ID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcamclientid" runat="server" Text='<%# Bind("CLIENTID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="CLIENT CODE">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcamclientcode" runat="server" Text='<%# Bind("CLIENTCODE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="CLIENT NAME">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcamclientname" runat="server" Text='<%# Bind("CLIENTNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="CLIENT NAME">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcamdiviname" runat="server" Text='<%# Bind("DIVISION") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                </asp:TemplateField>

                            </Columns>
                            <FooterStyle HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <RowStyle BackColor="#f5f5ef" />
                        </asp:GridView>

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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgMasterSubClientAdd.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/submenumaster.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

     </div>
                </div>
            

        </ContentTemplate>
    </asp:UpdatePanel>

    <%----------------------------------------------%>

    <%--/*---Message Validation----*/--%>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtclientname.ClientID%>").value == "") {
                alert("Enter The Client Name");
                document.getElementById("<%=txtclientname.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>
    <%--/*----------------------------*/--%>

    <%--/*--------------------------------------------------*/--%>


</asp:Content>

