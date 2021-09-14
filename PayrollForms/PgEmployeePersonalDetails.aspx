<%@ Page Title="" Language="C#" MasterPageFile="~/PayrollForms/MasterPageSurya.master" AutoEventWireup="true" CodeFile="PgEmployeePersonalDetails.aspx.cs" Inherits="PgEmployeePersonalDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div id="accordion">

    <%-------------Page-4--------------%>

  <div class="card">
    <div class="card-header">
      <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
        Employees Personal Details 
      </a>
    </div>
    <div id="collapseThree" class="collapse" data-parent="#accordion">
      <div class="card-body bg-light">
                
                    <div class="row" id="ENER-Pg3">
 
               <div id="KPD-Known-Person-Details" class="col-sm-10 col-10 col-md-10 col-lg-10 col-xl-10">
                   <h5>Known Person Details</h5>


              <asp:Label ID="lblkpdpersonname" runat="server" CssClass="label-conrol" Text="Person's Name"></asp:Label>
                       <div class="form-group">
                          <div class="col-sm-10 col-10 col-md-10 col-lg-10 col-xl-10 ">
                           <asp:TextBox ID="txtkpdpersonname" CssClass="form-control" runat="server" placeholder="Person's Name"></asp:TextBox>                       
                          </div>   
                       </div>                   

              <asp:Label ID="lblkpdrelationship" runat="server" CssClass="label-conrol" Text="Relationship"></asp:Label>
                       <div class="form-group">
                          <div class="col-sm-10 col-10 col-md-10 col-lg-10 col-xl-10 ">
                           <asp:TextBox ID="txtkpdrelationship" CssClass="form-control" runat="server" placeholder="Relationship"></asp:TextBox>                       
                          </div>   
                       </div>                   

              <asp:Label ID="lblkpdmobileno" runat="server" CssClass="label-conrol" Text="Mobile No"></asp:Label>
                       <div class="form-group">
                          <div class="col-sm-10 col-10 col-md-10 col-lg-10 col-xl-10 ">
                           <asp:TextBox ID="txtkpdmobileno" CssClass="form-control" runat="server" placeholder="+ 91"></asp:TextBox>                       
                          </div>   
                       </div>                   

             <asp:Label ID="lblkpdaddress" runat="server" CssClass="label-conrol" Text="Address"></asp:Label>
                       <div class="form-group">
                          <div class="col-sm-10 col-10 col-md-10 col-lg-10 col-xl-10 ">
                           <asp:TextBox ID="txtkpdaddress" CssClass="form-control" runat="server" placeholder="Address" TextMode="MultiLine"></asp:TextBox>                       
                          </div>   
                       </div>                   

               </div>

               
       <div id="KPDC-Known-Person-Details-Company" class="col-sm-6 col-6 col-md-6 col-lg-6 col-xl-6">
                   <h5>Known Person Details in Company</h5>

             <asp:Label ID="lblkpdcemployeecode" runat="server" CssClass="label-conrol" Text="Employee Code"></asp:Label>
                       <div class="form-group">
                          <div class="col-sm-12 col-12 col-md-12 col-lg-12 col-xl-12 ">
                           <asp:TextBox ID="txtkpdemployeecode" CssClass="form-control" runat="server" placeholder="Employee Code"></asp:TextBox>                       
                          </div>   
                       </div>                   
                           
             <asp:Label ID="lblkpdcrelationship" runat="server" CssClass="label-conrol" Text="Relationship"></asp:Label>
                       <div class="form-group">
                          <div class="col-sm-12 col-12 col-md-12 col-lg-12 col-xl-12 ">
                           <asp:TextBox ID="txtkpdcrelationship" CssClass="form-control" runat="server" placeholder="Relationship"></asp:TextBox>                       
                          </div>   
                       </div>             

             <asp:Label ID="lblkpdcpersonname" runat="server" CssClass="label-conrol" Text="Relationship"></asp:Label>
                       <div class="form-group">
                          <div class="col-sm-12 col-12 col-md-12 col-lg-12 col-xl-12 ">
                           <asp:TextBox ID="txtkpdcpersonname" CssClass="form-control" runat="server" placeholder="Person's Name"></asp:TextBox>                       
                          </div>   
                       </div>             
          

              <asp:Label ID="lblkpdcmobile" runat="server" CssClass="label-conrol" Text="Mobile No"></asp:Label>
                       <div class="form-group">
                          <div class="col-sm-12 col-12 col-md-12 col-lg-12 col-xl-12 ">
                           <asp:TextBox ID="txtkpdcmobile" CssClass="form-control" runat="server" placeholder="+ 91"></asp:TextBox>                       
                          </div>   
                       </div>                   

             <asp:Label ID="lblkpdcaddress" runat="server" CssClass="label-conrol" Text="Address"></asp:Label>
                       <div class="form-group">
                          <div class="col-sm-12 col-12 col-md-12 col-lg-12 col-xl-12 ">
                           <asp:TextBox ID="txtkpdcaddress" CssClass="form-control" runat="server" placeholder="Address" TextMode="MultiLine"></asp:TextBox>                       
                          </div>   
                       </div>                   

               </div>


       <div id="Languages-Known" class="col-sm-6 col-6 col-md-6 col-lg-6 col-xl-6">
             <h5>Languages Known</h5>
             <br />       

             <asp:Label ID="lbllkmothertongue" runat="server" CssClass="label-conrol" Text="Mother Tongue *"></asp:Label>
                       <div class="form-group">
                          <div class="col-sm-12 col-12 col-md-12 col-lg-12 col-xl-12 ">
                           <asp:TextBox ID="txtlkmothertongue" CssClass="form-control" runat="server" placeholder="Mother Tongue"></asp:TextBox>                       
                          </div>   
                       </div>                   

              <asp:Label ID="lbllkspeak" runat="server" CssClass="label-conrol" Text="Speak *"></asp:Label>
                       <div class="form-group">
                          <div class="col-sm-12 col-12 col-md-12 col-lg-12 col-xl-12 ">
                           <asp:TextBox ID="txtlkspeak" CssClass="form-control" runat="server" placeholder="Speak"></asp:TextBox>                       
                          </div>   
                       </div>                   

              <asp:Label ID="lbllkread" runat="server" CssClass="label-conrol" Text="Read *"></asp:Label>
                       <div class="form-group">
                          <div class="col-sm-12 col-12 col-md-12 col-lg-12 col-xl-12 ">
                           <asp:TextBox ID="txtlkread" CssClass="form-control" runat="server" placeholder="Read"></asp:TextBox>                       
                          </div>   
                       </div>                   

              <asp:Label ID="lbllkwrite" runat="server" CssClass="label-conrol" Text="Write *"></asp:Label>
                       <div class="form-group">
                          <div class="col-sm-12 col-12 col-md-12 col-lg-12 col-xl-12 ">
                           <asp:TextBox ID="txtlkwrite" CssClass="form-control" runat="server" placeholder="Write"></asp:TextBox>                       
                          </div>   
                       </div>                   

             </div>
    
               </div>
                
      </div>
    </div>
  </div>


<%---------------------------------------------------------%>


    <%-------------Page-4--------------%>

  <div class="card">
    <div class="card-header">
      <a class="collapsed card-link" data-toggle="collapse" href="#collapseFour">
         Employee Family Details
      </a>
    </div>
    <div id="collapseFour" class="collapse" data-parent="#accordion">
      <div class="card-body bg-light">
       

            <div class="row" id="ENER-Pg4">

           <div id="FD-Family-Details" class="col-sm-12 col-12 col-md-12 col-lg-12 col-xl-12">
           <h5>Family Details</h5> 

            <div class="container">        
            <table class="table <%--table-striped--%>">
            <thead>

            <tr>
            <th class="col-lg-4 col-xl-4"><asp:Label ID="lblfdname" runat="server" CssClass="label-conrol" Text="Name" Font-Bold="False" Font-Size="Large"></asp:Label></th>
            <th class="col-lg-2 col-xl-2"><asp:Label ID="lblfdrelationship" runat="server" CssClass="label-conrol" Text="Relationship" Font-Bold="False" Font-Size="Large"></asp:Label></th>
            <th class="col-lg-2 col-xl-2"><asp:Label ID="lblfddobage" runat="server" CssClass="label-conrol" Text="DOB / Age" Font-Bold="False" Font-Size="Large"></asp:Label></th>
            <th class="col-lg-4 col-xl-4"><asp:Label ID="lblfdoccupation" runat="server" CssClass="label-conrol" Text="Occupation" Font-Bold="False" Font-Size="Large"></asp:Label></th>
            </tr>

            </thead>
                                
          <tbody>
                       
          <tr>                
          <td class="col-lg-4 col-xl-4 "><asp:TextBox ID="txtfdname1" CssClass="form-control" runat="server" placeholder="Name 1"></asp:TextBox></td>          
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtfdrelationship1" CssClass="form-control" runat="server" placeholder="Relationship"></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtfddateofbirth1" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox></td>                                    
          <td class="col-lg-4 col-xl-4"><asp:TextBox ID="txtfdoccupation1" CssClass="form-control" runat="server" placeholder="Occupation"></asp:TextBox></td>
          </tr>
                                     
          <tr>                
          <td class="col-lg-4 col-xl-4 "><asp:TextBox ID="txtfdname2" CssClass="form-control" runat="server" placeholder="Name 2"></asp:TextBox></td>          
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtfdrelationship2" CssClass="form-control" runat="server" placeholder="Relationship"></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtfddobage2" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox></td>                                    
          <td class="col-lg-4 col-xl-4"><asp:TextBox ID="txtfdoccupation2" CssClass="form-control" runat="server" placeholder="Occupation"></asp:TextBox></td>
          </tr>
              
          <tr>                
          <td class="col-lg-4 col-xl-4 "><asp:TextBox ID="txtfdname3" CssClass="form-control" runat="server" placeholder="Name 3"></asp:TextBox></td>          
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtfdrelationship3" CssClass="form-control" runat="server" placeholder="Relationship"></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtfddobage3" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox></td>                                    
          <td class="col-lg-4 col-xl-4"><asp:TextBox ID="txtfdoccupation3" CssClass="form-control" runat="server" placeholder="Occupation"></asp:TextBox></td>
          </tr>
             
          <tr>                
          <td class="col-lg-4 col-xl-4 "><asp:TextBox ID="txtfdname4" CssClass="form-control" runat="server" placeholder="Name 4"></asp:TextBox></td>          
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtfdrelationship4" CssClass="form-control" runat="server" placeholder="Relationship"></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtfddobage4" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox></td>                                    
          <td class="col-lg-4 col-xl-4"><asp:TextBox ID="txtfdoccupation4" CssClass="form-control" runat="server" placeholder="Occupation"></asp:TextBox></td>
          </tr>
              
          <tr>                
          <td class="col-lg-4 col-xl-4 "><asp:TextBox ID="txtfdname5" CssClass="form-control" runat="server" placeholder="Name 5"></asp:TextBox></td>          
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtfdrelationship5" CssClass="form-control" runat="server" placeholder="Relationship"></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtfddobage5" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox></td>                                    
          <td class="col-lg-4 col-xl-4"><asp:TextBox ID="txtfdoccupation5" CssClass="form-control" runat="server" placeholder="Occupation"></asp:TextBox></td>
          </tr>

          <tr>                
          <td class="col-lg-4 col-xl-4 "><asp:TextBox ID="txtfdname6" CssClass="form-control" runat="server" placeholder="Name 6"></asp:TextBox></td>          
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtfdrelationship6" CssClass="form-control" runat="server" placeholder="Relationship"></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtfddobage6" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox></td>                                    
          <td class="col-lg-4 col-xl-4"><asp:TextBox ID="txtfdoccupation6" CssClass="form-control" runat="server" placeholder="Occupation"></asp:TextBox></td>
          </tr>


         </tbody>
         </table>
        </div>     

      </div>



        <div id="ED-Education-Details" class="col-sm-12 col-12 col-md-12 col-lg-12 col-xl-12">
           <h5>Education Details</h5> 

            <div class="container">        
            <table class="table <%--table-striped--%>">
            <thead>

            <tr>
            <th class="col-lg-4 col-xl-4"><asp:Label ID="lbledschoolcollegeuniversityname" runat="server" CssClass="label-conrol" Text="School / College / University Name" Font-Bold="False" Font-Size="Large"></asp:Label></th>
            <th class="col-lg-3 col-xl-3"><asp:Label ID="lbledformto" runat="server" CssClass="label-conrol" Text="From - To" Font-Bold="False" Font-Size="Large"></asp:Label></th>
            <th class="col-lg-2 col-xl-2"><asp:Label ID="lbledclassdegree" runat="server" CssClass="label-conrol" Text="Class / Degree" Font-Bold="False" Font-Size="Large"></asp:Label></th>
            <th class="col-lg-2 col-xl-2"><asp:Label ID="lbledmarkpercentage" runat="server" CssClass="label-conrol" Text="Mark Percentage" Font-Bold="False" Font-Size="Large"></asp:Label></th>
            <th></th>
            <th class="col-lg-3 col-xl-3"><asp:Label ID="lbledresult" runat="server" CssClass="label-conrol" Text="Result" Font-Bold="False" Font-Size="Large"></asp:Label></th>
            </tr>

            </thead>
                                
          <tbody>
                       
          <tr>                
          <td class="col-lg-4 col-xl-4"><asp:TextBox ID="edschoolcollegeuniversityname1" CssClass="form-control" runat="server" placeholder="Name 1"></asp:TextBox></td>          
          <td class="col-lg-3 col-xl-3"><asp:TextBox ID="txtedformto1" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtedclassdegree1" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtedmarkpercentage1" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td > % </td>
          <td class="col-lg-1 col-xl-1"> <asp:DropDownList ID="ddledresult1" CssClass="form-control" runat="server"></asp:DropDownList> </td>
          </tr>
                                     
          <tr>                
          <td class="col-lg-4 col-xl-4"><asp:TextBox ID="edschoolcollegeuniversityname2" CssClass="form-control" runat="server" placeholder="Name 2"></asp:TextBox></td>          
          <td class="col-lg-3 col-xl-3"><asp:TextBox ID="txtedformto2" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtedclassdegree2" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtedmarkpercentage2" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td > % </td>
          <td class="col-lg-1 col-xl-1"> <asp:DropDownList ID="ddledresult2" CssClass="form-control" runat="server"></asp:DropDownList> </td>
          </tr>

          <tr>                
          <td class="col-lg-4 col-xl-4"><asp:TextBox ID="edschoolcollegeuniversityname3" CssClass="form-control" runat="server" placeholder="Name 3"></asp:TextBox></td>          
          <td class="col-lg-3 col-xl-3"><asp:TextBox ID="txtedformto3" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtedclassdegree3" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtedmarkpercentage3" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td > % </td>
          <td class="col-lg-1 col-xl-1"> <asp:DropDownList ID="ddledresult3" CssClass="form-control" runat="server"></asp:DropDownList> </td>
          </tr>

          <tr>                
          <td class="col-lg-4 col-xl-4"><asp:TextBox ID="edschoolcollegeuniversityname4" CssClass="form-control" runat="server" placeholder="Name 4"></asp:TextBox></td>          
          <td class="col-lg-3 col-xl-3"><asp:TextBox ID="txtedformto4" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtedclassdegree4" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtedmarkpercentage4" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td > % </td>
          <td class="col-lg-1 col-xl-1"> <asp:DropDownList ID="ddledresult4" CssClass="form-control" runat="server"></asp:DropDownList> </td>
          </tr>

         </tbody>

         </table>
        </div>     

      </div>



        <div id="EXD-Company-Organization-Details" class="col-sm-12 col-12 col-md-12 col-lg-12 col-xl-12">
           <h5>Experience Details</h5> 

            <div class="container">        
            <table class="table <%--table-striped--%>">
            <thead>

            <tr>
            <th class="col-lg-3 col-xl-4"><asp:Label ID="lblexdcompanyorganization" runat="server" CssClass="label-conrol" Text="Company / Organization Details" Font-Bold="False" Font-Size="Large"></asp:Label></th>
            <th class="col-lg-3 col-xl-2"><asp:Label ID="lblexdformto" runat="server" CssClass="label-conrol" Text="From - To" Font-Bold="False" Font-Size="Large"></asp:Label></th>
            <th class="col-lg-3 col-xl-2"><asp:Label ID="lblexddesignation" runat="server" CssClass="label-conrol" Text="Designation" Font-Bold="False" Font-Size="Large"></asp:Label></th>
            <th class="col-lg-3 col-xl-1"><asp:Label ID="lblexdlastsalaryday" runat="server" CssClass="label-conrol" Text="Lastsalary/Day" Font-Bold="False" Font-Size="Large"></asp:Label></th>
            <th class="col-lg-3 col-xl-3"><asp:Label ID="lblexdreasonforreleaving" runat="server" CssClass="label-conrol" Text="Reason For Releaving" Font-Bold="False" Font-Size="Large"></asp:Label></th>
            </tr>

            </thead>
                                
          <tbody>
                       
          <tr>                
          <td class="col-lg-3 col-xl-4"><asp:TextBox ID="txtexdcompanyorganization1" CssClass="form-control" runat="server" placeholder="Details 1"></asp:TextBox></td>          
          <td class="col-lg-3 col-xl-2"><asp:TextBox ID="txtexdformto1" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-3 col-xl-2"><asp:TextBox ID="txtexddesignation1" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-3 col-xl-1"><asp:TextBox ID="txtexdlastsalaryday1" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-3"><asp:TextBox ID="txtexdreasonforreleaving1" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          </tr>
                                     
          <tr>                
          <td class="col-lg-4 col-xl-4"><asp:TextBox ID="txtexdcompanyorganization2" CssClass="form-control" runat="server" placeholder="Details 2"></asp:TextBox></td>          
          <td class="col-lg-3 col-xl-2"><asp:TextBox ID="txtexdformto2" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtexddesignation2" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-1"><asp:TextBox ID="txtexdlastsalaryday2" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-3"><asp:TextBox ID="txtexdreasonforreleaving2" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
           </tr>

          <tr>                
          <td class="col-lg-4 col-xl-4"><asp:TextBox ID="txtexdcompanyorganization3" CssClass="form-control" runat="server" placeholder="Details 3"></asp:TextBox></td>          
          <td class="col-lg-3 col-xl-2"><asp:TextBox ID="txtexdformto3" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtexddesignation3" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-1"><asp:TextBox ID="txtexdlastsalaryday3" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-3"><asp:TextBox ID="txtexdreasonforreleaving3" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          </tr>

          <tr>                
          <td class="col-lg-4 col-xl-4"><asp:TextBox ID="txtexdcompanyorganization4" CssClass="form-control" runat="server" placeholder="Details 4"></asp:TextBox></td>          
          <td class="col-lg-3 col-xl-2"><asp:TextBox ID="txtexdformto4" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-2"><asp:TextBox ID="txtexddesignation4" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-1"><asp:TextBox ID="txtexdlastsalaryday4" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          <td class="col-lg-2 col-xl-3"><asp:TextBox ID="txtexdreasonforreleaving4" CssClass="form-control" runat="server" placeholder=""></asp:TextBox></td>
          </tr>

         </tbody>

         </table>
        </div>     

      </div>

                
      </div>
          </div>

        </div>
      
      </div>



       <div id="FD-btn" class=" col-lg-12 col-xl-12">

                    <div class=" col-lg-12 col-xl-12 ">

                        <asp:Button ID="btnsave" runat="server" CssClass="btn btn-primary" Text="Save" Width="120" />                  
                        <asp:Button ID="btnclose" runat="server" CssClass="btn btn-primary" Text="Close" Width="120" PostBackUrl="~/PayrollForms/SubmenuEmployeeMaster.aspx" />
                     
                     </div>            
               </div>

            </div>

</asp:Content>

