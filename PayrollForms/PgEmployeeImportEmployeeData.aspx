<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgEmployeeImportEmployeeData.aspx.cs" Inherits="PayrollForms_PgEmployeeImportEmployeeData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .Listboxx {
            border-width: thin;
            border-width: 2px;
            border-color: #990000;
            background-color: #ffcccc;
            height: 100px;
            width: 300px;
        }
        #AYM-listbox {
            margin-top: 10px;
            margin-left: 700px;
        }
    </style>

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnableSecureHistoryState="false"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true" UpdateMode="Conditional">
        <ContentTemplate>
            <br />
            <div>
                <h6 class="card-title">Import Employee Data</h6>
            </div>
      
            <div class="row col-lg-12 col-xl-12">

                <div class="col-lg-4 col-xl-4">

                    <asp:Label ID="lblclientname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Client Name"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:DropDownList ID="ddlcompanyname" CssClass="form-control form-control-sm txtnew" autocomplete="off" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlcompanyname_SelectedIndexChanged">
                                <asp:ListItem>---Select Client Name---</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <asp:Label ID="lbldivisionname" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Division Name"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:TextBox ID="txtdivisionname" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" placeholder="Division Name"></asp:TextBox>
                        </div>
                    </div>

                </div>

                <%--<div class=" col-lg-4 col-xl-4">
                    <br />
                    <div><asp:FileUpload ID="SelectFiles" class="form-control form-control-sm txtnew" runat="server" /></div>
                    <br />
                    <div><asp:Button ID="btndowtemp" runat="server" CssClass="btn btn-primary " Text="Import" Width="120" OnClick="btndowtemp_Click" /></div>
                </div>

                <div id="" class="col-lg-4 col-xl-4">

                    <asp:Label ID="lbltotalnoofemployees" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Total No OF Employees"></asp:Label>
                    <div class="form-group">
                        <div class=" col-lg-12 col-xl-12">
                            <asp:TextBox ID="txttotalnoofemployees" CssClass="form-control form-control-sm txtnew text-uppercase" autocomplete="off" runat="server" placeholder="Total No OF Employees" Width="200"></asp:TextBox>
                        </div>
                    </div>

                    <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" data-toggle="modal" data-target="#exampleModalLong" OnClick="btnsave_Click" OnClientClick="return validate()" />

                    <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary " Text="New" Width="120" OnClick="btnnew_Click" />

                    <asp:Button ID="btnclose" runat="server" ValidationGroup="txtDivi" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/SubmenuDataMaster.aspx" Width="120" />

                </div>--%>

                <table class="table col-lg-8 col-xl-8">
                    <tbody>
                        <tr>
                            <td>
                                <asp:Label ID="lbluploadexcel" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Upload Excel File"></asp:Label>
                                <asp:FileUpload ID="SelectFiles" class="form-control form-control-sm " runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="lbltotalnoofemployees" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="No of Emp"></asp:Label>
                                <asp:TextBox ID="txttotalnoofemployees" CssClass="form-control form-control-sm" autocomplete="off" runat="server" placeholder="Total No of Emp" Width="120"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btndowtemp" runat="server" CssClass="btn btn-primary " Text="Import" Width="120" OnClick="btndowtemp_Click" style="font-size: smaller"/>
                            </td>
                            <td>
                                <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" data-toggle="modal" data-target="#exampleModalLong" OnClick="btnsave_Click" OnClientClick="return validate()" style="font-size: smaller"/>
                            </td>
                            <td>
                                <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary " Text="New" Width="120" OnClick="btnnew_Click" style="font-size: smaller"/>
                            </td>
                            <td>
                                <asp:Button ID="btnclose" runat="server" ValidationGroup="txtDivi" CssClass="btn btn-primary" Text="Close" PostBackUrl="~/PayrollForms/SubmenuDataMaster.aspx" Width="120" style="font-size: smaller"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="row col-lg-12 col-xl-12">

                <div class="col-lg-5 col-xl-5">
                    <asp:Label ID="lblapplicationno" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Application No :" Font-Names="Cambria" Font-Size="Smaller"></asp:Label>
                </div>

                <div class="col-lg-5 col-xl-5">
                    <asp:Label ID="lblemployeecode" runat="server" CssClass="label-conrol col-sm-12 lblnew" Text="Employee Code :" Font-Names="Cambria" Font-Size="Smaller"></asp:Label>
                </div>
            </div>

            <div class="row">

                <div id="IED-listbox" class="col-lg-4 col-xl-4 justify-content-center" style="align-content: center">
                    <asp:ListBox ID="listOfEmp" runat="server" class="list-group-item rounded border border-danger" Visible="False" CssClass="Listboxx"></asp:ListBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div id="tableview-frontview" class="col-lg-12 col-xl-12">

                    <asp:GridView ID="gdEmployeeImport" runat="server" BackColor="White" CssClass="table table-hover table-secondary" HeaderStyle-BackColor="#a6a6a6" BorderColor="#999999" BorderStyle="Solid" Font-Size="10pt"
                        BorderWidth="3px" CellPadding="3" ForeColor="Black">
                        <Columns>
                        </Columns>
                        <FooterStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <RowStyle BackColor="#f5f5ef" />
                    </asp:GridView>

                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btndowtemp" />
        </Triggers>
    </asp:UpdatePanel>

    <%-----------------------------------------%>

    <%--/*---Message Validation----*/--%>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=ddlcompanyname.ClientID%>").value == "") {
                alert("Enter The Company Name");
                document.getElementById("<%=ddlcompanyname.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>

    <%----------------------------------------------%>
</asp:Content>

