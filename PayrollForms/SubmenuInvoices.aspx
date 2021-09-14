<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="SubmenuInvoices.aspx.cs" Inherits="SubmenuInvoices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .fa {
            padding-right: .5em;
        }

        .fas {
            padding-right: .5em;
        }
    </style>

    <div class="container-fluid">

        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col"></th>
                    <th scope="col">Invoice Generate</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <th scope="row"></th>
                    <td><a href="PgLCMInvoiceRegularBill.aspx" style="text-decoration: none"><i class="fas fa-file-alt"></i>Regular Bill</a></td>
                    <td><a href="#" style="text-decoration: none"><i class="fas fa-file-alt"></i>Auto Bill</a></td>
                    <td><a href="#" style="text-decoration: none"><i class="fas fa-file-alt"></i>Invoice Value Setting</a></td>
                </tr>

                <tr>
                    <th scope="row"></th>
                    <td><a href="PgLCMInvoiceDepartmentValueSetting.aspx" style="text-decoration: none"><i class="fas fa-file-alt"></i>Department Value Setting</a></td>
                </tr>

                <thead>  
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">Open Bill</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                </thead>

                <tr>
                    <th scope="row"></th>
                    <td class="auto-style5"><a href="PgLCMInvoiceManDays.aspx" style="text-decoration: none"><i class="fas fa-file-alt"></i>Mandays</a></td>
                    <td class="auto-style2"><a href="#" style="text-decoration: none"><i class="fas fa-file-alt"></i>Piece-rate Wages</a></td>
                    <td class="auto-style2"><a href="#" style="text-decoration: none"><i class="fas fa-file-alt"></i>Weekly Wages</a></td>
                </tr>
            </tbody>
        </table>

    </div>

</asp:Content>

