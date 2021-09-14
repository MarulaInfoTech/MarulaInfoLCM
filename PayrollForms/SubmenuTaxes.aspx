<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="SubmenuTaxes.aspx.cs" Inherits="SubmenuTaxes" %>

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
      <th scope="col">Taxes</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <th scope="row" style="height: 26px"></th>
      <td><a href="PgTaxes-GST.aspx" style="text-decoration: none"><i class="fas fa-money-check"></i>Generate GST Challan</a></td>
      <td><a href="#" style="text-decoration: none"><i class="fas fa-file-invoice"></i> EMP TDS</a></td>
      <td><a href="#" style="text-decoration: none"><i class="fas fa-file-invoice"></i>Invoice TDS</a></td>
    </tr>


     <tr>
      <th scope="row"></th>
      <td><a href="#" style="text-decoration: none"><i class="fas fa-file"></i> Client Wise Form 16</a></td>
      <td><a href="#" style="text-decoration: none"><i class="fas fa-file"></i>Client Wise Form 26A</a></td>  
    </tr>

      
  </tbody>


</table>

</div>



</asp:Content>

