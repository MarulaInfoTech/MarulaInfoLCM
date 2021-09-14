<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="SubmenuDataMaster.aspx.cs" Inherits="SubmenuDataMaster" %>

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
      <th scope="col">Employee Master</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row"></th>
      <td><a href="PgEmployeeNewResumeRegistration.aspx" style="text-decoration: none"><i class="fas fa-id-badge"></i>Candidate Application</a></td>
      <td><a href="PgEmployeeInterviewSchedule.aspx" style="text-decoration: none"><i class="fas fa-clipboard-list"></i> Interview Schedule</a></td>
      <td><a href="PgEmployeeNewEmployeeRegistration.aspx" style="text-decoration: none"><i class="fas fa-info-circle"></i>Employee Company Details </a></td>
    </tr>

    <tr>
      <th scope="row"></th>
      <td><a href="PgEmployeeImportEmployeeData.aspx" style="text-decoration: none"><i class="fas fa-file-import"></i> Import Employee Data</a></td>
      <td><a href="PgEmployeeTransfer.aspx" style="text-decoration: none"><i class="fas fa-random"></i> Employee Transfer</a></td>
      <td><a href="PgEmployeeReleavingForm.aspx" style="text-decoration: none"><i class="fas fa-circle"></i> Employee Relieving</a></td>
    </tr>


    <tr>
      <th scope="row"></th>
<%--         <td><a href="PgEmployeePersonalDetails.aspx" style="text-decoration: none"><i class="fa  fa fa-fw fa-home"></i>Employee Personal Details</a></td>--%>
         <td><a href="PgEmployeeViewAndEdit.aspx" style="text-decoration: none"><i class="fas fa-user-edit"></i>Employee View And Edit</a></td>
      </tr>
 
</tbody>
</table>


</div>



</asp:Content>

