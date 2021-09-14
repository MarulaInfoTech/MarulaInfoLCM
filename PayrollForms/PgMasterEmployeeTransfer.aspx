<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgMasterEmployeeTransfer.aspx.cs" Inherits="PgMasterEmployeeTransfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
  <li class="nav-item">
    <a class="nav-link alert-dark actives" id="pills-companymaster-tab" data-toggle="pill" href="#pills-companymaster" role="tab" aria-controls="pills-companymaster" style="font-size:larger" aria-selected="true">Employee Transfer</a>
  </li>
  <li class="nav-item">
    <a class="nav-link alert-dark actives" id="pills-view-tab" data-toggle="pill" href="#pills-view" role="tab" style="font-size:larger" aria-selected="false">Views</a>
  </li>

  </ul>


  <div class="tab-content" id="pills-tabContent">
  <div class="tab-pane fade show active" id="pills-companymaster" role="tabpanel" aria-labelledby="pills-companymaster-tab">





            <div >
                <h5 class="card-title">Employee Transfer</h5>
            </div>


             <div class="row"> 
               
       <div id="ET-EmployeeTransfer" class=" col-lg-5 col-xl-5 ">
             
                         <asp:Label ID="lbldate" runat="server" CssClass="label-conrol" Text="Date"></asp:Label>
                       <div class="form-group">
                          <div class=" col-lg-12 col-xl-12 ">                              
                           <asp:TextBox ID="txtdate" runat="server" CssClass="form-control"></asp:TextBox>
                           <script type="text/javascript">
                             $(function () {
                                 $('[id*= txtdate]').datepicker({
                              changeMonth: true,
                              changeYear: true,
                              format: "dd/mm/yyyy",
                              language: "tr"
                              });
                              });
                           </script>
                          </div>
                          </div>   
                                 

             <asp:Label ID="lblemployeecode" runat="server" CssClass="label-conrol" Text="Employee Code"></asp:Label>
                       <div class="form-group">
                          <div class=" col-lg-12 col-xl-12">
                           <asp:TextBox ID="txtemployeecode" CssClass="form-control" runat="server" placeholder="Employee Code"></asp:TextBox>                       
                          </div>   
                       </div>  

             <asp:Label ID="lblemployeename" runat="server" CssClass="label-conrol" Text="Employee Name"></asp:Label>
                       <div class="form-group">
                          <div class=" col-lg-12 col-xl-12">
                           <asp:TextBox ID="txtemployeename" CssClass="form-control" runat="server" placeholder="Employee Name"></asp:TextBox>                       
                          </div>   
                       </div>                   
 
       </div>
            </div> 
   
       

             <div class="row"> 
               
       <div id="ET-CurrentStatus" class=" col-lg-6 col-xl-6 ">

            <div >
                <h5 class="card-title">Current Status</h5>
            </div>
                  

             <asp:Label ID="lblcsclientname" runat="server" CssClass="label-conrol" Text="Client Name"></asp:Label>
                       <div class="form-group">
                          <div class=" col-lg-12 col-xl-12">
                           <asp:TextBox ID="txtcsclientname" CssClass="form-control" runat="server" placeholder="Clinet Name"></asp:TextBox>                       
                          </div>   
                       </div>                   
                           
             <asp:Label ID="lblcsdivision" runat="server" CssClass="label-conrol" Text="Division"></asp:Label>
                       <div class="form-group">
                          <div class=" col-lg-12 col-xl-12 ">
                           <asp:TextBox ID="txtcsdivision" CssClass="form-control" runat="server" placeholder="Division"></asp:TextBox>                       
                          </div>   
                       </div>             

             <asp:Label ID="lblcsdepartment" runat="server" CssClass="label-conrol" Text="Department"></asp:Label>
                       <div class="form-group">
                          <div class=" col-lg-12 col-xl-12 ">
                           <asp:TextBox ID="txtcsdepartment" CssClass="form-control" runat="server" placeholder="Department"></asp:TextBox>                       
                          </div>   
                       </div>             



             <asp:Label ID="lblcsjobtype" runat="server" CssClass="label-conrol" Text="Job Type"></asp:Label>
                       <div class="form-group">
                          <div class="col-lg-12 col-xl-12 ">
                           <asp:TextBox ID="txtcsjobtype" CssClass="form-control" runat="server" placeholder="Job Type"></asp:TextBox>                       
                          </div>   
                       </div>             
          

              <asp:Label ID="lblcsgradename" runat="server" CssClass="label-conrol" Text="Grade Name"></asp:Label>
                       <div class="form-group">
                          <div class=" col-lg-12 col-xl-12 ">
                           <asp:TextBox ID="txtcsgradename" CssClass="form-control" runat="server" placeholder="Grade Name"></asp:TextBox>                       
                          </div>   
                       </div>                   
    
               </div>


       <div id="ET-UpdatedStatus" class=" col-lg-5 col-xl-5">

           <div >
                <h5 class="card-title">Updated Status</h5>
            </div>
                  

             <asp:Label ID="lblusclientname" runat="server" CssClass="label-conrol" Text="Client Name"></asp:Label>
                       <div class="form-group">
                          <div class=" col-lg-12 col-xl-12">
                              <asp:DropDownList ID="ddlusclientname" CssClass="form-control" runat="server"></asp:DropDownList>
                          </div>   
                       </div>                   
                           
             <asp:Label ID="lblusdivision" runat="server" CssClass="label-conrol" Text="Division"></asp:Label>
                       <div class="form-group">
                          <div class=" col-lg-12 col-xl-12 ">
                              <asp:DropDownList ID="ddlusdivision" CssClass="form-control" runat="server"></asp:DropDownList>
                          </div>   
                       </div>             

             <asp:Label ID="lblusdepartment" runat="server" CssClass="label-conrol" Text="Department"></asp:Label>
                       <div class="form-group">
                          <div class=" col-lg-12 col-xl-12 ">
                              <asp:DropDownList ID="ddlusdepartment" CssClass="form-control" runat="server"></asp:DropDownList>
                          </div>   
                       </div>             



             <asp:Label ID="lblusjobtype" runat="server" CssClass="label-conrol" Text="Job Type"></asp:Label>
                       <div class="form-group">
                          <div class="col-lg-12 col-xl-12 ">
                              <asp:DropDownList ID="ddlusjobtype" CssClass="form-control" runat="server"></asp:DropDownList>
                          </div>   
                       </div>             
          

              <asp:Label ID="lblusgradename" runat="server" CssClass="label-conrol" Text="Grade Name"></asp:Label>
                       <div class="form-group">
                          <div class=" col-lg-12 col-xl-12 ">
                              <asp:DropDownList ID="ddlusgradename" CssClass="form-control" runat="server"></asp:DropDownList>
                          </div>   
                       </div>                   
                     
          </div>

                 </div>

           <div class="row">

                <div id="RFT"  class=" col-lg-7 col-xl-7 " >

              <asp:Label ID="lblreasonfortransfer" runat="server" CssClass="label-conrol" Text="Reason For Transfer"></asp:Label>
                       <div class="form-group">
                          <div class=" col-lg-12 col-xl-12 ">
                           <asp:TextBox ID="txtreasonfortransfer" CssClass="form-control" runat="server" placeholder="Reason For Transfer" TextMode="MultiLine"></asp:TextBox>                       
                          </div>   
                       </div>                   
                                                                                                                    
                </div>

       </div>  


           <div class="row">

                <div id="ET-btn"  class=" col-lg-12 col-xl-12 " >
                     
                        <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary " Text="Save" Width="120" />                 
                                              
                        <asp:Button ID="btnnew" runat="server" CssClass="btn btn-primary  "  Text="New" Width="120"  />

                        <asp:Button ID="btncancel" runat="server" CssClass="btn btn-primary  "  Text="Cancel" PostBackUrl="~/SubmenuEmployeeMaster.aspx" Width="120"  />
                                                                                                                                                                                            
                </div>
       </div> 





 

 </div>

 <div class="tab-pane fade" id="pills-view" role="tabpanel">


           <div class="row">

                <div id="view"  class=" col-lg-4 col-xl-4 " >
                        
              <asp:Label ID="lblcompanynameview" runat="server" CssClass="label-conrol" Text="Company Name"></asp:Label>
                       <div class="form-group">
                          <div class=" col-md-12 col-lg-12 col-xl-12 ">
                           <asp:TextBox ID="txtcompanynameview" CssClass="form-control" runat="server" placeholder="Company Name"></asp:TextBox>                       
                          </div>   
                       </div>                   

                      </div>

                 <div id="tableview"  class=" col-lg-12 col-xl-12 " >
                                    
                   ---------      
                                                                                                         
            </div>

       </div>  


</div>

    </div>





</asp:Content>

