<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="SubmenuPayroll.aspx.cs" Inherits="SubmenuPayroll" %>

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
      <th scope="col">Expencive</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <th scope="row"></th>
      <td><a href="PgPayrollAllowances.aspx" style="text-decoration: none"><i class="fas fa-sort-amount-up"></i> Allowances</a></td>
      <td><a href="PgPayrollDeductions.aspx" style="text-decoration: none"><i class="fas fa-sort-amount-down-alt"></i> Deductions</a></td>
    </tr>

  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">Payroll Generate</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>

     <tr>
         <th scope="row"></th>
      <td class="auto-style5"><a href="PgPayrollMonthlyWageGenerate.aspx" style="text-decoration: none"><i class="fas fa-calendar-alt"></i>Monthly Wage Generate</a></td>
      <td class="auto-style2"><a href="#" style="text-decoration: none"><i class="fas fa-calendar-alt"></i> Weekly Wage Generate</a></td>
      <td class="auto-style2"><a href="#" style="text-decoration: none"><i class="fas fa-signal"></i>Piece rate & Measurement of units</a></td>
     </tr>
    
     <tr>
         <th scope="row"></th>
      <td class="auto-style5"><a href="#" style="text-decoration: none"><i class="fas fa-calendar-alt"></i>Daily Wage Generate</a></td>

     </tr>

      
  </tbody>


</table>

</div>


</asp:Content>

