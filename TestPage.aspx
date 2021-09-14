<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="TestPage.aspx.cs" Inherits="TestPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="row col-lg-12 col-xl-12">

        <table class="table table-sm border col-lg-6 col-xl-6">
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
                    <td style="width: 30px;">%</td>
                    <td style="width: 200px;">
                        <asp:TextBox ID="txtesitotalwagesvalue" CssClass="form-control form-control-sm txtnewc" runat="server" Height="23px" ReadOnly="true"></asp:TextBox></td>
                </tr>

            </tbody>
        </table>


        <table class="table table-sm border col-lg-6 col-xl-6">
            <tr>
                <td style="width: 300px;">
                    <asp:Label ID="Label19" runat="server" Text="qqq"></asp:Label></td>
                <td style="width: 100px;">
                    <asp:Label ID="Label20" runat="server" Text="www"></asp:Label></td>
                <td style="width: 400px;">
                    <asp:Label ID="Label21" runat="server" Text="eee"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label22" runat="server" Text="rrr"></asp:Label></td>
                <td>
                    <asp:Label ID="Label23" runat="server" Text="ttt"></asp:Label></td>
                <td>
                    <asp:Label ID="Label24" runat="server" Text="yyy"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label25" runat="server" Text="vvv"></asp:Label></td>
                <td>
                    <asp:Label ID="Label26" runat="server" Text="bbb"></asp:Label></td>
                <td>
                    <asp:Label ID="Label27" runat="server" Text="hhh"></asp:Label></td>
            </tr>
        </table>
    </div>




    <%-- <div class="card">
<div class="card-body d-flex align-items-center">
	<nav class="flex-fill"> 
	<ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="#">Home</a></li>
	    <li class="breadcrumb-item"><a href="#">Category name</a></li>
	    <li class="breadcrumb-item"><a href="#">Sub category</a></li>
	    <li class="breadcrumb-item active" aria-current="page">Items</li>
	</ol>  
	</nav> <!-- col.// -->

</div>
</div>--%>
</asp:Content>





