<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="SubmenuPettyCash.aspx.cs" Inherits="SubmenuPettyCash" %>

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
      <th scope="col">Petty Cash</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>

  <tbody> 
    <tr>
      <th scope="row"></th>
      <td><a href="PgPettyCashAdvanceRequest.aspx" style="text-decoration: none"><i class="fas fa-file-alt"></i>Advance Request</a></td>
      <td><a href="#" style="text-decoration: none"><i class="fas fa-file-alt"></i>Monthly Statement</a></td>
      <td><a href="#" style="text-decoration: none"><i class="fas fa-file-alt"></i>Cash On Hand</a></td>
    </tr>

  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">Cash IN</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>

     <tr>
         <th scope="row"></th>
      <td><a href="PgPettyCashCashInEntry.aspx" style="text-decoration: none"><i class="fas fa-file-alt"></i> Cash In Entry</a></td>
      <td><a href="CashInReport.aspx" style="text-decoration: none"><i class="fas fa-file-invoice"></i> Cash In Report</a></td>
     </tr>
         
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">Cash OUT</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>

  </thead>
     <tr>
         <th scope="row"></th>
      <td><a href="PgPettyCashCashOutEntry.aspx" style="text-decoration: none"><i class="fas fa-file-alt"></i> Cash Out Entry</a></td>
      <td><a href="CashOutReport.aspx" style="text-decoration: none"><i class="fas fa-file-invoice"></i> Cash Out Report</a></td>
     </tr>
     
  </tbody>
</table>

</div>

</asp:Content>

