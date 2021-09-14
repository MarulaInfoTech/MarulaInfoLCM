<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="SubmenuoffrollLcm-PF-ESIMaster.aspx.cs" Inherits="PayrollForms_SubmenuoffrollLcm_PF_ESIMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">


<div class="container-fluid">

    
  <table class="table table-hover">
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">EPF Master & ESI Master</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <th scope="row"></th>
      <td><a href="PgOffRollLCM-EPFMaster.aspx"><i class="fa  fa fa-fw fa-home"></i> EPF Master</a></td>
      <td><a href="PgOffRollLCM-ESIMaster.aspx"><i class="fa  fa fa-fw fa-home"></i> ESI Master</a></td>
    </tr>
      
  <tbody>
    <tr>
      <th scope="row"></th>      
    </tr>

  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col"> <asp:Button ID="btnback" runat="server" CssClass="btn btn-primary" Text="Back" PostBackUrl="~/PayrollForms/SubmenuOffRollLCM.aspx" Width="120" Style="font-size: smaller" /></th>
      <th scope="col"></th>
    </tr>
  </thead>
      
  </tbody>

</table>

</div>

</asp:Content>

