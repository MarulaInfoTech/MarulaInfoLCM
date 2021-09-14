<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="SubmenuCaEntry.aspx.cs" Inherits="SubmenuCaEntry" %>

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
      <th scope="col">CA Entry</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <th scope="row"></th>
      <td><a href="PgCAEntryOtherIncomeEntry.aspx" style="text-decoration: none"><i class="fas fa-file-alt"></i> Other Income Entry</a></td>
      <td><a href="PgCAEntryExpenseEntry.aspx" style="text-decoration: none"><i class="fas fa-file-alt"></i> Expenses Entry</a></td>
    </tr>

      
  </tbody>


</table>

</div>



</asp:Content>

