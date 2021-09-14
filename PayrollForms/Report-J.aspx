<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="Report-J.aspx.cs" Inherits="PayrollForms_Report_J" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">

    <h5>Report-J</h5>
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true">
        <ContentTemplate>

            <div class="col-lg-12 col-xl-12">
                <div class="row">

                    <div id="invoice2" class="col-lg-4 col-xl-4">
                        <div class="form-group">
                            <asp:Label ID="lblclientnamename" CssClass="label-control col-sm-9 lblnew" runat="server" Text="Client Name"></asp:Label>
                            <div class="col-lg-12 col-xl-12">
                                <asp:DropDownList ID="ddlClient" CssClass="form-control form-control-sm txtnew" runat="server" AppendDataBoundItems="True" AutoPostBack="True"></asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lbldivisionname" CssClass="label-control col-sm-9 lblnew" runat="server" Text="Division Name"></asp:Label>
                            <div class="col-lg-12 col-xl-12">
                                <asp:TextBox ID="txtdivisionname" CssClass="form-control form-control-sm txtnew" runat="server" ></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div id="invoice8" class="col-lg-2 col-xl-2">
                        <br />
                        <asp:Button ID="btnview" CssClass="btn btn-primary form-control-sm" runat="server" Text="View" Width="120px" Style="font-size: smaller"/>                      
                    </div>

                    <div>
                        <br />
                        <asp:Button ID="btnclose" CssClass="btn btn-primary form-control-sm" runat="server" Text="Close" Width="120px" Style="font-size: smaller" PostBackUrl="~/PayrollForms/SubmenuOffRollLCMReports.aspx" />
                    </div>
                </div>
            </div>
            <br />

            <div class="row">
                <div id="tableview-endview" class=" col-lg-12 col-xl-12">
                    <asp:GridView ID="Dg" runat="server" CssClass="Grid table table-hover table-secondary" HeaderStyle-BackColor=" #a6a6a6" BorderColor="#999999"
                        BorderStyle="Solid" BorderWidth="3px" Font-Size="10pt" AutoGenerateColumns="true" BackColor="#f5f5f0">

                        <HeaderStyle BackColor="#A6A6A6" />
                    </asp:GridView>
                </div>
            </div>


        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>

