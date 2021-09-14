<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="SubmenuEntries.aspx.cs" Inherits="SubmenuEntries" %>

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
      <th scope="col">Attendance Entry</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row"></th>
      <td><a href="PgEntriesDailyAttendanceEntry.aspx" style="text-decoration: none"><i class="fab fa-dailymotion"></i> Daily Attendance Entry</a></td>
      <td><a href="PgEntriesMonthlyAttdendance.aspx" style="text-decoration: none"><i class="fas fa-calendar-alt"></i> Monthly Attendance Entry</a></td>
      <td><a href="#" style="text-decoration: none"><i class="fas fa-calendar-alt"></i> Weekly Attendance Entry</a></td>
    </tr>

     <tr>
      <th scope="row"></th>
      <td class="auto-style5"><a href="#" style="text-decoration: none"><i class="fas fa-signal"></i> Piece Rate&Measure Of Units</a></td>
      <td class="auto-style2"><a href="#" style="text-decoration: none"><i class="fas fa-stream"></i> Time/Auto Machine Subscriptions</a></td>
      <td class="auto-style2"><a href="PgEntriesAttendanceViewAndEdit.aspx" style="text-decoration: none"><i class="fas fa-edit"></i>Attendance View And Edit</a></td>
     </tr>      
  </tbody>
</table>

</div>


</asp:Content>

