<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="SubmenuOffRollLCMReports.aspx.cs" Inherits="SubmenuOffRollLCMReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
      <th scope="col">OFF Roll LCM Reports</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <th scope="row"></th>
      <td><a href="#"><i class="fas fa-file-invoice"></i> EPS Reports</a></td>
      <td><a href="#"><i class="fas fa-file-invoice"></i> Salary Break-up</a></td>
      <td><a href="#"><i class="fas fa-file-invoice"></i> Employee Details</a></td>
    </tr>

    <tr>
      <th scope="row"></th>
      <td><a href="#"><i class="fas fa-file-invoice"></i> Employee Salary Break-up</a></td>
      <td><a href="#"><i class="fas fa-file-invoice"></i> Employee Earning Break-up</a></td>
      <td><a href="#"><i class="fas fa-file-invoice"></i> Employee Deduction Break-up</a></td>
    </tr>

    <tr>
      <th scope="row"></th>
      <td><a href="#"><i class="fas fa-file-invoice"></i> CC Balance</a></td>
    </tr>
      
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">Net Profit</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>

     <tr>
         <th scope="row"></th>
      <td class="auto-style5"><a href="#"><i class="fas fa-file-alt"></i> Company Wise</a></td>
      <td class="auto-style2"><a href="#"><i class="fas fa-file-alt"></i> Monthly Wise</a></td>
      <td class="auto-style2"><a href="#"><i class="fas fa-file-alt"></i> Yearly Wise</a></td>
     </tr>
    
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">Regular Bill</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>

     <tr>
         <th scope="row"></th>
      <td class="auto-style5"><a href="RegularBillWageStatement.aspx"><i class="fas fa-file-alt"></i>LCM Invoices</a></td>
      <td class="auto-style5"><a href="PgReport26Report.aspx"><i class="fas fa-file"></i>Form 26</a></td>
     </tr>
      

  </tbody>


</table>

</div>



</asp:Content>

