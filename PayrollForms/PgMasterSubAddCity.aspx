<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="PgMasterSubAddCity.aspx.cs" Inherits="PageSubAddCity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-clientadd-tab" data-toggle="pill" href="#pills-clientadd" role="tab" aria-controls="pills-clientadd" style="font-size: smaller" aria-selected="true">Client Add</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark actives" id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" aria-controls="pills-view" style="font-size: smaller" aria-selected="false">View</a>
                </li>

            </ul>

            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-clientadd" role="tabpanel" aria-labelledby="pills-clientadd-tab">

                    <div class="container-fluid">

                        <h6 class="card-title">New Add City</h6>

                        <%--<div class="loading">
                            <img src="../Photos/Ajux_loader.gif" alt="" height="300" width="300" />
                        </div>--%>


                      <%--  <div id="preloader">
                            <div id="loader"></div>
                        </div>--%>



                 

                        <div class="row col-lg-12 col-xl-12">

                            <div id="CA-Add-City" class=" col-lg-6 col-xl-6 ">
                                <br />

                                <asp:Label ID="lblchoosestate" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Choose State *"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:DropDownList ID="ddlchoosestate" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" AppendDataBoundItems="True">
                                            <asp:ListItem>---- Select State ----</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <asp:Label ID="lbladdcity" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Add City *"></asp:Label>
                                <div class="form-group">
                                    <div class=" col-lg-12 col-xl-12 ">
                                        <asp:TextBox ID="txtaddcity" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Add City" OnTextChanged="txtaddcity_TextChanged" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>

                            </div>

                            <div id="CA-Add-Button" class="col-lg-6 col-xl-6">
                                <asp:Button ID="btnaddstate" runat="server" ValidationGroup="txtaddcity" CssClass="btn btn-primary " Text="Add State" PostBackUrl="~/PayrollForms/PgMasterSubAddState.aspx" Width="120" Style="font-size: smaller" />
                              
                            </div>

                        </div>

                        <div class="row">

                            <div id="CA-btn" class="col-lg-12 col-xl-12">

                                <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>
                                <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" OnClick="btnsave_Click" Style="font-size: smaller"/>

                                <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary " Text="New" Width="120" OnClick="btnnew_Click" Style="font-size: smaller" />

                                <asp:Button ID="btncancel" runat="server" ValidationGroup="txtaddcity" CssClass="btn btn-primary " Text="Close" PostBackUrl="~/PayrollForms/submenumaster.aspx" Width="120" OnClick="btncancel_Click" Style="font-size: smaller" />

                            </div>
                        </div>
                    </div>

                </div>

                <div class="tab-pane fade" id="pills-view" role="tabpanel" aria-labelledby="pills-view-tab">
                    <br />
                    <div id="tableview-endview" class=" col-lg-12 col-xl-12" style="width: 75%;">

                        <asp:GridView ID="DgCity" runat="server" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CssClass="table table-hover table-secondary" OnSelectedIndexChanged="DgCity_SelectedIndexChanged" HorizontalAlign="Center" AutoGenerateColumns="False" Font-Size="10pt">
                            <Columns>
                                <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" CausesValidation="False" />

                                <asp:TemplateField HeaderText="CITY NAME">
                                    <ItemTemplate>
                                        <asp:Label ID="lbladccityname" runat="server" Text='<%# Bind("CITYNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="STATE NAME">
                                    <ItemTemplate>
                                        <asp:Label ID="lbladcstatename" runat="server" Text='<%# Bind("STATENAME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="300px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="CITY ID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lbladccityid" runat="server" Text='<%# Bind("CITYID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="STATE ID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lbladcstateid" runat="server" Text='<%# Bind("STATEID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ControlStyle Height="12px" Width="200px"></ControlStyle>
                                </asp:TemplateField>

                            </Columns>
                            <HeaderStyle CssClass="FixedHeader" />
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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgMasterSubAddCity.aspx" Width="120" Style="font-size: smaller" />
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

        </ContentTemplate>
    </asp:UpdatePanel>

    <%--/*----------------------*/--%>

   



    <%--    <style type="text/css">
        .modal {
            position: fixed;
            top: 200px;
            left: 300px;          
            z-index: 99;
            opacity: 0.8;
            filter: alpha(opacity=80);
            -moz-opacity: 0.8;
            min-height: 100%;
            width: 100%;
        }

        .loading {
            
            font-family: Arial;
            font-size: 10pt;
            margin-left:300px;
            margin-top:95px;
            display: none;
            position: fixed;
           
            z-index: 999;
        }
    </style>


    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        function ShowProgress() {
            setTimeout(function () {
                var modal = $('<div />');
                modal.addClass("modal");
                $('body').append(modal);
                var loading = $(".loading");
                loading.show();
                var top = Math.max($(window).height(20) / 2 - loading[0].offsetHeight / 2, 0);
                var left = Math.max($(window).width(20) / 2 - loading[0].offsetWidth / 2, 0);
                loading.css({ top: top, left: left });
            }, 200);
        }
        $('form').live("submit", function () {
            ShowProgress();
        });
    </script>--%>


    <%--/*---Message Validation----*/--%>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtaddcity.ClientID%>").value == "") {
                alert("Enter Company Name");
                document.getElementById("<%=txtaddcity.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>

    <%-------------------------------------------------------%>
</asp:Content>

