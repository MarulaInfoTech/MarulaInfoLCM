<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="PgMasterSubAddState.aspx.cs" Inherits="PageSubAddState" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager2" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel3" runat="server" EnableViewState="true">

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

                        <h6 class="card-title">New Add State</h6>

                        <div id="CA-Add-State" class=" col-lg-12 col-xl-12 ">
                            <br />
                            
                            <asp:Label ID="lbladdstate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Add State *"></asp:Label>
                            <div class="form-group">
                                <div class=" col-lg-6 col-xl-6">
                                    <asp:TextBox ID="txtaddstate" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Add State" OnTextChanged="txtaddstate_TextChanged" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <%--<div class="form-group">
                                <div class=" col-lg-12 col-xl-12 ">
                                    <asp:Label ID="MessageBox" class="alert alert-secondary" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Cambria"></asp:Label>
                                </div>
                            </div>--%>

                            <div class="row">

                                <div id="CA-btn" class="col-lg-12 col-xl-12">

                                    <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>

                                    <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" OnClick="btnsave_Click" Style="font-size: smaller"/>

                                    <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary  " Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller"/>

                                    <asp:Button ID="btncancel" runat="server" ValidationGroup="txtaddstate" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/submenumaster.aspx" Width="120" Style="font-size: smaller"/>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="pills-view" role="tabpanel" aria-labelledby="pills-view-tab">

                    <div id="tableview-endview" class=" col-lg-12 col-xl-12 ">

                        <asp:GridView ID="DgState" runat="server" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CssClass="table table-hover table-secondary" OnSelectedIndexChanged="DgState_SelectedIndexChanged" AutoGenerateColumns="false" Font-Size="10pt">
                            <Columns>
                                <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" CausesValidation="False" />

                                <asp:TemplateField HeaderText="STATE ID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lbladsstateid" runat="server" Text='<%# Bind("STATEID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="STATE NAME ">
                                    <ItemTemplate>
                                        <asp:Label ID="lbladsstatename" runat="server" Text='<%# Bind("STATENAME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgMasterSubAddState.aspx" Width="120" Style="font-size: smaller"/>
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

    <%--/*---Message Hide Code----*/--%>


    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtaddstate.ClientID%>").value == "") {
                alert("Enter Company Name");
                document.getElementById("<%=txtaddstate.ClientID%>").focus();
              return false;
          }

          return true;
      }
    </script>

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

