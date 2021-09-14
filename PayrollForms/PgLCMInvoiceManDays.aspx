<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgLCMInvoiceManDays.aspx.cs" Inherits="PayrollForms_ManDays" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">

        <ContentTemplate>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link alert-dark" id="pills-companymaster-tab" data-toggle="pill" href="#pills-companymaster" role="tab" aria-controls="pills-companymaster" style="font-size: smaller" aria-selected="true">Invoice</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-dark" id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" style="font-size: smaller" aria-selected="true" aria-controls="pills-view">View</a>
                </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">

                <div class="tab-pane fade active show" id="pills-companymaster" role="tabpanel" aria-labelledby="pills-companymaster-tab">

                    <h6>Man Days</h6>

                    <div class="row">

                        <div id="mandays1" class="col-lg-2 col-xl-2">

                            <div class="form-group">
                                <asp:Label ID="lblinvoiceno" CssClass="label-control col-sm-9 lblnew" runat="server" Text="Invoice.No"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtinvoiceno" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblinvoicedate" CssClass="label-control col-sm-9 lblnew" runat="server" Text="Invoice.Date"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtinvoicedate" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="mandays2" class="col-lg-4 col-xl-4">

                            <div class="form-group">
                                <asp:Label ID="lblclientname" CssClass="label-control col-sm-9 lblnew" runat="server" Text="Client Name"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:DropDownList ID="ddlclientname" CssClass="form-control form-control-sm txtnew" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblinvoicetype" CssClass="label-control col-sm-9 lblnew" runat="server" Text="Invoice Type"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txinvoicetype" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div id="mandays3" class="col-lg-2 col-xl-2">
                            <div class="form-group">
                                <asp:Label ID="lblfromdate" CssClass="label-control col-sm-9 lblnew" runat="server" Text="FromDate"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtfromdate" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbltodate" CssClass="label-control col-sm-9 lblnew" runat="server" Text="ToDate"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttodate" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div id="mandays4" class="col-lg-2 col-xl-2">
                            <div class="form-group">
                                <asp:Label ID="lblaccyear" CssClass="label-control col-sm-9 lblnew" runat="server" Text="AccYear"></asp:Label>
                                <div class="col-lg-12 col-x-12">
                                    <asp:TextBox ID="txtaccyear" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                                <br />
                                <asp:Button ID="btngenerate" CssClass="btn btn-primary form-control-sm" runat="server" Text="Generate" Width="120px" Style="font-size: smaller" /><br />
                            </div>
                        </div>

                        <div id="mandays9" class="col-lg-2 col-xl-2">
                            <br />
                            <br />
                            <br />
                            <asp:Button ID="btnnew" CssClass="btn btn-primary form-control-sm" runat="server" Text="New" Width="120px" Style="font-size: smaller" />
                        </div>
                    </div>

                    <div class="row">
                        <div id="tableview-front" class="col-lg-12 col-xl-12">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Font-Size="10pt"></asp:GridView>
                            <columns>
                                </columns>
                            <footerstyle horizontalalign="Center" />
                            <headerstyle horizontalalign="Center" />
                            <rowstyle backcolor="#f5f5ef" />
                        </div>
                    </div>


                    <div class="row col-md-12 col-xl-12">

                        <table class="table table-sm border table-responsive-sm col-lg-6 col-xl-6">
                            <thead>
                                <tr>
                                    <th colspan="5" style="height: 20px; font-size: 12px;">Principle Employer Contribution Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr style="height: 20px; font-size: 15px;">
                                    <td class="small" style="width: 300px;">Statutory</td>
                                    <td class="small" style="width: 150px;">Status For Only Bill Purpose</td>
                                    <td class="small" style="width: 200px;">Percentage</td>
                                    <td style="width: 50px;"></td>
                                    <td class="small" style="width: 200px;">Values</td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="lblpfonwagesper" CssClass="small" runat="server" Text="EPF On EPF Wages"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:DropDownList ID="ddlpfonwagespers" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtpfonwagesper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                    <td style="width: 50px;">%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtpfonwageesvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="lblesitotalwagesper" runat="server" Text="ESI On ESI Wages" CssClass="small" Height="23px"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:DropDownList ID="ddlesitotalwagesper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtesitotalwagesper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                    <td style="width: 50px;">%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtesitotalwagesvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size:12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="lblbonusonwagesper" runat="server" Text="Bonus On Earned Basic & DA" CssClass="small" Height="23px"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:DropDownList ID="ddlbonusonwagesper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtbonusonwagesper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtbonusonwagesvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="lblgratuityonwagesper" runat="server" Text="Gratuity On Earned Basic & DA" CssClass="small" Height="23px"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:DropDownList ID="ddlgratuityonwagesper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtgratuityonwagesper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtgratuityonwagesvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="lblleavewithwagesper" runat="server" Text="Leave With Wages On Total Wages" CssClass="small" Height="23px"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:DropDownList ID="ddlleavewithwagesper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtleavewithwagesper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtleavewithwagesvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="Label25" runat="server" Text="LTA On Earned Basic & DA" CssClass="small" Height="23px"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:DropDownList ID="DropDownList6" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="TextBox10" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="TextBox11" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="lbllwf" runat="server" Text="LWF" CssClass="small"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:DropDownList ID="ddllwfoption" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtlwfpercentage" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtlwfvalues" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="lblothers" runat="server" Text="Others" CssClass="small"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:DropDownList ID="ddlotheroption" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtotherpercentage" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtothervalues" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;" colspan="2">
                                        <asp:Label ID="lbltotalservicechargeper" runat="server" Text="Total Statutory Charges" CssClass="small"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txt" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="TextBox17" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>
                            </tbody>
                        </table>


                        <table class="table table-sm border col-lg-6 col-xl-6">
                            <thead>
                                <tr>
                                    <th style="font-size: 12px;">Tax Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 150px;">
                                        <asp:Label ID="lblgsttaxon" CssClass="small" runat="server" Text="GST Tax On"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtGSTtaxOn" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px">100</asp:TextBox></td>
                                    <td style="width: 50px;">%</td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 150px;">
                                        <asp:Label ID="lblCGST" CssClass="small" runat="server" Text="CGST"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtcgstper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                    <td style="width: 50px;">%</td>
                                    <td style="width: 100px;">
                                        <asp:Label ID="lblongrandtotal" CssClass="small" runat="server" Text="On Grand Total"></asp:Label></td>
                                    <td style="width: 200px;;">
                                        <asp:DropDownList ID="ddlcgstoption" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtcgstvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 150px;">
                                        <asp:Label ID="lbligst" CssClass="small" runat="server" Text="IGST"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtigstper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                    <td style="width: 50px;">%</td>
                                    <td style="width: 100px;">
                                        <asp:Label ID="lbligstongrandtotal" CssClass="small" runat="server" Text="On Grand Total"></asp:Label></td>
                                    <td style="width: 200px;;">
                                        <asp:DropDownList ID="ddligstoption" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width:50px;">%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtigstvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 150px;">
                                        <asp:Label ID="lblcess" CssClass="small" runat="server" Text="CESS"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtcessper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 100px;">
                                        <asp:Label ID="lblcessongrangtotal" CssClass="small" runat="server" Text="On Grand Total"></asp:Label></td>
                                    <td style="width: 200px;;">
                                        <asp:DropDownList ID="ddlcessoption" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtcessvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 150px;">
                                        <asp:Label ID="lblsgst" CssClass="small" runat="server" Text="SGST"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtsgstper" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 100px;">
                                        <asp:Label ID="lblsgstongrandtotal" CssClass="small" runat="server" Text="On Grand Total"></asp:Label></td>
                                    <td style="width: 200px;;">
                                        <asp:DropDownList ID="ddlsgstoption" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                            <asp:ListItem>NILL</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtsgstvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 150px;">
                                        <asp:Label ID="Label38" runat="server" Text="Total Tax Default" CssClass="small"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="TextBox24" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                    <td>%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="TextBox25" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 150px;">
                                        <asp:Label ID="Label39" runat="server" Text="Round Up" CssClass="small"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="TextBox26" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="row col-md-12 col-xl-12">
                        <table class="table table-sm border col-lg-6 col-xl-6">
                            <thead>
                                <tr>
                                    <th colspan="5" style="height: 20px; font-size: 12px;">Grand Values Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;" colspan="2">
                                        <asp:Label ID="Label29" runat="server" Text="Earned Gross Wages" Font-Size="Smaller"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtgrosswages" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;" colspan="2">
                                        <asp:Label ID="Label21" runat="server" Text="Total Statutory Charges Default" CssClass="small" Height="23px"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="TextBox1" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                    <td style="width:50px;">%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="TextBox2" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                </tr>


                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 300px;">
                                        <asp:Label ID="Label31" runat="server" Text="Service Charges" Font-Size="Smaller"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:DropDownList ID="DropDownList9" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Font-Size="12px">
                                            <asp:ListItem>Options</asp:ListItem>
                                            <asp:ListItem>ALL Grand</asp:ListItem>
                                            <asp:ListItem>Gross</asp:ListItem>
                                            <asp:ListItem>Wages</asp:ListItem>
                                            <asp:ListItem>Standard</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="TextBox18" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                    <td style="width: 50px;">%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="TextBox22" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 150px;" colspan="2">
                                        <asp:Label ID="Label32" runat="server" Text="Grand Total" Font-Size="Smaller"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="TextBox23" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                </tr>
                            </tbody>
                        </table>

                        <table class="table table-sm border col-lg-6 col-xl-6">
                            <thead>
                                <tr>
                                    <th colspan="5" style="height: 20px; font-size: 12px;">Bill Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 100px;" colspan="3">
                                        <asp:Label ID="Label40" runat="server" Text="Grand Total" Font-Size="Smaller"></asp:Label></td>
                                    <td style="width: 150px;">
                                        <asp:TextBox ID="TextBox27" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 100px;">
                                        <asp:Label ID="Label41" runat="server" Text="Total Tax Default" CssClass="small" Height="23px"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="TextBox28" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                    <td style="width:40px;">%</td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="TextBox29" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" Width="175"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 100px;" colspan="3">
                                        <asp:Label ID="lblcanteen" runat="server" Text="Canteen" Font-Size="Smaller"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtbdcanteen" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 100px;" colspan="3">
                                        <asp:Label ID="lblother" runat="server" Text="Other" Font-Size="Smaller"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtbdother" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                </tr>

                                <tr style="height: 20px; font-size: 12px;">
                                    <td style="width: 100px;" colspan="3">
                                        <asp:Label ID="lbltotalbillvalue" runat="server" Text="Total Bill Value" Font-Size="Smaller"></asp:Label></td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txttotalbillvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px"></asp:TextBox></td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="TypeId" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <asp:Button ID="btncalculate" runat="server" CssClass="btn btn-primary " Text="Calculate" Width="100" Style="font-size: smaller" />
                                    <td>
                                        <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" Text="Save" Width="100" Style="font-size: smaller" />

                                    <td>
                                        <asp:Button ID="btnprint" runat="server" CssClass="btn btn-primary" Text="Print" Width="100" Style="font-size: smaller" />
                                    <td>
                                        <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" Text="Close" Width="100" Style="font-size: smaller" />
                                </tr>

                            </tbody>
                        </table>

                    </div>

                </div>

                <%-------------------------------------View ------------------------------%>

                <div class="tab-pane fade" id="pills-view" role="tabpanel">

                    <div class="row">
                        <div id="mandaysview1" class="col-lg-2 col-xl-2">
                            <div class="form-group">
                                <asp:Label ID="lblfromdateview" runat="server" CssClass="label-control col-sm-12 lblnew" Text="From Date"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txtfromdateview" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbltodateview" runat="server" CssClass="label-control col-sm-12 lblnew" Text="To Date"></asp:Label>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:TextBox ID="txttodateview" CssClass="form-control form-control-sm txtnew" runat="server" AutoComplete="off"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div id="mandaysview2" class="col-lg-5 col-xl-5">

                            <div class="form-group">
                                <asp:Label ID="lblclientnameview" runat="server" CssClass="label-control col-sm-12 lblnew" Text="Client Name"></asp:Label>
                                <div class="col-lg-8 col-xl-8">
                                    <asp:DropDownList ID="ddlclientnameview" CssClass="form-control form-control-sm txtnew" runat="server"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="container">
                                <br />
                                <asp:Button ID="btnview" CssClass="btn btn-primary " runat="server" Text="View" Width="120px" Style="font-size: smaller" />
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <br />
                        <div id="tableview-endview" class=" col-lg-12 col-xl-12">

                            <asp:GridView ID="DgMandays" runat="server" CssClass="table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6" Font-Size="10pt">
                        </asp:GridView>
                            </div>
                    <br />

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
                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/PgLCMInvoiceManDays.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnmastersubmenu" runat="server" CssClass="btn btn-primary" Text="Master Menu" PostBackUrl="~/PayrollForms/SubmenuInvoices.aspx" Width="120" Style="font-size: smaller" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                    </div>

                </div>


            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <%-- <%-- %--/*---Date Picker----*/--%>

    <script type="text/javascript">
        $(function () {
            bindDatePickers(); // bind date picker on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDatePickers); // bind date picker on every UpdatePanel refresh
        });

        function bindDatePickers(sender, args) {
            $('#<%= txtinvoicedate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtfromdate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodate.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txtfromdateview.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%= txttodateview.ClientID %>').datepicker({ dateFormat: 'dd/mm/yy' });
        }
    </script>


    <%--/*-----------------*/--%>
</asp:Content>

