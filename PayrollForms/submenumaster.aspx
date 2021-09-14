<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="SubmenuMaster.aspx.cs" Inherits="_Default" %>

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
                    <th scope="col">Master</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row"></th>
                    <td><a href="PgMasterCompanyMaster.aspx" style="text-decoration: none"><i class="fa fa-fw fa-home "></i>Company Master</a></td>
                    <td><a href="PgMasterClientEntry.aspx" style="text-decoration: none"><i class="fas fa-building"></i>LCM Clients</a></td>
                    <td><a href="PgMasterPrincipalPEMCompanies.aspx" style="text-decoration: none"><i class="fas fa-building"></i>Prinicipal PEM Companies</a></td>
                </tr>
                <tr>
                    <th scope="row"></th>
                    <td><a href="PgMasterCcClientEntry.aspx" style="text-decoration: none"><i class="fas fa-building"></i>CC Client Entry</a></td>
                    <td><a href="PgMasterDepartmentMaster.aspx" style="text-decoration: none"><i class="fas fa-id-card"></i>Department Master</a></td>
                    <td><a href="PgMasterDesignationMaster.aspx" style="text-decoration: none"><i class="fas fas fa-map-pin"></i>Designation Master</a></td>
                </tr>
                <tr>
                    <th scope="row"></th>
                    <td><a href="PgMasterSalaryGradeMaster.aspx" style="text-decoration: none"><i class="fas fa-rupee-sign"></i>Salary Grade Master</a></td>
                    <td><a href="PgMasterSubAddCity.aspx" style="text-decoration: none"><i class="fas fa-city"></i>State & City</a></td>
                    <td><a href="PgMasterQualificationMaster.aspx" style="text-decoration: none"><i class="fa fa-book fa-fw"></i>Education</a></td>
                </tr>
                <tr>
                    <th scope="row"></th>
                    <td><a href="PgMasterBankBranchMaster.aspx" style="text-decoration: none"><i class="fa fa fa-university"></i>Bank Master</a></td>
                    <td><a href="PgMasterAccountYearMaster.aspx" style="text-decoration: none"><i class="fas fa-search"></i>Account Peroid</a></td>
                    <td><a href="PgMasterInvoiceFormat.aspx" style="text-decoration: none"><i class="fas fa-file-invoice"></i>Invoice Value Format</a></td>
                </tr>
            </tbody>
        </table>

    </div>
</asp:Content>

