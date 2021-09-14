<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="SubmenuCashRegister.aspx.cs" Inherits="SubmenuCashRegister" %>

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
      <th scope="col">Cash Register</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <th scope="row"></th>
      <td><a href="#" style="text-decoration: none"><i class="fas fa-file-invoice"></i> Bill Register</a></td>
      <td><a href="#" style="text-decoration: none"><i class="fas fa-file-invoice"></i> GST Register</a></td>
    </tr>


  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">Cheque Entry</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>


     <tr>
         <th scope="row"></th>
      <td class="auto-style5"><a href="PgCashRegisterPaymentEntry.aspx" style="text-decoration: none"><i class="fas fa-file-invoice"></i> Payment Entry</a></td>
      <td class="auto-style2"><a href="#" style="text-decoration: none"><i class="fas fa-file-invoice"></i> GST Entry</a></td> 
     </tr>
    



  </tbody>


</table>

</div>



</asp:Content>

