<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="PgMasterBankBranchMaster.aspx.cs" Inherits="PageBankBranchMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
        <li class="nav-item">
            <a class="nav-link alert-dark actives" id="pills-bank-tab" data-toggle="pill" href="#pills-bank" role="tab" aria-controls="pills-bank" style="font-size:smaller" aria-selected="true">Bank</a>
        </li>
        <li class="nav-item">
            <a class="nav-link alert-dark actives" id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" aria-controls="pills-view" style="font-size:smaller" aria-selected="false">View</a>
        </li>
    </ul>

    <div class="tab-content" id="pills-tabContent">
        <div class="tab-pane fade show active" id="pills-bank" role="tabpanel" aria-labelledby="pills-bank-tab">

            <div class="container-fluid">

                <h6 class="card-title">Bank Branch Master</h6>

                <div class="row col-lg-12 col-xl-12">

                    <div id="BBM-Bank-Branch-Master" class=" col-lg-6 col-xl-6 ">
                        <br />
                        <asp:Label ID="lblbankname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Bank Name *"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12 ">
                                <asp:TextBox ID="txtbankname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Bank Name" OnTextChanged="txtbankname_TextChanged" autocomplete="off"></asp:TextBox>
                            </div>
                        </div>

                        <asp:Label ID="lblbranchcode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="IFSC Code *"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12 ">
                                <asp:TextBox ID="txtbranchcode" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="IFSC Code" OnTextChanged="txtbranchcode_TextChanged" autocomplete="off"></asp:TextBox>
                            </div>
                        </div>

                        <asp:Label ID="lblbranchname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Branch Name *"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12 ">
                                <asp:TextBox ID="txtbranchname" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Branch Name" OnTextChanged="txtbranchname_TextChanged" autocomplete="off"></asp:TextBox>
                            </div>
                        </div>

                        <asp:Label ID="lblaccountno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Account Number *"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12 ">
                                <asp:TextBox ID="txtaccountno" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Account No" MaxLength="15" OnTextChanged="txtaccountno_TextChanged" autocomplete="off"></asp:TextBox>
                            </div>
                        </div>

                        <asp:Label ID="lbladdress" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Address"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12 ">
                                <asp:TextBox ID="txtaddress" CssClass="form-control form-control-sm text-uppercase txtnew" runat="server" placeholder="Address" Height="75px" TextMode="MultiLine" OnTextChanged="txtaddress_TextChanged" autocomplete="off"></asp:TextBox>
                            </div>
                        </div>

                    </div>

                    <div id="" class=" col-lg-6 col-xl-6 ">
                        <br />
                        <asp:Label ID="lblmobileno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Mobile No"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12 ">
                                <asp:TextBox ID="txtphoneno" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="91+" autocomplete="off" TextMode="Number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==10) return false;"></asp:TextBox>
                            </div>
                        </div>

                        <asp:Label ID="lblemailid" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Email ID"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12 ">
                                <asp:TextBox ID="txtemailid" CssClass="form-control form-control-sm txtnew" runat="server" placeholder="Email ID" TextMode="Email" autocomplete="off"></asp:TextBox>
                            </div>
                        </div>

                        <asp:Label ID="lblothernotes" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Other Notes"></asp:Label>
                        <div class="form-group">
                            <div class=" col-lg-12 col-xl-12 ">
                                <asp:TextBox ID="txtothernotes" CssClass="form-control form-control-sm txtnew" runat="server" Height="75px" placeholder="Other Notes" TextMode="MultiLine" autocomplete="off"></asp:TextBox>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="row">

                    <div id="BBM-btn" class="col-lg-12 col-xl-12">

                        <asp:Label ID="TypeID" runat="server" Text="" Visible="False"></asp:Label>

                        <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" OnClick="btnsave_Click" OnClientClick="return validate()" style="font-size:smaller"/>

                        <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary  " Text="New" Width="120" OnClick="btnnew_Click" style="font-size:smaller" />

                        <asp:Button ID="btncancel" runat="server" CssClass="btn btn-primary" ValidationGroup="txtothernotes" Text="Close" PostBackUrl="~/PayrollForms/submenumaster.aspx" Width="120" style="font-size:smaller" />

                    </div>
                </div>

            </div>
        </div>

        <div class="tab-pane fade" id="pills-view" role="tabpanel" aria-labelledby="pills-view-tab">
            <br />

            <div class="row">

                <div id="tableview-endview" class=" col-lg-12 col-xl-12">

                    <asp:GridView ID="DgBankDetail" runat="server" HeaderStyle-BackColor="#a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CssClass="table table-hover table-secondary" OnSelectedIndexChanged="DgBankDetail_SelectedIndexChanged" AutoGenerateColumns="False" Font-Size="10pt">
                        <Columns>
                            <asp:CommandField HeaderText="SELECT" ShowHeader="True" ShowSelectButton="True" CausesValidation="False" />

                            <asp:TemplateField HeaderText="BANK ID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblbbbankid" runat="server" Text='<%# Bind("BANKID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="25px" Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="BANK NAME">
                                <ItemTemplate>
                                    <asp:Label ID="lblbbbankname" runat="server" Text='<%# Bind("BANKNAME") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="25px" Width="350px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="IFSC CODE">
                                <ItemTemplate>
                                    <asp:Label ID="lblbbbankcode" runat="server" Text='<%# Bind("BANKCODE") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="25px" Width="250px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="BRANCH NAME">
                                <ItemTemplate>
                                    <asp:Label ID="lblbbbranch" runat="server" Text='<%# Bind("BRANCH") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="25px" Width="300px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ACCOUNT NUMBER">
                                <ItemTemplate>
                                    <asp:Label ID="lblbbaccountnumber" runat="server" Text='<%# Bind("ACCOUNTNUMBER") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="25px" Width="300px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ADDRESS">
                                <ItemTemplate>
                                    <asp:Label ID="lblbbaddress" runat="server" Text='<%# Bind("ADDRESS") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="25px" Width="450px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="MOBILE NO">
                                <ItemTemplate>
                                    <asp:Label ID="lblbbphoneno" runat="server" Text='<%# Bind("PHONENO") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="25px" Width="200px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="EMAIL ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblbbemailid" runat="server" Text='<%# Bind("EMAILID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="25px" Width="300px"></ControlStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="OTHER NOTES">
                                <ItemTemplate>
                                    <asp:Label ID="lblbbother" runat="server" Text='<%# Bind("OTHER") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ControlStyle Height="25px" Width="300px"></ControlStyle>
                            </asp:TemplateField>

                        </Columns>
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
                                <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgMasterBankBranchMaster.aspx" Width="120" style="font-size:smaller"/>
                            </td>
                            <td>
                                <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/submenumaster.aspx" Width="120" style="font-size:smaller"/>
                            </td>
                        </tr>

                    </tbody>
                </table>

            </div>
        </div>

    </div>
    <%----------------------------------------%>

    <%--/*---Message Validation----*/--%>

   <%-- <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtbankname.ClientID%>").value == "") {
                alert("Enter The Bank Name");
                document.getElementById("<%=txtbankname.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>--%>

    <%------------------------------------------------%>
</asp:Content>

